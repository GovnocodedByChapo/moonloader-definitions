---@meta

---@alias status "dead" | "error" | "running" | "suspended" | "yielded"

---@class LuaThread
---@field dead boolean Определяет статус завершённости потока. Только для чтения
---@field work_in_pause boolean Определяет исполнение потока во время паузы игры
---@field run function Выполняет замороженный, выполняющийся или завершённый поток с начала
---@field terminate function Принудительно завершает поток
---@field status fun(): status Возвращает статус потока

lua_thread = {}

---@param func function
---@return LuaThread thread
function lua_thread.create(func) end

--- @param func function
--- @return LuaThread thread
function lua_thread.create_suspended(func) end

return lua_thread
