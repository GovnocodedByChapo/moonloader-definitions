---@meta
---@diagnostic disable: missing-return

---@class LuaScript
---@field name string имя скрипта, заданное функцией 'script_name'. Если имя не задано используется название файла
---@field description string описание скрипта, указанное функцией 'script_description'. Пустая строка, если не указано
---@field version_num number числовая версия скрипта. 0, если не указано
---@field version string текстовая версия скрипта. Будет использована числовая версия, если не задано
---@field authors table список авторов скрипта. Пустой, если не указаны
---@field dependencies table список зависимостей скрипта. Пустой, если не указаны
---@field path string полный путь к файлу скрипта
---@field filename string название файла скрипта, включая расширение
---@field directory string полный путь директории, из который был загружен скрипт
---@field frozen boolean статус активности потока (приостановлен/активен)
---@field dead boolean статус существования потока. Есть случаи, когда поток уже завершён, а lua-объект скрипта ещё существует. Свойство dead проверяет объект скрипта на валидность
---@field exports any экспортируемые скриптом значения. Можно получить и функцией import
---@field id number уникальный идентификатор скрипта
---@field url string web-адрес скрипта
---@field properties table список свойств, заданных директивой script_properties
---@field pause function приостанавливает поток скрипта
---@field resume function снимает остановленный поток с паузы
---@field unload function выгружает скрипт
---@field reload function перезагружает скрипт

---@type table
script = {}

---@type LuaScript
script.this = {}
---загружает скрипт из файла и возвращает объект скрипта. возвращает `nil`, если скрипт не был загружен
---@param file string
---@return LuaScript | nil
function script.load(file) end

---ищет загруженный скрипт по имени. возвращает `nil`, если скрипт не найден
---@param name string
---@return LuaScript | nil
function script.find(name) end

---возвращает массив загруженных скриптов
---@return LuaScript[] Scripts list
function script.list() end

---возвращает объект скрипта по идентификатору. если скрипта с указанным идентификатором не существует, то возвращает nil
---@param scriptId number
---@return LuaScript | nil
function script.get(scriptId) end

---@return LuaScript LuaScript
function thisScript() end

return script
