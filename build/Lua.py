import abc
import re

LUA_KEYWORDS = {
  "and", "break", "do", "else", "elseif",
  "end", "false", "for", "function", "if",
  "in", "local", "nil", "not", "or",
  "repeat", "return", "then", "true", "until", "while"
}

# Name of lua function/variable
class LuaName:
  # Parts is delimitered by dot
  #  i.e. name "lua_thread.create" will
  #  have parts: [ "lua_thread", "create" ]
  parts: list[str]

  def __init__(self, name: list[str] | str):
    if isinstance(name, str):
      if name == "...":
        self.parts = [ name ]
      else:
        self.parts = name.split(".")

    else:
      self.parts = name

  # Checks whatever this name is valid lua name and if not - fixes it
  def validate(self):
    if len(self.parts) == 0:
      self.parts = [ "_" ]

    if self.parts[0] == "...":
      if len(self.parts) > 1:
        self.parts = [ "..." ]
      return
    
    for name_part_index, name_part in enumerate(self.parts):
      if len(name_part) == 0:
        self.parts[name_part_index] = "_"
        continue

      # Name cannot be keyword
      if name_part in LUA_KEYWORDS:
        self.parts[name_part_index] = "_" + name_part
        continue
      
      # First character shoul be only word character or underscore
      if re.match(r"[\w_]", name_part[0]) is None:
        self.parts[name_part_index] = "_" + name_part
        continue
      
      # Name can contains numbers, but not as first character
      if re.match(r"[\w\d_]*", name_part[1:]) is None:
        self.parts[name_part_index] = re.sub(r"[^\w\d_]", "_", name_part)
        continue

  def __str__(self) -> str:
    result = ""
    prefix = ""

    for part in self.parts:
      result += prefix + part
      prefix = "."

    return result

# Base class for all lua definitions.
# Definition - declaration of a global function or a global variable
class LuaDefinition:
  definition_type: type # Should be equal to class, derived from LuaDefinition
  wiki_link: str | None # Link to the wiki page of this function/variable

  def __init__(self, definition_type: type, wiki_link: str = None) -> None:
    self.definition_type = definition_type
    self.wiki_link = wiki_link

# Argument of a lua function
class LuaArgument:
  name: LuaName # Name of an argument (for vararg argument this should be "..."). Note that this name can contain only 1 part
  types: list[str]  # List of types, available for this argument
  is_optional: bool # Is this argument optional?
  default_value: str | None # If "is_optional == True" then this should be default value of this argument

  def __init__(self, name: str, types: list[str], is_optional: bool = False, default_value: str = None) -> None:
    self.name = LuaName(name)
    self.types = types
    self.is_optional = is_optional
    self.default_value = default_value

    self.name.validate()

# Lua value. Can be either definition or return value of a function
class LuaValue(LuaDefinition):
  name: LuaName
  type: str

  def __init__(self, name: str | LuaName, type: str, wiki_link: str = None) -> None:
    super().__init__(__class__, wiki_link)

    if isinstance(name, LuaName):
      self.name = name
    else:
      self.name = LuaName(name)
      self.name.validate()

    self.type = type

# Declaration of a lua function
class LuaFunction(LuaDefinition):
  name: LuaName
  arguments: list[LuaArgument]
  return_values: list[LuaValue]

  def __init__(self, name: str | LuaName, arguments: list[LuaArgument], return_values: list[LuaValue] = None, wiki_link: str | None = None) -> None:
    super().__init__(__class__, wiki_link)

    if return_values is None:
      return_values = []

    if isinstance(name, LuaName):
      self.name = name
    else:
      self.name = LuaName(name)
      self.name.validate()

    self.arguments = arguments
    self.return_values = return_values

# Base abstract class of lua type
class LuaType(abc.ABC):
  name: str # Name of the type
  description: str | None # Decription of the type

  def __init__(self, name: str, description: str = None) -> None:
    self.name = name
    self.description = description

  # Should return declaration of this type in LuaLS annotations style
  @abc.abstractmethod
  def get_declaration(self) -> str: pass

# Field of a class
class LuaClassField:
  name: str # Name of the field
  type: str # Type of the field
  description: str | None # Description of the field

  def __init__(self, name: str, type: str, description: str = None) -> None:
    self.name = name
    self.type = type
    self.description = description

# Class type
class LuaTypeClass(LuaType):
  fields: list[LuaClassField]

  def __init__(self, name: str, fields: list[LuaClassField], description: str = None) -> None:
    super().__init__(name, description)

    self.fields = fields

  def get_declaration(self) -> str:
    declaration = f"---@class {self.name}" + (f" # {self.description}" if self.description is not None else "")

    for field in self.fields:
      declaration += f"\n---@field {field.name} {field.type}" + (f" # {field.description}" if field.description is not None else "")
    
    return declaration

# Alias type (analogue of "using" keyword in C++)
class LuaTypeAlias(LuaType):
  value: str

  def __init__(self, name: str, value: str, description: str = None) -> None:
    super().__init__(name, description)

    self.value = value

  def get_declaration(self) -> str:
    return f"---@alias {self.name} {self.value}" + (f" # {self.description}" if self.description is not None else "")

# Field of an enum
class LuaEnumField:
  value: str
  description: str | None

  def __init__(self, value: str, description: str | None = None) -> None:
    self.value = value
    self.description = description

# Enum type
class LuaTypeEnum(LuaType):
  fields: list[LuaEnumField]

  def __init__(self, name: str, fields: list[LuaEnumField]) -> None:
    super().__init__(name)

    self.fields = fields

  def get_declaration(self) -> str:
    declaration = f"---@alias {self.name}"

    for field in self.fields:
      declaration += f"\n---| '{field.value}'" + (f" # {field.description}" if field.description is not None else "")

    return declaration
