---@meta
---@diagnostic disable: lowercase-global, missing-return

---@alias bool boolean # ����������
---@alias int number # ������������� �� ������, 4 �����
---@alias uint number # ������������� ��� �����, 4 �����
---@alias float number # ����� � ��������� ������, 4 �����
---@alias double number # ����� � ��������� ������ ������� ��������, 8 ����
---@alias zstring string # ����-��������������� ������ (� Lua ������� ������)

---@class Ped # ���������� ����� �������� ���������
---@class Marker # ���������� ����� �������
---@class Pickup # ���������� ����� ������
---@class Searchlight # ���������� ����� ����������
---@class Particle # ���������� ����� ����������� �������
---@class Checkpoint # ���������� ����� ���������
---@class Vehicle # ���������� ����� ������������� ��������
---@class Object # ���������� ����� �������� �������
---@class Player # ������������� ������

---@alias GxtString string # �������� ������-������������� GXT-������
---@alias Model uint # ������������� ������� ������
---@alias Bitstream uint # ��������� �� ������ BitStream
---@alias VarId uint # ������ ���������� ���������� ����������

---@class DxutDialog # ����� DXUT-������� SAMPFUNCS

---@class DxFont # ��������� ������ DirectX
---@class DxTexture # ��������� �������� DirectX
---@class AudioStream # ��������� ����������� BASS
---@class Filesearch # ����� ������ ������

---@alias LuaThreadStatus
---| '"dead"' # ��������
---| '"suspended"' # ���������
---| '"running"' # �����������
---| '"yielded"' # �������������
---| '"error"' # �������� � �������

---@class LuaThread # ��������� ������ LuaThread
---@field dead boolean # ���������� ������ ������������� ������. ������ ��� ������.
---@field work_in_pause boolean # ���������� ���������� ������ �� ����� ����� ����.
---@field run fun(...) # ��������� ������������, ������������� ��� ����������� ����� � ������. ��� ��������� ������ ���������� � ������� ������ � �������� ����������.
---@field terminate fun() # ������������� ��������� �����.
---@field status fun(): LuaThreadStatus # ���������� ������ ������.

---@class lua_thread
lua_thread = {}

---
--- ������ ����� ����� � ����� �� ��������� ��� � ���������� �����������.  
--- ��� �������� ������ ���������������� ����� ������������ ������� `lua_thread.create_suspended`.  
--- �� ��������� � ����� ������������� � ������� ���������� � ������ <a href="���������� ������">https://wiki.blast.hk/moonloader/scripting/threads</a>.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/lua_thread/create">Open the wiki</a></b>  
---
---@param func function ������� ������, ������� ����� ���������� ����� ����� �������� ������
---@param ... any ���������, � �������� ����� ������� �������
---@return LuaThread thread ��������� `LuaThread`
function lua_thread.create(func, ...) end

---
--- ������ ����� ����� � ��������� �������� �������. ����� ����� �� ����� ���������� ����� �� ����� ��������, ������ ���� ����� ���������� � �������� ��������� �������� lua_thread:run.  
--- ��� �������� ������ � ����������� �������� ����� ������������ ������� lua_thread.create.  
--- �� ��������� � ����� ������������� � ������� ���������� � ������ ���������� ������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/lua_thread/create_suspended">Open the wiki</a></b>  
---
---@param func function ������� ������, ������� ���������� ����� ������ `thread:run()`
---@return LuaThread thread ��������� `LuaThread`
function lua_thread.create_suspended(func) end


---@class LuaScript # ��������� ������ LuaScript
---@field name string # ��� �������, �������� �������� 'script_name'. ���� ��� �� ������ ������������ �������� �����
---@field description string # �������� �������, ��������� �������� 'script_description'. ������ ������, ���� �� �������
---@field version_num int # �������� ������ �������. 0, ���� �� �������
---@field version string # ��������� ������ �������. ����� ������������ �������� ������, ���� �� ������
---@field authors table # ������ ������� �������. ������, ���� �� �������
---@field dependencies table # ������ ������������ �������. ������, ���� �� �������
---@field path string # ������ ���� � ����� �������
---@field filename string # �������� ����� �������, ������� ����������
---@field directory string # ������ ���� ����������, �� ������� ��� �������� ������
---@field frozen bool # ������ ���������� ������ (�������������/�������)
---@field dead bool # ������ ������������� ������. ���� ������, ����� ����� ��� ��������, � lua-������ ������� ��� ����������. �������� dead ��������� ������ ������� �� ����������
---@field exports any # �������������� �������� ��������. ����� �������� � �������� import
---@field id int # ���������� ������������� �������
---@field url string # web-����� �������
---@field properties table # ������ �������, �������� ���������� script_properties
---@field pause fun() # ���������������� ����� �������
---@field resume fun() # ������� ������������� ����� � �����
---@field unload fun() # ��������� ������
---@field reload fun() # ������������� ������

---
--- ���������� `LuaScript` �������, �� �������� ���� ������� �������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/thisScript">Open the wiki</a></b>  
---
---@return LuaScript script ������
function thisScript() end

---@class script
script = {}

---
--- ����������� ��������. ���������� ������ `LuaScript` �������� �������. �������� �������� ������� `thisScript`.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/this">Open the wiki</a></b>  
---
---@type LuaScript
script.this = {}

---
--- ��������� ������ �� ����� � ���������� ������ `LuaScript`.  
--- ������� �������� ��������� ������ � ��������� ������� �����:
---  - ������� ���������� + ����
---  - ������� ���������� + ���� + .lua(c)
---  - ���������� ����
---  - ���������� ���� + .lua(c)
---
--- ���������� `nil`, ���� ������ �� ��� ��������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/load">Open the wiki</a></b>  
---
---@param file string ���� � �����
---@return LuaScript script ������
function script.load(file) end

---
--- ���� ����������� ������ �� �����. ���������� ������ `LuaScript`, ���� ������ ������, � ��������� ������ ���������� `nil`.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/find">Open the wiki</a></b>  
---
---@param name string �������� �������
---@return LuaScript script ������
function script.find(name) end

---
--- ���������� ������ ����������� ��������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/list">Open the wiki</a></b>  
---
---@return LuaScript[] list ������ `LuaScript` ����������� ��������
function script.list() end

--- 
--- �������� ����������� ������ �� ��� ����������� �������������� � ���������� ������ `LuaScript`.  
--- ���������� `nil`, ���� ������� � ����� ��������������� ���.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/get">Open the wiki</a></b>  
---
---@param scriptId int ������������� �������
---@return LuaScript script ������
function script.get(scriptId) end

---
--- ���������, ������� �� ������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCursorActive">Open the wiki</a></b>  
---
---@return bool result ���������
function isCursorActive() end

---
--- ���������� ������ �� ����� ��������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAllPickups">Open the wiki</a></b>  
---
---@return Pickup[] pickups ������
function getAllPickups() end

---
--- ���������� ����� ������ �� ��������� �� �������� ������ CPickup.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupPointerHandle">Open the wiki</a></b>  
---
---@param handle int ���������
---@return Pickup pickup ����� ������
function getPickupPointerHandle(handle) end

---
--- ���������� ��������� �� ��������� ������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupPointer">Open the wiki</a></b>  
---
---@param pickup Pickup �����
---@return int pointer ���������
function getPickupPointer(pickup) end

---@alias PickupType
---| 0 # ������������ �� ������. �� ����� ���� ��������.
---| 1 # ������������ ������.
---| 2 # ��������� ����� ��������, ���������� ����� 30 ������, ���� ����� ��������� �� ��������� ���� �� 15 ������ �� ������.
---| 3 # ��������� ����� ��������, ���������� ����� ������.
---| 4 # ��������� ����� 15-20 ������. ���������� ����� ������.
---| 8 # ��������� ����� ��������.
---| 11 # ���������� ����� ��������� ������ ����� �������� (�����?)
---| 12 # ���������� ����� ��������� ������ ����� ��������.
---| 13 # ���������. ����� ���� ���������, ����� �������� �� ����������.
---| 14 # ��������� ����� ��������, �� ����� ���� �������� ������ �� ����������. ������ ���� ���������.
---| 15 # ���� �����, ��� � ��� 2.
---| 18 # ����� �� ��� 1. ������� `TAB` �������� ��� ��������.
---| 19 # �������� ����� ��������, �� �� ���������� �����. ����� ���� �������� �����.
---| 20 # ����� �� ��� 1. ���������, ����� �� ��� �������������� (��������� �����������).
---| 22 # ���� �����, ��� � ��� 3.

---
--- ���������� ��� ������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupType">Open the wiki</a></b>  
---
---@param pickup Pickup ����� ������
---@return PickupType type ��� ������
function getPickupType(pickup) end

---
--- ���������� ������ ������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupModel">Open the wiki</a></b>  
---
---@param pickup Pickup ����� ������
---@return int model ������
function getPickupModel(pickup) end

---
--- ���������� ���������� �������� �������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectQuaternion">Open the wiki</a></b>  
---
---@param object Object ������
---@return float x
---@return float y
---@return float z
---@return float w
function getObjectQuaternion(object) end

---
--- ����� ���������� �������� �������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectQuaternion">Open the wiki</a></b>  
---
---@param object Object ������
---@param x float
---@param y float
---@param z float
---@param w float
function setObjectQuaternion(object, x, y, z, w) end

---
--- ���������� ���������� �������� ������������� ��������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getVehicleQuaternion">Open the wiki</a></b>  
---
---@param car Vehicle ���������
---@return float x
---@return float y
---@return float z
---@return float w
function getVehicleQuaternion(car) end

---
--- ����� ���������� �������� ������������� ��������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleQuaternion">Open the wiki</a></b>  
---
---@param car Vehicle ���������
---@param x float
---@param y float
---@param z float
---@param w float
function setVehicleQuaternion(car, x, y, z, w) end

---
--- ���������� ���������� �������� ���������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharQuaternion">Open the wiki</a></b>  
---
---@param ped Ped ��������
---@return float x
---@return float y
---@return float z
---@return float w
function getCharQuaternion(ped) end

---
--- ����� ���������� �������� ���������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharQuaternion">Open the wiki</a></b>  
---
---@param ped Ped ��������
---@param x float
---@param y float
---@param z float
---@param w float
function setCharQuaternion(ped, x, y, z, w) end

---
--- ��������� ����� �� ����� ��� �� ���-������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadAudioStream">Open the wiki</a></b>  
---
---@param audio zstring ���� � ����� ��� Web-�����
---@return AudioStream handle ����������
function loadAudioStream(audio) end

---@alias AudioStreamState
---| 0 # ���������� (��������)
---| 1 # ������
---| 2 # �������������
---| 3 # ����������

---
--- ����� ����� ������ �����������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAudioStreamState">Open the wiki</a></b>  
---
---@param handle AudioStream ����������
---@param state AudioStreamState ���������
function setAudioStreamState(handle, state) end

---
--- ����������� ����������� ����������.  
--- ������������ �� ����������, �.�. ����������� ������������� ������������� ��������� ������.  
---
--- ### ������ �������������  
---
--- ```lua
---   -- �� ���������:
---   releaseAudioStream(audiostream)
---   -- ���������:
---   audiostream = nil
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releaseAudioStream">Open the wiki</a></b>  
---
---@param handle AudioStream ����������
---@deprecated
function releaseAudioStream(handle) end

---
--- ���������� ������������ ����������� � ��������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAudioStreamLength">Open the wiki</a></b>  
---
---@param handle AudioStream ����������
---@return double length ������������
function getAudioStreamLength(handle) end

---
--- ���������� ������ �����������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAudioStreamState">Open the wiki</a></b>  
---
---@param handle AudioStream ����������
---@return AudioStreamState state ������
function getAudioStreamState(handle) end

---
--- ���������� ��������� �����������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAudioStreamVolume">Open the wiki</a></b>  
---
---@param audio AudioStream ����������
---@return float volume ��������� (1.0 - 100%, 0.0 - 0%)
function getAudioStreamVolume(audio) end

---
--- ������������� ��������� �����������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAudioStreamVolume">Open the wiki</a></b>  
---
---@param audio AudioStream ����������
---@param volume float ��������� (1.0 - 100%, 0.0 - 0%)
function setAudioStreamVolume(audio, volume) end

---
--- ����������� ������ ������������� �����������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAudioStreamLooped">Open the wiki</a></b>  
---
---@param audio AudioStream ����������
---@param loop bool ���������
function setAudioStreamLooped(audio, loop) end

---
--- ��������� ���������� � ���������� ��������� (3D) �����  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/load3dAudioStream">Open the wiki</a></b>  
---
---@param audio zstring ���� � ����� ��� ���-�����
---@return AudioStream handle ����������� ����������
function load3dAudioStream(audio) end

---
--- ������������� 3D-����������� ������� � ���� ����  
---
--- ### ������ �������������  
---
--- ```lua
---   local as_action = require('moonloader').audiostream_state
---   local as = load3dAudioStream('moonloader/resource/audio/sound.mp3')
---   local x, y, z = getCharCoordinates(PLAYER_PED)
---   setPlay3dAudioStreamAtCoordinates(as, x, y, z)
---   setAudioStreamState(audio, as_action.PLAY)
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCoordinates">Open the wiki</a></b>  
---
---@param handle AudioStream ����������
---@param posX float
---@param posY float
---@param posZ float
function setPlay3dAudioStreamAtCoordinates(handle, posX, posY, posZ) end

---
--- ����������� 3D-���� � �������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtObject">Open the wiki</a></b>  
---
---@param audio AudioStream ����������
---@param object Object ������
function setPlay3dAudioStreamAtObject(audio, object) end

---
--- ����������� 3D-���� � ���������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtChar">Open the wiki</a></b>  
---
---@param audio AudioStream ����������
---@param ped Ped ��������
function setPlay3dAudioStreamAtChar(audio, ped) end

---
--- ����������� 3D-���� � ������������� ��������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCar">Open the wiki</a></b>  
---
---@param audio AudioStream ����������
---@param car Vehicle ���������
function setPlay3dAudioStreamAtCar(audio, car) end

---
--- ��������� ���������� �� ����� � ������ ��������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadAudioStreamFromMemory">Open the wiki</a></b>  
---
---@param address uint ����� ������
---@param size uint ������ �����
---@return AudioStream handle ����������� ����������
function loadAudioStreamFromMemory(address, size) end

---
--- ��������� ���������� � �������� ��������� �� ����� � ������ ��������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/load3dAudioStreamFromMemory">Open the wiki</a></b>  
---
---@param address uint ����� ������
---@param size uint ������
---@return AudioStream handle ����������� ����������
function load3dAudioStreamFromMemory(address, size) end

---
--- ���������� �� ������ ����� �� ����� `pos1x, pos1y` �� ����� `pos2x, pos2y`  
---
--- ### ������ �������������  
---
--- ```lua
---   while true do
---     renderDrawLine(100, 100, 200, 200, 2.0, 0xFFD00000) -- ������������ ������� ����
---     wait(0) -- �������� �� ���� ����
---   end
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawLine">Open the wiki</a></b>  
---
---@param pos1X float ���������� X ������ �����
---@param pos1Y float ���������� Y ������ �����
---@param pos2X float ���������� X ������ �����
---@param pos2Y float ���������� Y ������ �����
---@param width float ������ �����
---@param color uint ���� ����� � ������� ARGB
function renderDrawLine(pos1X, pos1Y, pos2X, pos2Y, width, color) end

---
--- ������ ������������� � ��������� ����������� � ����������� ��������  
---
--- ### ������ �������������  
---
--- ```lua
---   renderDrawBox(10, 15, 200, 80, 0xAA00CC00)
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawBox">Open the wiki</a></b>  
---
---@param posX float ���������� X
---@param posY float ���������� Y
---@param sizeX float ������
---@param sizeY float ������
---@param color uint ���� � ARGB
function renderDrawBox(posX, posY, sizeX, sizeY, color) end

---
--- ������ ������������� � ��������  
---
--- ### ������ �������������  
---
--- ```lua
---   renderDrawBoxWithBorder(10, 15, 200, 80, 0xAA00CC00, 3, 0x90000000)
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawBoxWithBorder">Open the wiki</a></b>  
---
---@param posX float ���������� X
---@param posY float ���������� Y
---@param sizeX float ������
---@param sizeY float ������
---@param color uint ���� � ARGB
---@param bsize float ������� �������
---@param bcolor uint ���� ������� � ARGB
function renderDrawBoxWithBorder(posX, posY, sizeX, sizeY, color, bsize, bcolor) end

---
--- ��������� ������ ��������� ������ ��� ������������ ������ � ���������� ��������� � ��������.  
---
--- ### ������ �������������  
---
--- ```lua
---   local friends = {'Kalcor', 'Jacob', 'Sacky'}
---   local x = 10
---   for _, v in ipairs(friends) do
---     renderFontDrawText(my_font, v, x, 300, 0xFFFFCDCD)
---     x = x + 5 + renderGetFontDrawTextLength(my_font, v)
---   end
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetFontDrawTextLength">Open the wiki</a></b>  
---
---@param font DxFont �����
---@param text zstring �����
---@param ignoreColorTags bool? ������� �������� ����� (�� ��������� = `false`)
---@return float length ������ � ��������
function renderGetFontDrawTextLength(font, text, ignoreColorTags) end

---
--- ���������� ������ ������������ ������ � ��������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetFontDrawHeight">Open the wiki</a></b>  
---
---@param font DxFont �����
---@return float height ������
function renderGetFontDrawHeight(font) end

---
--- ���������� ������ ������� � ������ �� ������� � ��������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetFontCharIndexAt">Open the wiki</a></b>  
---
---@param font DxFont �����
---@param text string �����
---@param x float �������� � ��������
---@param ignoreColorTags bool? ������� �������� ����� (�� ��������� = `false`)
---@return uint index ������ �������
function renderGetFontCharIndexAt(font, text, x, ignoreColorTags) end

---
--- �������� ������ ������������ ������� � ���������� ��������� � ��������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetFontCharWidth">Open the wiki</a></b>  
---
---@param font DxFont �����
---@param char string|uint ������
---@return float width ������ �������
function renderGetFontCharWidth(font, char) end

---
--- ��������� ������������� � ������� ����� �� ��������. ����� ������ ����� ������ � ��������� ���������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderCreateFont">Open the wiki</a></b>  
---
---@param font zstring ��������
---@param height int ������
---@param flags uint �����
---@param charset uint? ���������
---@return DxFont font �����
function renderCreateFont(font, height, flags, charset) end

---
--- ����������� ������ ������.  
--- ����������� ������ ����������� ������������� ��������� ������, ��� ��� ������������� ���� ������� �������������, ��� ���������� ���� ��� ����������� ������������� �� ������� ��������.  
---
--- ### ������ �������������  
---
--- ```lua
---   renderReleaseFont(my_font)
---   -- ����������:
---   my_font = nil
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderReleaseFont">Open the wiki</a></b>  
---
---@param font DxFont �����
---@deprecated
function renderReleaseFont(font) end

---
--- ���������� ����� �� ������, ��������� ����������� �����.  
--- ������������ �������� ���� � ������� `{RRGGBB}` � `{AARRGGBB}`, � ������ �������� ������ `\n`.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderFontDrawText">Open the wiki</a></b>  
---
---@param font DxFont �����
---@param text zstring �����
---@param posX float ���������� X
---@param posY float ���������� Y
---@param color uint ���� � ARGB
---@param ignoreColorTags bool? ���� ������ `true`, �������� ���� �� ������ �������������� (�� ��������� = `false`)
function renderFontDrawText(font, text, posX, posY, color, ignoreColorTags) end

---
--- ���������� ������������� � ��������� ����������� � �������� ��������� � ����������� �����  
---
--- ### ������ �������������  
---
--- ```lua
---   -- ������������ �� ������ ������
---   local sx, sy = getScreenResolution()
---   renderDrawPolygon(sx / 2, sy / 2, 150, 150, 5, 0.0, 0xFF1166AA)
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawPolygon">Open the wiki</a></b>  
---
---@param posX float ���������� X ������
---@param posY float ���������� Y ������
---@param sizeX float ������
---@param sizeY float ������
---@param corners int ���������� ������
---@param rotation float �������� � ��������
---@param color uint ���� ������ � ������� ARGB
function renderDrawPolygon(posX, posY, sizeX, sizeY, corners, rotation, color) end

---
--- ��������� �������� �� �����  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderLoadTextureFromFile">Open the wiki</a></b>  
---
---@param file zstring ���� � �����
---@return DxTexture texture ��������
function renderLoadTextureFromFile(file) end

---
--- ����������� ����������� ��������.  
--- ��������� �������������, �.�. ��� ����������� �������� ������������� ��������� ������.  
--- ������� ��������� ��� ����������� ������������� �� ������� ��������.  
---
--- ### ������ �������������  
---
--- ```lua
---   renderReleaseTexture(texture )
---   -- ����������:
---   texture  = nil
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderReleaseTexture">Open the wiki</a></b>  
---
---@param texture DxTexture ��������
function renderReleaseTexture(texture) end

---
--- ���������� ����������� �������� �� �������� �����������, � ��������� �������� � ���������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawTexture">Open the wiki</a></b>  
---
---@param texture DxTexture ��������
---@param posX float ���������� X
---@param posY float ���������� Y
---@param sizeX float ������
---@param sizeY float ������
---@param rotation float ��������
---@param color uint ���� � ARGB
function renderDrawTexture(texture, posX, posY, sizeX, sizeY, rotation, color) end

---@alias RenderType
---| 1 # ������ �����
---| 2 # ����� �����
---| 3 # ������� �����
---| 4 # ����� �������������
---| 5 # ����� ��������� ������������� (�������������)
---| 6 # ����� ��������� ������������� � ������ �������

---
--- ������ ��������� ������ ����������� �������.  
--- ��������� � ������ ������ ���������� ����������: <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/bb147291(v=vs.85).aspx">MSDN</a>  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderBegin">Open the wiki</a></b>  
---
---@param type RenderType �����
function renderBegin(type) end

---
--- ���������� ��������� ������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderEnd">Open the wiki</a></b>  
---
function renderEnd() end

---
--- ����� ���� ������. ������ ���� ������� ����� ����������� �������  
---
--- ### ������ �������������  
---
--- ```lua
---   renderColor(0xFFFF0000)
---   renderVertex(10, 100)
---   renderColor(0xFF0000FF)
---   renderVertex(200, 100)
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderColor">Open the wiki</a></b>  
---
---@param color uint ���� � ARGB
function renderColor(color) end

---
--- ��������� ������� � ������ �� ���������� �����������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderVertex">Open the wiki</a></b>  
---
---@param vX float ���������� X
---@param vY float ���������� Y
function renderVertex(vX, vY) end

