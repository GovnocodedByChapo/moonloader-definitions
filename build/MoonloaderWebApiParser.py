import requests
import bs4
import traceback

from Lua import\
  LuaDefinition, LuaFunction, LuaArgument, LuaValue,\
  LuaType, LuaTypeAlias, LuaTypeEnum, LuaEnumField, LuaTypeClass, LuaClassField

# Class just to make indentation beetwen types
class LuaTypeIndent(LuaType):
  def __init__(self) -> None:
    super().__init__("", None)

  def get_declaration(self) -> str:
    return ""
  
class MoonloaderWebApiDefinitionsDeserializer:
  base_wiki_url: str

  def __init__(self, base_wiki_url: str) -> None:
    self.base_wiki_url = base_wiki_url

  def deserialize_definition_from_html(self, html_definition: bs4.Tag) -> LuaDefinition:
    html_definition_contents = html_definition.contents

    try:
      if isinstance(html_definition_contents[-1], bs4.TemplateString) and html_definition_contents[-1][0] == '(':
        definition = self.deserialize_function_from_html(html_definition_contents)
        
        print(f"Generated definition of function {definition.name}")
        return definition
      else:
        definition = self.deserialize_value_from_html(html_definition_contents)

        print(f"Generated definition of value {definition.name}")
        return definition
    except:
      print(f"Failed to deserialize definition from HTML: {html_definition}")
      traceback.print_exc()

      return None
    
  def deserialize_function_from_html(self, html_definition_contents: list[bs4.Tag | bs4.TemplateString]) -> LuaFunction:
    definition = LuaFunction("", []) # will be initialized later

    if len(html_definition_contents) == 3:
      return_values_serialized: str = html_definition_contents[0]
      assert isinstance(return_values_serialized, str), "Invalid HTML definition"

      html_definition_contents.pop(0)

      for return_value_serialized in return_values_serialized.split(', '):
        return_value_serialized = return_value_serialized.split(' ')

        definition.return_values.append(LuaValue(return_value_serialized[1], return_value_serialized[0]))

    name_wrapper: bs4.Tag = html_definition_contents[0]
    assert isinstance(name_wrapper, bs4.Tag), "Invalid HTML definition"
    
    definition.wiki_link = self.base_wiki_url + name_wrapper.get("href")
    definition.name = name_wrapper.contents[0]

    arguments_serialized: str = html_definition_contents[1]
    assert isinstance(arguments_serialized, str), "Invalid HTML definition"

    arguments_names_have_seen = set()

    # if length == 2, then this is just "()", i.e. no arguments
    if len(arguments_serialized) > 2:
      arguments_serialized = arguments_serialized[1:-1] # remove '(' and ')'

      for argument in arguments_serialized.split(', '):
        if argument == "...":
          # Vararg
          definition.arguments.append(LuaArgument("...", [ "any" ]))
        elif argument[0] == '[':
          # Optional
          argument = argument[1:-1] # remove '[' and ']'

          argument = argument.split('=')
          default_value = argument[1] if len(argument) > 1 else "nil"

          argument = argument[0].split(' ')

          object = LuaArgument(argument[1], [ argument[0] ], True, default_value)

          if object.name in arguments_names_have_seen:
            postfix_candidate = 2

            while object.name + str(postfix_candidate) in arguments_names_have_seen:
              postfix_candidate += 1
            
            object.name += str(postfix_candidate)

          arguments_names_have_seen.add(object.name)

          definition.arguments.append(object)
        else:
          # Simple
          argument = argument.split(' ')

          types = None
          if '/' in argument[0]:
            types = argument[0].split('/')
          else:
            types = [ argument[0] ]
          
          object = LuaArgument(argument[1], types)

          if object.name in arguments_names_have_seen:
            postfix_candidate = 2

            while object.name + str(postfix_candidate) in arguments_names_have_seen:
              postfix_candidate += 1
            
            object.name += str(postfix_candidate)

          arguments_names_have_seen.add(object.name)

          definition.arguments.append(object)

    return definition

  def deserialize_value_from_html(self, html_definition_contents: list[bs4.Tag | bs4.TemplateString]) -> LuaValue:
    if len(html_definition_contents) == 1:
      html_definition_contents.insert(0, "any")

    value_type = html_definition_contents[0]

    if isinstance(value_type, bs4.Tag):
      value_type = value_type.contents[0].strip()
    else:
      value_type = value_type.strip()

    definition = LuaValue("", value_type)

    definition.wiki_link = self.base_wiki_url + html_definition_contents[1].get("href")
    definition.name = html_definition_contents[1].contents[0]

    return definition

