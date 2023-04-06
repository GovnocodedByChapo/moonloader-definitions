---@meta
local memory = {}

--- @param address uint
--- @param size uint
--- @param unprotect bool
--- @return int value
function memory.read(address, size, unprotect) end

--- @param address uint
--- @param value int
--- @param size uint
--- @param unprotect bool
function memory.write(address, value, size, unprotect) end

--- @param address uint
--- @param unprotect bool
--- @return int value
function memory.getint8(address, unprotect) end

--- @param address uint
--- @param byte int
--- @param unprotect bool
--- @return bool result
function memory.setint8(address, byte, unprotect) end

--- @param address uint
--- @param unprotect bool
--- @return int value
function memory.getint16(address, unprotect) end

--- @param address uint
--- @param word int
--- @param unprotect bool
--- @return bool result
function memory.setint16(address, word, unprotect) end

--- @param address uint
--- @param unprotect bool
--- @return int value
function memory.getint32(address, unprotect) end

--- @param address uint
--- @param dword int
--- @param unprotect bool
--- @return bool result
function memory.setint32(address, dword, unprotect) end

--- @param address uint
--- @param unprotect bool
--- @return double value
function memory.getint64(address, unprotect) end

--- @param address uint
--- @param qword double
--- @param unprotect bool
--- @return bool result
function memory.setint64(address, qword, unprotect) end

--- @param address uint
--- @param unprotect bool
--- @return int value
function memory.getuint8(address, unprotect) end

--- @param address uint
--- @param byte int
--- @param unprotect bool
--- @return bool result
function memory.setuint8(address, byte, unprotect) end

--- @param address uint
--- @param unprotect bool
--- @return int value
function memory.getuint16(address, unprotect) end

--- @param address uint
--- @param word int
--- @param unprotect bool
--- @return bool result
function memory.setuint16(address, word, unprotect) end

--- @param address uint
--- @param unprotect bool
--- @return int value
function memory.getuint32(address, unprotect) end

--- @param address uint
--- @param dword int
--- @param unprotect bool
--- @return bool result
function memory.setuint32(address, dword, unprotect) end

--- @param address uint
--- @param unprotect bool
--- @return double value
function memory.getuint64(address, unprotect) end

--- @param address uint
--- @param qword double
--- @param unprotect bool
--- @return bool result
function memory.setuint64(address, qword, unprotect) end

--- @param address uint
--- @param unprotect bool
--- @return float value
function memory.getfloat(address, unprotect) end

--- @param address uint
--- @param value float
--- @param unprotect bool
--- @return bool result
function memory.setfloat(address, value, unprotect) end

--- @param address uint
--- @param unprotect bool
--- @return double value
function memory.getdouble(address, unprotect) end

--- @param address uint
--- @param value double
--- @param unprotect bool
--- @return bool result
function memory.setdouble(address, value, unprotect) end

--- @param address uint
--- @param size uint
--- @return int oldProtection
function memory.unprotect(address, size) end

--- @param address uint
--- @param size uint
--- @param newProtection int
--- @return int oldProtection
function memory.protect(address, size, newProtection) end

--- @param destAddress uint
--- @param srcAddress uint
--- @param size uint
--- @param unprotect bool
function memory.copy(destAddress, srcAddress, size, unprotect) end

--- @param address1 uint
--- @param address2 uint
--- @param size uint
--- @param unprotect bool
--- @return bool result
function memory.compare(address1, address2, size, unprotect) end

--- @param address uint
--- @param size uint
--- @param unprotect bool
--- @return string str
function memory.tostring(address, size, unprotect) end

--- @param address uint
--- @param size uint
--- @param unprotect bool
--- @return string hexstr
function memory.tohex(address, size, unprotect) end

--- @param hex string
--- @return string bin
function memory.hex2bin(hex) end

--- @param address uint
--- @param value int
--- @param size uint
--- @param unprotect bool
function memory.fill(address, value, size, unprotect) end

--- @param str string
--- @return uint address
function memory.strptr(str) end

return memory