---
--- ���������, ����� ����� �������� ����� ����������� � ��������� �������.  
--- ���������� ����� �������� � ��������� �� `0.0` �� `1.0`, ������������ �������� ���� ��������.  
--- ������ ���� ������� ����� ������ ����������� �������, � ������� ����� ���������� ��������.  
--- ��� ������ `renderBindTexture` �� ����� ����� �������  
---
--- ### ������ �������������  
---
--- ```lua
---   renderColor(0xFFFFFFFF)
---   renderBindTexture(tex)
---   renderSetTexCoord(0.0, 0.0)
---   renderVertex(100, 100)
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderSetTexCoord">Open the wiki</a></b>  
---
---@param posX float ������������� ���������� X ��������
---@param posY float ������������� ���������� Y ��������
function renderSetTexCoord(posX, posY) end

---
--- ����� ������ ��������. ������ ������ ����� ���� ������ ������ ���� ��������.  
--- �������� `nil` ������� �������� ��������.  
--- ��� ������� ������ ���� ������������ ��������� � `renderSetTexCoord`  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderBindTexture">Open the wiki</a></b>  
---
---@param texture DxTexture ��������
function renderBindTexture(texture) end

---
--- ���������� ��������� �� ������ `IDirect3DTexture9`, ������������� ��������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetTextureStruct">Open the wiki</a></b>  
---
---@param texture DxTexture ��������
---@return uint struct ���������
function renderGetTextureStruct(texture) end

---
--- ���������� ��������� �� ������ ID3DXSprite, ������������� ��������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetTextureSprite">Open the wiki</a></b>  
---
---@param texture DxTexture ��������
---@return uint sprite ���������
function renderGetTextureSprite(texture) end

---
--- ���������� ������� �����������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetTextureSize">Open the wiki</a></b>  
---
---@param texture DxTexture ��������
---@return uint sizeX ������
---@return uint sizeY ������
function renderGetTextureSize(texture) end

---
--- ������������� �������� ������������.  
--- ��������� � �������������: <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/bb172599(v=vs.85).aspx">MSDN</a>  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderSetRenderState">Open the wiki</a></b>  
---
---@param state int ���
---@param value uint ����� ��������
function renderSetRenderState(state, value) end

---
--- ��������� �������� �� ����� � ������ ��������  
---
--- ### ������ �������������  
---
--- ```lua
---   local memory = require 'memory'
---   -- �������� �������� ������ ������ ������ �������
---   function main()
---     repeat wait(0) until isSampAvailable()
---     texture = renderLoadTextureFromFileInMemory(memory.strptr(texture), #texture)
---   end
---   -- ���� ��������
---   texture = "\x89\x50\x4E\x47\x0D\x0A\x1A\x0A\x00\x00\x00..."
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderLoadTextureFromFileInMemory">Open the wiki</a></b>  
---
---@param pointer uint ����� ������
---@param size uint ������ �����
---@return DxTexture texture ��������
function renderLoadTextureFromFileInMemory(pointer, size) end

---
--- ����� �������� ������ �������. ������������� ��������������� ��� ������� �������� ����������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_version_number">Open the wiki</a></b>  
---
---@param version int ������
function script_version_number(version) end

---
--- ����� ��������� ������ �������.  
---
--- ### ������ �������������  
---
--- ```lua
---   script_version("0.2.3-beta")
---   
---   function main()
---     -- ...
---   end
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_version">Open the wiki</a></b>  
---
---@param version string ������
function script_version(version) end

---
--- ����� �������� �������.  
--- ���� �������� �� ������, �� � �������� �������� ����� ��������� ��� ����� �������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_name">Open the wiki</a></b>  
---
---@param name string ��������
function script_name(name) end

---
--- ����� �������� �������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_description">Open the wiki</a></b>  
---
---@param description string ����� ��������
function script_description(description) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_authors">Open the wiki</a></b>
---
---@param author string
---@param ... string
function script_authors(author, ...) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_author">Open the wiki</a></b>
---
---@param author string
function script_author(author) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_dependencies">Open the wiki</a></b>
---
---@param name string
---@param ... string
function script_dependencies(name, ...) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_moonloader">Open the wiki</a></b>
---
---@param version int
function script_moonloader(version) end

---
--- ���������������� ���������� ����������� `main` �� �������� ����� � �������������.  
--- ����� ���� ������� ������ ������� `main` � ���������� �������.  
--- ���� ������� ������� ������� `main` � �������� `time` ����� `-1`, �� ������ ����� ������������� �� ����������� ������ �������, ��� ����� ���� ������������ ��� ����������� ��������� ���������� �������, �� ����� �� ��������� �������� � ������������ �������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/wait">Open the wiki</a></b>  
---
---@param time int ����� � �������������
function wait(time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameGlobal">Open the wiki</a></b>
---
---@param index int
---@return int value
function getGameGlobal(index) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGameGlobal">Open the wiki</a></b>
---
---@param index int
---@param value int
function setGameGlobal(index, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameGlobalPtr">Open the wiki</a></b>
---
---@param index int
---@return uint ptr
function getGameGlobalPtr(index) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampfuncsLoaded">Open the wiki</a></b>
---
---@return bool loaded
function isSampfuncsLoaded() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCleoLoaded">Open the wiki</a></b>
---
---@return bool loaded
function isCleoLoaded() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampLoaded">Open the wiki</a></b>
---
---@return bool loaded
function isSampLoaded() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isKeyDown">Open the wiki</a></b>
---
---@param keyId int
---@return bool state
function isKeyDown(keyId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/reloadScripts">Open the wiki</a></b>
---
function reloadScripts() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isOpcodesAvailable">Open the wiki</a></b>
---
---@return bool status
function isOpcodesAvailable() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/representFloatAsInt">Open the wiki</a></b>
---
---@param f float
---@return int i
function representFloatAsInt(f) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/representIntAsFloat">Open the wiki</a></b>
---
---@param i int
---@return float i
function representIntAsFloat(i) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGxtEntry">Open the wiki</a></b>
---
---@param key string
---@param text string
function setGxtEntry(key, text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFreeGxtEntry">Open the wiki</a></b>
---
---@param text string
---@return string key
function setFreeGxtEntry(text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getFreeGxtKey">Open the wiki</a></b>
---
---@return string key
function getFreeGxtKey() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGxtText">Open the wiki</a></b>
---
---@param key string
---@return string text
function getGxtText(key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearGxtEntry">Open the wiki</a></b>
---
---@param key string
function clearGxtEntry(key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPauseMenuActive">Open the wiki</a></b>
---
---@return bool active
function isPauseMenuActive() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGameWindowForeground">Open the wiki</a></b>
---
---@return bool foreground
function isGameWindowForeground() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameVersion">Open the wiki</a></b>
---
---@return int major
---@return int minor
---@return int majorRev
---@return int minorRev
---@return int game
---@return int region
---@return bool steam
---@return bool cracked
function getGameVersion() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMoonloaderVersion">Open the wiki</a></b>
---
---@return int version
function getMoonloaderVersion() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/localClock">Open the wiki</a></b>
---
---@return double time
function localClock() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freeTextures">Open the wiki</a></b>
---
function freeTextures() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getWorkingDirectory">Open the wiki</a></b>
---
---@return string path
function getWorkingDirectory() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameDirectory">Open the wiki</a></b>
---
---@return string path
function getGameDirectory() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/useRenderCommands">Open the wiki</a></b>
---
---@param enable bool
function useRenderCommands(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/writeMemory">Open the wiki</a></b>
---
---@param address uint
---@param size uint
---@param value int
---@param virtualProtect bool
function writeMemory(address, size, value, virtualProtect) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/readMemory">Open the wiki</a></b>
---
---@param address uint
---@param size uint
---@param virtualProtect bool
---@return int value
function readMemory(address, size, virtualProtect) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadDynamicLibrary">Open the wiki</a></b>
---
---@param library string
---@return bool result
---@return uint handle
function loadDynamicLibrary(library) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freeDynamicLibrary">Open the wiki</a></b>
---
---@param handle uint
function freeDynamicLibrary(handle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDynamicLibraryProcedure">Open the wiki</a></b>
---
---@param proc string
---@param handle uint
---@return bool result
---@return uint proc
function getDynamicLibraryProcedure(proc, handle) end

---
--- ��������� ���� �� �������������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesFileExist">Open the wiki</a></b>  
---
---@param file string ����
---@return bool result ��������� ����������
function doesFileExist(file) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesDirectoryExist">Open the wiki</a></b>
---
---@param directory string
---@return bool result
function doesDirectoryExist(directory) end

---
--- ������ �������� ���������� ��� ���������� ����.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createDirectory">Open the wiki</a></b>  
---
---@param directory string ����
---@return bool result ��������� ����������
function createDirectory(directory) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/popFloat">Open the wiki</a></b>
---
---@return float val
function popFloat() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGameVersionOriginal">Open the wiki</a></b>
---
---@return bool result
function isGameVersionOriginal() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/allocateMemory">Open the wiki</a></b>
---
---@param size uint
---@return uint memory
function allocateMemory(size) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freeMemory">Open the wiki</a></b>
---
---@param memory uint
function freeMemory(memory) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findFirstFile">Open the wiki</a></b>
---
---@param mask string
---@return Filesearch handle
---@return string name
function findFirstFile(mask) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findNextFile">Open the wiki</a></b>
---
---@param handle Filesearch
---@return string file
function findNextFile(handle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findClose">Open the wiki</a></b>
---
---@param handle Filesearch
function findClose(handle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findAllRandomCharsInSphere">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param posZ float
---@param radius float
---@param findNext bool
---@param skipDead bool
---@return bool result
---@return Ped ped
function findAllRandomCharsInSphere(posX, posY, posZ, radius, findNext, skipDead) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findAllRandomVehiclesInSphere">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param posZ float
---@param radius float
---@param findNext bool
---@param skipWrecked bool
---@return bool result
---@return Vehicle car
function findAllRandomVehiclesInSphere(posX, posY, posZ, radius, findNext, skipWrecked) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findAllRandomObjectsInSphere">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param posZ float
---@param radius float
---@param findNext bool
---@return bool result
---@return Object object
function findAllRandomObjectsInSphere(posX, posY, posZ, radius, findNext) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharPointer">Open the wiki</a></b>
---
---@param ped Ped
---@return uint ptr
function getCharPointer(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarPointer">Open the wiki</a></b>
---
---@param car Vehicle
---@return uint ptr
function getCarPointer(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectPointer">Open the wiki</a></b>
---
---@param object Object
---@return uint struct
function getObjectPointer(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/callFunction">Open the wiki</a></b>
---
---@param address uint
---@param params int
---@param pop int
---@param ... any
---@return int returnValue
function callFunction(address, params, pop, ...) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/callMethod">Open the wiki</a></b>
---
---@param address uint
---@param struct int
---@param params int
---@param pop int
---@param ... any
---@return int returnValue
function callMethod(address, struct, params, pop, ...) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/storeClosestEntities">Open the wiki</a></b>
---
---@param ped Ped
---@return Vehicle car
---@return Ped ped
function storeClosestEntities(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchCarEngine">Open the wiki</a></b>
---
---@param car Vehicle
---@param state bool
function switchCarEngine(car, state) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTargetBlipCoordinates">Open the wiki</a></b>
---
---@return bool result
---@return float posX
---@return float posY
---@return float posZ
function getTargetBlipCoordinates() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarNumberOfGears">Open the wiki</a></b>
---
---@param car Vehicle
---@return int gears
function getCarNumberOfGears(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarCurrentGear">Open the wiki</a></b>
---
---@param car Vehicle
---@return int gear
function getCarCurrentGear(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarSirenOn">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool state
function isCarSirenOn(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarEngineOn">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool state
function isCarEngineOn(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printHelpString">Open the wiki</a></b>
---
---@param text string
function printHelpString(text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printStyledString">Open the wiki</a></b>
---
---@param text string
---@param time int
---@param style int
function printStyledString(text, time, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printString">Open the wiki</a></b>
---
---@param text string
---@param time int
function printString(text, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printStringNow">Open the wiki</a></b>
---
---@param text string
---@param time int
function printStringNow(text, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharPlayerIsTargeting">Open the wiki</a></b>
---
---@param player Player
---@return bool result
---@return Ped ped
function getCharPlayerIsTargeting(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNameOfVehicleModel">Open the wiki</a></b>
---
---@param modelId Model
---@return GxtString name
function getNameOfVehicleModel(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/testCheat">Open the wiki</a></b>
---
---@param text string
---@return bool result
function testCheat(text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/spawnVehicleByCheating">Open the wiki</a></b>
---
---@param modelId Model
---@return bool result
function spawnVehicleByCheating(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharPointerHandle">Open the wiki</a></b>
---
---@param ptr uint
---@return Ped handle
function getCharPointerHandle(ptr) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getVehiclePointerHandle">Open the wiki</a></b>
---
---@param ptr uint
---@return Vehicle handle
function getVehiclePointerHandle(ptr) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectPointerHandle">Open the wiki</a></b>
---
---@param ptr uint
---@return Object handle
function getObjectPointerHandle(ptr) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/processLineOfSight">Open the wiki</a></b>
---
---@param originX float
---@param originY float
---@param originZ float
---@param targetX float
---@param targetY float
---@param targetZ float
---@param checkSolid bool? Default value is true
---@param car bool? Default value is false
---@param ped bool? Default value is false
---@param object bool? Default value is false
---@param particle bool? Default value is false
---@param seeThrough bool? Default value is false
---@param ignoreSomeObjects bool? Default value is false
---@param shootThrough bool? Default value is false
---@return bool result
---@return table colPoint
function processLineOfSight(originX, originY, originZ, targetX, targetY, targetZ, checkSolid, car, ped, object, particle, seeThrough, ignoreSomeObjects, shootThrough) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setClipboardText">Open the wiki</a></b>
---
---@param text string
---@return bool result
function setClipboardText(text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClipboardText">Open the wiki</a></b>
---
---@return string text
function getClipboardText() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getStructElement">Open the wiki</a></b>
---
---@param struct uint
---@param offset int
---@param size uint
---@param unprotect bool? Default value is false
---@return int value
function getStructElement(struct, offset, size, unprotect) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setStructElement">Open the wiki</a></b>
---
---@param struct uint
---@param offset int
---@param size uint
---@param value int
---@param unprotect bool? Default value is false
function setStructElement(struct, offset, size, value, unprotect) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertMatrixToQuaternion">Open the wiki</a></b>
---
---@param rightX float
---@param rightY float
---@param rightZ float
---@param frontX float
---@param frontY float
---@param frontZ float
---@param upX float
---@param upY float
---@param upZ float
---@return float w
---@return float x
---@return float y
---@return float z
function convertMatrixToQuaternion(rightX, rightY, rightZ, frontX, frontY, frontZ, upX, upY, upZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertQuaternionToMatrix">Open the wiki</a></b>
---
---@param w float
---@param x float
---@param y float
---@param z float
---@return float rightX
---@return float rightY
---@return float rightZ
---@return float frontX
---@return float frontY
---@return float frontZ
---@return float upX
---@return float upY
---@return float upZ
function convertQuaternionToMatrix(w, x, y, z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreen">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param posZ float
---@return float wposX
---@return float wposY
function convert3DCoordsToScreen(posX, posY, posZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGameKeyState">Open the wiki</a></b>
---
---@param key int
---@param state int
function setGameKeyState(key, state) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCursorPos">Open the wiki</a></b>
---
---@return int posX
---@return int posY
function getCursorPos() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertWindowScreenCoordsToGameScreenCoords">Open the wiki</a></b>
---
---@param wposX float
---@param wposY float
---@return float gposX
---@return float gposY
function convertWindowScreenCoordsToGameScreenCoords(wposX, wposY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertGameScreenCoordsToWindowScreenCoords">Open the wiki</a></b>
---
---@param gposX float
---@param gposY float
---@return float wposX
---@return float wposY
function convertGameScreenCoordsToWindowScreenCoords(gposX, gposY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertScreenCoordsToWorld3D">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param depth float
---@return float posX
---@return float posY
---@return float posZ
function convertScreenCoordsToWorld3D(posX, posY, depth) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getModuleHandle">Open the wiki</a></b>
---
---@param module string
---@return uint handle
function getModuleHandle(module) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getModuleProcAddress">Open the wiki</a></b>
---
---@param module string
---@param proc string
---@return uint address
function getModuleProcAddress(module, proc) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVirtualKeyDown">Open the wiki</a></b>
---
---@param vkey int
---@param down bool
function setVirtualKeyDown(vkey, down) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharKeyDown">Open the wiki</a></b>
---
---@param ckey int
---@param down bool
function setCharKeyDown(ckey, down) end

---@alias DownloadingCallback fun(id: int, status: int, p1: any, p2: any): boolean

---
--- ��������� ���� �� ��������� �� URL �� ��������� HTTP.  
--- ������� �������� ��������� ������������ � ������� ����������� �������� � ����� ���� ������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/downloadUrlToFile">Open the wiki</a></b>  
---
---@param url string uRL �������
---@param file string ���� � �����
---@param statusCallback DownloadingCallback? �������-���������� ������� ��������, �������� �������������� ����������
---@return int index ������������� ��������
function downloadUrlToFile(url, file, statusCallback) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isKeyJustPressed">Open the wiki</a></b>
---
---@param key int
---@return bool state
function isKeyJustPressed(key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreenEx">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param posZ float
---@param checkMin bool? Default value is false
---@param checkMax bool? Default value is false
---@return bool result
---@return float x
---@return float y
---@return float z
---@return float w
---@return float h
function convert3DCoordsToScreenEx(posX, posY, posZ, checkMin, checkMax) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getStructFloatElement">Open the wiki</a></b>
---
---@param struct uint
---@param offset int
---@param unprotect bool? Default value is false
---@return float value
function getStructFloatElement(struct, offset, unprotect) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setStructFloatElement">Open the wiki</a></b>
---
---@param struct uint
---@param offset int
---@param value float
---@param unprotect bool? Default value is false
function setStructFloatElement(struct, offset, value, unprotect) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/wasKeyPressed">Open the wiki</a></b>
---
---@param key int
---@return bool state
function wasKeyPressed(key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/wasKeyReleased">Open the wiki</a></b>
---
---@param key int
---@return bool state
function wasKeyReleased(key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMousewheelDelta">Open the wiki</a></b>
---
---@return int delta
function getMousewheelDelta() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/consumeWindowMessage">Open the wiki</a></b>
---
---@param game bool? Default value is true
---@param scripts bool? Default value is true
function consumeWindowMessage(game, scripts) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addEventHandler">Open the wiki</a></b>
---
---@param ... any
---
---@overload fun(eventName: '"onExitScript"', callback: fun(quitGame: boolean))
---@overload fun(eventName: '"onQuitGame"', callback: fun())
---@overload fun(eventName: '"onScriptLoad"', callback: fun(script: LuaScript))
---@overload fun(eventName: '"onScriptTerminate"', callback: fun(script: LuaScript, quitGame: boolean))
---@overload fun(eventName: '"onSystemInitialized"', callback: fun())
---@overload fun(eventName: '"onScriptMessage"', callback: fun(msg: string, script: LuaScript))
---@overload fun(eventName: '"onSystemMessage"', callback: fun(msg: string, type: int, script: LuaScript))
---@overload fun(eventName: '"onReceivePacket"', callback: fun(id: int, bitStream: Bitstream): boolean?, int?, Bitstream?)
---@overload fun(eventName: '"onReceiveRpc"', callback: fun(id: int, bitStream: Bitstream): boolean?, int?, Bitstream?)
---@overload fun(eventName: '"onSendPacket"', callback: fun(id: int, bitStream: Bitstream, priority: int, relability: int, orderingChannel: int): boolean?, int?, Bitstream?, int?, int?, int?)
---@overload fun(eventName: '"onSendRpc"', callback: fun(id: int, bitStream: Bitstream, priority: int, relability: int, orderingChannel: int, shiftTs: boolean): boolean?, int?, Bitstream?, int?, int?, int?, boolean?)
---@overload fun(eventName: '"onWindowMessage"', callback: fun(msg: uint, wparam: uint, lparam: int))
---@overload fun(eventName: '"onStartNewGame"', callback: fun(mpack: int))
---@overload fun(eventName: '"onLoadGame"', callback: fun(saveData: table))
---@overload fun(eventName: '"onSaveGame"', callback: fun(saveData: table): table?)
function addEventHandler(...) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGamePaused">Open the wiki</a></b>
---
---@return bool paused
function isGamePaused() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/gameClock">Open the wiki</a></b>
---
---@return double time
function gameClock() end

---@alias ScriptProperty
---| '"work-in-pause"' # ���������, ��� ������ ����� ���������� ���������� �� ����� ����� ���� (� ��������, ��� ���� ��������� � ��������� �� �������� �����).
---| '"forced-reloading-only"' # �������� �������������� ������������ �������, �������� ����������� ������ �������������� ������������.

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_properties">Open the wiki</a></b>
---
---@param property string
---@param ... ScriptProperty
function script_properties(property, ...) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_url">Open the wiki</a></b>
---
---@param url string
function script_url(url) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/import">Open the wiki</a></b>
---
---@param filename string
---@return any imports
function import(filename) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/encodeJson">Open the wiki</a></b>
---
---@param data table
---@return string json
function encodeJson(data) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/decodeJson">Open the wiki</a></b>
---
---@param json string
---@return table data
function decodeJson(json) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/showCursor">Open the wiki</a></b>
---
---@param show bool
---@param lockControls bool? Default value is nil
function showCursor(show, lockControls) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/lockPlayerControl">Open the wiki</a></b>
---
---@param lock bool
function lockPlayerControl(lock) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerControlLocked">Open the wiki</a></b>
---
---@return bool locked
function isPlayerControlLocked() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setBlipCoordinates">Open the wiki</a></b>
---
---@param blip Marker
---@param x float
---@param y float
---@param z float
---@return bool result
function setBlipCoordinates(blip, x, y, z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTargetBlipCoordinates">Open the wiki</a></b>
---
---@param x float
---@param y float
---@param z float
---@return bool result
function setTargetBlipCoordinates(x, y, z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/placeWaypoint">Open the wiki</a></b>
---
---@param x float
---@param y float
---@param z float
---@return bool result
function placeWaypoint(x, y, z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeWaypoint">Open the wiki</a></b>
---
---@return bool result
function removeWaypoint() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getFolderPath">Open the wiki</a></b>
---
---@param csidl int
---@return string path
function getFolderPath(csidl) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTimeStepValue">Open the wiki</a></b>
---
---@return float value
function getTimeStepValue() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getD3DDevicePtr">Open the wiki</a></b>
---
---@return uint devicePtr
function getD3DDevicePtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAllObjects">Open the wiki</a></b>
---
---@return Object[] objects
function getAllObjects() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAllChars">Open the wiki</a></b>
---
---@return Ped[] peds
function getAllChars() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAllVehicles">Open the wiki</a></b>
---
---@return Vehicle[] vehicles
function getAllVehicles() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameGlobalFloat">Open the wiki</a></b>
---
---@param index int
---@return float value
function getGameGlobalFloat(index) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGameGlobalFloat">Open the wiki</a></b>
---
---@param index int
---@param value float
function setGameGlobalFloat(index, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shakeCam">Open the wiki</a></b>
---
---@param shake int
function shakeCam(shake) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createPlayer">Open the wiki</a></b>
---
---@param modelId Model
---@param atX float
---@param atY float
---@param atZ float
---@return Player player
function createPlayer(modelId, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createChar">Open the wiki</a></b>
---
---@param pedtype int
---@param modelId Model
---@param atX float
---@param atY float
---@param atZ float
---@return Ped ped
function createChar(pedtype, modelId, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteChar">Open the wiki</a></b>
---
---@param ped Ped
function deleteChar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharCoordinates">Open the wiki</a></b>
---
---@param ped Ped
---@return float positionX
---@return float positionY
---@return float positionZ
function getCharCoordinates(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCoordinates">Open the wiki</a></b>
---
---@param ped Ped
---@param posX float
---@param posY float
---@param posZ float
function setCharCoordinates(ped, posX, posY, posZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInArea2d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param sphere bool
---@return bool result
function isCharInArea2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInArea3d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@param sphere bool
---@return bool result
function isCharInArea3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCar">Open the wiki</a></b>
---
---@param modelId Model
---@param atX float
---@param atY float
---@param atZ float
---@return Vehicle car
function createCar(modelId, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteCar">Open the wiki</a></b>
---
---@param car Vehicle
function deleteCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/carGotoCoordinates">Open the wiki</a></b>
---
---@param car Vehicle
---@param driveToX float
---@param driveToY float
---@param driveToZ float
function carGotoCoordinates(car, driveToX, driveToY, driveToZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/carWanderRandomly">Open the wiki</a></b>
---
---@param car Vehicle
function carWanderRandomly(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/carSetIdle">Open the wiki</a></b>
---
---@param car Vehicle
function carSetIdle(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarCoordinates">Open the wiki</a></b>
---
---@param car Vehicle
---@return float positionX
---@return float positionY
---@return float positionZ
function getCarCoordinates(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCoordinates">Open the wiki</a></b>
---
---@param car Vehicle
---@param atX float
---@param atY float
---@param atZ float
function setCarCoordinates(car, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCruiseSpeed">Open the wiki</a></b>
---
---@param car Vehicle
---@param maxSpeed float
function setCarCruiseSpeed(car, maxSpeed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarDrivingStyle">Open the wiki</a></b>
---
---@param car Vehicle
---@param behaviour int
function setCarDrivingStyle(car, behaviour) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarMission">Open the wiki</a></b>
---
---@param car Vehicle
---@param driverBehaviour int
function setCarMission(car, driverBehaviour) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarInArea2d">Open the wiki</a></b>
---
---@param car Vehicle
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param sphere bool
---@return bool result
function isCarInArea2d(car, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarInArea3d">Open the wiki</a></b>
---
---@param car Vehicle
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@param sphere bool
---@return bool result
function isCarInArea3d(car, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printBig">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param time int
---@param style int
function printBig(gxtString, time, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printText">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param time int
---@param flag int
function printText(gxtString, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printTextNow">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param time int
---@param flag int
function printTextNow(gxtString, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearPrints">Open the wiki</a></b>
---
function clearPrints() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTimeOfDay">Open the wiki</a></b>
---
---@return int hours
---@return int mins
function getTimeOfDay() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTimeOfDay">Open the wiki</a></b>
---
---@param hours int
---@param minutes int
function setTimeOfDay(hours, minutes) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMinutesToTimeOfDay">Open the wiki</a></b>
---
---@param hours int
---@param minutes int
---@return int minutes
function getMinutesToTimeOfDay(hours, minutes) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPointOnScreen">Open the wiki</a></b>
---
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radius float
---@return bool result
function isPointOnScreen(sphereX, sphereY, sphereZ, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/storeCarCharIsIn">Open the wiki</a></b>
---
---@param ped Ped
---@return Vehicle car
function storeCarCharIsIn(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInCar">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@return bool result
function isCharInCar(ped, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInModel">Open the wiki</a></b>
---
---@param ped Ped
---@param carModel Model
---@return bool result
function isCharInModel(ped, carModel) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyCar">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharInAnyCar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isButtonPressed">Open the wiki</a></b>
---
---@param player Player
---@param key int
---@return bool result
function isButtonPressed(player, key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPadState">Open the wiki</a></b>
---
---@param player Player
---@param key int
---@return int state
function getPadState(player, key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeans2d">Open the wiki</a></b>
---
---@param ped Ped
---@param pointX float
---@param pointY float
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharAnyMeans2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFoot2d">Open the wiki</a></b>
---
---@param ped Ped
---@param pointX float
---@param pointY float
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharOnFoot2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param pointX float
---@param pointY float
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharInCar2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCharAnyMeans2d">Open the wiki</a></b>
---
---@param ped Ped
---@param pointX float
---@param pointY float
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateStoppedCharAnyMeans2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCharOnFoot2d">Open the wiki</a></b>
---
---@param ped Ped
---@param pointX float
---@param pointY float
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateStoppedCharOnFoot2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCharInCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param pointX float
---@param pointY float
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateStoppedCharInCar2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansChar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharAnyMeansChar2d(ped, nearPed, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFootChar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX float
---@param radiusY float
---@param sphere bool
function locateCharOnFootChar2d(ped, nearPed, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCarChar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharInCarChar2d(ped, nearPed, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeans3d">Open the wiki</a></b>
---
---@param ped Ped
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateCharAnyMeans3d(ped, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFoot3d">Open the wiki</a></b>
---
---@param ped Ped
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateCharOnFoot3d(ped, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateCharInCar3d(ped, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCharAnyMeans3d">Open the wiki</a></b>
---
---@param ped Ped
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateStoppedCharAnyMeans3d(ped, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCharOnFoot3d">Open the wiki</a></b>
---
---@param ped Ped
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateStoppedCharOnFoot3d(ped, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCharInCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateStoppedCharInCar3d(ped, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansChar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateCharAnyMeansChar3d(ped, nearPed, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFootChar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateCharOnFootChar3d(ped, nearPed, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCarChar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateCharInCarChar3d(ped, nearPed, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createObject">Open the wiki</a></b>
---
---@param modelId Model
---@param atX float
---@param atY float
---@param atZ float
---@return Object object
function createObject(modelId, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteObject">Open the wiki</a></b>
---
---@param object Object
function deleteObject(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/givePlayerMoney">Open the wiki</a></b>
---
---@param player Player
---@param money int
function givePlayerMoney(player, money) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPlayerMoney">Open the wiki</a></b>
---
---@param player Player
---@return int money
function getPlayerMoney(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/giveRemoteControlledCarToPlayer">Open the wiki</a></b>
---
---@param player Player
---@param float2 float
---@param float3 float
---@param float4 float
function giveRemoteControlledCarToPlayer(player, float2, float3, float4) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/alterWantedLevel">Open the wiki</a></b>
---
---@param player Player
---@param wantedLevel int
function alterWantedLevel(player, wantedLevel) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/alterWantedLevelNoDrop">Open the wiki</a></b>
---
---@param player Player
---@param minimumWantedLevel int
function alterWantedLevelNoDrop(player, minimumWantedLevel) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isWantedLevelGreater">Open the wiki</a></b>
---
---@param player Player
---@param level int
---@return bool result
function isWantedLevelGreater(player, level) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearWantedLevel">Open the wiki</a></b>
---
---@param player Player
function clearWantedLevel(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setDeatharrestState">Open the wiki</a></b>
---
---@param value bool
function setDeatharrestState(value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasDeatharrestBeenExecuted">Open the wiki</a></b>
---
---@return bool result
function hasDeatharrestBeenExecuted() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addAmmoToChar">Open the wiki</a></b>
---
---@param ped Ped
---@param weapon int
---@param ammo int
function addAmmoToChar(ped, weapon, ammo) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerDead">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isPlayerDead(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharDead">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharDead(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarDead">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarDead(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerPressingHorn">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isPlayerPressingHorn(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCharInsideCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param pedtype Model
---@param model int
---@return Ped ped
function createCharInsideCar(car, pedtype, model) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarModel">Open the wiki</a></b>
---
---@param car Vehicle
---@param modelId Model
---@return bool result
function isCarModel(car, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCarGenerator">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param angle float
---@param modelId Model
---@param color1 int
---@param color2 int
---@param forceSpawn bool
---@param alarm int
---@param doorLock int
---@param minDelay int
---@param maxDelay int
---@return int carGenerator
function createCarGenerator(atX, atY, atZ, angle, modelId, color1, color2, forceSpawn, alarm, doorLock, minDelay, maxDelay) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchCarGenerator">Open the wiki</a></b>
---
---@param carGenerator int
---@param carsToGenerate int
function switchCarGenerator(carGenerator, carsToGenerate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayOnscreenTimer">Open the wiki</a></b>
---
---@param var VarId
---@param countInDirection bool
function displayOnscreenTimer(var, countInDirection) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearOnscreenTimer">Open the wiki</a></b>
---
---@param var VarId
function clearOnscreenTimer(var) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearOnscreenCounter">Open the wiki</a></b>
---
---@param var VarId
function clearOnscreenCounter(var) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInZone">Open the wiki</a></b>
---
---@param ped Ped
---@param zoneName GxtString
---@return bool result
function isCharInZone(ped, zoneName) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pointCameraAtCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param mode int
---@param switchstyle int
function pointCameraAtCar(car, mode, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pointCameraAtChar">Open the wiki</a></b>
---
---@param ped Ped
---@param mode int
---@param switchstyle int
function pointCameraAtChar(ped, mode, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/restoreCamera">Open the wiki</a></b>
---
function restoreCamera() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shakePad">Open the wiki</a></b>
---
---@param player Player
---@param time int
---@param intensity int
function shakePad(player, time, intensity) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTimeScale">Open the wiki</a></b>
---
---@param gamespeed float
function setTimeScale(gamespeed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFixedCameraPosition">Open the wiki</a></b>
---
---@param positionX float
---@param positionY float
---@param positionZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
function setFixedCameraPosition(positionX, positionY, positionZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pointCameraAtPoint">Open the wiki</a></b>
---
---@param pointAtX float
---@param pointAtY float
---@param pointAtZ float
---@param switchstyle int
function pointCameraAtPoint(pointAtX, pointAtY, pointAtZ, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForCarOld">Open the wiki</a></b>
---
---@param car Vehicle
---@param unused int
---@param visibility bool
---@return Marker marker
function addBlipForCarOld(car, unused, visibility) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForCharOld">Open the wiki</a></b>
---
---@param ped Ped
---@param int2 int
---@param int3 int
---@return Marker marker
function addBlipForCharOld(ped, int2, int3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeBlip">Open the wiki</a></b>
---
---@param marker Marker
function removeBlip(marker) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeBlipColour">Open the wiki</a></b>
---
---@param marker Marker
---@param color int
function changeBlipColour(marker, color) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForCoordOld">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param color int
---@param flag int
---@return Marker marker
function addBlipForCoordOld(atX, atY, atZ, color, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeBlipScale">Open the wiki</a></b>
---
---@param marker Marker
---@param size int
function changeBlipScale(marker, size) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFadingColour">Open the wiki</a></b>
---
---@param r int
---@param g int
---@param b int
function setFadingColour(r, g, b) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doFade">Open the wiki</a></b>
---
---@param _in bool
---@param time int
function doFade(_in, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getFadingStatus">Open the wiki</a></b>
---
---@return bool result
function getFadingStatus() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addHospitalRestart">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param angle float
---@param townNumber int
function addHospitalRestart(atX, atY, atZ, angle, townNumber) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addPoliceRestart">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param angle float
---@param townNumber int
function addPoliceRestart(atX, atY, atZ, angle, townNumber) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/overrideNextRestart">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param angle float
function overrideNextRestart(atX, atY, atZ, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawShadow">Open the wiki</a></b>
---
---@param particle Particle
---@param atX float
---@param atY float
---@param atZ float
---@param rotationFactor float
---@param size float
---@param intensity int
---@param flags1 int
---@param flags2 int
---@param flags3 int
function drawShadow(particle, atX, atY, atZ, rotationFactor, size, intensity, flags1, flags2, flags3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharHeading">Open the wiki</a></b>
---
---@param ped Ped
---@return float angle
function getCharHeading(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharHeading">Open the wiki</a></b>
---
---@param ped Ped
---@param angle float
function setCharHeading(ped, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarHeading">Open the wiki</a></b>
---
---@param car Vehicle
---@return float angle
function getCarHeading(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarHeading">Open the wiki</a></b>
---
---@param car Vehicle
---@param angle float
function setCarHeading(car, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectHeading">Open the wiki</a></b>
---
---@param object Object
---@return float angle
function getObjectHeading(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectHeading">Open the wiki</a></b>
---
---@param object Object
---@param angle float
function setObjectHeading(object, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharTouchingObject">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@return bool result
function isCharTouchingObject(ped, object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharAmmo">Open the wiki</a></b>
---
---@param ped Ped
---@param weapon int
---@param ammo int
function setCharAmmo(ped, weapon, ammo) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/declareMissionFlag">Open the wiki</a></b>
---
---@param flag VarId
function declareMissionFlag(flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForCar">Open the wiki</a></b>
---
---@param car Vehicle
---@return Marker marker
function addBlipForCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForChar">Open the wiki</a></b>
---
---@param ped Ped
---@return Marker marker
function addBlipForChar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForObject">Open the wiki</a></b>
---
---@param object Object
---@return Marker marker
function addBlipForObject(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForCoord">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@return Checkpoint checkpoint
function addBlipForCoord(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeBlipDisplay">Open the wiki</a></b>
---
---@param marker Marker
---@param mode int
function changeBlipDisplay(marker, mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addOneOffSound">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param sound int
function addOneOffSound(atX, atY, atZ, sound) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addContinuousSound">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param sound int
---@return int unk
function addContinuousSound(atX, atY, atZ, sound) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeSound">Open the wiki</a></b>
---
---@param sound int
function removeSound(sound) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarStuckOnRoof">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarStuckOnRoof(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addUpsidedownCarCheck">Open the wiki</a></b>
---
---@param car Vehicle
function addUpsidedownCarCheck(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeUpsidedownCarCheck">Open the wiki</a></b>
---
---@param car Vehicle
function removeUpsidedownCarCheck(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAreaOnFoot2d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param sphere bool
---@return bool result
function isCharInAreaOnFoot2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAreaInCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param sphere bool
---@return bool result
function isCharInAreaInCar2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInArea2d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param sphere bool
---@return bool result
function isCharStoppedInArea2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaOnFoot2d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param sphere bool
---@return bool result
function isCharStoppedInAreaOnFoot2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaInCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param sphere bool
---@return bool result
function isCharStoppedInAreaInCar2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAreaOnFoot3d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@param sphere bool
---@return bool result
function isCharInAreaOnFoot3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAreaInCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@param sphere bool
---@return bool result
function isCharInAreaInCar3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInArea3d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@param sphere bool
---@return bool result
function isCharStoppedInArea3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaOnFoot3d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@param sphere bool
---@return bool result
function isCharStoppedInAreaOnFoot3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaInCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@param sphere bool
---@return bool result
function isCharStoppedInAreaInCar3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarStoppedInArea2d">Open the wiki</a></b>
---
---@param car Vehicle
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param sphere bool
---@return bool result
function isCarStoppedInArea2d(car, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarStoppedInArea3d">Open the wiki</a></b>
---
---@param car Vehicle
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@param sphere bool
---@return bool result
function isCarStoppedInArea3d(car, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCar2d">Open the wiki</a></b>
---
---@param car Vehicle
---@param pointX float
---@param pointY float
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCar2d(car, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCar2d">Open the wiki</a></b>
---
---@param car Vehicle
---@param pointX float
---@param pointY float
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateStoppedCar2d(car, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCar3d">Open the wiki</a></b>
---
---@param car Vehicle
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateCar3d(car, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCar3d">Open the wiki</a></b>
---
---@param car Vehicle
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateStoppedCar3d(car, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/giveWeaponToChar">Open the wiki</a></b>
---
---@param ped Ped
---@param weapon int
---@param ammo int
function giveWeaponToChar(ped, weapon, ammo) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerControl">Open the wiki</a></b>
---
---@param player Player
---@param canMove bool
---@return bool result
function setPlayerControl(player, canMove) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceWeather">Open the wiki</a></b>
---
---@param weather int
---@return bool result
function forceWeather(weather) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceWeatherNow">Open the wiki</a></b>
---
---@param weather int
---@return bool result
function forceWeatherNow(weather) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releaseWeather">Open the wiki</a></b>
---
function releaseWeather() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCurrentCharWeapon">Open the wiki</a></b>
---
---@param ped Ped
---@param weapon int
function setCurrentCharWeapon(ped, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectCoordinates">Open the wiki</a></b>
---
---@param object Object
---@return bool result
---@return float positionX
---@return float positionY
---@return float positionZ
function getObjectCoordinates(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectCoordinates">Open the wiki</a></b>
---
---@param object Object
---@param atX float
---@param atY float
---@param atZ float
---@return bool result
function setObjectCoordinates(object, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameTimer">Open the wiki</a></b>
---
---@return int timeMs
function getGameTimer() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/storeWantedLevel">Open the wiki</a></b>
---
---@param player Player
---@return bool result
---@return int level
function storeWantedLevel(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarStopped">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarStopped(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markCharAsNoLongerNeeded">Open the wiki</a></b>
---
---@param ped Ped
function markCharAsNoLongerNeeded(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markCarAsNoLongerNeeded">Open the wiki</a></b>
---
---@param car Vehicle
function markCarAsNoLongerNeeded(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markObjectAsNoLongerNeeded">Open the wiki</a></b>
---
---@param object Object
function markObjectAsNoLongerNeeded(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dontRemoveChar">Open the wiki</a></b>
---
---@param ped Ped
function dontRemoveChar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dontRemoveObject">Open the wiki</a></b>
---
---@param object Object
function dontRemoveObject(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCharAsPassenger">Open the wiki</a></b>
---
---@param car Vehicle
---@param pedtype Model
---@param model int
---@param passengerSeat int
---@return bool result
---@return Ped ped
function createCharAsPassenger(car, pedtype, model, passengerSeat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWithNumberBig">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param number int
---@param time int
---@param style int
---@return bool result
function printWithNumberBig(gxtString, number, time, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWithNumber">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param number int
---@param time int
---@param flag int
---@return bool result
function printWithNumber(gxtString, number, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWithNumberNow">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param number int
---@param time int
---@param flag int
---@return bool result
function printWithNumberNow(gxtString, number, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchRoadsOn">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@return bool result
function switchRoadsOn(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchRoadsOff">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function switchRoadsOff(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumberOfPassengers">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
---@return int passengers
function getNumberOfPassengers(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMaximumNumberOfPassengers">Open the wiki</a></b>
---
---@param car Vehicle
---@return int maxPassengers
function getMaximumNumberOfPassengers(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarDensityMultiplier">Open the wiki</a></b>
---
---@param multiplier float
---@return bool result
function setCarDensityMultiplier(multiplier) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarHeavy">Open the wiki</a></b>
---
---@param car Vehicle
---@param heavy bool
---@return bool result
function setCarHeavy(car, heavy) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMaxWantedLevel">Open the wiki</a></b>
---
---@param level int
function setMaxWantedLevel(level) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarInAirProper">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarInAirProper(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarUpsidedown">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarUpsidedown(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPlayerChar">Open the wiki</a></b>
---
---@param player Player
---@return bool result
---@return Ped ped
function getPlayerChar(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cancelOverrideRestart">Open the wiki</a></b>
---
---@return bool result
function cancelOverrideRestart() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPoliceIgnorePlayer">Open the wiki</a></b>
---
---@param player Player
---@param ignored bool
---@return bool result
function setPoliceIgnorePlayer(player, ignored) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startKillFrenzy">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param weapon int
---@param timeLimit int
---@param targets int
---@param targetModels1 Model
---@param targetModels2 Model
---@param targetModels3 Model
---@param targetModels4 Model
---@param completedText bool
---@return bool result
function startKillFrenzy(gxtString, weapon, timeLimit, targets, targetModels1, targetModels2, targetModels3, targetModels4, completedText) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/readKillFrenzyStatus">Open the wiki</a></b>
---
---@return bool result
---@return int status
function readKillFrenzyStatus() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharAnyMeansCar2d(ped, car, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFootCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radiusX float
---@param radiusY float
---@param flag bool
---@return bool result
function locateCharOnFootCar2d(ped, car, radiusX, radiusY, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCarCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharInCarCar2d(ped, car, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param flag bool
---@return bool result
function locateCharAnyMeansCar3d(ped, car, radiusX, radiusY, radiusZ, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFootCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param flag bool
---@return bool result
function locateCharOnFootCar3d(ped, car, radiusX, radiusY, radiusZ, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCarCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param flag bool
---@return bool result
function locateCharInCarCar3d(ped, car, radiusX, radiusY, radiusZ, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/lockCarDoors">Open the wiki</a></b>
---
---@param car Vehicle
---@param status int
function lockCarDoors(car, status) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/explodeCar">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function explodeCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addExplosion">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius int
---@return bool result
function addExplosion(atX, atY, atZ, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarUpright">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarUpright(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createPickup">Open the wiki</a></b>
---
---@param modelId Model
---@param type int
---@param atX float
---@param atY float
---@param atZ float
---@return bool result
---@return Pickup pickup
function createPickup(modelId, type, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasPickupBeenCollected">Open the wiki</a></b>
---
---@param pickup Pickup
---@return bool result
function hasPickupBeenCollected(pickup) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removePickup">Open the wiki</a></b>
---
---@param pickup Pickup
---@return bool result
function removePickup(pickup) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTaxiLights">Open the wiki</a></b>
---
---@param taxi Vehicle
---@param light bool
---@return bool result
function setTaxiLights(taxi, light) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printBigQ">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param time int
---@param style int
---@return bool result
function printBigQ(gxtString, time, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTargetCarForMissionGarage">Open the wiki</a></b>
---
---@param garage GxtString
---@param car Vehicle
---@return bool result
function setTargetCarForMissionGarage(garage, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/applyBrakesToPlayersCar">Open the wiki</a></b>
---
---@param player Player
---@param apply bool
---@return bool result
function applyBrakesToPlayersCar(player, apply) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharHealth">Open the wiki</a></b>
---
---@param ped Ped
---@param health int
function setCharHealth(ped, health) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarHealth">Open the wiki</a></b>
---
---@param car Vehicle
---@param health int
function setCarHealth(car, health) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharHealth">Open the wiki</a></b>
---
---@param ped Ped
---@return int health
function getCharHealth(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarHealth">Open the wiki</a></b>
---
---@param car Vehicle
---@return int health
function getCarHealth(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeCarColour">Open the wiki</a></b>
---
---@param car Vehicle
---@param primaryColor int
---@param secondaryColor int
---@return bool result
function changeCarColour(car, primaryColor, secondaryColor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchPedRoadsOn">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function switchPedRoadsOn(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchPedRoadsOff">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function switchPedRoadsOff(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGangWeapons">Open the wiki</a></b>
---
---@param gang int
---@param weapons1 int
---@param weapons2 int
---@param weapons3 int
function setGangWeapons(gang, weapons1, weapons2, weapons3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharTouchingObjectOnFoot">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@return bool result
function isCharTouchingObjectOnFoot(ped, object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadSpecialCharacter">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param id int
function loadSpecialCharacter(gxtString, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasSpecialCharacterLoaded">Open the wiki</a></b>
---
---@param id int
---@return bool result
function hasSpecialCharacterLoaded(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerInRemoteMode">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isPlayerInRemoteMode(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCutsceneOffset">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param posZ float
function setCutsceneOffset(posX, posY, posZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAnimGroupForChar">Open the wiki</a></b>
---
---@param ped Ped
---@param style string
function setAnimGroupForChar(ped, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/requestModel">Open the wiki</a></b>
---
---@param modelId Model
function requestModel(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasModelLoaded">Open the wiki</a></b>
---
---@param modelId Model
---@return bool result
function hasModelLoaded(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markModelAsNoLongerNeeded">Open the wiki</a></b>
---
---@param modelId Model
function markModelAsNoLongerNeeded(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawCorona">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
---@param type int
---@param lensflares bool
---@param r int
---@param g int
---@param b int
function drawCorona(atX, atY, atZ, radius, type, lensflares, r, g, b) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/storeClock">Open the wiki</a></b>
---
function storeClock() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/restoreClock">Open the wiki</a></b>
---
function restoreClock() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerPlaying">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isPlayerPlaying(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getControllerMode">Open the wiki</a></b>
---
---@return int mode
function getControllerMode() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCanResprayCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param sprayable bool
function setCanResprayCar(car, sprayable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/unloadSpecialCharacter">Open the wiki</a></b>
---
---@param id int
function unloadSpecialCharacter(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/resetNumOfModelsKilledByPlayer">Open the wiki</a></b>
---
---@param player Player
function resetNumOfModelsKilledByPlayer(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumOfModelsKilledByPlayer">Open the wiki</a></b>
---
---@param player Player
---@param modelId Model
---@return int quantity
function getNumOfModelsKilledByPlayer(player, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/activateGarage">Open the wiki</a></b>
---
---@param garage GxtString
function activateGarage(garage) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createObjectNoOffset">Open the wiki</a></b>
---
---@param modelId Model
---@param atX float
---@param atY float
---@param atZ float
---@return Object object
function createObjectNoOffset(modelId, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStopped">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharStopped(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchWidescreen">Open the wiki</a></b>
---
---@param enable bool
function switchWidescreen(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addSpriteBlipForContactPoint">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param icon int
---@return Marker marker
function addSpriteBlipForContactPoint(atX, atY, atZ, icon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addSpriteBlipForCoord">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param type int
---@return Marker marker
function addSpriteBlipForCoord(atX, atY, atZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharOnlyDamagedByPlayer">Open the wiki</a></b>
---
---@param ped Ped
---@param enabled bool
function setCharOnlyDamagedByPlayer(ped, enabled) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarOnlyDamagedByPlayer">Open the wiki</a></b>
---
---@param car Vehicle
---@param enabled bool
function setCarOnlyDamagedByPlayer(car, enabled) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharProofs">Open the wiki</a></b>
---
---@param ped Ped
---@param BP bool
---@param FP bool
---@param EP bool
---@param CP bool
---@param MP bool
function setCharProofs(ped, BP, FP, EP, CP, MP) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarProofs">Open the wiki</a></b>
---
---@param car Vehicle
---@param BP bool
---@param FP bool
---@param EP bool
---@param CP bool
---@param MP bool
function setCarProofs(car, BP, FP, EP, CP, MP) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deactivateGarage">Open the wiki</a></b>
---
---@param garage GxtString
function deactivateGarage(garage) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarInWater">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarInWater(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClosestCharNode">Open the wiki</a></b>
---
---@param closestToX float
---@param closestToY float
---@param closestToZ float
---@return float nodeX
---@return float nodeY
---@return float nodeZ
function getClosestCharNode(closestToX, closestToY, closestToZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClosestCarNode">Open the wiki</a></b>
---
---@param closestToX float
---@param closestToY float
---@param closestToZ float
---@return float nodeX
---@return float nodeY
---@return float nodeZ
function getClosestCarNode(closestToX, closestToY, closestToZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesAccurate">Open the wiki</a></b>
---
---@param car Vehicle
---@param toX float
---@param toY float
---@param toZ float
function carGotoCoordinatesAccurate(car, toX, toY, toZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarOnScreen">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarOnScreen(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharOnScreen">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharOnScreen(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectOnScreen">Open the wiki</a></b>
---
---@param object Object
---@return bool result
function isObjectOnScreen(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGroundZFor3dCoord">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@return float z
function getGroundZFor3dCoord(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startScriptFire">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param propagation int
---@param size int
---@return int fire
function startScriptFire(atX, atY, atZ, propagation, size) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isScriptFireExtinguished">Open the wiki</a></b>
---
---@param fire int
---@return bool result
function isScriptFireExtinguished(fire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeScriptFire">Open the wiki</a></b>
---
---@param fire int
function removeScriptFire(fire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/boatGotoCoords">Open the wiki</a></b>
---
---@param boat Vehicle
---@param toX float
---@param toY float
---@param toZ float
function boatGotoCoords(boat, toX, toY, toZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/boatStop">Open the wiki</a></b>
---
---@param car Vehicle
function boatStop(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharShootingInArea">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param weapon int
---@return bool result
function isCharShootingInArea(ped, cornerAX, cornerAY, cornerBX, cornerBY, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCurrentCharWeapon">Open the wiki</a></b>
---
---@param ped Ped
---@param weapon int
---@return bool result
function isCurrentCharWeapon(ped, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setBoatCruiseSpeed">Open the wiki</a></b>
---
---@param boat Vehicle
---@param speed float
function setBoatCruiseSpeed(boat, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCharInZone">Open the wiki</a></b>
---
---@param zone GxtString
---@param pedtype bool
---@param gang bool
---@param criminal_prostitute bool
---@return Ped ped
function getRandomCharInZone(zone, pedtype, gang, criminal_prostitute) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharShooting">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharShooting(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createMoneyPickup">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param cash int
---@param permanenceFlag bool
---@return Pickup pickup
function createMoneyPickup(atX, atY, atZ, cash, permanenceFlag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharAccuracy">Open the wiki</a></b>
---
---@param ped Ped
---@param accuracy int
function setCharAccuracy(ped, accuracy) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarSpeed">Open the wiki</a></b>
---
---@param car Vehicle
---@return float speed
function getCarSpeed(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadCutscene">Open the wiki</a></b>
---
---@param cutscene GxtString
function loadCutscene(cutscene) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCutsceneObject">Open the wiki</a></b>
---
---@param modelId Model
---@return Object object
function createCutsceneObject(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCutsceneAnim">Open the wiki</a></b>
---
---@param cutscene int
---@param anim GxtString
function setCutsceneAnim(cutscene, anim) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startCutscene">Open the wiki</a></b>
---
function startCutscene() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCutsceneTime">Open the wiki</a></b>
---
---@return int time
function getCutsceneTime() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCutsceneFinished">Open the wiki</a></b>
---
---@return bool result
function hasCutsceneFinished() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCutscene">Open the wiki</a></b>
---
function clearCutscene() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/restoreCameraJumpcut">Open the wiki</a></b>
---
function restoreCameraJumpcut() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCollectable1Total">Open the wiki</a></b>
---
---@param total int
function setCollectable1Total(total) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isProjectileInArea">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@return bool result
function isProjectileInArea(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharModel">Open the wiki</a></b>
---
---@param ped Ped
---@param modelId Model
---@return bool result
function isCharModel(ped, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadSpecialModel">Open the wiki</a></b>
---
---@param modelId Model
---@param gxtString GxtString
function loadSpecialModel(modelId, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarForwardX">Open the wiki</a></b>
---
---@param car Vehicle
---@return float forwardX
function getCarForwardX(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarForwardY">Open the wiki</a></b>
---
---@param car Vehicle
---@return float forwardY
function getCarForwardY(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeGarageType">Open the wiki</a></b>
---
---@param garage GxtString
---@param type int
function changeGarageType(garage, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWith2NumbersNow">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param numbers1 int
---@param numbers2 int
---@param time int
---@param flag int
function printWith2NumbersNow(gxtString, numbers1, numbers2, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWith3Numbers">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param numbers1 int
---@param numbers2 int
---@param numbers3 int
---@param time int
---@param flag int
function printWith3Numbers(gxtString, numbers1, numbers2, numbers3, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWith4Numbers">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param numbers1 int
---@param numbers2 int
---@param numbers3 int
---@param numbers4 int
---@param time int
---@param flag int
function printWith4Numbers(gxtString, numbers1, numbers2, numbers3, numbers4, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWith4NumbersNow">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param numbers1 int
---@param numbers2 int
---@param numbers3 int
---@param numbers4 int
---@param time int
---@param flag int
function printWith4NumbersNow(gxtString, numbers1, numbers2, numbers3, numbers4, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWith6Numbers">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param numbers1 int
---@param numbers2 int
---@param numbers3 int
---@param numbers4 int
---@param numbers5 int
---@param numbers6 int
---@param time int
---@param flag int
function printWith6Numbers(gxtString, numbers1, numbers2, numbers3, numbers4, numbers5, numbers6, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playerMadeProgress">Open the wiki</a></b>
---
---@param progress int
function playerMadeProgress(progress) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setProgressTotal">Open the wiki</a></b>
---
---@param maxProgress int
function setProgressTotal(maxProgress) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerMissionGiven">Open the wiki</a></b>
---
function registerMissionGiven() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerMissionPassed">Open the wiki</a></b>
---
---@param mission GxtString
function registerMissionPassed(mission) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeAllScriptFires">Open the wiki</a></b>
---
function removeAllScriptFires() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByWeapon">Open the wiki</a></b>
---
---@param ped Ped
---@param weapon int
---@return bool result
function hasCharBeenDamagedByWeapon(ped, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByWeapon">Open the wiki</a></b>
---
---@param car Vehicle
---@param weapon int
---@return bool result
function hasCarBeenDamagedByWeapon(car, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/explodeCharHead">Open the wiki</a></b>
---
---@param ped Ped
function explodeCharHead(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/anchorBoat">Open the wiki</a></b>
---
---@param boat Vehicle
---@param anchor bool
function anchorBoat(boat, anchor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startCarFire">Open the wiki</a></b>
---
---@param car Vehicle
---@return int fire
function startCarFire(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startCharFire">Open the wiki</a></b>
---
---@param ped Ped
---@return int fire
function startCharFire(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInArea">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param modelId Model
---@return Vehicle car
function getRandomCarOfTypeInArea(cornerAX, cornerAY, cornerBX, cornerBY, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasResprayHappened">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function hasResprayHappened(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCameraZoom">Open the wiki</a></b>
---
---@param mode int
function setCameraZoom(mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createPickupWithAmmo">Open the wiki</a></b>
---
---@param modelId Model
---@param type int
---@param ammo int
---@param atX float
---@param atY float
---@param atZ float
---@return Pickup pickup
function createPickupWithAmmo(modelId, type, ammo, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarRamCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param car2 Vehicle
function setCarRamCar(car, car2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerNeverGetsTired">Open the wiki</a></b>
---
---@param player Player
---@param infiniteRun bool
function setPlayerNeverGetsTired(player, infiniteRun) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerFastReload">Open the wiki</a></b>
---
---@param player Player
---@param fastReload bool
function setPlayerFastReload(player, fastReload) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharBleeding">Open the wiki</a></b>
---
---@param ped Ped
---@param bleeding bool
function setCharBleeding(ped, bleeding) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFreeResprays">Open the wiki</a></b>
---
---@param enable bool
function setFreeResprays(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharVisible">Open the wiki</a></b>
---
---@param ped Ped
---@param visible bool
function setCharVisible(ped, visible) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarVisible">Open the wiki</a></b>
---
---@param car Vehicle
---@param visible bool
function setCarVisible(car, visible) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isAreaOccupied">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@param solid bool
---@param car bool
---@param actor bool
---@param object bool
---@param particle bool
---@return bool result
function isAreaOccupied(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, solid, car, actor, object, particle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayText">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param gxtString GxtString
function displayText(posX, posY, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextScale">Open the wiki</a></b>
---
---@param sizeX float
---@param sizeY float
function setTextScale(sizeX, sizeY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextColour">Open the wiki</a></b>
---
---@param r int
---@param g int
---@param b int
---@param a int
function setTextColour(r, g, b, a) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextJustify">Open the wiki</a></b>
---
---@param alignJustify bool
function setTextJustify(alignJustify) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextCentre">Open the wiki</a></b>
---
---@param centered bool
function setTextCentre(centered) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextWrapx">Open the wiki</a></b>
---
---@param linewidth float
function setTextWrapx(linewidth) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextCentreSize">Open the wiki</a></b>
---
---@param linewidth float
function setTextCentreSize(linewidth) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextBackground">Open the wiki</a></b>
---
---@param background bool
function setTextBackground(background) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextProportional">Open the wiki</a></b>
---
---@param proportional bool
function setTextProportional(proportional) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextFont">Open the wiki</a></b>
---
---@param font int
function setTextFont(font) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/rotateObject">Open the wiki</a></b>
---
---@param object Object
---@param fromAngle float
---@param toAngle float
---@param flag bool
---@return bool result
function rotateObject(object, fromAngle, toAngle, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/slideObject">Open the wiki</a></b>
---
---@param object Object
---@param toX float
---@param toY float
---@param toZ float
---@param speedX float
---@param speedY float
---@param speedZ float
---@param collisionCheck bool
---@return bool result
function slideObject(object, toX, toY, toZ, speedX, speedY, speedZ, collisionCheck) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeCharElegantly">Open the wiki</a></b>
---
---@param ped Ped
function removeCharElegantly(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharStayInSamePlace">Open the wiki</a></b>
---
---@param ped Ped
---@param enabled bool
function setCharStayInSamePlace(ped, enabled) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isExplosionInArea">Open the wiki</a></b>
---
---@param explosionType int
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@return bool result
function isExplosionInArea(explosionType, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/placeObjectRelativeToCar">Open the wiki</a></b>
---
---@param object Object
---@param car Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
function placeObjectRelativeToCar(object, car, offsetX, offsetY, offsetZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/makeObjectTargettable">Open the wiki</a></b>
---
---@param object Object
---@param targetable bool
function makeObjectTargettable(object, targetable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addArmourToChar">Open the wiki</a></b>
---
---@param ped Ped
---@param points int
function addArmourToChar(ped, points) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/openGarage">Open the wiki</a></b>
---
---@param garage GxtString
function openGarage(garage) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/closeGarage">Open the wiki</a></b>
---
---@param garage GxtString
function closeGarage(garage) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/warpCharFromCarToCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param placeAtX float
---@param placeAtY float
---@param placeAtZ float
function warpCharFromCarToCoord(ped, placeAtX, placeAtY, placeAtZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVisibilityOfClosestObjectOfType">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
---@param modelId Model
---@param visibility bool
function setVisibilityOfClosestObjectOfType(atX, atY, atZ, radius, modelId, visibility) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharSpottedChar">Open the wiki</a></b>
---
---@param ped Ped
---@param ped2 Ped
---@return bool result
function hasCharSpottedChar(ped, ped2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasObjectBeenDamaged">Open the wiki</a></b>
---
---@param object Object
---@return bool result
function hasObjectBeenDamaged(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/warpCharIntoCar">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
function warpCharIntoCar(ped, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWith2NumbersBig">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param numbers1 int
---@param numbers2 int
---@param time int
---@param style int
function printWith2NumbersBig(gxtString, numbers1, numbers2, time, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCameraBehindPlayer">Open the wiki</a></b>
---
function setCameraBehindPlayer() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createRandomChar">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@return Ped ped
function createRandomChar(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSniperBulletInArea">Open the wiki</a></b>
---
---@param float1 float
---@param float2 float
---@param float3 float
---@param float4 float
---@param float5 float
---@param float6 float
---@return bool result
function isSniperBulletInArea(float1, float2, float3, float4, float5, float6) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectVelocity">Open the wiki</a></b>
---
---@param object Object
---@param velocityInDirectionX float
---@param velocityInDirectionY float
---@param velocityInDirectionZ float
function setObjectVelocity(object, velocityInDirectionX, velocityInDirectionY, velocityInDirectionZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectCollision">Open the wiki</a></b>
---
---@param object Object
---@param collision bool
function setObjectCollision(object, collision) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printStringInStringNow">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param string GxtString
---@param time1 int
---@param time2 int
function printStringInStringNow(gxtString, string, time1, time2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPointObscuredByAMissionEntity">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@return bool result
function isPointObscuredByAMissionEntity(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadAllModelsNow">Open the wiki</a></b>
---
function loadAllModelsNow() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addToObjectVelocity">Open the wiki</a></b>
---
---@param object Object
---@param velocityX float
---@param velocityY float
---@param velocityZ float
function addToObjectVelocity(object, velocityX, velocityY, velocityZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawSprite">Open the wiki</a></b>
---
---@param texture int
---@param positionX float
---@param positionY float
---@param width float
---@param height float
---@param r int
---@param g int
---@param b int
---@param a int
function drawSprite(texture, positionX, positionY, width, height, r, g, b, a) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawRect">Open the wiki</a></b>
---
---@param positionX float
---@param positionY float
---@param width float
---@param height float
---@param r int
---@param g int
---@param b int
---@param a int
function drawRect(positionX, positionY, width, height, r, g, b, a) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadSprite">Open the wiki</a></b>
---
---@param name string
---@return int id
function loadSprite(name) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadTextureDictionary">Open the wiki</a></b>
---
---@param txd zstring
---@return bool result
function loadTextureDictionary(txd) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeTextureDictionary">Open the wiki</a></b>
---
function removeTextureDictionary() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectDynamic">Open the wiki</a></b>
---
---@param object Object
---@param moveable bool
function setObjectDynamic(object, moveable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharAnimSpeed">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@param speed float
function setCharAnimSpeed(ped, animation, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playMissionPassedTune">Open the wiki</a></b>
---
---@param music int
function playMissionPassedTune(music) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearArea">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
---@param area bool
function clearArea(atX, atY, atZ, radius, area) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freezeOnscreenTimer">Open the wiki</a></b>
---
---@param timer bool
function freezeOnscreenTimer(timer) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchCarSiren">Open the wiki</a></b>
---
---@param car Vehicle
---@param siren bool
function switchCarSiren(car, siren) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarWatertight">Open the wiki</a></b>
---
---@param car Vehicle
---@param watertight bool
function setCarWatertight(car, watertight) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCantBeDraggedOut">Open the wiki</a></b>
---
---@param ped Ped
---@param locked bool
function setCharCantBeDraggedOut(ped, locked) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/turnCarToFaceCoord">Open the wiki</a></b>
---
---@param car Vehicle
---@param coordX float
---@param coordY float
function turnCarToFaceCoord(car, coordX, coordY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawSphere">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
function drawSphere(atX, atY, atZ, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarStatus">Open the wiki</a></b>
---
---@param car Vehicle
---@param action int
function setCarStatus(car, action) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharMale">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharMale(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/policeRadioMessage">Open the wiki</a></b>
---
---@param float1 float
---@param float2 float
---@param float3 float
function policeRadioMessage(float1, float2, float3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarStrong">Open the wiki</a></b>
---
---@param car Vehicle
---@param strong bool
function setCarStrong(car, strong) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchRubbish">Open the wiki</a></b>
---
---@param int1 bool
function switchRubbish(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchStreaming">Open the wiki</a></b>
---
---@param streaming bool
function switchStreaming(streaming) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGarageOpen">Open the wiki</a></b>
---
---@param garage GxtString
---@return bool result
function isGarageOpen(garage) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGarageClosed">Open the wiki</a></b>
---
---@param garage GxtString
---@return bool result
function isGarageClosed(garage) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/swapNearestBuildingModel">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
---@param from Model
---@param to Model
function swapNearestBuildingModel(atX, atY, atZ, radius, from, to) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchWorldProcessing">Open the wiki</a></b>
---
---@param cutsceneOnly bool
function switchWorldProcessing(cutsceneOnly) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearAreaOfCars">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function clearAreaOfCars(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addSphere">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
---@return int sphere
function addSphere(atX, atY, atZ, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeSphere">Open the wiki</a></b>
---
---@param sphere int
function removeSphere(sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setEveryoneIgnorePlayer">Open the wiki</a></b>
---
---@param player Player
---@param ignored bool
function setEveryoneIgnorePlayer(player, ignored) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/storeCarCharIsInNoSave">Open the wiki</a></b>
---
---@param ped Ped
---@return Vehicle car
function storeCarCharIsInNoSave(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayOnscreenTimerWithString">Open the wiki</a></b>
---
---@param timer VarId
---@param type int
---@param gxtString GxtString
function displayOnscreenTimerWithString(timer, type, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayOnscreenCounterWithString">Open the wiki</a></b>
---
---@param var VarId
---@param type bool
---@param gxtString GxtString
function displayOnscreenCounterWithString(var, type, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createRandomCarForCarPark">Open the wiki</a></b>
---
---@param coordsX float
---@param coordsY float
---@param coordsZ float
---@param zAngle float
function createRandomCarForCarPark(coordsX, coordsY, coordsZ, zAngle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setWantedMultiplier">Open the wiki</a></b>
---
---@param sensitivity float
function setWantedMultiplier(sensitivity) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCameraInFrontOfPlayer">Open the wiki</a></b>
---
function setCameraInFrontOfPlayer() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarVisiblyDamaged">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarVisiblyDamaged(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesObjectExist">Open the wiki</a></b>
---
---@param object Object
---@return bool result
function doesObjectExist(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadScene">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
function loadScene(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addStuckCarCheck">Open the wiki</a></b>
---
---@param car Vehicle
---@param stuckCheckDistance float
---@param time int
function addStuckCarCheck(car, stuckCheckDistance, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeStuckCarCheck">Open the wiki</a></b>
---
---@param car Vehicle
function removeStuckCarCheck(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarStuck">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarStuck(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadMissionAudio">Open the wiki</a></b>
---
---@param asId int
---@param name int
function loadMissionAudio(asId, name) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasMissionAudioLoaded">Open the wiki</a></b>
---
---@param id int
---@return bool result
function hasMissionAudioLoaded(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playMissionAudio">Open the wiki</a></b>
---
---@param id int
function playMissionAudio(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasMissionAudioFinished">Open the wiki</a></b>
---
---@param id int
---@return bool result
function hasMissionAudioFinished(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClosestCarNodeWithHeading">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@return float nodeX
---@return float nodeY
---@return float nodeZ
---@return float angle
function getClosestCarNodeWithHeading(X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasImportGarageSlotBeenFilled">Open the wiki</a></b>
---
---@param int1 int
---@param int2 int
---@return bool result
function hasImportGarageSlotBeenFilled(int1, int2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearThisPrint">Open the wiki</a></b>
---
---@param text GxtString
function clearThisPrint(text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearThisBigPrint">Open the wiki</a></b>
---
---@param text GxtString
function clearThisBigPrint(text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMissionAudioPosition">Open the wiki</a></b>
---
---@param id int
---@param locationX float
---@param locationY float
---@param locationZ float
function setMissionAudioPosition(id, locationX, locationY, locationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/activateSaveMenu">Open the wiki</a></b>
---
function activateSaveMenu() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasSaveGameFinished">Open the wiki</a></b>
---
---@return bool result
function hasSaveGameFinished() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/noSpecialCameraForThisGarage">Open the wiki</a></b>
---
---@param int1 int
function noSpecialCameraForThisGarage(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForPickup">Open the wiki</a></b>
---
---@param pickup Pickup
---@return Marker marker
function addBlipForPickup(pickup) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPedDensityMultiplier">Open the wiki</a></b>
---
---@param multiplier float
function setPedDensityMultiplier(multiplier) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextDrawBeforeFade">Open the wiki</a></b>
---
---@param int1 bool
function setTextDrawBeforeFade(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCollectable1sCollected">Open the wiki</a></b>
---
---@return int collected
function getCollectable1sCollected() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSpritesDrawBeforeFade">Open the wiki</a></b>
---
---@param antialiased bool
function setSpritesDrawBeforeFade(antialiased) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextRightJustify">Open the wiki</a></b>
---
---@param alignRight bool
function setTextRightJustify(alignRight) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printHelp">Open the wiki</a></b>
---
---@param gxtString GxtString
function printHelp(gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearHelp">Open the wiki</a></b>
---
function clearHelp() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/flashHudObject">Open the wiki</a></b>
---
---@param hudComponent int
function flashHudObject(hudComponent) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGenerateCarsAroundCamera">Open the wiki</a></b>
---
---@param int1 bool
function setGenerateCarsAroundCamera(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearSmallPrints">Open the wiki</a></b>
---
function clearSmallPrints() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpsidedownCarNotDamaged">Open the wiki</a></b>
---
---@param car Vehicle
---@param disableFlippedExplosion bool
function setUpsidedownCarNotDamaged(car, disableFlippedExplosion) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerControllable">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isPlayerControllable(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/makePlayerSafe">Open the wiki</a></b>
---
---@param player Player
function makePlayerSafe(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarColours">Open the wiki</a></b>
---
---@param car Vehicle
---@return int primaryColor
---@return int secondaryColor
function getCarColours(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAllCarsCanBeDamaged">Open the wiki</a></b>
---
---@param enable bool
function setAllCarsCanBeDamaged(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCanBeDamaged">Open the wiki</a></b>
---
---@param car Vehicle
---@param enable bool
function setCarCanBeDamaged(car, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setDrunkInputDelay">Open the wiki</a></b>
---
---@param player Player
---@param handlingResponsiveness int
function setDrunkInputDelay(player, handlingResponsiveness) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharMoney">Open the wiki</a></b>
---
---@param ped Ped
---@param money int
function setCharMoney(ped, money) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getOffsetFromObjectInWorldCoords">Open the wiki</a></b>
---
---@param object Object
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@return float X
---@return float Y
---@return float Z
function getOffsetFromObjectInWorldCoords(object, offsetX, offsetY, offsetZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getOffsetFromCarInWorldCoords">Open the wiki</a></b>
---
---@param car Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@return float X
---@return float Y
---@return float Z
function getOffsetFromCarInWorldCoords(car, offsetX, offsetY, offsetZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearMissionAudio">Open the wiki</a></b>
---
---@param id int
function clearMissionAudio(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFreeHealthCare">Open the wiki</a></b>
---
---@param player Player
---@param free bool
function setFreeHealthCare(player, free) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadAndLaunchMissionInternal">Open the wiki</a></b>
---
---@param mission int
function loadAndLaunchMissionInternal(mission) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectDrawLast">Open the wiki</a></b>
---
---@param object Object
---@param drawLast bool
function setObjectDrawLast(object, drawLast) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAmmoInCharWeapon">Open the wiki</a></b>
---
---@param ped Ped
---@param int int
---@return int ammo
function getAmmoInCharWeapon(ped, int) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setNearClip">Open the wiki</a></b>
---
---@param clip float
function setNearClip(clip) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRadioChannel">Open the wiki</a></b>
---
---@param radioStation int
function setRadioChannel(radioStation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarTraction">Open the wiki</a></b>
---
---@param car Vehicle
---@param traction float
function setCarTraction(car, traction) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/areMeasurementsInMetres">Open the wiki</a></b>
---
---@return bool result
function areMeasurementsInMetres() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertMetresToFeet">Open the wiki</a></b>
---
---@param meters float
---@return float feet
function convertMetresToFeet(meters) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarAvoidLevelTransitions">Open the wiki</a></b>
---
---@param car Vehicle
---@param avoidLevelTransitions bool
function setCarAvoidLevelTransitions(car, avoidLevelTransitions) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearAreaOfChars">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function clearAreaOfChars(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTotalNumberOfMissions">Open the wiki</a></b>
---
---@param totalMissions int
function setTotalNumberOfMissions(totalMissions) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertMetresToFeetInt">Open the wiki</a></b>
---
---@param metric int
---@return int imperial
function convertMetresToFeetInt(metric) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerFastestTime">Open the wiki</a></b>
---
---@param stat int
---@param to int
function registerFastestTime(stat, to) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerHighestScore">Open the wiki</a></b>
---
---@param int1 int
---@param int2 int
function registerHighestScore(int1, int2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/warpCharIntoCarAsPassenger">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param passengerSeat int
function warpCharIntoCarAsPassenger(ped, car, passengerSeat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarPassengerSeatFree">Open the wiki</a></b>
---
---@param car Vehicle
---@param seat int
---@return bool result
function isCarPassengerSeatFree(car, seat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharInCarPassengerSeat">Open the wiki</a></b>
---
---@param car Vehicle
---@param seat int
---@return Ped ped
function getCharInCarPassengerSeat(car, seat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharIsChrisCriminal">Open the wiki</a></b>
---
---@param ped Ped
---@param flag bool
function setCharIsChrisCriminal(ped, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startCredits">Open the wiki</a></b>
---
function startCredits() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/stopCredits">Open the wiki</a></b>
---
function stopCredits() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/areCreditsFinished">Open the wiki</a></b>
---
---@return bool result
function areCreditsFinished() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMusicDoesFade">Open the wiki</a></b>
---
---@param enable bool
function setMusicDoesFade(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarModel">Open the wiki</a></b>
---
---@param veh Vehicle
---@return Model modelId
function getCarModel(veh) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/areAnyCarCheatsActivated">Open the wiki</a></b>
---
---@return bool result
function areAnyCarCheatsActivated() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharSuffersCriticalHits">Open the wiki</a></b>
---
---@param ped Ped
---@param enable bool
function setCharSuffersCriticalHits(ped, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharSittingInCar">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@return bool result
function isCharSittingInCar(ped, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharSittingInAnyCar">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharSittingInAnyCar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharOnFoot">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharOnFoot(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadSplashScreen">Open the wiki</a></b>
---
---@param gxtString GxtString
function loadSplashScreen(gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setJamesCarOnPathToPlayer">Open the wiki</a></b>
---
---@param int1 int
function setJamesCarOnPathToPlayer(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectRotation">Open the wiki</a></b>
---
---@param object Object
---@param rotationX float
---@param rotationY float
---@param rotationZ float
function setObjectRotation(object, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDebugCameraCoordinates">Open the wiki</a></b>
---
---@return float X
---@return float Y
---@return float Z
function getDebugCameraCoordinates() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerTargettingChar">Open the wiki</a></b>
---
---@param player Player
---@param ped Ped
---@return bool result
function isPlayerTargettingChar(player, ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerTargettingObject">Open the wiki</a></b>
---
---@param player Player
---@param object Object
---@return bool result
function isPlayerTargettingObject(player, object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayTextWithNumber">Open the wiki</a></b>
---
---@param x float
---@param y float
---@param gxtString GxtString
---@param number int
function displayTextWithNumber(x, y, gxtString, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayTextWith2Numbers">Open the wiki</a></b>
---
---@param x float
---@param y float
---@param gxtString GxtString
---@param numbersX int
---@param numbersY int
function displayTextWith2Numbers(x, y, gxtString, numbersX, numbersY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/failCurrentMission">Open the wiki</a></b>
---
function failCurrentMission() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setInterpolationParameters">Open the wiki</a></b>
---
---@param delay float
---@param time int
function setInterpolationParameters(delay, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDebugCameraPointAt">Open the wiki</a></b>
---
---@return float X
---@return float Y
---@return float Z
function getDebugCameraPointAt() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCharToCar">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param position int
---@param shootingAngleLimit float
---@param weapon int
function attachCharToCar(ped, car, offsetX, offsetY, offsetZ, position, shootingAngleLimit, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/detachCharFromCar">Open the wiki</a></b>
---
---@param ped Ped
function detachCharFromCar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarStayInFastLane">Open the wiki</a></b>
---
---@param car Vehicle
---@param flag bool
function setCarStayInFastLane(car, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCharLastWeaponDamage">Open the wiki</a></b>
---
---@param ped Ped
function clearCharLastWeaponDamage(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCarLastWeaponDamage">Open the wiki</a></b>
---
---@param car Vehicle
function clearCarLastWeaponDamage(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCopInArea">Open the wiki</a></b>
---
---@param float1 float
---@param float2 float
---@param float3 float
---@param float4 float
---@param int5 bool
---@param int6 bool
---@param int7 bool
---@param int8 bool
---@param int9 bool
---@return int int10
function getRandomCopInArea(float1, float2, float3, float4, int5, int6, int7, int8, int9) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDriverOfCar">Open the wiki</a></b>
---
---@param car Vehicle
---@return Ped ped
function getDriverOfCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumberOfFollowers">Open the wiki</a></b>
---
---@param ped Ped
---@return int followers
function getNumberOfFollowers(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/giveRemoteControlledModelToPlayer">Open the wiki</a></b>
---
---@param player Player
---@param atX float
---@param atY float
---@param atZ float
---@param angle float
---@param RCModel Model
function giveRemoteControlledModelToPlayer(player, atX, atY, atZ, angle, RCModel) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentCharWeapon">Open the wiki</a></b>
---
---@param ped Ped
---@return int weapon
function getCurrentCharWeapon(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansObject2d">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharAnyMeansObject2d(ped, object, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFootObject2d">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharOnFootObject2d(ped, object, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCarObject2d">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharInCarObject2d(ped, object, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansObject3d">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateCharAnyMeansObject3d(ped, object, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFootObject3d">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateCharOnFootObject3d(ped, object, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCarObject3d">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param sphere bool
---@return bool result
function locateCharInCarObject3d(ped, object, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarTempAction">Open the wiki</a></b>
---
---@param car Vehicle
---@param action int
---@param time int
function setCarTempAction(car, action, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharOnAnyBike">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharOnAnyBike(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/canCharSeeDeadChar">Open the wiki</a></b>
---
---@param ped Ped
---@param pedtype int
---@return bool result
function canCharSeeDeadChar(ped, pedtype) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setEnterCarRangeMultiplier">Open the wiki</a></b>
---
---@param float1 float
function setEnterCarRangeMultiplier(float1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRemoteControlledCar">Open the wiki</a></b>
---
---@param player Player
---@return Vehicle car
function getRemoteControlledCar(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPcVersion">Open the wiki</a></b>
---
---@return bool result
function isPcVersion() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isModelAvailable">Open the wiki</a></b>
---
---@param modelId Model
---@return bool result
function isModelAvailable(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shutCharUp">Open the wiki</a></b>
---
---@param ped Ped
---@param muted bool
function shutCharUp(ped, muted) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setEnableRcDetonate">Open the wiki</a></b>
---
---@param detonation bool
function setEnableRcDetonate(detonation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarRandomRouteSeed">Open the wiki</a></b>
---
---@param car Vehicle
---@param routeSeed int
function setCarRandomRouteSeed(car, routeSeed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isAnyPickupAtCoords">Open the wiki</a></b>
---
---@param pickupX float
---@param pickupY float
---@param pickupZ float
---@return bool result
function isAnyPickupAtCoords(pickupX, pickupY, pickupZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeAllCharWeapons">Open the wiki</a></b>
---
---@param ped Ped
function removeAllCharWeapons(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharGotWeapon">Open the wiki</a></b>
---
---@param ped Ped
---@param weapon int
---@return bool result
function hasCharGotWeapon(ped, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTankDetonateCars">Open the wiki</a></b>
---
---@param tank int
---@param detonate bool
function setTankDetonateCars(tank, detonate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPositionOfAnalogueSticks">Open the wiki</a></b>
---
---@param joystick int
---@return int offset1
---@return int offset2
---@return int offset3
---@return int offset4
function getPositionOfAnalogueSticks(joystick) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarOnFire">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarOnFire(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarTireBurst">Open the wiki</a></b>
---
---@param car Vehicle
---@param tire int
---@return bool result
function isCarTireBurst(car, tire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/initialiseObjectPath">Open the wiki</a></b>
---
---@param int1 int
---@param float2 float
function initialiseObjectPath(int1, float2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectPathSpeed">Open the wiki</a></b>
---
---@param int1 int
---@param int2 int
function setObjectPathSpeed(int1, int2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectPathPosition">Open the wiki</a></b>
---
---@param int1 int
---@param float2 float
function setObjectPathPosition(int1, float2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearObjectPath">Open the wiki</a></b>
---
---@param int1 int
function clearObjectPath(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/heliGotoCoords">Open the wiki</a></b>
---
---@param heli Vehicle
---@param toX float
---@param toY float
---@param toZ float
---@param altitudeMin float
---@param altitudeMax float
function heliGotoCoords(heli, toX, toY, toZ, altitudeMin, altitudeMax) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDeadCharPickupCoords">Open the wiki</a></b>
---
---@param ped Ped
---@return float coordsX
---@return float coordsY
---@return float coordsZ
function getDeadCharPickupCoords(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createProtectionPickup">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param int4 int
---@param int5 int
---@return Pickup pickup
function createProtectionPickup(atX, atY, atZ, int4, int5) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyBoat">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharInAnyBoat(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyHeli">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharInAnyHeli(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyPlane">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharInAnyPlane(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInWater">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharInWater(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharWeaponInSlot">Open the wiki</a></b>
---
---@param ped Ped
---@param slot int
---@return int weapon
---@return int ammo
---@return Model modelId
function getCharWeaponInSlot(ped, slot) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClosestStraightRoad">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param height float
---@param radius float
---@return float float6
---@return float float7
---@return float float8
---@return float float9
---@return float float10
---@return float float11
---@return float float12
function getClosestStraightRoad(atX, atY, atZ, height, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarForwardSpeed">Open the wiki</a></b>
---
---@param car Vehicle
---@param speed float
function setCarForwardSpeed(car, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setInteriorVisible">Open the wiki</a></b>
---
---@param interior int
function setInteriorVisible(interior) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markCarAsConvoyCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param convoy bool
function markCarAsConvoyCar(car, convoy) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/resetHavocCausedByPlayer">Open the wiki</a></b>
---
---@param int1 int
function resetHavocCausedByPlayer(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getHavocCausedByPlayer">Open the wiki</a></b>
---
---@param int1 int
---@return int int2
function getHavocCausedByPlayer(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createScriptRoadblock">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@param type int
function createScriptRoadblock(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearAllScriptRoadblocks">Open the wiki</a></b>
---
function clearAllScriptRoadblocks() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getOffsetFromCharInWorldCoords">Open the wiki</a></b>
---
---@param ped Ped
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@return float X
---@return float Y
---@return float Z
function getOffsetFromCharInWorldCoords(ped, offsetX, offsetY, offsetZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharBeenPhotographed">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function hasCharBeenPhotographed(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchSecurityCamera">Open the wiki</a></b>
---
---@param int1 bool
function switchSecurityCamera(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInFlyingVehicle">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharInFlyingVehicle(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addShortRangeSpriteBlipForCoord">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param icon int
---@return Marker marker
function addShortRangeSpriteBlipForCoord(atX, atY, atZ, icon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeliOrientation">Open the wiki</a></b>
---
---@param heli Vehicle
---@param angle float
function setHeliOrientation(heli, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearHeliOrientation">Open the wiki</a></b>
---
---@param heli Vehicle
function clearHeliOrientation(heli) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/planeGotoCoords">Open the wiki</a></b>
---
---@param plane int
---@param X float
---@param Y float
---@param Z float
---@param z1 float
---@param z2 float
function planeGotoCoords(plane, X, Y, Z, z1, z2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNthClosestCarNode">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@param type int
---@return float X
---@return float Y
---@return float Z
function getNthClosestCarNode(X, Y, Z, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawWeaponshopCorona">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@param type int
---@param flare int
---@param r int
---@param g int
---@param b int
function drawWeaponshopCorona(X, Y, Z, radius, type, flare, r, g, b) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setEnableRcDetonateOnContact">Open the wiki</a></b>
---
---@param enable bool
function setEnableRcDetonateOnContact(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freezeCharPosition">Open the wiki</a></b>
---
---@param ped Ped
---@param locked bool
function freezeCharPosition(ped, locked) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharDrownsInWater">Open the wiki</a></b>
---
---@param ped Ped
---@param drowns bool
function setCharDrownsInWater(ped, drowns) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectRecordsCollisions">Open the wiki</a></b>
---
---@param object Object
---@param set bool
function setObjectRecordsCollisions(object, set) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasObjectCollidedWithAnything">Open the wiki</a></b>
---
---@param object Object
---@return bool result
function hasObjectCollidedWithAnything(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeRcBuggy">Open the wiki</a></b>
---
function removeRcBuggy() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharArmour">Open the wiki</a></b>
---
---@param ped Ped
---@return int armour
function getCharArmour(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeliStabiliser">Open the wiki</a></b>
---
---@param heli Vehicle
---@param limiter bool
function setHeliStabiliser(heli, limiter) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarStraightLineDistance">Open the wiki</a></b>
---
---@param car Vehicle
---@param radius int
function setCarStraightLineDistance(car, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/popCarBoot">Open the wiki</a></b>
---
---@param car Vehicle
function popCarBoot(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shutPlayerUp">Open the wiki</a></b>
---
---@param player Player
---@param shut bool
function shutPlayerUp(player, shut) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerMood">Open the wiki</a></b>
---
---@param player Player
---@param flag int
---@param time int
function setPlayerMood(player, flag, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/requestCollision">Open the wiki</a></b>
---
---@param X float
---@param Y float
function requestCollision(X, Y) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateObject2d">Open the wiki</a></b>
---
---@param object Object
---@param X float
---@param Y float
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateObject2d(object, X, Y, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateObject3d">Open the wiki</a></b>
---
---@param object Object
---@param X float
---@param Y float
---@param Z float
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param flag bool
---@return bool result
function locateObject3d(object, X, Y, Z, radiusX, radiusY, radiusZ, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectInWater">Open the wiki</a></b>
---
---@param object Object
---@return bool result
function isObjectInWater(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectInArea2d">Open the wiki</a></b>
---
---@param object Object
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param sphere bool
---@return bool result
function isObjectInArea2d(object, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectInArea3d">Open the wiki</a></b>
---
---@param object Object
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@param flag bool
---@return bool result
function isObjectInArea3d(object, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskToggleDuck">Open the wiki</a></b>
---
---@param ped Ped
---@param crouch bool
function taskToggleDuck(ped, crouch) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/requestAnimation">Open the wiki</a></b>
---
---@param animation string
function requestAnimation(animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasAnimationLoaded">Open the wiki</a></b>
---
---@param animation string
---@return bool result
function hasAnimationLoaded(animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeAnimation">Open the wiki</a></b>
---
---@param animation string
function removeAnimation(animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharWaitingForWorldCollision">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharWaitingForWorldCollision(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarWaitingForWorldCollision">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarWaitingForWorldCollision(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCharToObject">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param orientation int
---@param angle float
---@param lockWeapon int
function attachCharToObject(ped, object, offsetX, offsetY, offsetZ, orientation, angle, lockWeapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayNthOnscreenCounterWithString">Open the wiki</a></b>
---
---@param text VarId
---@param type int
---@param line int
---@param gxtString GxtString
function displayNthOnscreenCounterWithString(text, type, line, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addSetPiece">Open the wiki</a></b>
---
---@param type int
---@param rectX1 float
---@param rectY1 float
---@param rectX2 float
---@param rectY2 float
---@param spawnAX float
---@param spawnAY float
---@param headedTowards1X float
---@param headedTowards1Y float
---@param spawnBX float
---@param spawnBY float
---@param headedTowards2X float
---@param headedTowards2Y float
function addSetPiece(type, rectX1, rectY1, rectX2, rectY2, spawnAX, spawnAY, headedTowards1X, headedTowards1Y, spawnBX, spawnBY, headedTowards2X, headedTowards2Y) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setExtraColours">Open the wiki</a></b>
---
---@param color int
---@param fade bool
function setExtraColours(color, fade) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearExtraColours">Open the wiki</a></b>
---
---@param fade bool
function clearExtraColours(fade) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getWheelieStats">Open the wiki</a></b>
---
---@param player Player
---@return int twowheelstime
---@return float twowheelsdistance
---@return int wheelietime
---@return float wheelieDistance
---@return int stoppieTime
---@return float stoppieDistance
function getWheelieStats(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/burstCarTire">Open the wiki</a></b>
---
---@param car Vehicle
---@param tire int
function burstCarTire(car, tire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerWearing">Open the wiki</a></b>
---
---@param player Player
---@param bodypart string
---@param skin int
---@return bool result
function isPlayerWearing(player, bodypart, skin) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerCanDoDriveBy">Open the wiki</a></b>
---
---@param player Player
---@param mode bool
function setPlayerCanDoDriveBy(player, mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createSwatRope">Open the wiki</a></b>
---
---@param pedtype int
---@param modelId Model
---@param X float
---@param Y float
---@param Z float
---@return int handleAs
function createSwatRope(pedtype, modelId, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarModelComponents">Open the wiki</a></b>
---
---@param car Model
---@param variation1 int
---@param variation2 int
function setCarModelComponents(car, variation1, variation2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/closeAllCarDoors">Open the wiki</a></b>
---
---@param car Vehicle
function closeAllCarDoors(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords2d">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@return float distance
function getDistanceBetweenCoords2d(x1, y1, x2, y2) end

---
--- ��������� ��������� ����� ����� ������� � ������� ���� (3D)  
---
--- ### ������ �������������  
---
--- ```lua
--   function main()
--     sampRegisterChatCommand('prv', function(id) -- ������ ��� ��� ����� /prv id ������� ��������� ����� ���� � ������ �������
--        local res, ped = sampGetCharHandleBySampPlayerId(id)
--        if res then
--           local x, y, z = getCharCoordinates(PLAYER_PED)
--           local mX, mY, mZ = getCharCoordinates(ped)
--           local dist = getDistanceBetweenCoords3d(x, y, z, mX, mY, mZ)
--           sampAddChatMessage('��������� ����� ����: '..dist, 0x00DD00)
--        end
--     end)
--     wait(-1) -- �� �������� ������� ��������� �������� � ����� main, ����� ������ �� �������� ���� ������
--   end
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords3d">Open the wiki</a></b>  
---
---@param x1 float ���������� X ������ �����
---@param y1 float ���������� Y ������ �����
---@param z1 float ���������� Z ������ �����
---@param x2 float ���������� X ������ �����
---@param y2 float ���������� Y ������ �����
---@param z2 float ���������� Z ������ �����
---@return float distance ���������
function getDistanceBetweenCoords3d(x1, y1, z1, x2, y2, z2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sortOutObjectCollisionWithCar">Open the wiki</a></b>
---
---@param object Object
---@param car Vehicle
function sortOutObjectCollisionWithCar(object, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMaxWantedLevel">Open the wiki</a></b>
---
---@return int level
function getMaxWantedLevel() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printHelpForever">Open the wiki</a></b>
---
---@param text GxtString
function printHelpForever(text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printHelpForeverWithNumber">Open the wiki</a></b>
---
---@param text GxtString
---@param number int
function printHelpForeverWithNumber(text, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createLockedPropertyPickup">Open the wiki</a></b>
---
---@param pX float
---@param pY float
---@param pZ float
---@param gxtString GxtString
---@return Pickup pickup
function createLockedPropertyPickup(pX, pY, pZ, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createForsalePropertyPickup">Open the wiki</a></b>
---
---@param pX float
---@param pY float
---@param pZ float
---@param price int
---@param gxtString GxtString
---@return Pickup pickup
function createForsalePropertyPickup(pX, pY, pZ, price, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freezeCarPosition">Open the wiki</a></b>
---
---@param car Vehicle
---@param locked bool
function freezeCarPosition(car, locked) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByChar">Open the wiki</a></b>
---
---@param ped Ped
---@param byActor Ped
---@return bool result
function hasCharBeenDamagedByChar(ped, byActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByCar">Open the wiki</a></b>
---
---@param ped Ped
---@param byCar Vehicle
---@return bool result
function hasCharBeenDamagedByCar(ped, byCar) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByChar">Open the wiki</a></b>
---
---@param car Vehicle
---@param byActor Ped
---@return bool result
function hasCarBeenDamagedByChar(car, byActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param byCar Vehicle
---@return bool result
function hasCarBeenDamagedByCar(car, byCar) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRadioChannel">Open the wiki</a></b>
---
---@return int radio
function getRadioChannel() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharStayInCarWhenJacked">Open the wiki</a></b>
---
---@param ped Ped
---@param stay bool
function setCharStayInCarWhenJacked(ped, stay) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerDrunkenness">Open the wiki</a></b>
---
---@param player Player
---@param drunk int
function setPlayerDrunkenness(player, drunk) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInAreaNoSave">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param modelId Model
---@return Vehicle car
function getRandomCarOfTypeInAreaNoSave(x1, y1, x2, y2, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCanBurstCarTires">Open the wiki</a></b>
---
---@param car Vehicle
---@param vulnerability bool
function setCanBurstCarTires(car, vulnerability) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fireHunterGun">Open the wiki</a></b>
---
---@param car Vehicle
function fireHunterGun(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharTouchingVehicle">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@return bool result
function isCharTouchingVehicle(ped, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCanBeShotInVehicle">Open the wiki</a></b>
---
---@param ped Ped
---@param can bool
function setCharCanBeShotInVehicle(ped, can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadMissionText">Open the wiki</a></b>
---
---@param table GxtString
function loadMissionText(table) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCharLastDamageEntity">Open the wiki</a></b>
---
---@param ped Ped
function clearCharLastDamageEntity(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCarLastDamageEntity">Open the wiki</a></b>
---
---@param car Vehicle
function clearCarLastDamageEntity(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freezeObjectPosition">Open the wiki</a></b>
---
---@param object Object
---@param freeze bool
function freezeObjectPosition(object, freeze) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeWeaponFromChar">Open the wiki</a></b>
---
---@param ped Ped
---@param weapon int
function removeWeaponFromChar(ped, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/makePlayerFireProof">Open the wiki</a></b>
---
---@param player Player
---@param fireproof bool
function makePlayerFireProof(player, fireproof) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/increasePlayerMaxHealth">Open the wiki</a></b>
---
---@param player Player
---@param increase int
function increasePlayerMaxHealth(player, increase) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/increasePlayerMaxArmour">Open the wiki</a></b>
---
---@param player Player
---@param increase int
function increasePlayerMaxArmour(player, increase) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createRandomCharAsDriver">Open the wiki</a></b>
---
---@param car Vehicle
---@return Ped ped
function createRandomCharAsDriver(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createRandomCharAsPassenger">Open the wiki</a></b>
---
---@param car Vehicle
---@param seat int
---@return Ped ped
function createRandomCharAsPassenger(car, seat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/ensurePlayerHasDriveByWeapon">Open the wiki</a></b>
---
---@param player Player
---@param ammo int
function ensurePlayerHasDriveByWeapon(player, ammo) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/makeHeliComeCrashingDown">Open the wiki</a></b>
---
---@param heli Vehicle
function makeHeliComeCrashingDown(heli) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addExplosionNoSound">Open the wiki</a></b>
---
---@param pX float
---@param pY float
---@param pZ float
---@param type int
function addExplosionNoSound(pX, pY, pZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/linkObjectToInterior">Open the wiki</a></b>
---
---@param object Object
---@param interior int
function linkObjectToInterior(object, interior) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharNeverTargetted">Open the wiki</a></b>
---
---@param ped Ped
---@param untargetable bool
function setCharNeverTargetted(ped, untargetable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/wasCutsceneSkipped">Open the wiki</a></b>
---
---@return bool result
function wasCutsceneSkipped() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyPoliceVehicle">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharInAnyPoliceVehicle(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesCharExist">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function doesCharExist(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesVehicleExist">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function doesVehicleExist(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addShortRangeSpriteBlipForContactPoint">Open the wiki</a></b>
---
---@param pX float
---@param pY float
---@param pZ float
---@param icon int
---@return Marker blip
function addShortRangeSpriteBlipForContactPoint(pX, pY, pZ, icon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAllTaxisHaveNitro">Open the wiki</a></b>
---
---@param toggle bool
function setAllTaxisHaveNitro(toggle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freezeCarPositionAndDontLoadCollision">Open the wiki</a></b>
---
---@param car Vehicle
---@param keep bool
function freezeCarPositionAndDontLoadCollision(car, keep) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freezeCharPositionAndDontLoadCollision">Open the wiki</a></b>
---
---@param ped Ped
---@param keep bool
function freezeCharPositionAndDontLoadCollision(ped, keep) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerIsInStadium">Open the wiki</a></b>
---
---@param set bool
function setPlayerIsInStadium(set) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayRadar">Open the wiki</a></b>
---
---@param enable bool
function displayRadar(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerBestPosition">Open the wiki</a></b>
---
---@param stat int
---@param float float
function registerBestPosition(stat, float) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerInInfoZone">Open the wiki</a></b>
---
---@param player Player
---@param zone GxtString
---@return bool result
function isPlayerInInfoZone(player, zone) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setLoadCollisionForCarFlag">Open the wiki</a></b>
---
---@param car Vehicle
---@param enable bool
function setLoadCollisionForCarFlag(car, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setLoadCollisionForCharFlag">Open the wiki</a></b>
---
---@param ped Ped
---@param enable bool
function setLoadCollisionForCharFlag(ped, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBigGunFlash">Open the wiki</a></b>
---
---@param fromX float
---@param fromY float
---@param fromZ float
---@param toX float
---@param toY float
---@param toZ float
function addBigGunFlash(fromX, fromY, fromZ, toX, toY, toZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getProgressPercentage">Open the wiki</a></b>
---
---@return float progress
function getProgressPercentage() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleToFadeIn">Open the wiki</a></b>
---
---@param car Vehicle
---@param flag int
function setVehicleToFadeIn(car, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerOddjobMissionPassed">Open the wiki</a></b>
---
function registerOddjobMissionPassed() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerInShortcutTaxi">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isPlayerInShortcutTaxi(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharDucking">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharDucking(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setOnscreenCounterFlashWhenFirstDisplayed">Open the wiki</a></b>
---
---@param text VarId
---@param flashing bool
function setOnscreenCounterFlashWhenFirstDisplayed(text, flashing) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shuffleCardDecks">Open the wiki</a></b>
---
---@param shuffle bool
function shuffleCardDecks(shuffle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fetchNextCard">Open the wiki</a></b>
---
---@return int card
function fetchNextCard() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectVelocity">Open the wiki</a></b>
---
---@param object Object
---@return float vecX
---@return float vecY
---@return float vecZ
function getObjectVelocity(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isDebugCameraOn">Open the wiki</a></b>
---
---@return bool result
function isDebugCameraOn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addToObjectRotationVelocity">Open the wiki</a></b>
---
---@param object Object
---@param vecX float
---@param vecY float
---@param vecZ float
function addToObjectRotationVelocity(object, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectRotationVelocity">Open the wiki</a></b>
---
---@param object Object
---@param vecX float
---@param vecY float
---@param vecZ float
function setObjectRotationVelocity(object, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectStatic">Open the wiki</a></b>
---
---@param object Object
---@return bool result
function isObjectStatic(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAngleBetween2dVectors">Open the wiki</a></b>
---
---@param vecX float
---@param vecY float
---@param vecX2 float
---@param vecY2 float
---@return float angle
function getAngleBetween2dVectors(vecX, vecY, vecX2, vecY2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/do2dRectanglesCollide">Open the wiki</a></b>
---
---@param areaX float
---@param areaY float
---@param scaleX float
---@param scaleY float
---@param overlapareaX float
---@param overlapareaY float
---@param overlapscaleX float
---@param overlapscaleY float
---@return bool result
function do2dRectanglesCollide(areaX, areaY, scaleX, scaleY, overlapareaX, overlapareaY, overlapscaleX, overlapscaleY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectRotationVelocity">Open the wiki</a></b>
---
---@param object Object
---@return float axisX
---@return float axisY
---@return float axisZ
function getObjectRotationVelocity(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addVelocityRelativeToObjectVelocity">Open the wiki</a></b>
---
---@param object Object
---@param vecX float
---@param vecY float
---@param vecZ float
function addVelocityRelativeToObjectVelocity(object, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectSpeed">Open the wiki</a></b>
---
---@param object Object
---@return float speed
function getObjectSpeed(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/get2dLinesIntersectPoint">Open the wiki</a></b>
---
---@param l1x1 float
---@param l1y1 float
---@param l1x2 float
---@param l1y2 float
---@param l2x1 float
---@param l2y1 float
---@param l2x2 float
---@param l2y2 float
---@return bool result
---@return float X
---@return float Y
function get2dLinesIntersectPoint(l1x1, l1y1, l1x2, l1y2, l2x1, l2y1, l2x2, l2y2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPause">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS int
function taskPause(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskStandStill">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS int
function taskStandStill(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFallAndGetUp">Open the wiki</a></b>
---
---@param ped Ped
---@param int2 bool
---@param time int
function taskFallAndGetUp(ped, int2, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskJump">Open the wiki</a></b>
---
---@param ped Ped
---@param jump bool
function taskJump(ped, jump) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskTired">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS int
function taskTired(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDie">Open the wiki</a></b>
---
---@param ped Ped
function taskDie(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLookAtChar">Open the wiki</a></b>
---
---@param ped Ped
---@param lookAt int
---@param timeMS int
function taskLookAtChar(ped, lookAt, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLookAtVehicle">Open the wiki</a></b>
---
---@param ped Ped
---@param lookAt int
---@param timeMS int
function taskLookAtVehicle(ped, lookAt, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSay">Open the wiki</a></b>
---
---@param ped Ped
---@param audio int
function taskSay(ped, audio) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskShakeFist">Open the wiki</a></b>
---
---@param ped Ped
function taskShakeFist(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCower">Open the wiki</a></b>
---
---@param ped Ped
function taskCower(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskHandsUp">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS int
function taskHandsUp(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDuck">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS int
function taskDuck(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskUseAtm">Open the wiki</a></b>
---
---@param ped Ped
function taskUseAtm(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskScratchHead">Open the wiki</a></b>
---
---@param ped Ped
function taskScratchHead(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLookAbout">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS int
function taskLookAbout(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskEnterCarAsPassenger">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param time int
---@param passengerSeat int
function taskEnterCarAsPassenger(ped, car, time, passengerSeat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskEnterCarAsDriver">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param timeMS int
function taskEnterCarAsDriver(ped, car, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLeaveCar">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
function taskLeaveCar(ped, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLeaveCarAndFlee">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param X float
---@param Y float
---@param Z float
function taskLeaveCarAndFlee(ped, car, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCarDriveToCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param toX float
---@param toY float
---@param toZ float
---@param speed float
---@param int7 int
---@param model int
---@param int9 int
function taskCarDriveToCoord(ped, car, toX, toY, toZ, speed, int7, model, int9) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCarDriveWander">Open the wiki</a></b>
---
---@param ped Ped
---@param hijackCar Vehicle
---@param searchRadius float
---@param trafficBehavior int
function taskCarDriveWander(ped, hijackCar, searchRadius, trafficBehavior) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGoStraightToCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
---@param mode int
---@param time int
function taskGoStraightToCoord(ped, toX, toY, toZ, mode, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskAchieveHeading">Open the wiki</a></b>
---
---@param ped Ped
---@param angle float
function taskAchieveHeading(ped, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/flushRoute">Open the wiki</a></b>
---
function flushRoute() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/extendRoute">Open the wiki</a></b>
---
---@param pointX float
---@param pointY float
---@param pointZ float
function extendRoute(pointX, pointY, pointZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFollowPointRoute">Open the wiki</a></b>
---
---@param ped Ped
---@param flags1 int
---@param flags2 int
function taskFollowPointRoute(ped, flags1, flags2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGotoChar">Open the wiki</a></b>
---
---@param ped Ped
---@param toActor Ped
---@param timelimit int
---@param stopWithinRadius float
function taskGotoChar(ped, toActor, timelimit, stopWithinRadius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFleePoint">Open the wiki</a></b>
---
---@param ped Ped
---@param fromX float
---@param fromY float
---@param fromZ float
---@param awayRadius float
---@param timelimit int
function taskFleePoint(ped, fromX, fromY, fromZ, awayRadius, timelimit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFleeChar">Open the wiki</a></b>
---
---@param ped Ped
---@param fromActor Ped
---@param radius float
---@param timelimit int
function taskFleeChar(ped, fromActor, radius, timelimit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSmartFleePoint">Open the wiki</a></b>
---
---@param ped Ped
---@param fromX float
---@param fromY float
---@param fromZ float
---@param stopAtRadius float
---@param timelimit int
function taskSmartFleePoint(ped, fromX, fromY, fromZ, stopAtRadius, timelimit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSmartFleeChar">Open the wiki</a></b>
---
---@param ped Ped
---@param fromActor Ped
---@param originRadius float
---@param timelimit int
function taskSmartFleeChar(ped, fromActor, originRadius, timelimit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskWanderStandard">Open the wiki</a></b>
---
---@param ped Ped
function taskWanderStandard(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskKillCharOnFoot">Open the wiki</a></b>
---
---@param ped Ped
---@param killActor Ped
function taskKillCharOnFoot(ped, killActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param path int
function startPlaybackRecordedCar(car, path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/stopPlaybackRecordedCar">Open the wiki</a></b>
---
---@param car Vehicle
function stopPlaybackRecordedCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pausePlaybackRecordedCar">Open the wiki</a></b>
---
---@param car Vehicle
function pausePlaybackRecordedCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/unpausePlaybackRecordedCar">Open the wiki</a></b>
---
---@param car Vehicle
function unpausePlaybackRecordedCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarEscortCarLeft">Open the wiki</a></b>
---
---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarLeft(car, followCar) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarEscortCarRight">Open the wiki</a></b>
---
---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarRight(car, followCar) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarEscortCarRear">Open the wiki</a></b>
---
---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarRear(car, followCar) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarEscortCarFront">Open the wiki</a></b>
---
---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarFront(car, followCar) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFollowPathNodesToCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param pathX float
---@param pathY float
---@param pathZ float
---@param mode int
---@param time int
function taskFollowPathNodesToCoord(ped, pathX, pathY, pathZ, mode, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAngledArea2d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param angle float
---@param sphere bool
---@return bool result
function isCharInAngledArea2d(ped, x1, y1, x2, y2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaOnFoot2d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param angle float
---@param sphere bool
---@return bool result
function isCharInAngledAreaOnFoot2d(ped, x1, y1, x2, y2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaInCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param angle float
---@param sphere bool
---@return bool result
function isCharInAngledAreaInCar2d(ped, x1, y1, x2, y2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledArea2d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param height float
---@param flag bool
---@return bool result
function isCharStoppedInAngledArea2d(ped, x1, y1, x2, y2, height, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaOnFoot2d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param angle float
---@param sphere bool
---@return bool result
function isCharStoppedInAngledAreaOnFoot2d(ped, x1, y1, x2, y2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaInCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param height float
---@param flag bool
---@return bool result
function isCharStoppedInAngledAreaInCar2d(ped, x1, y1, x2, y2, height, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAngledArea3d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
---@param angle float
---@param sphere bool
---@return bool result
function isCharInAngledArea3d(ped, x1, y1, z1, x2, y2, z2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaOnFoot3d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
---@param angle float
---@param sphere bool
---@return bool result
function isCharInAngledAreaOnFoot3d(ped, x1, y1, z1, x2, y2, z2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaInCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
---@param depth float
---@param flag bool
---@return bool result
function isCharInAngledAreaInCar3d(ped, x1, y1, z1, x2, y2, z2, depth, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledArea3d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
---@param depth float
---@param flag bool
---@return bool result
function isCharStoppedInAngledArea3d(ped, x1, y1, z1, x2, y2, z2, depth, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaOnFoot3d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
---@param depth float
---@param flag bool
---@return bool result
function isCharStoppedInAngledAreaOnFoot3d(ped, x1, y1, z1, x2, y2, z2, depth, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaInCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
---@param depth float
---@param flag bool
---@return bool result
function isCharStoppedInAngledAreaInCar3d(ped, x1, y1, z1, x2, y2, z2, depth, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInTaxi">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharInTaxi(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGoToCoordAnyMeans">Open the wiki</a></b>
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
---@param mode int
---@param useCar Vehicle
function taskGoToCoordAnyMeans(ped, toX, toY, toZ, mode, useCar) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getHeadingFromVector2d">Open the wiki</a></b>
---
---@param pX float
---@param pY float
---@return float zAngle
function getHeadingFromVector2d(pX, pY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPlayAnim">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@param IFP string
---@param framedelta float
---@param loop bool
---@param lockX bool
---@param lockY bool
---@param lockF bool
---@param time int
function taskPlayAnim(ped, animation, IFP, framedelta, loop, lockX, lockY, lockF, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadPathNodesInArea">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
function loadPathNodesInArea(x1, y1, x2, y2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releasePathNodes">Open the wiki</a></b>
---
function releasePathNodes() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadCharDecisionMaker">Open the wiki</a></b>
---
---@param type int
---@return int maker
function loadCharDecisionMaker(type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharDecisionMaker">Open the wiki</a></b>
---
---@param ped Ped
---@param maker int
function setCharDecisionMaker(ped, maker) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextDropshadow">Open the wiki</a></b>
---
---@param shadow int
---@param r int
---@param g int
---@param b int
---@param a int
function setTextDropshadow(shadow, r, g, b, a) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlaybackGoingOnForCar">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isPlaybackGoingOnForCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSenseRange">Open the wiki</a></b>
---
---@param ped Ped
---@param accuracy float
function setSenseRange(ped, accuracy) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharPlayingAnim">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@return bool result
function isCharPlayingAnim(ped, animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharAnimPlayingFlag">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@param flag bool
function setCharAnimPlayingFlag(ped, animation, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharAnimCurrentTime">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@return float time
function getCharAnimCurrentTime(ped, animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharAnimCurrentTime">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@param time float
function setCharAnimCurrentTime(ped, animation, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/openSequenceTask">Open the wiki</a></b>
---
---@return int task
function openSequenceTask() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/closeSequenceTask">Open the wiki</a></b>
---
---@param task int
function closeSequenceTask(task) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/performSequenceTask">Open the wiki</a></b>
---
---@param ped Ped
---@param task int
function performSequenceTask(ped, task) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCollision">Open the wiki</a></b>
---
---@param ped Ped
---@param enable bool
function setCharCollision(ped, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharAnimTotalTime">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@return float totalTime
function getCharAnimTotalTime(ped, animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearSequenceTask">Open the wiki</a></b>
---
---@param task int
function clearSequenceTask(task) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addAttractor">Open the wiki</a></b>
---
---@param originX float
---@param originY float
---@param originZ float
---@param zAngle float
---@param unknownAngle float
---@param taskSequence int
---@return int handle
function addAttractor(originX, originY, originZ, zAngle, unknownAngle, taskSequence) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearAttractor">Open the wiki</a></b>
---
---@param handle int
function clearAttractor(handle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCharAtAttractor">Open the wiki</a></b>
---
---@param pedtype int
---@param modelId Model
---@param ASOrigin int
---@param task int
---@return Ped ped
function createCharAtAttractor(pedtype, modelId, ASOrigin, task) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLeaveCarImmediately">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
function taskLeaveCarImmediately(ped, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/incrementIntStat">Open the wiki</a></b>
---
---@param stat int
---@param add int
function incrementIntStat(stat, add) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/incrementFloatStat">Open the wiki</a></b>
---
---@param stat int
---@param add float
function incrementFloatStat(stat, add) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/decrementIntStat">Open the wiki</a></b>
---
---@param stat int
---@param int int
function decrementIntStat(stat, int) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/decrementFloatStat">Open the wiki</a></b>
---
---@param stat int
---@param float float
function decrementFloatStat(stat, float) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerIntStat">Open the wiki</a></b>
---
---@param stat int
---@param int int
function registerIntStat(stat, int) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerFloatStat">Open the wiki</a></b>
---
---@param stat int
---@param value float
function registerFloatStat(stat, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setIntStat">Open the wiki</a></b>
---
---@param stat int
---@param int int
function setIntStat(stat, int) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFloatStat">Open the wiki</a></b>
---
---@param stat int
---@param float float
function setFloatStat(stat, float) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getScriptTaskStatus">Open the wiki</a></b>
---
---@param ped Ped
---@param task int
---@return int status
function getScriptTaskStatus(ped, task) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createGroup">Open the wiki</a></b>
---
---@param type int
---@return int group
function createGroup(type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupLeader">Open the wiki</a></b>
---
---@param group int
---@param ped Ped
function setGroupLeader(group, ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupMember">Open the wiki</a></b>
---
---@param group int
---@param ped Ped
function setGroupMember(group, ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeGroup">Open the wiki</a></b>
---
---@param group int
function removeGroup(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLeaveAnyCar">Open the wiki</a></b>
---
---@param ped Ped
function taskLeaveAnyCar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskKillCharOnFootWhileDucking">Open the wiki</a></b>
---
---@param ped Ped
---@param weapon int
---@param flags int
---@param time int
---@param chance int
function taskKillCharOnFootWhileDucking(ped, weapon, flags, time, chance) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskAimGunAtChar">Open the wiki</a></b>
---
---@param ped Ped
---@param aimAt int
---@param timeMS int
function taskAimGunAtChar(ped, aimAt, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGoToCoordWhileShooting">Open the wiki</a></b>
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
---@param mode int
---@param turnRadius float
---@param stopRadius float
---@param lookAtActor int
function taskGoToCoordWhileShooting(ped, toX, toY, toZ, mode, turnRadius, stopRadius, lookAtActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskStayInSamePlace">Open the wiki</a></b>
---
---@param ped Ped
---@param stay bool
function taskStayInSamePlace(ped, stay) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskTurnCharToFaceChar">Open the wiki</a></b>
---
---@param ped Ped
---@param rotateTo int
function taskTurnCharToFaceChar(ped, rotateTo) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharAtScriptedAttractor">Open the wiki</a></b>
---
---@param ped Ped
---@param origin int
---@return bool result
function isCharAtScriptedAttractor(ped, origin) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSequenceToRepeat">Open the wiki</a></b>
---
---@param pack int
---@param loop bool
function setSequenceToRepeat(pack, loop) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getSequenceProgress">Open the wiki</a></b>
---
---@param ped Ped
---@return int progess
function getSequenceProgress(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearLookAt">Open the wiki</a></b>
---
---@param ped Ped
function clearLookAt(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFollowNodeThresholdDistance">Open the wiki</a></b>
---
---@param ped Ped
---@param dist float
function setFollowNodeThresholdDistance(ped, dist) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystem">Open the wiki</a></b>
---
---@param particle string
---@param pX float
---@param pY float
---@param pZ float
---@param type int
---@return Particle particle
function createFxSystem(particle, pX, pY, pZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playFxSystem">Open the wiki</a></b>
---
---@param particle Particle
function playFxSystem(particle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/stopFxSystem">Open the wiki</a></b>
---
---@param particle Particle
function stopFxSystem(particle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playAndKillFxSystem">Open the wiki</a></b>
---
---@param particle Particle
function playAndKillFxSystem(particle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/killFxSystem">Open the wiki</a></b>
---
---@param particle Particle
function killFxSystem(particle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getIntStat">Open the wiki</a></b>
---
---@param stat int
---@return int stat
function getIntStat(stat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getFloatStat">Open the wiki</a></b>
---
---@param stat int
---@return float stat
function getFloatStat(stat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectRenderScorched">Open the wiki</a></b>
---
---@param object Object
---@param fireproof bool
function setObjectRenderScorched(object, fireproof) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLookAtObject">Open the wiki</a></b>
---
---@param ped Ped
---@param lookAt int
---@param timeMS int
function taskLookAtObject(ped, lookAt, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/limitAngle">Open the wiki</a></b>
---
---@param angle float
---@return float float
function limitAngle(angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/openCarDoor">Open the wiki</a></b>
---
---@param car Vehicle
---@param door int
function openCarDoor(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupCoordinates">Open the wiki</a></b>
---
---@param pickup Pickup
---@return float X
---@return float Y
---@return float Z
function getPickupCoordinates(pickup) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeDecisionMaker">Open the wiki</a></b>
---
---@param maker int
function removeDecisionMaker(maker) end

---
--- ���������� ID ����� �� ������ ���������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharModel">Open the wiki</a></b>  
---
---@param ped Ped ����� ���������
---@return Model modelId ID �����
function getCharModel(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskAimGunAtCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param atX float
---@param atY float
---@param atZ float
---@param timeMS int
function taskAimGunAtCoord(ped, atX, atY, atZ, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskShootAtCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param atX float
---@param atY float
---@param atZ float
---@param timeMS int
function taskShootAtCoord(ped, atX, atY, atZ, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystemOnChar">Open the wiki</a></b>
---
---@param particle string
---@param ped Ped
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param type int
---@return Particle particle
function createFxSystemOnChar(particle, ped, offsetX, offsetY, offsetZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystemOnCharWithDirection">Open the wiki</a></b>
---
---@param particle string
---@param ped Ped
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
---@param type int
---@return Particle particle
function createFxSystemOnCharWithDirection(particle, ped, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystemOnCar">Open the wiki</a></b>
---
---@param particle string
---@param car Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param type int
---@return Particle particle
function createFxSystemOnCar(particle, car, offsetX, offsetY, offsetZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystemOnCarWithDirection">Open the wiki</a></b>
---
---@param particle string
---@param car Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
---@param type int
---@return Particle particle
function createFxSystemOnCarWithDirection(particle, car, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystemOnObject">Open the wiki</a></b>
---
---@param particle string
---@param object Object
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param type int
---@return Particle particle
function createFxSystemOnObject(particle, object, offsetX, offsetY, offsetZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystemOnObjectWithDirection">Open the wiki</a></b>
---
---@param particle string
---@param object Object
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
---@param flag int
---@return Particle particle
function createFxSystemOnObjectWithDirection(particle, object, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDestroyCar">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
function taskDestroyCar(ped, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDiveAndGetUp">Open the wiki</a></b>
---
---@param ped Ped
---@param toOffsetX float
---@param toOffsetY float
---@param time int
function taskDiveAndGetUp(ped, toOffsetX, toOffsetY, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/customPlateForNextCar">Open the wiki</a></b>
---
---@param modelId Model
---@param numberplate string
function customPlateForNextCar(modelId, numberplate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskShuffleToNextCarSeat">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
function taskShuffleToNextCarSeat(ped, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskChatWithChar">Open the wiki</a></b>
---
---@param ped Ped
---@param withActor int
---@param flag bool
---@param unknownFlag int
function taskChatWithChar(ped, withActor, flag, unknownFlag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCameraToVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
---@param tilt float
---@param switchstyle int
function attachCameraToVehicle(car, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ, tilt, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCameraToVehicleLookAtVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param toCar int
---@param tilt float
---@param switchstyle int
function attachCameraToVehicleLookAtVehicle(car, offsetX, offsetY, offsetZ, toCar, tilt, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCameraToVehicleLookAtChar">Open the wiki</a></b>
---
---@param car Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param ped Ped
---@param tilt float
---@param switchstyle int
function attachCameraToVehicleLookAtChar(car, offsetX, offsetY, offsetZ, ped, tilt, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCameraToChar">Open the wiki</a></b>
---
---@param ped Ped
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
---@param tilt float
---@param switchstyle int
function attachCameraToChar(ped, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ, tilt, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCameraToCharLookAtChar">Open the wiki</a></b>
---
---@param ped Ped
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param targetActor int
---@param tilt float
---@param switchstyle int
function attachCameraToCharLookAtChar(ped, offsetX, offsetY, offsetZ, targetActor, tilt, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceCarLights">Open the wiki</a></b>
---
---@param car Vehicle
---@param lights int
function forceCarLights(car, lights) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addPedtypeAsAttractorUser">Open the wiki</a></b>
---
---@param ASOrigin int
---@param pedtype int
function addPedtypeAsAttractorUser(ASOrigin, pedtype) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachObjectToCar">Open the wiki</a></b>
---
---@param object Object
---@param car Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
function attachObjectToCar(object, car, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/detachObject">Open the wiki</a></b>
---
---@param object Object
---@param X float
---@param Y float
---@param Z float
---@param collisionDetection bool
function detachObject(object, X, Y, Z, collisionDetection) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCarToCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param toCar int
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
function attachCarToCar(car, toCar, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/detachCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param X float
---@param Y float
---@param Z float
---@param collisionDetection bool
function detachCar(car, X, Y, Z, collisionDetection) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectAttached">Open the wiki</a></b>
---
---@param object Object
---@return bool result
function isObjectAttached(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isVehicleAttached">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isVehicleAttached(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCharTasks">Open the wiki</a></b>
---
---@param ped Ped
function clearCharTasks(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskTogglePedThreatScanner">Open the wiki</a></b>
---
---@param ped Ped
---@param unknownFlag1 bool
---@param unknownFlag2 bool
---@param unknownFlag3 bool
function taskTogglePedThreatScanner(ped, unknownFlag1, unknownFlag2, unknownFlag3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/popCarDoor">Open the wiki</a></b>
---
---@param car Vehicle
---@param door int
---@param visible bool
function popCarDoor(car, door, visible) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fixCarDoor">Open the wiki</a></b>
---
---@param car Vehicle
---@param door int
function fixCarDoor(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskEveryoneLeaveCar">Open the wiki</a></b>
---
---@param car Vehicle
function taskEveryoneLeaveCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerTargettingAnything">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isPlayerTargettingAnything(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getActiveCameraCoordinates">Open the wiki</a></b>
---
---@return float X
---@return float Y
---@return float Z
function getActiveCameraCoordinates() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getActiveCameraPointAt">Open the wiki</a></b>
---
---@return float X
---@return float Y
---@return float Z
function getActiveCameraPointAt() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/popCarPanel">Open the wiki</a></b>
---
---@param car Vehicle
---@param component int
---@param effectFlag bool
function popCarPanel(car, component, effectFlag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fixCarPanel">Open the wiki</a></b>
---
---@param car Vehicle
---@param componentB int
function fixCarPanel(car, componentB) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fixCarTire">Open the wiki</a></b>
---
---@param car Vehicle
---@param tire int
function fixCarTire(car, tire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachObjectToObject">Open the wiki</a></b>
---
---@param object Object
---@param toObject int
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
function attachObjectToObject(object, toObject, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachObjectToChar">Open the wiki</a></b>
---
---@param object Object
---@param ped Ped
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
function attachObjectToChar(object, ped, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarSpeedVector">Open the wiki</a></b>
---
---@param car Vehicle
---@return float vecX
---@return float vecY
---@return float vecZ
function getCarSpeedVector(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarMass">Open the wiki</a></b>
---
---@param car Vehicle
---@return float mass
function getCarMass(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDiveFromAttachmentAndGetUp">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS int
function taskDiveFromAttachmentAndGetUp(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCharToBike">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param position int
---@param shootingAngle1 float
---@param shootingAngle2 float
---@param weapon int
function attachCharToBike(ped, car, offsetX, offsetY, offsetZ, position, shootingAngle1, shootingAngle2, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGotoCharOffset">Open the wiki</a></b>
---
---@param ped Ped
---@param toActor int
---@param timelimit int
---@param approachDistance float
---@param approachAngle float
function taskGotoCharOffset(ped, toActor, timelimit, approachDistance, approachAngle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLookAtCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
---@param timeMS int
function taskLookAtCoord(ped, toX, toY, toZ, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hideCharWeaponForScriptedCutscene">Open the wiki</a></b>
---
---@param ped Ped
---@param hide bool
function hideCharWeaponForScriptedCutscene(ped, hide) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharSpeed">Open the wiki</a></b>
---
---@param ped Ped
---@return float speed
function getCharSpeed(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupDecisionMaker">Open the wiki</a></b>
---
---@param group int
---@param maker int
function setGroupDecisionMaker(group, maker) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadGroupDecisionMaker">Open the wiki</a></b>
---
---@param type int
---@return int maker
function loadGroupDecisionMaker(type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/disablePlayerSprint">Open the wiki</a></b>
---
---@param player Player
---@param mode bool
function disablePlayerSprint(player, mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSitDown">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS int
function taskSitDown(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createSearchlight">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param targetX float
---@param targetY float
---@param targetZ float
---@param radius1 float
---@param radius2 float
---@return Searchlight searchlight
function createSearchlight(atX, atY, atZ, targetX, targetY, targetZ, radius1, radius2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteSearchlight">Open the wiki</a></b>
---
---@param searchlight Searchlight
function deleteSearchlight(searchlight) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesSearchlightExist">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@return bool result
function doesSearchlightExist(searchlight) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/moveSearchlightBetweenCoords">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param fromX float
---@param fromY float
---@param fromZ float
---@param toX float
---@param toY float
---@param toZ float
---@param speed float
function moveSearchlightBetweenCoords(searchlight, fromX, fromY, fromZ, toX, toY, toZ, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pointSearchlightAtCoord">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param toX float
---@param toY float
---@param toZ float
---@param speed float
function pointSearchlightAtCoord(searchlight, toX, toY, toZ, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pointSearchlightAtChar">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param ped Ped
---@param speed float
function pointSearchlightAtChar(searchlight, ped, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInSearchlight">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param ped Ped
---@return bool result
function isCharInSearchlight(searchlight, ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCutsceneLoaded">Open the wiki</a></b>
---
---@return bool result
function hasCutsceneLoaded() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskTurnCharToFaceCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param atX float
---@param atY float
---@param atZ float
function taskTurnCharToFaceCoord(ped, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDrivePointRoute">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param speed float
function taskDrivePointRoute(ped, car, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fireSingleBullet">Open the wiki</a></b>
---
---@param fromX float
---@param fromY float
---@param fromZ float
---@param targetX float
---@param targetY float
---@param targetZ float
---@param energy int
function fireSingleBullet(fromX, fromY, fromZ, targetX, targetY, targetZ, energy) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isLineOfSightClear">Open the wiki</a></b>
---
---@param fromX float
---@param fromY float
---@param fromZ float
---@param toX float
---@param toY float
---@param toZ float
---@param checkBuildings bool
---@param checkVehicles bool
---@param checkActors bool
---@param checkObjects bool
---@param checkParticles bool
---@return bool result
function isLineOfSightClear(fromX, fromY, fromZ, toX, toY, toZ, checkBuildings, checkVehicles, checkActors, checkObjects, checkParticles) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarRoll">Open the wiki</a></b>
---
---@param car Vehicle
---@return float roll
function getCarRoll(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pointSearchlightAtVehicle">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param car Vehicle
---@param speed float
function pointSearchlightAtVehicle(searchlight, car, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isVehicleInSearchlight">Open the wiki</a></b>
---
---@param int int
---@param car Vehicle
---@return bool result
function isVehicleInSearchlight(int, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createSearchlightOnVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param targetX float
---@param targetY float
---@param targetZ float
---@param radius float
---@param radius2 float
---@return Searchlight searchlight
function createSearchlightOnVehicle(car, offsetX, offsetY, offsetZ, targetX, targetY, targetZ, radius, radius2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGoToCoordWhileAiming">Open the wiki</a></b>
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
---@param mode int
---@param turnRadius float
---@param stopRadius float
---@param ped2 Ped
---@param offsetX float
---@param offsetY float
---@param offsetZ float
function taskGoToCoordWhileAiming(ped, toX, toY, toZ, mode, turnRadius, stopRadius, ped2, offsetX, offsetY, offsetZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumberOfFiresInRange">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
---@return int num
function getNumberOfFiresInRange(atX, atY, atZ, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForSearchlight">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@return Marker marker
function addBlipForSearchlight(searchlight) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/skipToEndAndStopPlaybackRecordedCar">Open the wiki</a></b>
---
---@param car Vehicle
function skipToEndAndStopPlaybackRecordedCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCarTempAction">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param performAction int
---@param timelimit int
function taskCarTempAction(ped, car, performAction, timelimit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setLaRiots">Open the wiki</a></b>
---
---@param enable bool
function setLaRiots(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeCharFromGroup">Open the wiki</a></b>
---
---@param ped Ped
function removeCharFromGroup(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachSearchlightToSearchlightObject">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param tower int
---@param housing int
---@param bulb int
---@param offsetX float
---@param offsetY float
---@param offsetZ float
function attachSearchlightToSearchlightObject(searchlight, tower, housing, bulb, offsetX, offsetY, offsetZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchEmergencyServices">Open the wiki</a></b>
---
---@param enable bool
function switchEmergencyServices(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCheckpoint">Open the wiki</a></b>
---
---@param type int
---@param atX float
---@param atY float
---@param atZ float
---@param pointX float
---@param pointY float
---@param pointZ float
---@param radius float
---@return Checkpoint checkpoint
function createCheckpoint(type, atX, atY, atZ, pointX, pointY, pointZ, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteCheckpoint">Open the wiki</a></b>
---
---@param checkpoint Checkpoint
function deleteCheckpoint(checkpoint) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchRandomTrains">Open the wiki</a></b>
---
---@param enable bool
function switchRandomTrains(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createMissionTrain">Open the wiki</a></b>
---
---@param type int
---@param atX float
---@param atY float
---@param atZ float
---@param direction bool
---@return Vehicle train
function createMissionTrain(type, atX, atY, atZ, direction) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteMissionTrains">Open the wiki</a></b>
---
function deleteMissionTrains() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markMissionTrainsAsNoLongerNeeded">Open the wiki</a></b>
---
function markMissionTrainsAsNoLongerNeeded() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteAllTrains">Open the wiki</a></b>
---
function deleteAllTrains() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTrainSpeed">Open the wiki</a></b>
---
---@param train Vehicle
---@param speed float
function setTrainSpeed(train, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTrainCruiseSpeed">Open the wiki</a></b>
---
---@param train Vehicle
---@param speed float
function setTrainCruiseSpeed(train, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTrainCaboose">Open the wiki</a></b>
---
---@param train Vehicle
---@return int caboose
function getTrainCaboose(train) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deletePlayer">Open the wiki</a></b>
---
---@param player Player
function deletePlayer(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTwoPlayerCameraMode">Open the wiki</a></b>
---
---@param mode bool
function setTwoPlayerCameraMode(mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCarMission">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param targetCar int
---@param order int
---@param maxSpeed float
---@param trafficFlag int
function taskCarMission(ped, car, targetCar, order, maxSpeed, trafficFlag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGoToObject">Open the wiki</a></b>
---
---@param ped Ped
---@param toObject int
---@param timelimit int
---@param stopWithinRadius float
function taskGoToObject(ped, toObject, timelimit, stopWithinRadius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskWeaponRoll">Open the wiki</a></b>
---
---@param ped Ped
---@param roll bool
function taskWeaponRoll(ped, roll) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCharArrestChar">Open the wiki</a></b>
---
---@param ped Ped
---@param bustActor int
function taskCharArrestChar(ped, bustActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAvailableVehicleMod">Open the wiki</a></b>
---
---@param car Vehicle
---@param poolIndex int
---@return Model itemID
function getAvailableVehicleMod(car, poolIndex) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getVehicleModType">Open the wiki</a></b>
---
---@param component Model
---@return int type
function getVehicleModType(component) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addVehicleMod">Open the wiki</a></b>
---
---@param car Vehicle
---@param component Model
---@return int componentId
function addVehicleMod(car, component) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeVehicleMod">Open the wiki</a></b>
---
---@param car Vehicle
---@param componentId int
function removeVehicleMod(car, componentId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/requestVehicleMod">Open the wiki</a></b>
---
---@param component Model
function requestVehicleMod(component) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasVehicleModLoaded">Open the wiki</a></b>
---
---@param component Model
---@return bool result
function hasVehicleModLoaded(component) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markVehicleModAsNoLongerNeeded">Open the wiki</a></b>
---
---@param component Model
function markVehicleModAsNoLongerNeeded(component) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumAvailablePaintjobs">Open the wiki</a></b>
---
---@param car Vehicle
---@return int num
function getNumAvailablePaintjobs(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/giveVehiclePaintjob">Open the wiki</a></b>
---
---@param set int
---@param paintjob int
function giveVehiclePaintjob(set, paintjob) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGroupMember">Open the wiki</a></b>
---
---@param ped Ped
---@param group int
---@return bool result
function isGroupMember(ped, group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGroupLeader">Open the wiki</a></b>
---
---@param ped Ped
---@param group int
---@return bool result
function isGroupLeader(ped, group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupSeparationRange">Open the wiki</a></b>
---
---@param group int
---@param range float
function setGroupSeparationRange(group, range) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/limitTwoPlayerDistance">Open the wiki</a></b>
---
---@param distance float
function limitTwoPlayerDistance(distance) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releaseTwoPlayerDistance">Open the wiki</a></b>
---
function releaseTwoPlayerDistance() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerPlayerTargetting">Open the wiki</a></b>
---
---@param can bool
function setPlayerPlayerTargetting(can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getScriptFireCoords">Open the wiki</a></b>
---
---@param fire int
---@return float X
---@return float Y
---@return float Z
function getScriptFireCoords(fire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNthClosestCarNodeWithHeading">Open the wiki</a></b>
---
---@param forX float
---@param forY float
---@param forZ float
---@param direction int
---@return float X
---@return float Y
---@return float Z
---@return float ZAngle
function getNthClosestCarNodeWithHeading(forX, forY, forZ, direction) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayersCanBeInSeparateCars">Open the wiki</a></b>
---
---@param allow bool
function setPlayersCanBeInSeparateCars(allow) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesCarHaveStuckCarCheck">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function doesCarHaveStuckCarCheck(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlaybackSpeed">Open the wiki</a></b>
---
---@param car Vehicle
---@param speed float
function setPlaybackSpeed(car, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/areAnyCharsNearChar">Open the wiki</a></b>
---
---@param ped Ped
---@param range float
---@return bool result
function areAnyCharsNearChar(ped, range) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/skipCutsceneEnd">Open the wiki</a></b>
---
function skipCutsceneEnd() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPercentageTaggedInArea">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@return int percentage
function getPercentageTaggedInArea(x1, y1, x2, y2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTagStatusInArea">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param value bool
function setTagStatusInArea(x1, y1, x2, y2, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesRacing">Open the wiki</a></b>
---
---@param car Vehicle
---@param toX float
---@param toY float
---@param toZ float
function carGotoCoordinatesRacing(car, toX, toY, toZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCarUsingAi">Open the wiki</a></b>
---
---@param car Vehicle
---@param path int
function startPlaybackRecordedCarUsingAi(car, path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/skipInPlaybackRecordedCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param path float
function skipInPlaybackRecordedCar(car, path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCharDecisionMakerEventResponse">Open the wiki</a></b>
---
---@param maker int
---@param event int
function clearCharDecisionMakerEventResponse(maker, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addCharDecisionMakerEventResponse">Open the wiki</a></b>
---
---@param maker int
---@param event int
---@param taskID int
---@param respect float
---@param hate float
---@param like float
---@param dislike float
---@param inCar bool
---@param onFoot bool
function addCharDecisionMakerEventResponse(maker, event, taskID, respect, hate, like, dislike, inCar, onFoot) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPickUpObject">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param boneId1 int
---@param boneId2 int
---@param performAnimation string
---@param IFPFile int
---@param time int
function taskPickUpObject(ped, object, offsetX, offsetY, offsetZ, boneId1, boneId2, performAnimation, IFPFile, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dropObject">Open the wiki</a></b>
---
---@param ped Ped
---@param object bool
function dropObject(ped, object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/explodeCarInCutscene">Open the wiki</a></b>
---
---@param car Vehicle
function explodeCarInCutscene(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/buildPlayerModel">Open the wiki</a></b>
---
---@param player Player
function buildPlayerModel(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/planeAttackPlayer">Open the wiki</a></b>
---
---@param hydra int
---@param car Vehicle
---@param radius float
function planeAttackPlayer(hydra, car, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/planeFlyInDirection">Open the wiki</a></b>
---
---@param plane int
---@param direction float
---@param altitudemin float
---@param altitudemax float
function planeFlyInDirection(plane, direction, altitudemin, altitudemax) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/planeFollowEntity">Open the wiki</a></b>
---
---@param plane int
---@param ped Ped
---@param car Vehicle
---@param radius float
function planeFollowEntity(plane, ped, car, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDriveBy">Open the wiki</a></b>
---
---@param ped Ped
---@param drivebyActor int
---@param car Vehicle
---@param pX float
---@param pY float
---@param pZ float
---@param radiusX float
---@param radiusY int
---@param radiusZ bool
---@param firingRate int
function taskDriveBy(ped, drivebyActor, car, pX, pY, pZ, radiusX, radiusY, radiusZ, firingRate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarStayInSlowLane">Open the wiki</a></b>
---
---@param car Vehicle
---@param stay bool
function setCarStayInSlowLane(car, stay) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/takeRemoteControlOfCar">Open the wiki</a></b>
---
---@param player Player
---@param car Vehicle
function takeRemoteControlOfCar(player, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isClosestObjectOfTypeSmashedOrDamaged">Open the wiki</a></b>
---
---@param object Model
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
---@param smashed bool
---@param damaged bool
---@return bool result
function isClosestObjectOfTypeSmashedOrDamaged(object, atX, atY, atZ, radius, smashed, damaged) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startSettingUpConversation">Open the wiki</a></b>
---
---@param ped Ped
function startSettingUpConversation(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/finishSettingUpConversation">Open the wiki</a></b>
---
function finishSettingUpConversation() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isConversationAtNode">Open the wiki</a></b>
---
---@param ped Ped
---@param gxtString GxtString
---@return bool result
function isConversationAtNode(ped, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectHealth">Open the wiki</a></b>
---
---@param object Object
---@return int health
function getObjectHealth(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectHealth">Open the wiki</a></b>
---
---@param object Object
---@param health int
function setObjectHealth(object, health) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/breakObject">Open the wiki</a></b>
---
---@param object Object
---@param intensity int
function breakObject(object, intensity) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/heliAttackPlayer">Open the wiki</a></b>
---
---@param heli Vehicle
---@param player Player
---@param radius float
function heliAttackPlayer(heli, player, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/heliFollowEntity">Open the wiki</a></b>
---
---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param radius float
function heliFollowEntity(heli, ped, car, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/policeHeliChaseEntity">Open the wiki</a></b>
---
---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param radius float
function policeHeliChaseEntity(heli, ped, car, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskUseMobilePhone">Open the wiki</a></b>
---
---@param ped Ped
---@param hold bool
function taskUseMobilePhone(ped, hold) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskWarpCharIntoCarAsDriver">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
function taskWarpCharIntoCarAsDriver(ped, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskWarpCharIntoCarAsPassenger">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param passengerseat int
function taskWarpCharIntoCarAsPassenger(ped, car, passengerseat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchCopsOnBikes">Open the wiki</a></b>
---
---@param generate bool
function switchCopsOnBikes(generate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isFlameInAngledArea2d">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param angle float
---@param sphere bool
---@return bool result
function isFlameInAngledArea2d(x1, y1, x2, y2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isFlameInAngledArea3d">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
---@param angle float
---@param sphere bool
---@return bool result
function isFlameInAngledArea3d(x1, y1, z1, x2, y2, z2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addStuckCarCheckWithWarp">Open the wiki</a></b>
---
---@param car Vehicle
---@param checkDistance float
---@param time int
---@param stuck bool
---@param flipped bool
---@param warp bool
---@param path int
function addStuckCarCheckWithWarp(car, checkDistance, time, stuck, flipped, warp, path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/damageCarPanel">Open the wiki</a></b>
---
---@param car Vehicle
---@param door int
function damageCarPanel(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarRoll">Open the wiki</a></b>
---
---@param car Vehicle
---@param roll float
function setCarRoll(car, roll) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/suppressCarModel">Open the wiki</a></b>
---
---@param modelId Model
---@return bool result
function suppressCarModel(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dontSuppressCarModel">Open the wiki</a></b>
---
---@param modelId Model
function dontSuppressCarModel(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dontSuppressAnyCarModels">Open the wiki</a></b>
---
function dontSuppressAnyCarModels() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPs2KeyboardKeyPressed">Open the wiki</a></b>
---
---@param key int
---@return bool result
function isPs2KeyboardKeyPressed(key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPs2KeyboardKeyJustPressed">Open the wiki</a></b>
---
---@param key int
---@return bool result
function isPs2KeyboardKeyJustPressed(key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharHoldingObject">Open the wiki</a></b>
---
---@param ped Ped
---@param liftingObject int
---@return bool result
function isCharHoldingObject(ped, liftingObject) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCanGoAgainstTraffic">Open the wiki</a></b>
---
---@param car Vehicle
---@param can bool
function setCarCanGoAgainstTraffic(car, can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/damageCarDoor">Open the wiki</a></b>
---
---@param car Vehicle
---@param door int
function damageCarDoor(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCarInSphereNoSave">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@param model int
---@return Vehicle car
function getRandomCarInSphereNoSave(X, Y, Z, radius, model) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCharInSphere">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@param pedtypeCivilian bool
---@param gang bool
---@param prostitute bool
---@return Ped ped
function getRandomCharInSphere(X, Y, Z, radius, pedtypeCivilian, gang, prostitute) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharBeenArrested">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function hasCharBeenArrested(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlaneThrottle">Open the wiki</a></b>
---
---@param plane int
---@param throttle float
function setPlaneThrottle(plane, throttle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/heliLandAtCoords">Open the wiki</a></b>
---
---@param heli Vehicle
---@param X float
---@param Y float
---@param Z float
---@param minaltitude float
---@param maxaltitude float
function heliLandAtCoords(heli, X, Y, Z, minaltitude, maxaltitude) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/planeStartsInAir">Open the wiki</a></b>
---
---@param hydra int
function planeStartsInAir(hydra) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRelationship">Open the wiki</a></b>
---
---@param acquaintance int
---@param pedtype int
---@param toPedtype int
function setRelationship(acquaintance, pedtype, toPedtype) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearRelationship">Open the wiki</a></b>
---
---@param acquaintance int
---@param pedtype int
---@param toPedtype int
function clearRelationship(acquaintance, pedtype, toPedtype) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearGroupDecisionMakerEventResponse">Open the wiki</a></b>
---
---@param maker int
---@param event int
function clearGroupDecisionMakerEventResponse(maker, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addGroupDecisionMakerEventResponse">Open the wiki</a></b>
---
---@param maker int
---@param event int
---@param taskID int
---@param respect float
---@param hate float
---@param like float
---@param dislike float
---@param inCar bool
---@param onFoot bool
function addGroupDecisionMakerEventResponse(maker, event, taskID, respect, hate, like, dislike, inCar, onFoot) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawSpriteWithRotation">Open the wiki</a></b>
---
---@param texture int
---@param x float
---@param y float
---@param scaleX float
---@param scaleY float
---@param angle float
---@param r int
---@param g int
---@param b int
---@param a int
function drawSpriteWithRotation(texture, x, y, scaleX, scaleY, angle, r, g, b, a) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskUseAttractor">Open the wiki</a></b>
---
---@param ped Ped
---@param attractor int
function taskUseAttractor(ped, attractor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskShootAtChar">Open the wiki</a></b>
---
---@param ped Ped
---@param atActor int
---@param timelimit int
function taskShootAtChar(ped, atActor, timelimit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setInformRespectedFriends">Open the wiki</a></b>
---
---@param flags int
---@param radius float
---@param pedsToScan int
function setInformRespectedFriends(flags, radius, pedsToScan) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharRespondingToEvent">Open the wiki</a></b>
---
---@param ped Ped
---@param event int
---@return bool result
function isCharRespondingToEvent(ped, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectVisible">Open the wiki</a></b>
---
---@param object Object
---@param visibility bool
function setObjectVisible(object, visibility) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFleeCharAnyMeans">Open the wiki</a></b>
---
---@param ped Ped
---@param fleeFrom int
---@param runDistance float
---@param time int
---@param changeCourse bool
---@param unkTime1 int
---@param unkTime2 int
---@param awayRadius float
function taskFleeCharAnyMeans(ped, fleeFrom, runDistance, time, changeCourse, unkTime1, unkTime2, awayRadius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/flushPatrolRoute">Open the wiki</a></b>
---
function flushPatrolRoute() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/extendPatrolRoute">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@param animation string
---@param IFPFile string
function extendPatrolRoute(X, Y, Z, animation, IFPFile) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playObjectAnim">Open the wiki</a></b>
---
---@param object Object
---@param animation string
---@param IFPFile string
---@param framedelta float
---@param lockF bool
---@param loop bool
---@return bool result
function playObjectAnim(object, animation, IFPFile, framedelta, lockF, loop) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRadarZoom">Open the wiki</a></b>
---
---@param zoom int
function setRadarZoom(zoom) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesBlipExist">Open the wiki</a></b>
---
---@param marker Marker
---@return bool result
function doesBlipExist(marker) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadPrices">Open the wiki</a></b>
---
---@param shopping GxtString
function loadPrices(shopping) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadShop">Open the wiki</a></b>
---
---@param shopping GxtString
function loadShop(shopping) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumberOfItemsInShop">Open the wiki</a></b>
---
---@return int num
function getNumberOfItemsInShop() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getItemInShop">Open the wiki</a></b>
---
---@param index int
---@return int item
function getItemInShop(index) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPriceOfItem">Open the wiki</a></b>
---
---@param item int
---@return int price
function getPriceOfItem(item) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDead">Open the wiki</a></b>
---
---@param ped Ped
function taskDead(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarAsMissionCar">Open the wiki</a></b>
---
---@param car Vehicle
function setCarAsMissionCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setZonePopulationType">Open the wiki</a></b>
---
---@param zone GxtString
---@param popcycle int
function setZonePopulationType(zone, popcycle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setZoneDealerStrength">Open the wiki</a></b>
---
---@param zone GxtString
---@param density int
function setZoneDealerStrength(zone, density) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getZoneDealerStrength">Open the wiki</a></b>
---
---@param zone GxtString
---@return int strength
function getZoneDealerStrength(zone) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setZoneGangStrength">Open the wiki</a></b>
---
---@param zone GxtString
---@param gang int
---@param density int
function setZoneGangStrength(zone, gang, density) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getZoneGangStrength">Open the wiki</a></b>
---
---@param zone GxtString
---@param gang int
---@return int density
function getZoneGangStrength(zone, gang) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isMessageBeingDisplayed">Open the wiki</a></b>
---
---@return bool result
function isMessageBeingDisplayed() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharIsTargetPriority">Open the wiki</a></b>
---
---@param ped Ped
---@param targetPriority bool
function setCharIsTargetPriority(ped, targetPriority) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/customPlateDesignForNextCar">Open the wiki</a></b>
---
---@param modelNumplate Model
---@param townTexture int
function customPlateDesignForNextCar(modelNumplate, townTexture) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGotoCar">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param timeMS int
---@param stopAtDistance float
function taskGotoCar(ped, car, timeMS, stopAtDistance) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/requestIpl">Open the wiki</a></b>
---
---@param group string
function requestIpl(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeIpl">Open the wiki</a></b>
---
---@param group string
function removeIpl(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeIplDiscreetly">Open the wiki</a></b>
---
---@param group string
function removeIplDiscreetly(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharRelationship">Open the wiki</a></b>
---
---@param ped Ped
---@param acquaintance int
---@param pedtype int
function setCharRelationship(ped, acquaintance, pedtype) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCharRelationship">Open the wiki</a></b>
---
---@param ped Ped
---@param acquaintance int
---@param pedtype int
function clearCharRelationship(ped, acquaintance, pedtype) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearAllCharRelationships">Open the wiki</a></b>
---
---@param ped Ped
---@param acquaintance int
function clearAllCharRelationships(ped, acquaintance) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarPitch">Open the wiki</a></b>
---
---@param car Vehicle
---@return float pitch
function getCarPitch(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getActiveInterior">Open the wiki</a></b>
---
---@return int interior
function getActiveInterior() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/heliKeepEntityInView">Open the wiki</a></b>
---
---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param minaltitude float
---@param maxaltitude float
function heliKeepEntityInView(heli, ped, car, minaltitude, maxaltitude) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getWeapontypeModel">Open the wiki</a></b>
---
---@param id int
---@return int model
function getWeapontypeModel(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getWeapontypeSlot">Open the wiki</a></b>
---
---@param id int
---@return int slot
function getWeapontypeSlot(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getShoppingExtraInfo">Open the wiki</a></b>
---
---@param item int
---@param flag int
---@return int info
function getShoppingExtraInfo(item, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/givePlayerClothes">Open the wiki</a></b>
---
---@param player Player
---@param texture int
---@param model int
---@param bodypart int
function givePlayerClothes(player, texture, model, bodypart) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumberOfFiresInArea">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
---@return int num
function getNumberOfFiresInArea(x1, y1, z1, x2, y2, z2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachWinchToHeli">Open the wiki</a></b>
---
---@param heli Vehicle
---@param magnet bool
function attachWinchToHeli(heli, magnet) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releaseEntityFromWinch">Open the wiki</a></b>
---
---@param heli Vehicle
function releaseEntityFromWinch(heli) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTrainCarriage">Open the wiki</a></b>
---
---@param train Vehicle
---@param handle int
---@return int carriage
function getTrainCarriage(train, handle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/grabEntityOnWinch">Open the wiki</a></b>
---
---@param heli Vehicle
---@return Vehicle carHandle
---@return Ped pedHandle
---@return Object objectHandle
function grabEntityOnWinch(heli) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNameOfItem">Open the wiki</a></b>
---
---@param item int
---@return GxtString name
function getNameOfItem(item) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskClimb">Open the wiki</a></b>
---
---@param ped Ped
---@param climb bool
function taskClimb(ped, climb) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/buyItem">Open the wiki</a></b>
---
---@param item int
function buyItem(item) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCharTasksImmediately">Open the wiki</a></b>
---
---@param ped Ped
function clearCharTasksImmediately(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/storeClothesState">Open the wiki</a></b>
---
function storeClothesState() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/restoreClothesState">Open the wiki</a></b>
---
function restoreClothesState() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRopeHeightForObject">Open the wiki</a></b>
---
---@param magnet int
---@return float length
function getRopeHeightForObject(magnet) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRopeHeightForObject">Open the wiki</a></b>
---
---@param magnet int
---@param length float
function setRopeHeightForObject(magnet, length) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/grabEntityOnRopeForObject">Open the wiki</a></b>
---
---@param magnet int
---@return Vehicle carHandle
---@return Ped pedHandle
---@return Object objectHandle
function grabEntityOnRopeForObject(magnet) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releaseEntityFromRopeForObject">Open the wiki</a></b>
---
---@param magnet int
function releaseEntityFromRopeForObject(magnet) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playerEnteredDockCrane">Open the wiki</a></b>
---
function playerEnteredDockCrane() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playerEnteredBuildingsiteCrane">Open the wiki</a></b>
---
function playerEnteredBuildingsiteCrane() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playerLeftCrane">Open the wiki</a></b>
---
function playerLeftCrane() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/performSequenceTaskFromProgress">Open the wiki</a></b>
---
---@param ped Ped
---@param sequence int
---@param unkProgress1 int
---@param unkProgress2 int
function performSequenceTaskFromProgress(ped, sequence, unkProgress1, unkProgress2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setNextDesiredMoveState">Open the wiki</a></b>
---
---@param speed int
function setNextDesiredMoveState(speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGotoCharAiming">Open the wiki</a></b>
---
---@param ped Ped
---@param followActor int
---@param minradius float
---@param maxradius float
function taskGotoCharAiming(ped, followActor, minradius, maxradius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getSequenceProgressRecursive">Open the wiki</a></b>
---
---@param ped Ped
---@return int unkProgress1
---@return int unkProgress2
function getSequenceProgressRecursive(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskKillCharOnFootTimed">Open the wiki</a></b>
---
---@param ped Ped
---@param attackActor int
---@param time int
function taskKillCharOnFootTimed(ped, attackActor, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNearestTagPosition">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@return float X
---@return float Y
---@return float Z
function getNearestTagPosition(X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskJetpack">Open the wiki</a></b>
---
---@param ped Ped
function taskJetpack(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setArea51SamSite">Open the wiki</a></b>
---
---@param enable bool
function setArea51SamSite(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnySearchlight">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
---@return Searchlight searchlight
function isCharInAnySearchlight(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isTrailerAttachedToCab">Open the wiki</a></b>
---
---@param trailer Vehicle
---@param car Vehicle
---@return bool result
function isTrailerAttachedToCab(trailer, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/detachTrailerFromCab">Open the wiki</a></b>
---
---@param trailer Vehicle
---@param cab Vehicle
function detachTrailerFromCab(trailer, cab) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPlayerGroup">Open the wiki</a></b>
---
---@param player Player
---@return int group
function getPlayerGroup(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getLoadedShop">Open the wiki</a></b>
---
---@return GxtString shop
function getLoadedShop() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getBeatProximity">Open the wiki</a></b>
---
---@param track int
---@return int int2
---@return int int3
---@return int int4
function getBeatProximity(track) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupDefaultTaskAllocator">Open the wiki</a></b>
---
---@param group int
---@param command int
function setGroupDefaultTaskAllocator(group, command) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerGroupRecruitment">Open the wiki</a></b>
---
---@param player Player
---@param enabled bool
function setPlayerGroupRecruitment(player, enabled) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/activateHeliSpeedCheat">Open the wiki</a></b>
---
---@param heli Vehicle
---@param power int
function activateHeliSpeedCheat(heli, power) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSetCharDecisionMaker">Open the wiki</a></b>
---
---@param ped Ped
---@param maker int
function taskSetCharDecisionMaker(ped, maker) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteMissionTrain">Open the wiki</a></b>
---
---@param train Vehicle
function deleteMissionTrain(train) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markMissionTrainAsNoLongerNeeded">Open the wiki</a></b>
---
---@param train Vehicle
function markMissionTrainAsNoLongerNeeded(train) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setBlipAlwaysDisplayOnZoomedRadar">Open the wiki</a></b>
---
---@param marker Marker
---@param displayAlways bool
function setBlipAlwaysDisplayOnZoomedRadar(marker, displayAlways) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/requestCarRecording">Open the wiki</a></b>
---
---@param path int
function requestCarRecording(path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCarRecordingBeenLoaded">Open the wiki</a></b>
---
---@param path int
---@return bool result
function hasCarRecordingBeenLoaded(path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMissionTrainCoordinates">Open the wiki</a></b>
---
---@param train Vehicle
---@param X float
---@param Y float
---@param Z float
function setMissionTrainCoordinates(train, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskComplexPickupObject">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
function taskComplexPickupObject(ped, object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/listenToPlayerGroupCommands">Open the wiki</a></b>
---
---@param ped Ped
---@param listen bool
function listenToPlayerGroupCommands(ped, listen) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerEnterCarButton">Open the wiki</a></b>
---
---@param player Player
---@param can bool
function setPlayerEnterCarButton(player, can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCharSlideToCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
---@param angle float
---@param withinRadius float
function taskCharSlideToCoord(ped, toX, toY, toZ, angle, withinRadius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentDayOfWeek">Open the wiki</a></b>
---
---@return int weekday
function getCurrentDayOfWeek() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerScriptBrainForCodeUse">Open the wiki</a></b>
---
---@param id int
---@param gxtString GxtString
function registerScriptBrainForCodeUse(id, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/applyForceToCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param vecX float
---@param vecY float
---@param vecZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
function applyForceToCar(car, vecX, vecY, vecZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addToCarRotationVelocity">Open the wiki</a></b>
---
---@param car Vehicle
---@param vecX float
---@param vecY float
---@param vecZ float
function addToCarRotationVelocity(car, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarRotationVelocity">Open the wiki</a></b>
---
---@param car Vehicle
---@param vecX float
---@param vecY float
---@param vecZ float
function setCarRotationVelocity(car, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharShootRate">Open the wiki</a></b>
---
---@param ped Ped
---@param rate int
function setCharShootRate(ped, rate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isModelInCdimage">Open the wiki</a></b>
---
---@param modelId Model
---@return bool result
function isModelInCdimage(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeOilPuddlesInArea">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
function removeOilPuddlesInArea(x1, y1, x2, y2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setBlipAsFriendly">Open the wiki</a></b>
---
---@param marker Marker
---@param type bool
function setBlipAsFriendly(marker, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSwimToCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
function taskSwimToCoord(ped, toX, toY, toZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getModelDimensions">Open the wiki</a></b>
---
---@param modelId Model
---@return float x1
---@return float y1
---@return float z1
---@return float x2
---@return float y2
---@return float z2
function getModelDimensions(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/copyCharDecisionMaker">Open the wiki</a></b>
---
---@param ped Ped
---@return int maker
function copyCharDecisionMaker(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/copyGroupDecisionMaker">Open the wiki</a></b>
---
---@param group int
---@return int maker
function copyGroupDecisionMaker(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDrivePointRouteAdvanced">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param speed float
---@param flag1 int
---@param flag2 int
---@param flag3 int
function taskDrivePointRouteAdvanced(ped, car, speed, flag1, flag2, flag3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isRelationshipSet">Open the wiki</a></b>
---
---@param acquaintance int
---@param ofActors int
---@param toActors int
---@return bool result
function isRelationshipSet(acquaintance, ofActors, toActors) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarAlwaysCreateSkids">Open the wiki</a></b>
---
---@param car Vehicle
---@param enable bool
function setCarAlwaysCreateSkids(car, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCityFromCoords">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@return int city
function getCityFromCoords(X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasObjectOfTypeBeenSmashed">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@param modelId Model
---@return bool result
function hasObjectOfTypeBeenSmashed(X, Y, Z, radius, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerPerformingWheelie">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isPlayerPerformingWheelie(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerPerformingStoppie">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isPlayerPerformingStoppie(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCheckpointCoords">Open the wiki</a></b>
---
---@param checkpoint Checkpoint
---@param X float
---@param Y float
---@param Z float
function setCheckpointCoords(checkpoint, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/controlCarHydraulics">Open the wiki</a></b>
---
---@param car Vehicle
---@param f1 float
---@param f2 float
---@param f3 float
---@param f4 float
function controlCarHydraulics(car, f1, f2, f3, f4) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGroupSize">Open the wiki</a></b>
---
---@param group int
---@return int numberOfLeaders
---@return int numberOfMembers
function getGroupSize(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectCollisionDamageEffect">Open the wiki</a></b>
---
---@param object Object
---@param destructible bool
function setObjectCollisionDamageEffect(object, destructible) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarFollowCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param followCar int
---@param radius float
function setCarFollowCar(car, followCar, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playerEnteredQuarryCrane">Open the wiki</a></b>
---
function playerEnteredQuarryCrane() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playerEnteredLasVegasCrane">Open the wiki</a></b>
---
function playerEnteredLasVegasCrane() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchEntryExit">Open the wiki</a></b>
---
---@param interior GxtString
---@param access bool
function switchEntryExit(interior, access) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayTextWithFloat">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param GXT GxtString
---@param value float
---@param flag int
function displayTextWithFloat(X, Y, GXT, value, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesGroupExist">Open the wiki</a></b>
---
---@param group int
---@return bool result
function doesGroupExist(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/giveMeleeAttackToChar">Open the wiki</a></b>
---
---@param ped Ped
---@param fightingStyle int
---@param moves int
function giveMeleeAttackToChar(ped, fightingStyle, moves) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarHydraulics">Open the wiki</a></b>
---
---@param car Vehicle
---@param hydraulics bool
function setCarHydraulics(car, hydraulics) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/is2playerGameGoingOn">Open the wiki</a></b>
---
---@return bool result
function is2playerGameGoingOn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCameraFov">Open the wiki</a></b>
---
---@return float fov
function getCameraFov() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesCarHaveHydraulics">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function doesCarHaveHydraulics(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCharSlideToCoordAndPlayAnim">Open the wiki</a></b>
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
---@param angle float
---@param radius float
---@param animation string
---@param ifp1 int
---@param ifp2 float
---@param LA bool
---@param LX bool
---@param LY bool
---@param LF bool
---@param LT int
function taskCharSlideToCoordAndPlayAnim(ped, toX, toY, toZ, angle, radius, animation, ifp1, ifp2, LA, LX, LY, LF, LT) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTotalNumberOfPedsKilledByPlayer">Open the wiki</a></b>
---
---@param player Player
---@return int number
function getTotalNumberOfPedsKilledByPlayer(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getLevelDesignCoordsForObject">Open the wiki</a></b>
---
---@param object Object
---@param spoot int
---@return float X
---@return float Y
---@return float Z
function getLevelDesignCoordsForObject(object, spoot) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharHighestPriorityEvent">Open the wiki</a></b>
---
---@param ped Ped
---@return int event
function getCharHighestPriorityEvent(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getParkingNodeInArea">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
---@return float X
---@return float Y
---@return float Z
function getParkingNodeInArea(x1, y1, z1, x2, y2, z2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarCharIsUsing">Open the wiki</a></b>
---
---@param ped Ped
---@return Vehicle car
function getCarCharIsUsing(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPlayAnimNonInterruptable">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@param IFP string
---@param framedelta float
---@param loopA bool
---@param lockX bool
---@param lockY bool
---@param lockF bool
---@param time int
function taskPlayAnimNonInterruptable(ped, animation, IFP, framedelta, loopA, lockX, lockY, lockF, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addStuntJump">Open the wiki</a></b>
---
---@param startX float
---@param startY float
---@param startZ float
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@param goalX float
---@param goalY float
---@param goalZ float
---@param radius2X float
---@param radius2Y float
---@param radius2Z float
---@param cameraX float
---@param cameraY float
---@param cameraZ float
---@param reward int
function addStuntJump(startX, startY, startZ, radiusX, radiusY, radiusZ, goalX, goalY, goalZ, radius2X, radius2Y, radius2Z, cameraX, cameraY, cameraZ, reward) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectCoordinatesAndVelocity">Open the wiki</a></b>
---
---@param object Object
---@param X float
---@param Y float
---@param Z float
function setObjectCoordinatesAndVelocity(object, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharKindaStayInSamePlace">Open the wiki</a></b>
---
---@param ped Ped
---@param stay bool
function setCharKindaStayInSamePlace(ped, stay) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFollowPatrolRoute">Open the wiki</a></b>
---
---@param ped Ped
---@param walkMode int
---@param routeMode int
function taskFollowPatrolRoute(ped, walkMode, routeMode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAir">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharInAir(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharHeightAboveGround">Open the wiki</a></b>
---
---@param ped Ped
---@return float height
function getCharHeightAboveGround(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharWeaponSkill">Open the wiki</a></b>
---
---@param ped Ped
---@param skill int
function setCharWeaponSkill(ped, skill) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextEdge">Open the wiki</a></b>
---
---@param size int
---@param r int
---@param g int
---@param b int
---@param a int
function setTextEdge(size, r, g, b, a) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarEngineBroken">Open the wiki</a></b>
---
---@param car Vehicle
---@param broken bool
function setCarEngineBroken(car, broken) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isThisModelABoat">Open the wiki</a></b>
---
---@param modelId Model
---@return bool result
function isThisModelABoat(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isThisModelAPlane">Open the wiki</a></b>
---
---@param modelId Model
---@return bool result
function isThisModelAPlane(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isThisModelAHeli">Open the wiki</a></b>
---
---@param modelId Model
---@return bool result
function isThisModelAHeli(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFirstPersonInCarCameraMode">Open the wiki</a></b>
---
---@param enable bool
function setFirstPersonInCarCameraMode(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGreetPartner">Open the wiki</a></b>
---
---@param ped Ped
---@param ped2 Ped
---@param unk1 float
---@param unk2 int
function taskGreetPartner(ped, ped2, unk1, unk2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeliBladesFullSpeed">Open the wiki</a></b>
---
---@param heli Vehicle
function setHeliBladesFullSpeed(heli) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayHud">Open the wiki</a></b>
---
---@param enable bool
function displayHud(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/connectLods">Open the wiki</a></b>
---
---@param object Object
---@param lod int
function connectLods(object, lod) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMaxFireGenerations">Open the wiki</a></b>
---
---@param max int
function setMaxFireGenerations(max) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDieNamedAnim">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@param ifp1 string
---@param ifp2 float
---@param time int
function taskDieNamedAnim(ped, animation, ifp1, ifp2, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerDuckButton">Open the wiki</a></b>
---
---@param player Player
---@param able bool
function setPlayerDuckButton(player, able) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPoolTableCoords">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
function setPoolTableCoords(x1, y1, z1, x2, y2, z2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasObjectBeenPhotographed">Open the wiki</a></b>
---
---@param object Object
---@return bool result
function hasObjectBeenPhotographed(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doCameraBump">Open the wiki</a></b>
---
---@param rotationZ float
---@param rotationY float
function doCameraBump(rotationZ, rotationY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentDate">Open the wiki</a></b>
---
---@return int day
---@return int month
function getCurrentDate() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectAnimSpeed">Open the wiki</a></b>
---
---@param object Object
---@param animation string
---@param speed float
function setObjectAnimSpeed(object, animation, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectPlayingAnim">Open the wiki</a></b>
---
---@param object Object
---@param anim string
---@return bool result
function isObjectPlayingAnim(object, anim) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectAnimCurrentTime">Open the wiki</a></b>
---
---@param object Object
---@param animation string
---@return float progress
function getObjectAnimCurrentTime(object, animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectAnimCurrentTime">Open the wiki</a></b>
---
---@param object Object
---@param animation string
---@param progress float
function setObjectAnimCurrentTime(object, animation, progress) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharVelocity">Open the wiki</a></b>
---
---@param ped Ped
---@param vecX float
---@param vecY float
---@param vecZ float
function setCharVelocity(ped, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharVelocity">Open the wiki</a></b>
---
---@param ped Ped
---@return float vecX
---@return float vecY
---@return float vecZ
function getCharVelocity(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharRotation">Open the wiki</a></b>
---
---@param ped Ped
---@param vecX float
---@param vecY float
---@param vecZ float
function setCharRotation(ped, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarUprightValue">Open the wiki</a></b>
---
---@param car Vehicle
---@return float value
function getCarUprightValue(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleInterior">Open the wiki</a></b>
---
---@param car Vehicle
---@param interior int
function setVehicleInterior(car, interior) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/selectWeaponsForVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@param gun bool
function selectWeaponsForVehicle(car, gun) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCityPlayerIsIn">Open the wiki</a></b>
---
---@param player Player
---@return int city
function getCityPlayerIsIn(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNameOfZone">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@return GxtString name
function getNameOfZone(X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/activateInteriorPeds">Open the wiki</a></b>
---
---@param activate bool
function activateInteriorPeds(activate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleCanBeTargetted">Open the wiki</a></b>
---
---@param car Vehicle
---@param unk bool
function setVehicleCanBeTargetted(car, unk) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFollowFootsteps">Open the wiki</a></b>
---
---@param ped Ped
---@param followActor int
function taskFollowFootsteps(ped, followActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/damageChar">Open the wiki</a></b>
---
---@param ped Ped
---@param health int
---@param affectArmour bool
function damageChar(ped, health, affectArmour) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCanBeVisiblyDamaged">Open the wiki</a></b>
---
---@param car Vehicle
---@param can bool
function setCarCanBeVisiblyDamaged(car, can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeliReachedTargetDistance">Open the wiki</a></b>
---
---@param heli Vehicle
---@param dist int
function setHeliReachedTargetDistance(heli, dist) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getSoundLevelAtCoords">Open the wiki</a></b>
---
---@param ped Ped
---@param X float
---@param Y float
---@param Z float
---@return float level
function getSoundLevelAtCoords(ped, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharAllowedToDuck">Open the wiki</a></b>
---
---@param ped Ped
---@param enable bool
function setCharAllowedToDuck(ped, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeadingForAttachedPlayer">Open the wiki</a></b>
---
---@param player Player
---@param toAngle float
---@param rotationSpeed float
function setHeadingForAttachedPlayer(player, toAngle, rotationSpeed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskWalkAlongsideChar">Open the wiki</a></b>
---
---@param ped Ped
---@param alongisdeActor int
function taskWalkAlongsideChar(ped, alongisdeActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createEmergencyServicesCar">Open the wiki</a></b>
---
---@param car Model
---@param X float
---@param Y float
---@param Z float
function createEmergencyServicesCar(car, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskKindaStayInSamePlace">Open the wiki</a></b>
---
---@param ped Ped
---@param stay bool
function taskKindaStayInSamePlace(ped, stay) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCarLooped">Open the wiki</a></b>
---
---@param car Vehicle
---@param path int
function startPlaybackRecordedCarLooped(car, path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharInterior">Open the wiki</a></b>
---
---@param ped Ped
---@param interior int
function setCharInterior(ped, interior) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isAttachedPlayerHeadingAchieved">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isAttachedPlayerHeadingAchieved(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableEntryExitPlayerGroupWarping">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param radius float
---@param access bool
function enableEntryExitPlayerGroupWarping(X, Y, radius, access) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClosestStealableObject">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@return Object object
function getClosestStealableObject(X, Y, Z, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isProceduralInteriorActive">Open the wiki</a></b>
---
---@param interior int
---@return bool result
function isProceduralInteriorActive(interior) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeCarRecording">Open the wiki</a></b>
---
---@param path int
function removeCarRecording(path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setZonePopulationRace">Open the wiki</a></b>
---
---@param zone GxtString
---@param popcycle int
function setZonePopulationRace(zone, popcycle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectOnlyDamagedByPlayer">Open the wiki</a></b>
---
---@param object Object
---@param player bool
function setObjectOnlyDamagedByPlayer(object, player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createBirds">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
---@param flag1 int
---@param flag2 int
function createBirds(x1, y1, z1, x2, y2, z2, flag1, flag2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleDirtLevel">Open the wiki</a></b>
---
---@param car Vehicle
---@param level float
function setVehicleDirtLevel(car, level) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGangWarsActive">Open the wiki</a></b>
---
---@param enable bool
function setGangWarsActive(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGangWarGoingOn">Open the wiki</a></b>
---
---@return bool result
function isGangWarGoingOn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/givePlayerClothesOutsideShop">Open the wiki</a></b>
---
---@param player Player
---@param clothes string
---@param model string
---@param bodyPart int
function givePlayerClothesOutsideShop(player, clothes, model, bodyPart) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearLoadedShop">Open the wiki</a></b>
---
function clearLoadedShop() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupSequence">Open the wiki</a></b>
---
---@param group int
---@param Aspack int
function setGroupSequence(group, Aspack) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharDropsWeaponsWhenDead">Open the wiki</a></b>
---
---@param ped Ped
---@param droppable bool
function setCharDropsWeaponsWhenDead(ped, droppable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharNeverLeavesGroup">Open the wiki</a></b>
---
---@param ped Ped
---@param set bool
function setCharNeverLeavesGroup(ped, set) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerFireButton">Open the wiki</a></b>
---
---@param player Player
---@param able bool
function setPlayerFireButton(player, able) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachFxSystemToCharBone">Open the wiki</a></b>
---
---@param particle Particle
---@param ped Ped
---@param mode int
function attachFxSystemToCharBone(particle, ped, mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerAttractorScriptBrainForCodeUse">Open the wiki</a></b>
---
---@param handle int
---@param script GxtString
function registerAttractorScriptBrainForCodeUse(handle, script) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeadingLimitForAttachedChar">Open the wiki</a></b>
---
---@param ped Ped
---@param orientation int
---@param limit float
function setHeadingLimitForAttachedChar(ped, orientation, limit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForDeadChar">Open the wiki</a></b>
---
---@param ped Ped
---@return Marker blip
function addBlipForDeadChar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDeadCharCoordinates">Open the wiki</a></b>
---
---@param ped Ped
---@return float X
---@return float Y
---@return float Z
function getDeadCharCoordinates(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPlayAnimWithFlags">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@param ifp string
---@param framedelta float
---@param loopA bool
---@param lockX bool
---@param lockY bool
---@param lockF bool
---@param time int
---@param force bool
---@param lockZ bool
function taskPlayAnimWithFlags(ped, animation, ifp, framedelta, loopA, lockX, lockY, lockF, time, force, lockZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleAirResistanceMultiplier">Open the wiki</a></b>
---
---@param car Vehicle
---@param multiplier float
function setVehicleAirResistanceMultiplier(car, multiplier) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCoordinatesNoOffset">Open the wiki</a></b>
---
---@param car Vehicle
---@param X float
---@param Y float
---@param Z float
function setCarCoordinatesNoOffset(car, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUsesCollisionOfClosestObjectOfType">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@param modelId Model
---@param collisionDetection bool
function setUsesCollisionOfClosestObjectOfType(X, Y, Z, radius, modelId, collisionDetection) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTimeOneDayForward">Open the wiki</a></b>
---
function setTimeOneDayForward() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTimerBeepCountdownTime">Open the wiki</a></b>
---
---@param timer VarId
---@param reach int
function setTimerBeepCountdownTime(timer, reach) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachTrailerToCab">Open the wiki</a></b>
---
---@param trailer int
---@param cab int
function attachTrailerToCab(trailer, cab) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isVehicleTouchingObject">Open the wiki</a></b>
---
---@param car Vehicle
---@param object Object
---@return bool result
function isVehicleTouchingObject(car, object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableCraneControls">Open the wiki</a></b>
---
---@param UP bool
---@param DOWN bool
---@param RELEASE bool
function enableCraneControls(UP, DOWN, RELEASE) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerInPositionForConversation">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isPlayerInPositionForConversation(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableConversation">Open the wiki</a></b>
---
---@param ped Ped
---@param enable bool
function enableConversation(ped, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCharInSphereOnlyDrugsBuyers">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@return Ped ped
function getRandomCharInSphereOnlyDrugsBuyers(X, Y, Z, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPedType">Open the wiki</a></b>
---
---@param ped Ped
---@return int pedtype
function getPedType(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskUseClosestMapAttractor">Open the wiki</a></b>
---
---@param ped Ped
---@param radius float
---@param nearModel Model
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param scriptNamed string
---@return bool result
function taskUseClosestMapAttractor(ped, radius, nearModel, offsetX, offsetY, offsetZ, scriptNamed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/planeAttackPlayerUsingDogFight">Open the wiki</a></b>
---
---@param hydra int
---@param player Player
---@param radius float
function planeAttackPlayerUsingDogFight(hydra, player, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/canTriggerGangWarWhenOnAMission">Open the wiki</a></b>
---
---@param can bool
function canTriggerGangWarWhenOnAMission(can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/controlMovableVehiclePart">Open the wiki</a></b>
---
---@param car Vehicle
---@param angle float
function controlMovableVehiclePart(car, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/winchCanPickVehicleUp">Open the wiki</a></b>
---
---@param car Vehicle
---@param attractive bool
function winchCanPickVehicleUp(car, attractive) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/openCarDoorABit">Open the wiki</a></b>
---
---@param car Vehicle
---@param door int
---@param rotation float
function openCarDoorABit(car, door, rotation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarDoorFullyOpen">Open the wiki</a></b>
---
---@param car Vehicle
---@param door int
---@return bool result
function isCarDoorFullyOpen(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAlwaysDraw3dMarkers">Open the wiki</a></b>
---
---@param set bool
function setAlwaysDraw3dMarkers(set) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/streamScript">Open the wiki</a></b>
---
---@param script int
function streamScript(script) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasStreamedScriptLoaded">Open the wiki</a></b>
---
---@param script int
---@return bool result
function hasStreamedScriptLoaded(script) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGangWarsTrainingMission">Open the wiki</a></b>
---
---@param set bool
function setGangWarsTrainingMission(set) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharHasUsedEntryExit">Open the wiki</a></b>
---
---@param ped Ped
---@param X float
---@param Y float
---@param radius float
function setCharHasUsedEntryExit(ped, X, Y, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharMaxHealth">Open the wiki</a></b>
---
---@param ped Ped
---@param health int
function setCharMaxHealth(ped, health) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setNightVision">Open the wiki</a></b>
---
---@param enable bool
function setNightVision(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setInfraredVision">Open the wiki</a></b>
---
---@param enable bool
function setInfraredVision(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setZoneForGangWarsTraining">Open the wiki</a></b>
---
---@param zone GxtString
function setZoneForGangWarsTraining(zone) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCanBeKnockedOffBike">Open the wiki</a></b>
---
---@param ped Ped
---@param can bool
function setCharCanBeKnockedOffBike(ped, can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCoordinatesDontWarpGang">Open the wiki</a></b>
---
---@param ped Ped
---@param X float
---@param Y float
---@param Z float
function setCharCoordinatesDontWarpGang(ped, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addPriceModifier">Open the wiki</a></b>
---
---@param item int
---@param price int
function addPriceModifier(item, price) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removePriceModifier">Open the wiki</a></b>
---
---@param item int
function removePriceModifier(item) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/initZonePopulationSettings">Open the wiki</a></b>
---
function initZonePopulationSettings() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/explodeCarInCutsceneShakeAndBits">Open the wiki</a></b>
---
---@param car Vehicle
---@param shake bool
---@param effect bool
---@param sound bool
function explodeCarInCutsceneShakeAndBits(car, shake, effect, sound) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSkipCutsceneButtonPressed">Open the wiki</a></b>
---
---@return bool result
function isSkipCutsceneButtonPressed() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCutsceneOffset">Open the wiki</a></b>
---
---@return bool result
---@return float X
---@return float Y
---@return float Z
function getCutsceneOffset() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectScale">Open the wiki</a></b>
---
---@param object Object
---@param scale float
function setObjectScale(object, scale) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentPopulationZoneType">Open the wiki</a></b>
---
---@return int popcycle
function getCurrentPopulationZoneType() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createMenu">Open the wiki</a></b>
---
---@param title GxtString
---@param posX float
---@param posY float
---@param width float
---@param columns int
---@param interactive bool
---@param background bool
---@param alignment int
---@return int menu
function createMenu(title, posX, posY, width, columns, interactive, background, alignment) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMenuColumnOrientation">Open the wiki</a></b>
---
---@param menu int
---@param column int
---@param alignment int
function setMenuColumnOrientation(menu, column, alignment) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMenuItemSelected">Open the wiki</a></b>
---
---@param menu int
---@return int item
function getMenuItemSelected(menu) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMenuItemAccepted">Open the wiki</a></b>
---
---@param menu int
---@return int item
function getMenuItemAccepted(menu) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/activateMenuItem">Open the wiki</a></b>
---
---@param menu int
---@param row int
---@param enable bool
function activateMenuItem(menu, row, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteMenu">Open the wiki</a></b>
---
---@param menu int
function deleteMenu(menu) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMenuColumn">Open the wiki</a></b>
---
---@param menu int
---@param column int
---@param header GxtString
---@param data1 GxtString
---@param data2 GxtString
---@param data3 GxtString
---@param data4 GxtString
---@param data5 GxtString
---@param data6 GxtString
---@param data7 GxtString
---@param data8 GxtString
---@param data9 GxtString
---@param data10 GxtString
---@param data11 GxtString
---@param data12 GxtString
function setMenuColumn(menu, column, header, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setBlipEntryExit">Open the wiki</a></b>
---
---@param marker Marker
---@param X float
---@param Y float
---@param radius float
function setBlipEntryExit(marker, X, Y, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchDeathPenalties">Open the wiki</a></b>
---
---@param lose bool
function switchDeathPenalties(lose) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchArrestPenalties">Open the wiki</a></b>
---
---@param lose bool
function switchArrestPenalties(lose) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setExtraHospitalRestartPoint">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@param angle float
function setExtraHospitalRestartPoint(X, Y, Z, radius, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setExtraPoliceStationRestartPoint">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@param angle float
function setExtraPoliceStationRestartPoint(X, Y, Z, radius, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findNumberTagsTagged">Open the wiki</a></b>
---
---@return int num
function findNumberTagsTagged() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTerritoryUnderControlPercentage">Open the wiki</a></b>
---
---@return int percentage
function getTerritoryUnderControlPercentage() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectInAngledArea2d">Open the wiki</a></b>
---
---@param object Object
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param radius float
---@param sphere bool
---@return bool result
function isObjectInAngledArea2d(object, x1, y1, x2, y2, radius, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectInAngledArea3d">Open the wiki</a></b>
---
---@param object Object
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
---@param depth float
---@param flag bool
---@return bool result
function isObjectInAngledArea3d(object, x1, y1, z1, x2, y2, z2, depth, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCharInSphereNoBrain">Open the wiki</a></b>
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@return Ped ped
function getRandomCharInSphereNoBrain(X, Y, Z, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlaneUndercarriageUp">Open the wiki</a></b>
---
---@param plane int
---@param set bool
function setPlaneUndercarriageUp(plane, set) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/disableAllEntryExits">Open the wiki</a></b>
---
---@param disable bool
function disableAllEntryExits(disable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachAnimsToModel">Open the wiki</a></b>
---
---@param modelId Model
---@param externalScript GxtString
function attachAnimsToModel(modelId, externalScript) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectAsStealable">Open the wiki</a></b>
---
---@param object Object
---@param liftable bool
function setObjectAsStealable(object, liftable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCreateRandomGangMembers">Open the wiki</a></b>
---
---@param enable bool
function setCreateRandomGangMembers(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addSparks">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param posZ float
---@param vecX float
---@param vecY float
---@param vecZ float
---@param density int
function addSparks(posX, posY, posZ, vecX, vecY, vecZ, density) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getVehicleClass">Open the wiki</a></b>
---
---@param car Vehicle
---@return int class
function getVehicleClass(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearConversationForChar">Open the wiki</a></b>
---
---@param ped Ped
function clearConversationForChar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMenuItemWithNumber">Open the wiki</a></b>
---
---@param panel int
---@param column int
---@param row int
---@param gxtString GxtString
---@param number int
function setMenuItemWithNumber(panel, column, row, gxtString, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMenuItemWith2Numbers">Open the wiki</a></b>
---
---@param panel int
---@param column int
---@param row int
---@param gxtString GxtString
---@param numbers1 int
---@param numbers2 int
function setMenuItemWith2Numbers(panel, column, row, gxtString, numbers1, numbers2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCutsceneModelTexture">Open the wiki</a></b>
---
---@param cutsceneModel GxtString
---@param textureName GxtString
function setCutsceneModelTexture(cutsceneModel, textureName) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNameOfInfoZone">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@return GxtString nameB
function getNameOfInfoZone(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/vehicleCanBeTargettedByHsMissile">Open the wiki</a></b>
---
---@param car Vehicle
---@param targetable bool
function vehicleCanBeTargettedByHsMissile(car, targetable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFreebiesInVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@param containsGoodies bool
function setFreebiesInVehicle(car, containsGoodies) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setScriptLimitToGangSize">Open the wiki</a></b>
---
---@param max bool
function setScriptLimitToGangSize(max) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/makePlayerGangDisappear">Open the wiki</a></b>
---
function makePlayerGangDisappear() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/makePlayerGangReappear">Open the wiki</a></b>
---
function makePlayerGangReappear() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClothesItem">Open the wiki</a></b>
---
---@param player Player
---@param bodypart int
---@return int textureCRC
---@return int modelCRC
function getClothesItem(player, bodypart) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/showUpdateStats">Open the wiki</a></b>
---
---@param display bool
function showUpdateStats(display) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCoordBlipAppearance">Open the wiki</a></b>
---
---@param checkpoint Checkpoint
---@param type int
function setCoordBlipAppearance(checkpoint, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeathazeEffect">Open the wiki</a></b>
---
---@param enable bool
function setHeathazeEffect(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isHelpMessageBeingDisplayed">Open the wiki</a></b>
---
---@return bool result
function isHelpMessageBeingDisplayed() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasObjectBeenDamagedByWeapon">Open the wiki</a></b>
---
---@param object Object
---@param type int
---@return bool result
function hasObjectBeenDamagedByWeapon(object, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearObjectLastWeaponDamage">Open the wiki</a></b>
---
---@param object Object
function clearObjectLastWeaponDamage(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerJumpButton">Open the wiki</a></b>
---
---@param player Player
---@param enable bool
function setPlayerJumpButton(player, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getHudColour">Open the wiki</a></b>
---
---@param interface int
---@return int r
---@return int g
---@return int b
---@return int a
function getHudColour(interface) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/lockDoor">Open the wiki</a></b>
---
---@param door int
---@param lock bool
function lockDoor(door, lock) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectMass">Open the wiki</a></b>
---
---@param object Object
---@param mass float
function setObjectMass(object, mass) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectMass">Open the wiki</a></b>
---
---@param int int
---@return float mass
function getObjectMass(int) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectTurnMass">Open the wiki</a></b>
---
---@param object Object
---@param turnMass float
function setObjectTurnMass(object, turnMass) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectTurnMass">Open the wiki</a></b>
---
---@param object Object
---@return float turnMass
function getObjectTurnMass(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSpecificZoneToTriggerGangWar">Open the wiki</a></b>
---
---@param zone GxtString
function setSpecificZoneToTriggerGangWar(zone) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearSpecificZonesToTriggerGangWar">Open the wiki</a></b>
---
function clearSpecificZonesToTriggerGangWar() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setActiveMenuItem">Open the wiki</a></b>
---
---@param panel int
---@param activeRow int
function setActiveMenuItem(panel, activeRow) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markStreamedScriptAsNoLongerNeeded">Open the wiki</a></b>
---
---@param externalScript int
function markStreamedScriptAsNoLongerNeeded(externalScript) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeStreamedScript">Open the wiki</a></b>
---
---@param externalScript int
function removeStreamedScript(externalScript) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMessageFormatting">Open the wiki</a></b>
---
---@param priority bool
---@param leftmargin int
---@param maxwidth int
function setMessageFormatting(priority, leftmargin, maxwidth) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startNewStreamedScript">Open the wiki</a></b>
---
---@param externalScript int
---@param args table
function startNewStreamedScript(externalScript, args) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setWeatherToAppropriateTypeNow">Open the wiki</a></b>
---
function setWeatherToAppropriateTypeNow() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/winchCanPickObjectUp">Open the wiki</a></b>
---
---@param object Object
---@param enable bool
function winchCanPickObjectUp(object, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchAudioZone">Open the wiki</a></b>
---
---@param zone GxtString
---@param enableSound bool
function switchAudioZone(zone, enableSound) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarEngineOn">Open the wiki</a></b>
---
---@param car Vehicle
---@param on bool
function setCarEngineOn(car, on) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarLightsOn">Open the wiki</a></b>
---
---@param car Vehicle
---@param lights bool
function setCarLightsOn(car, lights) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getUserOfClosestMapAttractor">Open the wiki</a></b>
---
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radius float
---@param modelId Model
---@param externalScriptNamed string
---@return Ped ped
function getUserOfClosestMapAttractor(sphereX, sphereY, sphereZ, radius, modelId, externalScriptNamed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchRoadsBackToOriginal">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function switchRoadsBackToOriginal(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchPedRoadsBackToOriginal">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function switchPedRoadsBackToOriginal(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPlaneUndercarriagePosition">Open the wiki</a></b>
---
---@param plane int
---@return int landingGearStatus
function getPlaneUndercarriagePosition(plane) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraSetVectorTrack">Open the wiki</a></b>
---
---@param pointX float
---@param pointY float
---@param pointZ float
---@param transverseX float
---@param transverseY float
---@param transverseZ float
---@param time int
---@param smooth bool
function cameraSetVectorTrack(pointX, pointY, pointZ, transverseX, transverseY, transverseZ, time, smooth) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraSetLerpFov">Open the wiki</a></b>
---
---@param from float
---@param to float
---@param timelimit int
---@param smoothTransition bool
function cameraSetLerpFov(from, to, timelimit, smoothTransition) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchAmbientPlanes">Open the wiki</a></b>
---
---@param enable bool
function switchAmbientPlanes(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setDarknessEffect">Open the wiki</a></b>
---
---@param enable bool
---@param value int
function setDarknessEffect(enable, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraResetNewScriptables">Open the wiki</a></b>
---
function cameraResetNewScriptables() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumberOfInstancesOfStreamedScript">Open the wiki</a></b>
---
---@param externalScript int
---@return int value
function getNumberOfInstancesOfStreamedScript(externalScript) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/allocateStreamedScriptToRandomPed">Open the wiki</a></b>
---
---@param externalScript int
---@param actorModel Model
---@param priority int
function allocateStreamedScriptToRandomPed(externalScript, actorModel, priority) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/allocateStreamedScriptToObject">Open the wiki</a></b>
---
---@param externalScript int
---@param objectModel Model
---@param priority int
---@param radius float
---@param type int
function allocateStreamedScriptToObject(externalScript, objectModel, priority, radius, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGroupMember">Open the wiki</a></b>
---
---@param group int
---@param member int
---@return int handle
function getGroupMember(group, member) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getWaterHeightAtCoords">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param ignoreWaves bool
---@return float height
function getWaterHeightAtCoords(atX, atY, ignoreWaves) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraPersistTrack">Open the wiki</a></b>
---
---@param lock bool
function cameraPersistTrack(lock) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraPersistPos">Open the wiki</a></b>
---
---@param lock bool
function cameraPersistPos(lock) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraPersistFov">Open the wiki</a></b>
---
---@param lock bool
function cameraPersistFov(lock) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraIsVectorMoveRunning">Open the wiki</a></b>
---
---@return bool result
function cameraIsVectorMoveRunning() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraIsVectorTrackRunning">Open the wiki</a></b>
---
---@return bool result
function cameraIsVectorTrackRunning() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraSetVectorMove">Open the wiki</a></b>
---
---@param cameraX float
---@param cameraY float
---@param cameraZ float
---@param positionX float
---@param positionY float
---@param positionZ float
---@param time int
---@param smoothTransition bool
function cameraSetVectorMove(cameraX, cameraY, cameraZ, positionX, positionY, positionZ, time, smoothTransition) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawWindow">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param gxtString GxtString
---@param style int
function drawWindow(cornerAX, cornerAY, cornerBX, cornerBY, gxtString, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCarToObject">Open the wiki</a></b>
---
---@param car Vehicle
---@param object Object
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
function attachCarToObject(car, object, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGarageResprayFree">Open the wiki</a></b>
---
---@param garage GxtString
---@param free bool
function setGarageResprayFree(garage, free) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharBulletproofVest">Open the wiki</a></b>
---
---@param ped Ped
---@param enable bool
function setCharBulletproofVest(ped, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCinemaCamera">Open the wiki</a></b>
---
---@param lock bool
function setCinemaCamera(lock) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharFireDamageMultiplier">Open the wiki</a></b>
---
---@param ped Ped
---@param multiplier float
function setCharFireDamageMultiplier(ped, multiplier) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupFollowStatus">Open the wiki</a></b>
---
---@param group int
---@param status bool
function setGroupFollowStatus(group, status) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSearchlightClipIfColliding">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param flag bool
function setSearchlightClipIfColliding(searchlight, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasPlayerBoughtItem">Open the wiki</a></b>
---
---@param item int
---@return bool result
function hasPlayerBoughtItem(item) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCameraInFrontOfChar">Open the wiki</a></b>
---
---@param ped Ped
function setCameraInFrontOfChar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPlayerMaxArmour">Open the wiki</a></b>
---
---@param player Player
---@return int maxArmour
function getPlayerMaxArmour(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharUsesUpperbodyDamageAnimsOnly">Open the wiki</a></b>
---
---@param ped Ped
---@param uninterupted bool
function setCharUsesUpperbodyDamageAnimsOnly(ped, uninterupted) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharSayContext">Open the wiki</a></b>
---
---@param ped Ped
---@param speech int
---@return int spokenPhrase
function setCharSayContext(ped, speech) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addExplosionVariableShake">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param type int
---@param cameraShake float
function addExplosionVariableShake(atX, atY, atZ, type, cameraShake) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachMissionAudioToChar">Open the wiki</a></b>
---
---@param id int
---@param ped Ped
function attachMissionAudioToChar(id, ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/updatePickupMoneyPerDay">Open the wiki</a></b>
---
---@param pickup Pickup
---@param cash int
function updatePickupMoneyPerDay(pickup, cash) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNameOfEntryExitCharUsed">Open the wiki</a></b>
---
---@param ped Ped
---@return GxtString interiorName
function getNameOfEntryExitCharUsed(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPositionOfEntryExitCharUsed">Open the wiki</a></b>
---
---@param ped Ped
---@return float coordX
---@return float coordY
---@return float coordZ
---@return int number
function getPositionOfEntryExitCharUsed(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharTalking">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharTalking(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/disableCharSpeech">Open the wiki</a></b>
---
---@param ped Ped
---@param disable bool
function disableCharSpeech(ped, disable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableCharSpeech">Open the wiki</a></b>
---
---@param ped Ped
function enableCharSpeech(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpSkip">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param posZ float
---@param angle float
function setUpSkip(posX, posY, posZ, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearSkip">Open the wiki</a></b>
---
function clearSkip() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/preloadBeatTrack">Open the wiki</a></b>
---
---@param soundtrack int
function preloadBeatTrack(soundtrack) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getBeatTrackStatus">Open the wiki</a></b>
---
---@return int status
function getBeatTrackStatus() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playBeatTrack">Open the wiki</a></b>
---
function playBeatTrack() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/stopBeatTrack">Open the wiki</a></b>
---
function stopBeatTrack() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findMaxNumberOfGroupMembers">Open the wiki</a></b>
---
---@return int max
function findMaxNumberOfGroupMembers() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/vehicleDoesProvideCover">Open the wiki</a></b>
---
---@param car Vehicle
---@param providesCover bool
function vehicleDoesProvideCover(car, providesCover) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createSnapshotPickup">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@return Pickup pickup
function createSnapshotPickup(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createHorseshoePickup">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@return Pickup pickup
function createHorseshoePickup(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createOysterPickup">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@return Pickup pickup
function createOysterPickup(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasObjectBeenUprooted">Open the wiki</a></b>
---
---@param object Object
---@return bool result
function hasObjectBeenUprooted(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addSmokeParticle">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param velocityX float
---@param velocityY float
---@param velocityZ float
---@param r int
---@param g int
---@param b int
---@param a int
---@param size float
---@param factor float
function addSmokeParticle(atX, atY, atZ, velocityX, velocityY, velocityZ, r, g, b, a, size, factor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStuckUnderCar">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharStuckUnderCar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/controlCarDoor">Open the wiki</a></b>
---
---@param car Vehicle
---@param door int
---@param unlatch int
---@param angle float
function controlCarDoor(car, door, unlatch, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDoorAngleRatio">Open the wiki</a></b>
---
---@param car Vehicle
---@param door int
---@return float angle
function getDoorAngleRatio(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerDisplayVitalStatsButton">Open the wiki</a></b>
---
---@param player Player
---@param display bool
function setPlayerDisplayVitalStatsButton(player, display) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharKeepTask">Open the wiki</a></b>
---
---@param ped Ped
---@param keepTasks bool
function setCharKeepTask(ped, keepTasks) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createMenuGrid">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param positionX int
---@param positionY int
---@param width float
---@param columns int
---@param interactive bool
---@param background bool
---@param alignment int
---@return int id
function createMenuGrid(gxtString, positionX, positionY, width, columns, interactive, background, alignment) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharSwimming">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharSwimming(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharSwimState">Open the wiki</a></b>
---
---@param ped Ped
---@return int status
function getCharSwimState(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startCharFacialTalk">Open the wiki</a></b>
---
---@param ped Ped
---@param time int
function startCharFacialTalk(ped, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/stopCharFacialTalk">Open the wiki</a></b>
---
---@param ped Ped
function stopCharFacialTalk(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isBigVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isBigVehicle(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchPoliceHelis">Open the wiki</a></b>
---
---@param enable bool
function switchPoliceHelis(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/storeCarModState">Open the wiki</a></b>
---
function storeCarModState() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/restoreCarModState">Open the wiki</a></b>
---
function restoreCarModState() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentCarMod">Open the wiki</a></b>
---
---@param car Vehicle
---@param slot int
---@return Model modelId
function getCurrentCarMod(car, slot) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarLowRider">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarLowRider(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarStreetRacer">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarStreetRacer(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceDeathRestart">Open the wiki</a></b>
---
function forceDeathRestart() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/syncWater">Open the wiki</a></b>
---
function syncWater() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCoordinatesNoOffset">Open the wiki</a></b>
---
---@param ped Ped
---@param atX float
---@param atY float
---@param atZ float
function setCharCoordinatesNoOffset(ped, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesScriptFireExist">Open the wiki</a></b>
---
---@param fire int
---@return bool result
function doesScriptFireExist(fire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/resetStuffUponResurrection">Open the wiki</a></b>
---
function resetStuffUponResurrection() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isEmergencyServicesVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isEmergencyServicesVehicle(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/killFxSystemNow">Open the wiki</a></b>
---
---@param particle Particle
function killFxSystemNow(particle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectWithinBrainActivationRange">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isObjectWithinBrainActivationRange(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/copySharedCharDecisionMaker">Open the wiki</a></b>
---
---@param from int
---@return int to
function copySharedCharDecisionMaker(from) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtPosition">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param event int
function reportMissionAudioEventAtPosition(atX, atY, atZ, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtObject">Open the wiki</a></b>
---
---@param at int
---@param event int
function reportMissionAudioEventAtObject(at, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachMissionAudioToObject">Open the wiki</a></b>
---
---@param id int
---@param object Object
function attachMissionAudioToObject(id, object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumCarColours">Open the wiki</a></b>
---
---@param car Vehicle
---@return int colours
function getNumCarColours(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/extinguishFireAtPoint">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
function extinguishFireAtPoint(atX, atY, atZ, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasTrainDerailed">Open the wiki</a></b>
---
---@param train Vehicle
---@return bool result
function hasTrainDerailed(train) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharForceDieInCar">Open the wiki</a></b>
---
---@param ped Ped
---@param stayInCarWhenDead bool
function setCharForceDieInCar(ped, stayInCarWhenDead) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setOnlyCreateGangMembers">Open the wiki</a></b>
---
---@param enable bool
function setOnlyCreateGangMembers(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectModel">Open the wiki</a></b>
---
---@param object Object
---@return Model modelId
function getObjectModel(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharUsesCollisionClosestObjectOfType">Open the wiki</a></b>
---
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radius float
---@param modelId Model
---@param solid bool
---@param forActor int
function setCharUsesCollisionClosestObjectOfType(sphereX, sphereY, sphereZ, radius, modelId, solid, forActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearAllScriptFireFlags">Open the wiki</a></b>
---
function clearAllScriptFireFlags() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarBlockingCar">Open the wiki</a></b>
---
---@param car Vehicle
---@return int blockingCar
function getCarBlockingCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentVehiclePaintjob">Open the wiki</a></b>
---
---@param car Vehicle
---@return int paintjob
function getCurrentVehiclePaintjob(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHelpMessageBoxSize">Open the wiki</a></b>
---
---@param width int
function setHelpMessageBoxSize(width) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGunshotSenseRangeForRiot2">Open the wiki</a></b>
---
---@param range float
function setGunshotSenseRangeForRiot2(range) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarMovingComponentOffset">Open the wiki</a></b>
---
---@param car Vehicle
---@return float angle
function getCarMovingComponentOffset(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setNamedEntryExitFlag">Open the wiki</a></b>
---
---@param interior GxtString
---@param bitmask int
---@param flag bool
function setNamedEntryExitFlag(interior, bitmask, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pauseCurrentBeatTrack">Open the wiki</a></b>
---
---@param paused bool
function pauseCurrentBeatTrack(paused) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerWeaponsScrollable">Open the wiki</a></b>
---
---@param player Player
---@param scrollable bool
function setPlayerWeaponsScrollable(player, scrollable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markRoadNodeAsDontWander">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
function markRoadNodeAsDontWander(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/unmarkAllRoadNodesAsDontWander">Open the wiki</a></b>
---
function unmarkAllRoadNodesAsDontWander() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCheckpointHeading">Open the wiki</a></b>
---
---@param checkpoint Checkpoint
---@param angle float
function setCheckpointHeading(checkpoint, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMissionRespectTotal">Open the wiki</a></b>
---
---@param respect int
function setMissionRespectTotal(respect) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/awardPlayerMissionRespect">Open the wiki</a></b>
---
---@param respect int
function awardPlayerMissionRespect(respect) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCollision">Open the wiki</a></b>
---
---@param car Vehicle
---@param collision bool
function setCarCollision(car, collision) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changePlaybackToUseAi">Open the wiki</a></b>
---
---@param car Vehicle
function changePlaybackToUseAi(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraSetShakeSimulationSimple">Open the wiki</a></b>
---
---@param type int
---@param timelimit float
---@param intensity float
function cameraSetShakeSimulationSimple(type, timelimit, intensity) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isNightVisionActive">Open the wiki</a></b>
---
---@return bool result
function isNightVisionActive() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCreateRandomCops">Open the wiki</a></b>
---
---@param enable bool
function setCreateRandomCops(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSetIgnoreWeaponRangeFlag">Open the wiki</a></b>
---
---@param ped Ped
---@param ignore bool
function taskSetIgnoreWeaponRangeFlag(ped, ignore) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPickUpSecondObject">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param bone int
---@param int7 int
---@param animation string
---@param file string
---@param time int
function taskPickUpSecondObject(ped, object, offsetX, offsetY, offsetZ, bone, int7, animation, file, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dropSecondObject">Open the wiki</a></b>
---
---@param ped Ped
---@param to bool
function dropSecondObject(ped, to) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeObjectElegantly">Open the wiki</a></b>
---
---@param object Object
function removeObjectElegantly(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawCrosshair">Open the wiki</a></b>
---
---@param draw bool
function drawCrosshair(draw) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpConversationNodeWithSpeech">Open the wiki</a></b>
---
---@param question GxtString
---@param answerY GxtString
---@param answerN GxtString
---@param questionWav int
---@param answerYWav int
---@param answerNWav int
function setUpConversationNodeWithSpeech(question, answerY, answerN, questionWav, answerYWav, answerNWav) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/showBlipsOnAllLevels">Open the wiki</a></b>
---
---@param enable bool
function showBlipsOnAllLevels(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharDruggedUp">Open the wiki</a></b>
---
---@param ped Ped
---@param druggedUp bool
function setCharDruggedUp(ped, druggedUp) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharHeadMissing">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharHeadMissing(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getHashKey">Open the wiki</a></b>
---
---@param string string
---@return int CRC32
function getHashKey(string) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpConversationEndNodeWithSpeech">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param speech int
function setUpConversationEndNodeWithSpeech(gxtString, speech) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/randomPassengerSay">Open the wiki</a></b>
---
---@param passengers int
---@param audioTable int
function randomPassengerSay(passengers, audioTable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hideAllFrontendBlips">Open the wiki</a></b>
---
---@param hide bool
function hideAllFrontendBlips(hide) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerInCarCameraMode">Open the wiki</a></b>
---
---@param mode int
function setPlayerInCarCameraMode(mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyTrain">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharInAnyTrain(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpSkipAfterMission">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param posZ float
---@param angle float
function setUpSkipAfterMission(posX, posY, posZ, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleIsConsideredByPlayer">Open the wiki</a></b>
---
---@param car Vehicle
---@param accessible bool
function setVehicleIsConsideredByPlayer(car, accessible) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCarModelInMemory">Open the wiki</a></b>
---
---@param unk bool
---@return Model modelId
---@return int class
function getRandomCarModelInMemory(unk) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarDoorLockStatus">Open the wiki</a></b>
---
---@param car Vehicle
---@return int doorStatus
function getCarDoorLockStatus(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setClosestEntryExitFlag">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param radius float
---@param bitmask int
---@param flag bool
function setClosestEntryExitFlag(atX, atY, radius, bitmask, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharSignalAfterKill">Open the wiki</a></b>
---
---@param ped Ped
---@param signal bool
function setCharSignalAfterKill(ped, signal) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharWantedByPolice">Open the wiki</a></b>
---
---@param ped Ped
---@param wanted bool
function setCharWantedByPolice(ped, wanted) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setZoneNoCops">Open the wiki</a></b>
---
---@param zone GxtString
---@param disableCops bool
function setZoneNoCops(zone, disableCops) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlood">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param density int
---@param onActor int
function addBlood(atX, atY, atZ, offsetX, offsetY, offsetZ, density, onActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayCarNames">Open the wiki</a></b>
---
---@param show bool
function displayCarNames(show) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayZoneNames">Open the wiki</a></b>
---
---@param show bool
function displayZoneNames(show) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarDoorDamaged">Open the wiki</a></b>
---
---@param car Vehicle
---@param door int
---@return bool result
function isCarDoorDamaged(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCoordinatesDontWarpGangNoOffset">Open the wiki</a></b>
---
---@param ped Ped
---@param atX float
---@param atY float
---@param atZ float
function setCharCoordinatesDontWarpGangNoOffset(ped, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMinigameInProgress">Open the wiki</a></b>
---
---@param enable bool
function setMinigameInProgress(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isMinigameInProgress">Open the wiki</a></b>
---
---@return bool result
function isMinigameInProgress() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setForceRandomCarModel">Open the wiki</a></b>
---
---@param modelId Model
function setForceRandomCarModel(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInAngledAreaNoSave">Open the wiki</a></b>
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param angle float
---@param int6 int
---@return Vehicle car
function getRandomCarOfTypeInAngledAreaNoSave(x1, y1, x2, y2, angle, int6) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addNextMessageToPreviousBriefs">Open the wiki</a></b>
---
---@param int1 bool
function addNextMessageToPreviousBriefs(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/failKillFrenzy">Open the wiki</a></b>
---
function failKillFrenzy() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCopVehicleInArea3dNoSave">Open the wiki</a></b>
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
---@return bool result
function isCopVehicleInArea3dNoSave(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPetrolTankWeakpoint">Open the wiki</a></b>
---
---@param car Vehicle
---@param enabled bool
function setPetrolTankWeakpoint(car, enabled) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharUsingMapAttractor">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharUsingMapAttractor(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerModel">Open the wiki</a></b>
---
---@param player Player
---@param modelId Model
function setPlayerModel(player, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/areSubtitlesSwitchedOn">Open the wiki</a></b>
---
---@return bool result
function areSubtitlesSwitchedOn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeCharFromCarMaintainPosition">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
function removeCharFromCarMaintainPosition(ped, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectProofs">Open the wiki</a></b>
---
---@param object Object
---@param BP bool
---@param FP bool
---@param EP bool
---@param CP bool
---@param MP bool
function setObjectProofs(object, BP, FP, EP, CP, MP) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarTouchingCar">Open the wiki</a></b>
---
---@param car1 Vehicle
---@param car2 Vehicle
---@return bool result
function isCarTouchingCar(car1, car2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesObjectHaveThisModel">Open the wiki</a></b>
---
---@param object Object
---@param modelId Model
---@return bool result
function doesObjectHaveThisModel(object, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTrainForcedToSlowDown">Open the wiki</a></b>
---
---@param train Vehicle
---@param forced bool
function setTrainForcedToSlowDown(train, forced) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isVehicleOnAllWheels">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isVehicleOnAllWheels(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesPickupExist">Open the wiki</a></b>
---
---@param pickup Pickup
---@return bool result
function doesPickupExist(pickup) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableAmbientCrime">Open the wiki</a></b>
---
---@param enable bool
function enableAmbientCrime(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearWantedLevelInGarage">Open the wiki</a></b>
---
function clearWantedLevelInGarage() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharSayContextImportant">Open the wiki</a></b>
---
---@param ped Ped
---@param soundslot int
---@param flags1 bool
---@param flags2 bool
---@param flags3 bool
---@return int unk
function setCharSayContextImportant(ped, soundslot, flags1, flags2, flags3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharSayScript">Open the wiki</a></b>
---
---@param ped Ped
---@param sound int
---@param flags1 bool
---@param flags2 bool
---@param flags3 bool
function setCharSayScript(ped, sound, flags1, flags2, flags3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceInteriorLightingForPlayer">Open the wiki</a></b>
---
---@param player Player
---@param force bool
function forceInteriorLightingForPlayer(player, force) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/useDetonator">Open the wiki</a></b>
---
function useDetonator() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isMoneyPickupAtCoords">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@return bool result
function isMoneyPickupAtCoords(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMenuColumnWidth">Open the wiki</a></b>
---
---@param panel int
---@param column int
---@param width int
function setMenuColumnWidth(panel, column, width) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/makeRoomInPlayerGangForMissionPeds">Open the wiki</a></b>
---
---@param group int
function makeRoomInPlayerGangForMissionPeds(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharGettingInToACar">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharGettingInToACar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpSkipForSpecificVehicle">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param posZ float
---@param angle float
---@param car Vehicle
function setUpSkipForSpecificVehicle(posX, posY, posZ, angle, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarModelValue">Open the wiki</a></b>
---
---@param modelId Model
---@return int price
function getCarModelValue(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCarGeneratorWithPlate">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param angle float
---@param modelId Model
---@param color1 int
---@param color2 int
---@param forceSpawn bool
---@param alarm int
---@param doorLock int
---@param minDelay int
---@param maxDelay int
---@param plate string
---@return int generator
function createCarGeneratorWithPlate(atX, atY, atZ, angle, modelId, color1, color2, forceSpawn, alarm, doorLock, minDelay, maxDelay, plate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findTrainDirection">Open the wiki</a></b>
---
---@param train Vehicle
---@return bool result
function findTrainDirection(train) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAircraftCarrierSamSite">Open the wiki</a></b>
---
---@param enable bool
function setAircraftCarrierSamSite(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawLightWithRange">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param r int
---@param g int
---@param b int
---@param radius float
function drawLightWithRange(atX, atY, atZ, r, g, b, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableBurglaryHouses">Open the wiki</a></b>
---
---@param enable bool
function enableBurglaryHouses(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerControlOn">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isPlayerControlOn(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharActiveInterior">Open the wiki</a></b>
---
---@param ped Ped
---@return int interior
function getCharActiveInterior(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/giveNonPlayerCarNitro">Open the wiki</a></b>
---
---@param car Vehicle
function giveNonPlayerCarNitro(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playerTakeOffGoggles">Open the wiki</a></b>
---
---@param player Player
---@param useAnim bool
function playerTakeOffGoggles(player, useAnim) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/allowFixedCameraCollision">Open the wiki</a></b>
---
---@param allow bool
function allowFixedCameraCollision(allow) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharSpottedCharInFront">Open the wiki</a></b>
---
---@param ped Ped
---@param ped2 Ped
---@return bool result
function hasCharSpottedCharInFront(ped, ped2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceBigMessageAndCounter">Open the wiki</a></b>
---
---@param stayOnScreen bool
function forceBigMessageAndCounter(stayOnScreen) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleCameraTweak">Open the wiki</a></b>
---
---@param carModel Model
---@param distance float
---@param altitudeMultiplier float
---@param angleX float
function setVehicleCameraTweak(carModel, distance, altitudeMultiplier, angleX) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/resetVehicleCameraTweak">Open the wiki</a></b>
---
function resetVehicleCameraTweak() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtChar">Open the wiki</a></b>
---
---@param ped Ped
---@param event int
function reportMissionAudioEventAtChar(ped, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesDecisionMakerExist">Open the wiki</a></b>
---
---@param maker int
---@return bool result
function doesDecisionMakerExist(maker) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/ignoreHeightDifferenceFollowingNodes">Open the wiki</a></b>
---
---@param ped Ped
---@param ignore bool
function ignoreHeightDifferenceFollowingNodes(ped, ignore) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shutAllCharsUp">Open the wiki</a></b>
---
---@param enable bool
function shutAllCharsUp(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharGetOutUpsideDownCar">Open the wiki</a></b>
---
---@param ped Ped
---@param canGetOut bool
function setCharGetOutUpsideDownCar(ped, canGetOut) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param event int
function reportMissionAudioEventAtCar(car, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doWeaponStuffAtStartOf2pGame">Open the wiki</a></b>
---
function doWeaponStuffAtStartOf2pGame() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasGameJustReturnedFromFrontend">Open the wiki</a></b>
---
---@return bool result
function hasGameJustReturnedFromFrontend() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentLanguage">Open the wiki</a></b>
---
---@return int language
function getCurrentLanguage() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectIntersectingWorld">Open the wiki</a></b>
---
---@param object Object
---@return bool result
function isObjectIntersectingWorld(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getStringWidth">Open the wiki</a></b>
---
---@param gxtString GxtString
---@return int width
function getStringWidth(gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/resetVehicleHydraulics">Open the wiki</a></b>
---
---@param car Vehicle
function resetVehicleHydraulics(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRespawnPointForDurationOfMission">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param posZ float
function setRespawnPointForDurationOfMission(posX, posY, posZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isThisModelACar">Open the wiki</a></b>
---
---@param modelId Model
---@return bool result
function isThisModelACar(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchOnGroundSearchlight">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param lightsThroughObstacles bool
function switchOnGroundSearchlight(searchlight, lightsThroughObstacles) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGangWarFightingGoingOn">Open the wiki</a></b>
---
---@return bool result
function isGangWarFightingGoingOn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isNextStationAllowed">Open the wiki</a></b>
---
---@param train Vehicle
---@return bool result
function isNextStationAllowed(train) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/skipToNextAllowedStation">Open the wiki</a></b>
---
---@param train Vehicle
function skipToNextAllowedStation(train) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getStringWidthWithNumber">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param number int
---@return int width
function getStringWidthWithNumber(gxtString, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shutCharUpForScriptedSpeech">Open the wiki</a></b>
---
---@param ped Ped
---@param muted bool
function shutCharUpForScriptedSpeech(ped, muted) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableDisabledAttractorsOnObject">Open the wiki</a></b>
---
---@param object Object
---@param enable bool
function enableDisabledAttractorsOnObject(object, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadSceneInDirection">Open the wiki</a></b>
---
---@param coordX float
---@param coordY float
---@param coordZ float
---@param angle float
function loadSceneInDirection(coordX, coordY, coordZ, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerUsingJetpack">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isPlayerUsingJetpack(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearThisPrintBigNow">Open the wiki</a></b>
---
---@param style int
function clearThisPrintBigNow(style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasLanguageChanged">Open the wiki</a></b>
---
---@return bool result
function hasLanguageChanged() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/incrementIntStatNoMessage">Open the wiki</a></b>
---
---@param stat int
---@param value int
function incrementIntStatNoMessage(stat, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setExtraCarColours">Open the wiki</a></b>
---
---@param car Vehicle
---@param tertiaryColor int
---@param quaternaryColor int
function setExtraCarColours(car, tertiaryColor, quaternaryColor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getExtraCarColours">Open the wiki</a></b>
---
---@param car Vehicle
---@return int tertiaryColor
---@return int quaternaryColor
function getExtraCarColours(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/manageAllPopulation">Open the wiki</a></b>
---
function manageAllPopulation() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setNoResprays">Open the wiki</a></b>
---
---@param enable bool
function setNoResprays(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCarBeenResprayed">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function hasCarBeenResprayed(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachMissionAudioToCar">Open the wiki</a></b>
---
---@param audioId int
---@param car Vehicle
function attachMissionAudioToCar(audioId, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHasBeenOwnedForCarGenerator">Open the wiki</a></b>
---
---@param generator int
---@param owned bool
function setHasBeenOwnedForCarGenerator(generator, owned) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpConversationNodeWithScriptedSpeech">Open the wiki</a></b>
---
---@param questionGXT GxtString
---@param answerYesGXT GxtString
---@param answerNoGXT GxtString
---@param questionWAV int
---@param answerYesWAV int
---@param answerNoWAV int
function setUpConversationNodeWithScriptedSpeech(questionGXT, answerYesGXT, answerNoGXT, questionWAV, answerYesWAV, answerNoWAV) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAreaName">Open the wiki</a></b>
---
---@param gxtString GxtString
function setAreaName(gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPlayAnimSecondary">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@param IFP string
---@param framedelta float
---@param loopA bool
---@param lockX bool
---@param lockY bool
---@param lockF bool
---@param time int
function taskPlayAnimSecondary(ped, animation, IFP, framedelta, loopA, lockX, lockY, lockF, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharTouchingChar">Open the wiki</a></b>
---
---@param ped Ped
---@param ped2 Ped
---@return bool result
function isCharTouchingChar(ped, ped2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/disableHeliAudio">Open the wiki</a></b>
---
---@param helicopter Vehicle
---@param disable bool
function disableHeliAudio(helicopter, disable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskHandGesture">Open the wiki</a></b>
---
---@param ped Ped
---@param ped2 Ped
function taskHandGesture(ped, ped2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/takePhoto">Open the wiki</a></b>
---
---@param unk bool
function takePhoto(unk) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/incrementFloatStatNoMessage">Open the wiki</a></b>
---
---@param stat int
---@param value float
function incrementFloatStatNoMessage(stat, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerGroupToFollowAlways">Open the wiki</a></b>
---
---@param player Player
---@param followAlways bool
function setPlayerGroupToFollowAlways(player, followAlways) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/improveCarByCheating">Open the wiki</a></b>
---
---@param car Vehicle
---@param affectedByCheats bool
function improveCarByCheating(car, affectedByCheats) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeCarColourFromMenu">Open the wiki</a></b>
---
---@param panelID int
---@param car Vehicle
---@param colorslot int
---@param activeRow int
function changeCarColourFromMenu(panelID, car, colorslot, activeRow) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/highlightMenuItem">Open the wiki</a></b>
---
---@param panel int
---@param row int
---@param highlight bool
function highlightMenuItem(panel, row, highlight) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setDisableMilitaryZones">Open the wiki</a></b>
---
---@param disable bool
function setDisableMilitaryZones(disable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCameraPositionUnfixed">Open the wiki</a></b>
---
---@param xAngle float
---@param zAngle float
function setCameraPositionUnfixed(xAngle, zAngle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRadioToPlayersFavouriteStation">Open the wiki</a></b>
---
function setRadioToPlayersFavouriteStation() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setDeathWeaponsPersist">Open the wiki</a></b>
---
---@param ped Ped
---@param persist bool
function setDeathWeaponsPersist(ped, persist) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharSwimSpeed">Open the wiki</a></b>
---
---@param ped Ped
---@param speed float
function setCharSwimSpeed(ped, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerClimbing">Open the wiki</a></b>
---
---@param player Player
---@return bool result
function isPlayerClimbing(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isThisHelpMessageBeingDisplayed">Open the wiki</a></b>
---
---@param gxtString GxtString
---@return bool result
function isThisHelpMessageBeingDisplayed(gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isWidescreenOnInOptions">Open the wiki</a></b>
---
---@return bool result
function isWidescreenOnInOptions() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawSubtitlesBeforeFade">Open the wiki</a></b>
---
---@param flag bool
function drawSubtitlesBeforeFade(flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawOddjobTitleBeforeFade">Open the wiki</a></b>
---
---@param flag bool
function drawOddjobTitleBeforeFade(flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFollowPathNodesToCoordWithRadius">Open the wiki</a></b>
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
---@param mode int
---@param time int
---@param stopRadius float
function taskFollowPathNodesToCoordWithRadius(ped, toX, toY, toZ, mode, time, stopRadius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPhotoCameraEffect">Open the wiki</a></b>
---
---@param firstPersonView bool
function setPhotoCameraEffect(firstPersonView) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fixCar">Open the wiki</a></b>
---
---@param car Vehicle
function fixCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerGroupToFollowNever">Open the wiki</a></b>
---
---@param player Player
---@param neverFollow bool
function setPlayerGroupToFollowNever(player, neverFollow) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharAttachedToAnyCar">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
function isCharAttachedToAnyCar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/storeCarCharIsAttachedToNoSave">Open the wiki</a></b>
---
---@param car Vehicle
---@return Ped ped
function storeCarCharIsAttachedToNoSave(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpSkipForVehicleFinishedByScript">Open the wiki</a></b>
---
---@param posX float
---@param posY float
---@param posZ float
---@param angle float
---@param car Vehicle
function setUpSkipForVehicleFinishedByScript(posX, posY, posZ, angle, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSkipWaitingForScriptToFadeIn">Open the wiki</a></b>
---
---@return bool result
function isSkipWaitingForScriptToFadeIn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceAllVehicleLightsOff">Open the wiki</a></b>
---
---@param off bool
function forceAllVehicleLightsOff(off) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPlayerInCarCameraMode">Open the wiki</a></b>
---
---@return int mode
function getPlayerInCarCameraMode() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isLastBuildingModelShotByPlayer">Open the wiki</a></b>
---
---@param player Player
---@param modelId Model
---@return bool result
function isLastBuildingModelShotByPlayer(player, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearLastBuildingModelShotByPlayer">Open the wiki</a></b>
---
---@param player Player
function clearLastBuildingModelShotByPlayer(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpConversationEndNodeWithScriptedSpeech">Open the wiki</a></b>
---
---@param dialogueGxt GxtString
---@param wav int
function setUpConversationEndNodeWithScriptedSpeech(dialogueGxt, wav) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/activatePimpCheat">Open the wiki</a></b>
---
---@param enable bool
function activatePimpCheat(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCharInAreaOffsetNoSave">Open the wiki</a></b>
---
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radiusX float
---@param radiusY float
---@param radiusZ float
---@return Ped ped
function getRandomCharInAreaOffsetNoSave(sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setScriptCoopGame">Open the wiki</a></b>
---
---@param enable bool
function setScriptCoopGame(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createUser3dMarker">Open the wiki</a></b>
---
---@param atX float
---@param atY float
---@param atZ float
---@param color int
---@return Marker marker
function createUser3dMarker(atX, atY, atZ, color) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeUser3dMarker">Open the wiki</a></b>
---
---@param marker Marker
function removeUser3dMarker(marker) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRidOfPlayerProstitute">Open the wiki</a></b>
---
function getRidOfPlayerProstitute() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayNonMinigameHelpMessages">Open the wiki</a></b>
---
---@param display bool
function displayNonMinigameHelpMessages(display) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRailtrackResistanceMult">Open the wiki</a></b>
---
---@param tracksFriction float
function setRailtrackResistanceMult(tracksFriction) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchObjectBrains">Open the wiki</a></b>
---
---@param externalScript int
---@param canBeStreamedIn bool
function switchObjectBrains(externalScript, canBeStreamedIn) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/finishSettingUpConversationNoSubtitles">Open the wiki</a></b>
---
function finishSettingUpConversationNoSubtitles() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/allowPauseInWidescreen">Open the wiki</a></b>
---
---@param enable bool
function allowPauseInWidescreen(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPcMouseMovement">Open the wiki</a></b>
---
---@return float x
---@return float y
function getPcMouseMovement() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPcUsingJoypad">Open the wiki</a></b>
---
---@return bool result
function isPcUsingJoypad() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isMouseUsingVerticalInversion">Open the wiki</a></b>
---
---@return bool result
function isMouseUsingVerticalInversion() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startNewCustomScript">Open the wiki</a></b>
---
---@param filepath zstring
---@param args table
---@return bool result
function startNewCustomScript(filepath, args) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/launchCustomMission">Open the wiki</a></b>
---
---@param filepath zstring
---@param args table
function launchCustomMission(filepath, args) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getScmThreadStructNamed">Open the wiki</a></b>
---
---@param thread GxtString
---@return int handle
function getScmThreadStructNamed(thread) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCleoSharedVar">Open the wiki</a></b>
---
---@param var int
---@param value int
function setCleoSharedVar(var, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCleoSharedVar">Open the wiki</a></b>
---
---@param var int
---@return int value
function getCleoSharedVar(var) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSpawnPlayer">Open the wiki</a></b>
---
function sampSpawnPlayer() end

---
--- ���������� ����� samp.dll  
--- �� �� �����, ��� � `getModuleHandle("samp.dll")`  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetBase">Open the wiki</a></b>  
---
---@return uint handle �����
function sampGetBase() end

--- 
--- ��������� � ���� ���� SA:MP ��������� ��������� �����  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampAddChatMessage">Open the wiki</a></b>  
---
---@param text zstring ����� ���������
---@param color uint ����
function sampAddChatMessage(text, color) end

---
--- ���������� �� ������ ��������� ��������� ��� �������, ���� ��������� ���������� � ������� '/'  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendChat">Open the wiki</a></b>  
---
---@param text zstring ����� ���������
function sampSendChat(text) end

---
--- ��������� ������������� �������� SA:MP  
--- ���� ������� ������� `false`, �� ������������� ����� �������, ������������ �� `samp` ������� ������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampAvailable">Open the wiki</a></b>  
---
---@return bool result ������
function isSampAvailable() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampRequestClass">Open the wiki</a></b>
---
---@param class int
function sampRequestClass(class) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendScmEvent">Open the wiki</a></b>
---
---@param event int
---@param id int
---@param param1 int
---@param param2 int
function sampSendScmEvent(event, id, param1, param2) end

---
--- ������������� ����������� �������� ���������� ������  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetSpecialAction">Open the wiki</a></b>  
---
---@param action int ����������� ��������. ��������� ��. <a href="�����">https://sampwiki.blast.hk/wiki/SpecialActions</a>
function sampSetSpecialAction(action) end

---
--- ������� ������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendDeathByPlayer">Open the wiki</a></b>  
---
---@param playerId int ID ������
---@param reason int ������� ������
function sampSendDeathByPlayer(playerId, reason) end

---
--- �������� ����� �/� �� ��� ���. ���� ���������� ��� � ���� ������, �� ���������� false.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCarHandleBySampVehicleId">Open the wiki</a></b>  
---
---@param id int ID �/c
---@return bool result ���������
---@return Vehicle car ����� �/c
function sampGetCarHandleBySampVehicleId(id) end

---
--- �������� ����� ������ �� ��� ���.
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCharHandleBySampPlayerId">Open the wiki</a></b>  
---
---@param id int ID ������
---@return bool result ���������
---@return Ped ped ����� ������
function sampGetCharHandleBySampPlayerId(id) end

---
--- ��������� ������ �� ����� ����.
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsChatInputActive">Open the wiki</a></b>  
---
---@return bool result ��������� ��������
function sampIsChatInputActive() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetSendrate">Open the wiki</a></b>
---
---@param type int
---@param rate int
function sampSetSendrate(type, rate) end

---
--- ��������� ��������� �� ����� � �������.
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsPlayerConnected">Open the wiki</a></b>  
---
---@param id int ID ������
---@return bool result ��������� ����������
function sampIsPlayerConnected(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerStructPtr">Open the wiki</a></b>
---
---@param id int
---@return uint structPtr
function sampGetPlayerStructPtr(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerHealth">Open the wiki</a></b>
---
---@param id int
---@return int health
function sampGetPlayerHealth(id) end

---
--- �������� ������� �������� ������.
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerArmor">Open the wiki</a></b>  
---
---@param id int �� ������.
---@return int armor ������� ��������.
function sampGetPlayerArmor(id) end

---@alias GameState
---| 0 # GAMESTATE_NONE (������)
---| 1 # GAMESTATE_WAIT_CONNECT (��������� �������� � ��������)
---| 2 # GAMESTATE_AWAIT_JOIN (���������� ������������, �����������)
---| 3 # GAMESTATE_CONNECTED (���������� � �������)
---| 4 # GAMESTATE_RESTARTING (������ ���������������)
---| 5 # GAMESTATE_DISCONNECTED (������ ������ ����������)

---
--- ������������� ������ ����������� � �������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetGamestate">Open the wiki</a></b>  
---
---@param gamestate GameState ������
function sampSetGamestate(gamestate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampDisconnectWithReason">Open the wiki</a></b>
---
---@param timeout bool
function sampDisconnectWithReason(timeout) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetLocalPlayerName">Open the wiki</a></b>
---
---@param name zstring
function sampSetLocalPlayerName(name) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerPing">Open the wiki</a></b>
---
---@param id int
---@return int ping
function sampGetPlayerPing(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerIdByCharHandle">Open the wiki</a></b>
---
---@param ped Ped
---@return bool result
---@return int id
function sampGetPlayerIdByCharHandle(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetVehicleIdByCarHandle">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
---@return int id
function sampGetVehicleIdByCarHandle(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetStreamedOutPlayerPos">Open the wiki</a></b>
---
---@param id int
---@return bool result
---@return float posX
---@return float posY
---@return float posZ
function sampGetStreamedOutPlayerPos(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendEnterVehicle">Open the wiki</a></b>
---
---@param id int
---@param passenger bool
function sampSendEnterVehicle(id, passenger) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendExitVehicle">Open the wiki</a></b>
---
---@param id int
function sampSendExitVehicle(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendSpawn">Open the wiki</a></b>
---
function sampSendSpawn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendDamageVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@param panel int
---@param doors int
---@param lights int
---@param tires int
function sampSendDamageVehicle(car, panel, doors, lights, tires) end

---
--- ������������ ����� ������� ���� SA:MP � ������������ ������ �� ������������ ���������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampRegisterChatCommand">Open the wiki</a></b>  
---
---@param cmd zstring ������� ��� ������� '/'
---@param func fun(argument: string) �������-����������
---@return bool result ��������� ����������
function sampRegisterChatCommand(cmd, func) end

---
--- �������� ��� ������ �� ��� ID.
---
--- ### ������ �������������  
---
--- ```lua
---   script_name("Example script")
---   
---   function main()
---     while not isSampAvailable() do wait(100) end
---     while true do
---     wait(0)
---     local result, target = getCharPlayerIsTargeting(playerHandle)
---     if result then result, playerid = sampGetPlayerIdByCharHandle(target) end
---       if result and isKeyDown(VK_1) then
---         name = sampGetPlayerNickname(playerid)
---         print(name)
---       end
---     end
---   end
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerNickname">Open the wiki</a></b>
---
---@param id int ID ������
---@return zstring name ���
function sampGetPlayerNickname(id) end

---
--- �������� ���� ������ �� scoreboard'a  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerColor">Open the wiki</a></b>  
---
---@param id int �� ������.
---@return uint color ����(ARGB).
function sampGetPlayerColor(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampConnectToServer">Open the wiki</a></b>
---
---@param ip zstring
---@param port uint
function sampConnectToServer(ip, port) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentServerAddress">Open the wiki</a></b>
---
---@return zstring ip
---@return uint port
function sampGetCurrentServerAddress() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentServerName">Open the wiki</a></b>
---
---@return zstring name
function sampGetCurrentServerName() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampShowDialog">Open the wiki</a></b>
---
---@param id int
---@param caption zstring
---@param text zstring
---@param button1 zstring
---@param button2 zstring
---@param style int
function sampShowDialog(id, caption, text, button1, button2, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampHasDialogRespond">Open the wiki</a></b>
---
---@param id int
---@return bool result
---@return int button
---@return int list
---@return zstring input
function sampHasDialogRespond(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetNewBitStream">Open the wiki</a></b>
---
---@return Bitstream bs
function raknetNewBitStream() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetDeleteBitStream">Open the wiki</a></b>
---
---@param bs Bitstream
function raknetDeleteBitStream(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetResetBitStream">Open the wiki</a></b>
---
---@param bs Bitstream
function raknetResetBitStream(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBool">Open the wiki</a></b>
---
---@param bs Bitstream
---@param value bool
function raknetBitStreamWriteBool(bs, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt8">Open the wiki</a></b>
---
---@param bs Bitstream
---@param value int
function raknetBitStreamWriteInt8(bs, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt16">Open the wiki</a></b>
---
---@param bs Bitstream
---@param value int
function raknetBitStreamWriteInt16(bs, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt32">Open the wiki</a></b>
---
---@param bs Bitstream
---@param value int
function raknetBitStreamWriteInt32(bs, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteFloat">Open the wiki</a></b>
---
---@param bs Bitstream
---@param value float
function raknetBitStreamWriteFloat(bs, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBuffer">Open the wiki</a></b>
---
---@param bs Bitstream
---@param dest uint
---@param size uint
function raknetBitStreamWriteBuffer(bs, dest, size) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBitStream">Open the wiki</a></b>
---
---@param bs Bitstream
---@param bitStream Bitstream
function raknetBitStreamWriteBitStream(bs, bitStream) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteString">Open the wiki</a></b>
---
---@param bs Bitstream
---@param str string
function raknetBitStreamWriteString(bs, str) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetSendRpcEx">Open the wiki</a></b>
---
---@param rpc int
---@param bs Bitstream
---@param priority int
---@param reliability int
---@param channel int
---@param timestamp bool
function raknetSendRpcEx(rpc, bs, priority, reliability, channel, timestamp) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetSendBitStreamEx">Open the wiki</a></b>
---
---@param bs Bitstream
---@param priority int
---@param reliability int
---@param channel int
function raknetSendBitStreamEx(bs, priority, reliability, channel) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampCreate3dText">Open the wiki</a></b>
---
---@param text zstring
---@param color uint
---@param posX float
---@param posY float
---@param posZ float
---@param distance float
---@param ignoreWalls bool
---@param playerId int
---@param vehicleId int
---@return int textlabel
function sampCreate3dText(text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampDestroy3dText">Open the wiki</a></b>
---
---@param textlabel int
function sampDestroy3dText(textlabel) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIs3dTextDefined">Open the wiki</a></b>
---
---@param _3dText int
---@return bool result
function sampIs3dTextDefined(_3dText) end

---
--- ��������� �������� ������ � ��������� ������� ������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampCloseCurrentDialogWithButton">Open the wiki</a></b>  
---
---@param button int ����� ������
function sampCloseCurrentDialogWithButton(button) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogListItem">Open the wiki</a></b>
---
---@return int list
function sampGetCurrentDialogListItem() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogListItem">Open the wiki</a></b>
---
---@param list int
function sampSetCurrentDialogListItem(list) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogEditboxText">Open the wiki</a></b>
---
---@return zstring text
function sampGetCurrentDialogEditboxText() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogEditboxText">Open the wiki</a></b>
---
---@param text zstring
function sampSetCurrentDialogEditboxText(text) end

---
--- ���������, ������� �� ����� SA:MP-������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsDialogActive">Open the wiki</a></b>  
---
---@return bool result ������
function sampIsDialogActive() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogType">Open the wiki</a></b>
---
---@return int type
function sampGetCurrentDialogType() end

---
--- ���������� ID ����������(���������) ����������� ����  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogId">Open the wiki</a></b>  
---
---@return int id ID ����������� ����
function sampGetCurrentDialogId() end

---
--- ���������� ������� gamestate.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetGamestate">Open the wiki</a></b>  
---
---@return GameState gamestate ID gamestate
function sampGetGamestate() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetObjectHandleBySampId">Open the wiki</a></b>
---
---@param id int
---@return Object object
function sampGetObjectHandleBySampId(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPickupHandleBySampId">Open the wiki</a></b>
---
---@param id int
---@return Pickup pickup
function sampGetPickupHandleBySampId(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetObjectSampIdByHandle">Open the wiki</a></b>
---
---@param object Object
---@return int objectId
function sampGetObjectSampIdByHandle(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPickupSampIdByHandle">Open the wiki</a></b>
---
---@param pickup Pickup
---@return int pickupId
function sampGetPickupSampIdByHandle(pickup) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetListboxItemsCount">Open the wiki</a></b>
---
---@return int count
function sampGetListboxItemsCount() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerAnimationId">Open the wiki</a></b>
---
---@param playerId int
---@return int animid
function sampGetPlayerAnimationId(playerId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetAnimationNameAndFile">Open the wiki</a></b>
---
---@param animid int
---@return zstring file
---@return zstring name
function sampGetAnimationNameAndFile(animid) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampFindAnimationIdByNameAndFile">Open the wiki</a></b>
---
---@param name zstring
---@param file zstring
---@return int id
function sampFindAnimationIdByNameAndFile(name, file) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getScreenResolution">Open the wiki</a></b>
---
---@return int resX
---@return int resY
function getScreenResolution() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetListboxItemText">Open the wiki</a></b>
---
---@param item int
---@return zstring text
function sampGetListboxItemText(item) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsPlayerPaused">Open the wiki</a></b>
---
---@param id int
---@return bool result
function sampIsPlayerPaused(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampToggleCursor">Open the wiki</a></b>
---
---@param show bool
function sampToggleCursor(show) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsLocalPlayerSpawned">Open the wiki</a></b>
---
---@return bool result
function sampIsLocalPlayerSpawned() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerSpecialAction">Open the wiki</a></b>
---
---@param id int
---@return int action
function sampGetPlayerSpecialAction(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampUnregisterChatCommand">Open the wiki</a></b>
---
---@param cmd zstring
---@return bool result
function sampUnregisterChatCommand(cmd) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsPlayerNpc">Open the wiki</a></b>
---
---@param id int
---@return bool result
function sampIsPlayerNpc(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerScore">Open the wiki</a></b>
---
---@param id int
---@return int score
function sampGetPlayerScore(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetChatString">Open the wiki</a></b>
---
---@param id int
---@param text zstring
---@param prefix zstring
---@param color uint
---@param pcolor uint
function sampSetChatString(id, text, prefix, color, pcolor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetChatString">Open the wiki</a></b>
---
---@param id int
---@return zstring text
---@return zstring prefix
---@return uint color
---@return uint pcolor
function sampGetChatString(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetChatInputText">Open the wiki</a></b>
---
---@param text zstring
function sampSetChatInputText(text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetChatInputText">Open the wiki</a></b>
---
---@return zstring text
function sampGetChatInputText() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampfuncsLog">Open the wiki</a></b>
---
---@param msg zstring
function sampfuncsLog(msg) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetChatInputEnabled">Open the wiki</a></b>
---
---@param enabled bool
function sampSetChatInputEnabled(enabled) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetRakclientInterface">Open the wiki</a></b>
---
---@return uint rakclientPtr
function sampGetRakclientInterface() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetRakpeer">Open the wiki</a></b>
---
---@return uint rakpeer
function sampGetRakpeer() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetRakclientFuncAddressByIndex">Open the wiki</a></b>
---
---@param index int
---@return uint address
function sampGetRakclientFuncAddressByIndex(index) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetRpcCallbackByRpcId">Open the wiki</a></b>
---
---@param index int
---@return uint callbackAddress
function sampGetRpcCallbackByRpcId(index) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetRpcNodeByRpcId">Open the wiki</a></b>
---
---@param index int
---@return uint node
function sampGetRpcNodeByRpcId(index) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetSampInfoPtr">Open the wiki</a></b>
---
---@return uint sampPtr
function sampGetSampInfoPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutCreateDialog">Open the wiki</a></b>
---
---@param name zstring
---@return DxutDialog dialog
function dxutCreateDialog(name) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutPopEvent">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@return bool result
---@return int event
---@return int id
function dxutPopEvent(dialog) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutAddButton">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param text zstring
---@param posX int
---@param posY int
---@param sizeX int
---@param sizeY int
function dxutAddButton(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutAddCheckbox">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param text zstring
---@param posX int
---@param posY int
---@param sizeX int
---@param sizeY int
function dxutAddCheckbox(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetDialogPos">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param posX int
---@param posY int
---@param sizeX int
---@param sizeY int
function dxutSetDialogPos(dialog, posX, posY, sizeX, sizeY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetDialogPosAndSize">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@return int posX
---@return int posY
---@return int sizeX
---@return int sizeY
function dxutGetDialogPosAndSize(dialog) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetDialogVisible">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param visible bool
function dxutSetDialogVisible(dialog, visible) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutIsDialogVisible">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@return bool result
function dxutIsDialogVisible(dialog) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutAddEditbox">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param text zstring
---@param posX int
---@param posY int
---@param sizeX int
---@param sizeY int
function dxutAddEditbox(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetControlText">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@return zstring text
function dxutGetControlText(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetSendRpc">Open the wiki</a></b>
---
---@param rpc int
---@param bs Bitstream
function raknetSendRpc(rpc, bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetSendBitStream">Open the wiki</a></b>
---
---@param bs Bitstream
function raknetSendBitStream(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsCursorActive">Open the wiki</a></b>
---
---@return bool result
function sampIsCursorActive() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetCursorMode">Open the wiki</a></b>
---
---@param mode int
function sampSetCursorMode(mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCursorMode">Open the wiki</a></b>
---
---@return int mode
function sampGetCursorMode() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetControlVisible">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param visible bool
function dxutSetControlVisible(dialog, id, visible) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutAddStatic">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param text zstring
---@param posX int
---@param posY int
---@param sizeX int
---@param sizeY int
function dxutAddStatic(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutIsCheckboxChecked">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@return bool result
function dxutIsCheckboxChecked(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetDialogBackgroundColor">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param color uint
function dxutSetDialogBackgroundColor(dialog, color) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetControlText">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param text zstring
function dxutSetControlText(dialog, id, text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutControlIsVisible">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@return bool result
function dxutControlIsVisible(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutAddSlider">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param posX int
---@param posY int
---@param sizeX int
---@param sizeY int
---@param max int
function dxutAddSlider(dialog, id, posX, posY, sizeX, sizeY, max) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetSliderValue">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@return int value
function dxutGetSliderValue(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetSliderValue">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param value int
function dxutSetSliderValue(dialog, id, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutAddListbox">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param posX int
---@param posY int
---@param sizeX int
---@param sizeY int
function dxutAddListbox(dialog, id, posX, posY, sizeX, sizeY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutListboxInsertItem">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param element zstring
---@param data uint
---@param after int
function dxutListboxInsertItem(dialog, id, element, data, after) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetListboxSelectedItemAndCount">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@return int element
---@return int count
function dxutGetListboxSelectedItemAndCount(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutListboxDeleteItem">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param element int
function dxutListboxDeleteItem(dialog, id, element) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetListboxItemTextAndData">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param element int
---@return zstring text
---@return uint data
function dxutGetListboxItemTextAndData(dialog, id, element) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutCheckboxSetChecked">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param checked bool
function dxutCheckboxSetChecked(dialog, id, checked) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutEnableDialogCaption">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param enable bool
function dxutEnableDialogCaption(dialog, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutIsDialogCaptionEnabled">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@return bool result
function dxutIsDialogCaptionEnabled(dialog) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetDialogMinimized">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param minimized bool
function dxutSetDialogMinimized(dialog, minimized) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutIsDialogMinimized">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@return bool result
function dxutIsDialogMinimized(dialog) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutDeleteControl">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
function dxutDeleteControl(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutDeleteDialog">Open the wiki</a></b>
---
---@param dialog DxutDialog
function dxutDeleteDialog(dialog) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetFocusOnControl">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
function dxutSetFocusOnControl(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetControlSize">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param sizeX int
---@param sizeY int
function dxutSetControlSize(dialog, id, sizeX, sizeY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetControlSize">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@return int sizeX
---@return int sizeY
function dxutGetControlSize(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetControlPos">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param posX int
---@param posY int
function dxutSetControlPos(dialog, id, posX, posY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetControlPos">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@return int posX
---@return int posY
function dxutGetControlPos(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetCheckboxColor">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id int
---@param color uint
function dxutSetCheckboxColor(dialog, id, color) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutIsDialogExists">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@return bool result
function dxutIsDialogExists(dialog) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetServerSettingsPtr">Open the wiki</a></b>
---
---@return uint settingsPtr
function sampGetServerSettingsPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetSampPoolsPtr">Open the wiki</a></b>
---
---@return uint poolsPtr
function sampGetSampPoolsPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetChatInfoPtr">Open the wiki</a></b>
---
---@return uint chatPtr
function sampGetChatInfoPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetInputInfoPtr">Open the wiki</a></b>
---
---@return uint inputPtr
function sampGetInputInfoPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetDialogInfoPtr">Open the wiki</a></b>
---
---@return uint dialogPtr
function sampGetDialogInfoPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetKillInfoPtr">Open the wiki</a></b>
---
---@return uint kill
function sampGetKillInfoPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetMiscInfoPtr">Open the wiki</a></b>
---
---@return uint miscPtr
function sampGetMiscInfoPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetTextdrawPoolPtr">Open the wiki</a></b>
---
---@return uint tdpoolPtr
function sampGetTextdrawPoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetObjectPoolPtr">Open the wiki</a></b>
---
---@return int objpoolPtr
function sampGetObjectPoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetGangzonePoolPtr">Open the wiki</a></b>
---
---@return uint gzpoolPtr
function sampGetGangzonePoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetTextlabelPoolPtr">Open the wiki</a></b>
---
---@return uint tlabelpoolPtr
function sampGetTextlabelPoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerPoolPtr">Open the wiki</a></b>
---
---@return uint playerpoolPtr
function sampGetPlayerPoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetVehiclePoolPtr">Open the wiki</a></b>
---
---@return uint vehpoolPtr
function sampGetVehiclePoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPickupPoolPtr">Open the wiki</a></b>
---
---@return uint pickuppoolPtr
function sampGetPickupPoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampStorePlayerOnfootData">Open the wiki</a></b>
---
---@param id int
---@param dstBuffer uint
function sampStorePlayerOnfootData(id, dstBuffer) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampStorePlayerIncarData">Open the wiki</a></b>
---
---@param id int
---@param dstBuffer uint
function sampStorePlayerIncarData(id, dstBuffer) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampStorePlayerPassengerData">Open the wiki</a></b>
---
---@param id int
---@param dstBuffer uint
function sampStorePlayerPassengerData(id, dstBuffer) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampStorePlayerTrailerData">Open the wiki</a></b>
---
---@param id int
---@param dstBuffer uint
function sampStorePlayerTrailerData(id, dstBuffer) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampStorePlayerAimData">Open the wiki</a></b>
---
---@param id int
---@param dstBuffer uint
function sampStorePlayerAimData(id, dstBuffer) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendRconCommand">Open the wiki</a></b>
---
---@param cmd zstring
function sampSendRconCommand(cmd) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendOnfootData">Open the wiki</a></b>
---
---@param dataPtr uint
function sampSendOnfootData(dataPtr) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendIncarData">Open the wiki</a></b>
---
---@param dataPtr uint
function sampSendIncarData(dataPtr) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendPassengerData">Open the wiki</a></b>
---
---@param dataPtr uint
function sampSendPassengerData(dataPtr) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendAimData">Open the wiki</a></b>
---
---@param dataPtr uint
function sampSendAimData(dataPtr) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendBulletData">Open the wiki</a></b>
---
---@param dataPtr uint
function sampSendBulletData(dataPtr) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendTrailerData">Open the wiki</a></b>
---
---@param dataPtr uint
function sampSendTrailerData(dataPtr) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendUnoccupiedData">Open the wiki</a></b>
---
---@param dataPtr uint
function sampSendUnoccupiedData(dataPtr) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendSpectatorData">Open the wiki</a></b>
---
---@param dataPtr uint
function sampSendSpectatorData(dataPtr) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendClickPlayer">Open the wiki</a></b>
---
---@param id int
---@param source int
function sampSendClickPlayer(id, source) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendDialogResponse">Open the wiki</a></b>
---
---@param id int
---@param button int
---@param listitem int
---@param input zstring
function sampSendDialogResponse(id, button, listitem, input) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendClickTextdraw">Open the wiki</a></b>
---
---@param id int
function sampSendClickTextdraw(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendGiveDamage">Open the wiki</a></b>
---
---@param id int
---@param damage float
---@param weapon int
---@param bodypart int
function sampSendGiveDamage(id, damage, weapon, bodypart) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendTakeDamage">Open the wiki</a></b>
---
---@param id int
---@param damage float
---@param weapon int
---@param bodypart int
function sampSendTakeDamage(id, damage, weapon, bodypart) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendEditObject">Open the wiki</a></b>
---
---@param playerObject bool
---@param objectId int
---@param response int
---@param posX float
---@param posY float
---@param posZ float
---@param rotX float
---@param rotY float
---@param rotZ float
function sampSendEditObject(playerObject, objectId, response, posX, posY, posZ, rotX, rotY, rotZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendEditAttachedObject">Open the wiki</a></b>
---
---@param response int
---@param index int
---@param model int
---@param bone int
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param rotX float
---@param rotY float
---@param rotZ float
---@param scaleX float
---@param scaleY float
---@param scaleZ float
function sampSendEditAttachedObject(response, index, model, bone, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendInteriorChange">Open the wiki</a></b>
---
---@param id int
function sampSendInteriorChange(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendRequestSpawn">Open the wiki</a></b>
---
function sampSendRequestSpawn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendPickedUpPickup">Open the wiki</a></b>
---
---@param id int
function sampSendPickedUpPickup(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendMenuSelectRow">Open the wiki</a></b>
---
---@param id int
function sampSendMenuSelectRow(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendMenuQuit">Open the wiki</a></b>
---
function sampSendMenuQuit() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendVehicleDestroyed">Open the wiki</a></b>
---
---@param id int
function sampSendVehicleDestroyed(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsScoreboardOpen">Open the wiki</a></b>
---
---@return bool result
function sampIsScoreboardOpen() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampToggleScoreboard">Open the wiki</a></b>
---
---@param show bool
function sampToggleScoreboard(show) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetDialogText">Open the wiki</a></b>
---
---@return zstring text
function sampGetDialogText() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetDialogCaption">Open the wiki</a></b>
---
---@return zstring caption
function sampGetDialogCaption() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetDialogClientside">Open the wiki</a></b>
---
---@param clientside bool
function sampSetDialogClientside(clientside) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsDialogClientside">Open the wiki</a></b>
---
---@return bool result
function sampIsDialogClientside() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsChatVisible">Open the wiki</a></b>
---
---@return bool result
function sampIsChatVisible() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetChatDisplayMode">Open the wiki</a></b>
---
---@return int mode
function sampGetChatDisplayMode() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetChatDisplayMode">Open the wiki</a></b>
---
---@param mode int
function sampSetChatDisplayMode(mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pauseScmThread">Open the wiki</a></b>
---
---@param thread uint
function pauseScmThread(thread) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/resumeScmThread">Open the wiki</a></b>
---
---@param thread uint
function resumeScmThread(thread) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBool">Open the wiki</a></b>
---
---@param bs Bitstream
---@return bool value
function raknetBitStreamReadBool(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt8">Open the wiki</a></b>
---
---@param bs Bitstream
---@return int value
function raknetBitStreamReadInt8(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt16">Open the wiki</a></b>
---
---@param bs Bitstream
---@return int value
function raknetBitStreamReadInt16(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt32">Open the wiki</a></b>
---
---@param bs Bitstream
---@return int value
function raknetBitStreamReadInt32(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadFloat">Open the wiki</a></b>
---
---@param bs Bitstream
---@return float value
function raknetBitStreamReadFloat(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBuffer">Open the wiki</a></b>
---
---@param bs Bitstream
---@param dest uint
---@param size uint
function raknetBitStreamReadBuffer(bs, dest, size) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadString">Open the wiki</a></b>
---
---@param bs Bitstream
---@param size uint
---@return string value
function raknetBitStreamReadString(bs, size) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamResetReadPointer">Open the wiki</a></b>
---
---@param bs Bitstream
function raknetBitStreamResetReadPointer(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamResetWritePointer">Open the wiki</a></b>
---
---@param bs Bitstream
function raknetBitStreamResetWritePointer(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamIgnoreBits">Open the wiki</a></b>
---
---@param bs Bitstream
---@param amount int
function raknetBitStreamIgnoreBits(bs, amount) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetWriteOffset">Open the wiki</a></b>
---
---@param bs Bitstream
---@param offset int
function raknetBitStreamSetWriteOffset(bs, offset) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetReadOffset">Open the wiki</a></b>
---
---@param bs Bitstream
---@param offset int
function raknetBitStreamSetReadOffset(bs, offset) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBitsUsed">Open the wiki</a></b>
---
---@param bs Bitstream
---@return uint value
function raknetBitStreamGetNumberOfBitsUsed(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBytesUsed">Open the wiki</a></b>
---
---@param bs Bitstream
---@return uint value
function raknetBitStreamGetNumberOfBytesUsed(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfUnreadBits">Open the wiki</a></b>
---
---@param bs Bitstream
---@return uint value
function raknetBitStreamGetNumberOfUnreadBits(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetWriteOffset">Open the wiki</a></b>
---
---@param bs Bitstream
---@return int value
function raknetBitStreamGetWriteOffset(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetReadOffset">Open the wiki</a></b>
---
---@param bs Bitstream
---@return int value
function raknetBitStreamGetReadOffset(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetDataPtr">Open the wiki</a></b>
---
---@param bs Bitstream
---@return uint value
function raknetBitStreamGetDataPtr(bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamDecodeString">Open the wiki</a></b>
---
---@param bs Bitstream
---@param size int
---@return zstring string
function raknetBitStreamDecodeString(bs, size) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamEncodeString">Open the wiki</a></b>
---
---@param bs Bitstream
---@param string zstring
function raknetBitStreamEncodeString(bs, string) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetEmulRpcReceiveBitStream">Open the wiki</a></b>
---
---@param rpc int
---@param bs Bitstream
function raknetEmulRpcReceiveBitStream(rpc, bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetEmulPacketReceiveBitStream">Open the wiki</a></b>
---
---@param packet int
---@param bs Bitstream
function raknetEmulPacketReceiveBitStream(packet, bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetGetRpcName">Open the wiki</a></b>
---
---@param rpc int
---@return zstring name
function raknetGetRpcName(rpc) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetGetPacketName">Open the wiki</a></b>
---
---@param packet int
---@return zstring name
function raknetGetPacketName(packet) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSampfuncsGlobalVar">Open the wiki</a></b>
---
---@param var zstring
---@param value int
---@return bool result
function setSampfuncsGlobalVar(var, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVar">Open the wiki</a></b>
---
---@param var zstring
---@return bool result
---@return int value
function getSampfuncsGlobalVar(var) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampCreate3dTextEx">Open the wiki</a></b>
---
---@param id int
---@param text zstring
---@param color uint
---@param posX float
---@param posY float
---@param posZ float
---@param distance float
---@param ignoreWalls bool
---@param playerId int
---@param vehicleId int
function sampCreate3dTextEx(id, text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGet3dTextInfoById">Open the wiki</a></b>
---
---@param id int
---@return zstring string
---@return uint color
---@return float posX
---@return float posY
---@return float posZ
---@return float distance
---@return bool ignoreWalls
---@return int playerId
---@return int vehicleId
function sampGet3dTextInfoById(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSet3dTextString">Open the wiki</a></b>
---
---@param id int
---@param text zstring
function sampSet3dTextString(id, text) end

---
--- ������� ��������� c ��������� �����������.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawCreate">Open the wiki</a></b>  
---
---@param id int ID ����������
---@param text zstring ����� ����������
---@param posX float ���������� X ����������
---@param posY float ���������� Y ����������
function sampTextdrawCreate(id, text, posX, posY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetBoxColorAndSize">Open the wiki</a></b>
---
---@param id int
---@param box int
---@param color uint
---@param sizeX float
---@param sizeY float
function sampTextdrawSetBoxColorAndSize(id, box, color, sizeX, sizeY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetAlign">Open the wiki</a></b>
---
---@param id int
---@param align int
function sampTextdrawSetAlign(id, align) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetProportional">Open the wiki</a></b>
---
---@param id int
---@param proportional int
function sampTextdrawSetProportional(id, proportional) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetStyle">Open the wiki</a></b>
---
---@param id int
---@param style int
function sampTextdrawSetStyle(id, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetShadow">Open the wiki</a></b>
---
---@param id int
---@param shadow int
---@param color uint
function sampTextdrawSetShadow(id, shadow, color) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetOutlineColor">Open the wiki</a></b>
---
---@param id int
---@param outline int
---@param color uint
function sampTextdrawSetOutlineColor(id, outline, color) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetModelRotationZoomVehColor">Open the wiki</a></b>
---
---@param id int
---@param model int
---@param rotX float
---@param rotY float
---@param rotZ float
---@param zoom float
---@param clr1 int
---@param clr2 int
function sampTextdrawSetModelRotationZoomVehColor(id, model, rotX, rotY, rotZ, zoom, clr1, clr2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetString">Open the wiki</a></b>
---
---@param id int
---@param text zstring
function sampTextdrawSetString(id, text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetPos">Open the wiki</a></b>
---
---@param id int
---@param posX float
---@param posY float
function sampTextdrawSetPos(id, posX, posY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetLetterSizeAndColor">Open the wiki</a></b>
---
---@param id int
---@param letSizeX float
---@param letSizeY float
---@param color uint
function sampTextdrawSetLetterSizeAndColor(id, letSizeX, letSizeY, color) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetBoxEnabledColorAndSize">Open the wiki</a></b>
---
---@param id int
---@return int box
---@return uint color
---@return float sizeX
---@return float sizeY
function sampTextdrawGetBoxEnabledColorAndSize(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetAlign">Open the wiki</a></b>
---
---@param id int
---@return int align
function sampTextdrawGetAlign(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetProportional">Open the wiki</a></b>
---
---@param id int
---@return int prop
function sampTextdrawGetProportional(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetStyle">Open the wiki</a></b>
---
---@param id int
---@return int style
function sampTextdrawGetStyle(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetShadowColor">Open the wiki</a></b>
---
---@param id int
---@return int shadow
---@return uint color
function sampTextdrawGetShadowColor(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetOutlineColor">Open the wiki</a></b>
---
---@param id int
---@return int outline
---@return uint color
function sampTextdrawGetOutlineColor(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetModelRotationZoomVehColor">Open the wiki</a></b>
---
---@param id int
---@return int model
---@return float rotX
---@return float rotY
---@return float rotZ
---@return float zoom
---@return int clr1
---@return int clr2
function sampTextdrawGetModelRotationZoomVehColor(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetString">Open the wiki</a></b>
---
---@param id int
---@return zstring text
function sampTextdrawGetString(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetPos">Open the wiki</a></b>
---
---@param id int
---@return float posX
---@return float posY
function sampTextdrawGetPos(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetLetterSizeAndColor">Open the wiki</a></b>
---
---@param id int
---@return float letSizeX
---@return float letSizeY
---@return uint color
function sampTextdrawGetLetterSizeAndColor(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawIsExists">Open the wiki</a></b>
---
---@param id int
---@return bool result
function sampTextdrawIsExists(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawDelete">Open the wiki</a></b>
---
---@param id int
function sampTextdrawDelete(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampfuncsGlobalVarDefined">Open the wiki</a></b>
---
---@param var zstring
---@return bool result
function isSampfuncsGlobalVarDefined(var) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVarAccessForThread">Open the wiki</a></b>
---
---@param var zstring
---@param thread uint
---@return bool read
---@return bool write
function getSampfuncsGlobalVarAccessForThread(var, thread) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/runSampfuncsConsoleCommand">Open the wiki</a></b>
---
---@param cmd zstring
function runSampfuncsConsoleCommand(cmd) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampfuncsRegisterConsoleCommand">Open the wiki</a></b>
---
---@param cmd zstring
---@param func function
---@return bool result
function sampfuncsRegisterConsoleCommand(cmd, func) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampfuncsUnregisterConsoleCommand">Open the wiki</a></b>
---
---@param cmd zstring
---@return bool result
function sampfuncsUnregisterConsoleCommand(cmd) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createScmThreadAtPointer">Open the wiki</a></b>
---
---@param pointer uint
---@param args table
---@return uint thread
function createScmThreadAtPointer(pointer, args) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setScmThreadLocalVar">Open the wiki</a></b>
---
---@param thread uint
---@param var int
---@param value any
function setScmThreadLocalVar(thread, var, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getScmThreadLocalVar">Open the wiki</a></b>
---
---@param thread uint
---@param var int
---@return int value
function getScmThreadLocalVar(thread, var) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/destroyScmThread">Open the wiki</a></b>
---
---@param thread uint
function destroyScmThread(thread) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/restartScmThread">Open the wiki</a></b>
---
---@param thread uint
---@param args table
function restartScmThread(thread, args) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleActive">Open the wiki</a></b>
---
---@return bool result
function isSampfuncsConsoleActive() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetClientCommandDescription">Open the wiki</a></b>
---
---@param cmd zstring
---@param text zstring
function sampSetClientCommandDescription(cmd, text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSampfuncsConsoleCommandDescription">Open the wiki</a></b>
---
---@param cmd zstring
---@param text zstring
function setSampfuncsConsoleCommandDescription(cmd, text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceVehicleSync">Open the wiki</a></b>
---
---@param id int
function sampForceVehicleSync(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceUnoccupiedSyncSeatId">Open the wiki</a></b>
---
---@param id int
---@param seatId int
function sampForceUnoccupiedSyncSeatId(id, seatId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceOnfootSync">Open the wiki</a></b>
---
function sampForceOnfootSync() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceAimSync">Open the wiki</a></b>
---
function sampForceAimSync() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceTrailerSync">Open the wiki</a></b>
---
---@param id int
function sampForceTrailerSync(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForcePassengerSyncSeatId">Open the wiki</a></b>
---
---@param id int
---@param seatId int
function sampForcePassengerSyncSeatId(id, seatId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceStatsSync">Open the wiki</a></b>
---
function sampForceStatsSync() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceWeaponsSync">Open the wiki</a></b>
---
function sampForceWeaponsSync() end

---
--- ���������� ������������ SAMP �� ������ �� �������/� ���� ���������� (������)  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetMaxPlayerId">Open the wiki</a></b>  
---
---@param streamed bool ����� � ������
---@return int id ID ������
function sampGetMaxPlayerId(streamed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerCount">Open the wiki</a></b>
---
---@param streamed bool
---@return int count
function sampGetPlayerCount(streamed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampProcessChatInput">Open the wiki</a></b>
---
---@param text zstring
function sampProcessChatInput(text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsChatCommandDefined">Open the wiki</a></b>
---
---@param cmd zstring
---@return bool result
function sampIsChatCommandDefined(cmd) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleCommandDefined">Open the wiki</a></b>
---
---@param cmd zstring
---@return bool result
function isSampfuncsConsoleCommandDefined(cmd) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCleoLibraryVersion">Open the wiki</a></b>
---
---@return int version
function getCleoLibraryVersion() end

---
--- �������� �������, ���������� �������� �� ������ �������.  
--- � ��� ����� ������������ �������� `wait` � ����������� �����, ��� ���� �� ������� ������ ����.  
--- ����������������� ������� `main` �������� �� ��������, � ������������, ������������� � ��������� Lua-������.  
--- ��� � ��� ����������� ��������� � ���������� �� �����-�� ���������� ������� � ����� ���������� ������ � ���� �� ����� ��� �����-���� ���������� �����������.  
---
--- ### ������  
---
--- ```lua
---   function main()
---     -- �������� ���-������ ����� ���, ��� ��������� ����������� ����
---     loadStuff()
---     key1_timesPressed = 0
---   
---     -- ����������� ���� - � ������ ������� ������ � �� ����������� �������� ����� �������
---     while true do
---       -- � �� ����������� ������ �������������� ����-�� ������� ��������, ����� ���� �������� ��������
---       -- ����������� ��� ���, ��� ���� ������� ���� ����������� ���������������, � ��� ����� � ������� MoonLoader-�
---       -- � ������� ������������ ���� ����� ������ ����������� ������������, ����� ����� � ������ ����������� ����� ������ �������
---       -- ������� �������� ������������ ���������� ������� ����� �� ���� ���� (�������� � main �� ��������� ������� �� ���������� ��������� �������)
---       wait(0)
---       if isPlayerPlaying(playerHandle) then
---         if isKeyDown(0x31) then
---           key1_timesPressed = key1_timesPressed + 1
---           print("Key 1 pressed " .. key1_timesPressed .. " times.")
---           wait(500)
---         end
---         doCoolStuff()
---       end
---     end
---   end
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/main">Open the wiki</a></b>
---
function main() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/PLAYER_PED">Open the wiki</a></b>
---
---@type Ped
PLAYER_PED = {}

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/PLAYER_HANDLE">Open the wiki</a></b>
---
---@type Player
PLAYER_HANDLE = {}

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/PLAYER_PED">Open the wiki</a></b>
---
---@type Ped
playerPed = {}

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/PLAYER_HANDLE">Open the wiki</a></b>
---
---@type Player
playerHandle = {}
