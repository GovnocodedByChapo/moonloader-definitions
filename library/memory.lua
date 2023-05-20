---@meta
---@diagnostic disable: missing-return

local memory = {}

--- @param address number
--- @param size number
--- @param unprotect boolean
--- @return number value
function memory.read(address, size, unprotect) end

--- @param address number
--- @param value number
--- @param size number
--- @param unprotect boolean
function memory.write(address, value, size, unprotect) end

--- @param address number
--- @param unprotect boolean
--- @return number value
function memory.getint8(address, unprotect) end

--- @param address number
--- @param byte number
--- @param unprotect boolean
--- @return boolean result
function memory.setint8(address, byte, unprotect) end

--- @param address number
--- @param unprotect boolean
--- @return number value
function memory.getint16(address, unprotect) end

--- @param address number
--- @param word number
--- @param unprotect boolean
--- @return boolean result
function memory.setint16(address, word, unprotect) end

--- @param address number
--- @param unprotect boolean
--- @return number value
function memory.getint32(address, unprotect) end

--- @param address number
--- @param dword number
--- @param unprotect boolean
--- @return boolean result
function memory.setint32(address, dword, unprotect) end

--- @param address number
--- @param unprotect boolean
--- @return number value
function memory.getint64(address, unprotect) end

--- @param address number
--- @param qword number
--- @param unprotect boolean
--- @return boolean result
function memory.setint64(address, qword, unprotect) end

--- @param address number
--- @param unprotect boolean
--- @return number value
function memory.getuint8(address, unprotect) end

--- @param address number
--- @param byte number
--- @param unprotect boolean
--- @return boolean result
function memory.setuint8(address, byte, unprotect) end

--- @param address number
--- @param unprotect boolean
--- @return number value
function memory.getuint16(address, unprotect) end

--- @param address number
--- @param word number
--- @param unprotect boolean
--- @return boolean result
function memory.setuint16(address, word, unprotect) end

--- @param address number
--- @param unprotect boolean
--- @return number value
function memory.getuint32(address, unprotect) end

--- @param address number
--- @param dword number
--- @param unprotect boolean
--- @return boolean result
function memory.setuint32(address, dword, unprotect) end

--- @param address number
--- @param unprotect boolean
--- @return number value
function memory.getuint64(address, unprotect) end

--- @param address number
--- @param qword number
--- @param unprotect boolean
--- @return boolean result
function memory.setuint64(address, qword, unprotect) end

--- @param address number
--- @param unprotect boolean
--- @return number value
function memory.getfloat(address, unprotect) end

--- @param address number
--- @param value number
--- @param unprotect boolean
--- @return boolean result
function memory.setfloat(address, value, unprotect) end

--- @param address number
--- @param unprotect boolean
--- @return number value
function memory.getdouble(address, unprotect) end

--- @param address number
--- @param value number
--- @param unprotect boolean
--- @return boolean result
function memory.setdouble(address, value, unprotect) end

--- @param address number
--- @param size number
--- @return number oldProtection
function memory.unprotect(address, size) end

--- @param address number
--- @param size number
--- @param newProtection number
--- @return number oldProtection
function memory.protect(address, size, newProtection) end

--- @param destAddress number
--- @param srcAddress number
--- @param size number
--- @param unprotect boolean
function memory.copy(destAddress, srcAddress, size, unprotect) end

--- @param address1 number
--- @param address2 number
--- @param size number
--- @param unprotect boolean
--- @return boolean result
function memory.compare(address1, address2, size, unprotect) end

--- @param address number
--- @param size number
--- @param unprotect boolean
--- @return string str
function memory.tostring(address, size, unprotect) end

--- @param address number
--- @param size number
--- @param unprotect boolean
--- @return string hexstr
function memory.tohex(address, size, unprotect) end

--- @param hex string
--- @return string bin
function memory.hex2bin(hex) end

--- @param address number
--- @param value number
--- @param size number
--- @param unprotect boolean
function memory.fill(address, value, size, unprotect) end

--- @param str string
--- @return number address
function memory.strptr(str) end

return memory
