---@meta memory
---@diagnostic disable: missing-return

local memory = {}

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memoryread)
---
---@param address number
---@param size number
---@param unprotect boolean? Default value is false
---@return number value
function memory.read(address, size, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorywrite)
---
---@param address number
---@param value number
---@param size number
---@param unprotect boolean? Default value is false
function memory.write(address, value, size, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorygetint8)
---
---@param address number
---@param unprotect boolean? Default value is false
---@return number value
function memory.getint8(address, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorysetint8)
---
---@param address number
---@param byte number
---@param unprotect boolean? Default value is false
---@return boolean result
function memory.setint8(address, byte, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorygetint16)
---
---@param address number
---@param unprotect boolean? Default value is false
---@return number value
function memory.getint16(address, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorysetint16)
---
---@param address number
---@param word number
---@param unprotect boolean? Default value is false
---@return boolean result
function memory.setint16(address, word, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorygetint32)
---
---@param address number
---@param unprotect boolean? Default value is false
---@return number value
function memory.getint32(address, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorysetint32)
---
---@param address number
---@param dword number
---@param unprotect boolean? Default value is false
---@return boolean result
function memory.setint32(address, dword, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorygetint64)
---
---@param address number
---@param unprotect boolean? Default value is false
---@return number value
function memory.getint64(address, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorysetint64)
---
---@param address number
---@param qword number
---@param unprotect boolean? Default value is false
---@return boolean result
function memory.setint64(address, qword, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorygetuint8)
---
---@param address number
---@param unprotect boolean? Default value is false
---@return number value
function memory.getuint8(address, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorysetuint8)
---
---@param address number
---@param byte number
---@param unprotect boolean? Default value is false
---@return boolean result
function memory.setuint8(address, byte, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorygetuint16)
---
---@param address number
---@param unprotect boolean? Default value is false
---@return number value
function memory.getuint16(address, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorysetuint16)
---
---@param address number
---@param word number
---@param unprotect boolean? Default value is false
---@return boolean result
function memory.setuint16(address, word, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorygetuint32)
---
---@param address number
---@param unprotect boolean? Default value is false
---@return number value
function memory.getuint32(address, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorysetuint32)
---
---@param address number
---@param dword number
---@param unprotect boolean? Default value is false
---@return boolean result
function memory.setuint32(address, dword, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorygetuint64)
---
---@param address number
---@param unprotect boolean? Default value is false
---@return number value
function memory.getuint64(address, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorysetuint64)
---
---@param address number
---@param qword number
---@param unprotect boolean? Default value is false
---@return boolean result
function memory.setuint64(address, qword, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorygetfloat)
---
---@param address number
---@param unprotect boolean? Default value is false
---@return number value
function memory.getfloat(address, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorysetfloat)
---
---@param address number
---@param value number
---@param unprotect boolean? Default value is false
---@return boolean result
function memory.setfloat(address, value, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorygetdouble)
---
---@param address number
---@param unprotect boolean? Default value is false
---@return number value
function memory.getdouble(address, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorysetdouble)
---
---@param address number
---@param value number
---@param unprotect boolean? Default value is false
---@return boolean result
function memory.setdouble(address, value, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memoryunprotect)
---
---@param address number
---@param size number
---@return number oldProtection
function memory.unprotect(address, size) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memoryprotect)
---
---@param address number
---@param size number
---@param newProtection number
---@return number oldProtection
function memory.protect(address, size, newProtection) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorycopy)
---
---@param destAddress number
---@param srcAddress number
---@param size number
---@param unprotect boolean? Default value is false
function memory.copy(destAddress, srcAddress, size, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorycompare)
---
---@param address1 number
---@param address2 number
---@param size number
---@param unprotect boolean? Default value is false
---@return boolean result
function memory.compare(address1, address2, size, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorytostring)
---
---@param address number
---@param size number? Default value is nil
---@param unprotect boolean? Default value is false
---@return string str
function memory.tostring(address, size, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memorytohex)
---
---@param address number
---@param size number
---@param unprotect boolean? Default value is false
---@return string hexstr
function memory.tohex(address, size, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memoryhex2bin)
---
---@param hex string
---@param dstAddress number
---@param size number
---@return boolean result
function memory.hex2bin(hex, dstAddress, size) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memoryhex2bin)
---
---@param hex string
---@return string bin
function memory.hex2bin(hex) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#memoryfill)
---
---@param address number
---@param value number
---@param size number
---@param unprotect boolean? Default value is false
function memory.fill(address, value, size, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/memory#strptr)
---
---@param str string
---@return number address
function memory.strptr(str) end

return memory
