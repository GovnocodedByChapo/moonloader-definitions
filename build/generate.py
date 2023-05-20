import sys
from typing import TextIO

from MoonloaderWebApiParser import MoonloaderWebApiParser
from Lua import LuaDefinition, LuaFunction, LuaValue, LuaType

class TypesWriter:
  types: list[LuaType]

  def __init__(self, parser: MoonloaderWebApiParser) -> None:
    self.types = parser.types

  def write_to(self, file: TextIO):
    for type in self.types:
      file.write(type.get_declaration())
      file.write("\n")
    file.write("\n")

class DefinitionsWriter:
  definitions: list[LuaDefinition]

  def __init__(self, parser: MoonloaderWebApiParser) -> None:
    self.definitions = parser.definitions

  def write_to(self, file: TextIO):
    for definition in self.definitions:
      if definition.wiki_link is not None:
        file.write("---\n")
        file.write(f"--- [Open the wiki]({definition.wiki_link})\n")
        file.write("---\n")

      if definition.definition_type == LuaFunction:
        for argument in definition.arguments:
          file.write(f"---@param {argument.name} ")

          prefix = ""
          for argument_type in argument.types:
            file.write(prefix + argument_type)
            if argument.is_optional:
              file.write("?")
            prefix = "|"

          if argument.is_optional and argument.default_value is not None:
            file.write(f" Default value is {argument.default_value}")

          file.write("\n")

        for return_value in definition.return_values:
          file.write(f"---@return {return_value.type} {return_value.name}\n")

        file.write(f"function {definition.name}(")
        prefix = ""
        for argument in definition.arguments:
          file.write(prefix + str(argument.name))
          prefix = ", "

        file.write(") end\n\n")
      elif definition.definition_type == LuaValue:
        file.write(f"---@type {definition.type}\n")
        file.write(f"{definition.name} = {'{}'}\n\n")

def main() -> int:
  if len(sys.argv) < 2:
    print("No output file name")
    return 1

  parser = MoonloaderWebApiParser()
  parser.run()

  print("Writing types and definitions to %s" % sys.argv[1])

  target_file = open(sys.argv[1], "w+")

  target_file.write("---@diagnostic disable: lowercase-global, missing-return\n")

  writer = TypesWriter(parser)
  writer.write_to(target_file)

  writer = DefinitionsWriter(parser)
  writer.write_to(target_file)

  target_file.close()

  return 0

if __name__ == "__main__":
  exit(main())