class MoonloaderWebApiParser:
  api_url: str
  base_wiki_url: str

  api_page: bs4.BeautifulSoup
  api_table: bs4.Tag

  types: list[LuaType]
  definitions: list[LuaDefinition]

  done_with_errors: bool

  def __init__(self, api_url: str = "https://wiki.blast.hk/ru/moonloader/scripting-api", base_wiki_url: str = "https://wiki.blast.hk") -> None:
    self.api_url = api_url
    self.base_wiki_url = base_wiki_url

    self.api_page = None
    self.api_table = None

    self.done_with_errors = False

    self.definitions = []

    # pre-computed types from https://wiki.blast.hk/moonloader/types
    self.types = [
      LuaTypeAlias("bool", "boolean", "логический"),
      LuaTypeAlias("int", "number", "целочисленный со знаком, 4 байта"),
      LuaTypeAlias("uint", "number", "целочисленный без знака, 4 байта"),
      LuaTypeAlias("float", "number", "число с плавающей точкой, 4 байта"),
      LuaTypeAlias("double", "number", "число с плавающей точкой двойной точности, 8 байт"),
      LuaTypeAlias("zstring", "string", "нуль-терминированная строка (в Lua обычная строка)"),

      LuaTypeIndent(),

      LuaTypeAlias("BaseScriptHandle", "uint", "базовый скриптовый хэндл"),
      LuaTypeAlias("BaseSFHandle", "uint", "базовый SAMPFUNC хэндл"),

      LuaTypeIndent(),

      LuaTypeAlias("Ped", "BaseScriptHandle", "скриптовый хэндл игрового персонажа"),
      LuaTypeAlias("Marker", "BaseScriptHandle", "скриптовый хэндл маркера"),
      LuaTypeAlias("Pickup", "BaseScriptHandle", "скриптовый хэндл пикапа"),
      LuaTypeAlias("Searchlight", "BaseScriptHandle", "скриптовый хэндл прожектора"),
      LuaTypeAlias("Particle", "BaseScriptHandle", "скриптовый хэндл визуального эффекта"),
      LuaTypeAlias("Checkpoint", "BaseScriptHandle", "скриптовый хэндл чекпоинта"),
      LuaTypeAlias("Vehicle", "BaseScriptHandle", "скриптовый хэндл транспортного средства"),
      LuaTypeAlias("Object", "BaseScriptHandle", "скриптовый хэндл игрового объекта"),
      LuaTypeAlias("Player", "BaseScriptHandle", "идентификатор игрока"),

      LuaTypeIndent(),

      LuaTypeAlias("GxtString", "string", "короткая строка-идентификатор GXT-записи"),
      LuaTypeAlias("Model", "uint", "идентификатор игровой модели"),
      LuaTypeAlias("Bitstream", "uint", "указатель на объект BitStream"),
      LuaTypeAlias("VarId", "uint", "индекс скриптовой глобальной переменной"),

      LuaTypeIndent(),

      LuaTypeAlias("DxutDialog", "BaseSFHandle", "хэндл DXUT-диалога SAMPFUNCS"),

      LuaTypeIndent(),

      LuaTypeAlias("DxFont", "userdata", "экземпляр шрифта DirectX"),
      LuaTypeAlias("DxTexture", "userdata", "экземпляр текстуры DirectX"),
      LuaTypeAlias("AudioStream", "userdata", "экземпляр аудиопотока BASS"),
      LuaTypeAlias("Filesearch", "userdata", "хэндл поиска файлов"),

      LuaTypeIndent(),

      LuaTypeClass("LuaScript", [
        LuaClassField("name", "string", "имя скрипта, заданное функцией 'script_name'. Если имя не задано используется название файла"),
        LuaClassField("description", "string", "описание скрипта, указанное функцией 'script_description'. Пустая строка, если не указано"),
        LuaClassField("version_num", "int", "числовая версия скрипта. 0, если не указано"),
        LuaClassField("version", "string", "текстовая версия скрипта. Будет использована числовая версия, если не задано"),
        LuaClassField("authors", "table", "список авторов скрипта. Пустой, если не указаны"),
        LuaClassField("dependencies", "table", "список зависимостей скрипта. Пустой, если не указаны"),
        LuaClassField("path", "string", "полный путь к файлу скрипта"),
        LuaClassField("filename", "string", "название файла скрипта, включая расширение"),
        LuaClassField("directory", "string", "полный путь директории, из который был загружен скрипт"),
        LuaClassField("frozen", "bool", "статус активности потока (приостановлен/активен)"),
        LuaClassField("dead", "bool", "статус существования потока. Есть случаи, когда поток уже завершён, а lua-объект скрипта ещё существует. Свойство dead проверяет объект скрипта на валидность"),
        LuaClassField("exports", "any", "экспортируемые скриптом значения. Можно получить и функцией import"),
        LuaClassField("id", "int", "уникальный идентификатор скрипта"),
        LuaClassField("url", "string", "web-адрес скрипта"),
        LuaClassField("properties", "table", "список свойств, заданных директивой script_properties"),

        LuaClassField("pause", "fun()", "приостанавливает поток скрипта"),
        LuaClassField("resume", "fun()", "снимает остановленный поток с паузы"),
        LuaClassField("unload", "fun()", "выгружает скрипт"),
        LuaClassField("reload", "fun()", "перезагружает скрипт"),
      ], "экземпляр класса LuaScript"),

      LuaTypeIndent(),

      LuaTypeEnum("LuaThreadStatus", [
        LuaEnumField("\"dead\"", "завершён"),
        LuaEnumField("\"suspended\"", "заморожен"),
        LuaEnumField("\"running\"", "выполняется"),
        LuaEnumField("\"yielded\"", "приостановлен"),
        LuaEnumField("\"error\"", "завершён с ошибкой"),
      ]),

      LuaTypeIndent(),

      LuaTypeClass("LuaThread", [
        LuaClassField("dead", "boolean", "Определяет статус завершённости потока. Только для чтения."),
        LuaClassField("work_in_pause", "boolean", "Определяет исполнение потока во время паузы игры."),

        LuaClassField("run", "fun(...)", "Выполняет замороженный, выполняющийся или завершённый поток с начала. Все параметры вызова передаются в функцию потока в качестве аргументов."),
        LuaClassField("terminate", "fun()", "Принудительно завершает поток."),
        LuaClassField("status", "fun(): LuaThreadStatus", "Возвращает статус потока.")
      ], "экземпляр класса LuaThread"),

      LuaTypeIndent(),

      LuaTypeAlias("bitstream", "Bitstream")
    ]

  def run(self) -> int:
    self.done_with_errors = False

    self.get_api_page()
    self.find_api_table()

    self.generate_definitions()

    if self.done_with_errors:
      print("Generating done with errors!")
    else:
      print("Generating done successfully!")

  def generate_definitions(self):
    deserializer = MoonloaderWebApiDefinitionsDeserializer(self.base_wiki_url)

    for html_definition in self.api_table.select("tr > td"):
      definition = deserializer.deserialize_definition_from_html(html_definition)
      if definition is None:
        self.done_with_errors = True
      else:
        self.definitions.append(definition)

  def get_api_page(self):
    response = requests.get(self.api_url)

    if response.status_code not in range(200, 299):
      raise Exception("Failed to get API page")
    
    self.api_page = bs4.BeautifulSoup(response.content, "html.parser")

  def find_api_table(self):
    table_candidates = self.api_page.select("table")

    api_table = None

    for candidate in table_candidates:
      table_header = candidate.findChild("thead")
      if table_header is None:
        continue

      header_text_wrapper = table_header.select_one("tr > th")

      if header_text_wrapper is None:
        continue

      header_text = header_text_wrapper.contents[0]

      if header_text == "Lua":
        api_table = candidate
        break
    
    if api_table is None:
      raise Exception("API table not found")
    
    self.api_table = api_table.select_one("tbody")
