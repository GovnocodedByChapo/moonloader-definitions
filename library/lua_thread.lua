---@meta
---@class LuaThread
lua_thread = {}

---@param func function
---@return LuaThread thread
function lua_thread.create(func) end

--- @param func function
--- @return LuaThread thread
function lua_thread.create_suspended(func) end

return lua_thread