---@meta moonloader
---@diagnostic disable: lowercase-global, missing-return

---@alias bool boolean # логический
---@alias int number # целочисленный со знаком, 4 байта
---@alias uint number # целочисленный без знака, 4 байта
---@alias float number # число с плавающей точкой, 4 байта
---@alias double number # число с плавающей точкой двойной точности, 8 байт
---@alias zstring string # нуль-терминированная строка (в Lua обычная строка)

---@alias BaseScriptHandle uint # базовый скриптовый хэндл
---@alias BaseSFHandle uint # базовый SAMPFUNC хэндл

---@alias Ped BaseScriptHandle # скриптовый хэндл игрового персонажа
---@alias Marker BaseScriptHandle # скриптовый хэндл маркера
---@alias Pickup BaseScriptHandle # скриптовый хэндл пикапа
---@alias Searchlight BaseScriptHandle # скриптовый хэндл прожектора
---@alias Particle BaseScriptHandle # скриптовый хэндл визуального эффекта
---@alias Checkpoint BaseScriptHandle # скриптовый хэндл чекпоинта
---@alias Vehicle BaseScriptHandle # скриптовый хэндл транспортного средства
---@alias Object BaseScriptHandle # скриптовый хэндл игрового объекта
---@alias Player BaseScriptHandle # идентификатор игрока

---@alias GxtString string # короткая строка-идентификатор GXT-записи
---@alias Model uint # идентификатор игровой модели
---@alias Bitstream uint # указатель на объект BitStream
---@alias VarId uint # индекс скриптовой глобальной переменной

---@alias DxutDialog BaseSFHandle # хэндл DXUT-диалога SAMPFUNCS

---@alias DxFont userdata # экземпляр шрифта DirectX
---@alias DxTexture userdata # экземпляр текстуры DirectX
---@alias AudioStream userdata # экземпляр аудиопотока BASS
---@alias Filesearch userdata # хэндл поиска файлов

---@alias LuaThreadStatus
---| '"dead"' # завершён
---| '"suspended"' # заморожен
---| '"running"' # выполняется
---| '"yielded"' # приостановлен
---| '"error"' # завершён с ошибкой

---@class LuaThread # экземпляр класса LuaThread
---@field dead boolean # Определяет статус завершённости потока. Только для чтения.
---@field work_in_pause boolean # Определяет исполнение потока во время паузы игры.
---@field run fun(...) # Выполняет замороженный, выполняющийся или завершённый поток с начала. Все параметры вызова передаются в функцию потока в качестве аргументов.
---@field terminate fun() # Принудительно завершает поток.
---@field status fun(): LuaThreadStatus # Возвращает статус потока.

---@class lua_thread

---@type lua_thread
lua_thread = {}

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/lua_thread/create)
---
---@param func function
---@param ... any
---@return LuaThread thread
function lua_thread.create(func, ...) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/lua_thread/create_suspended)
---
---@param func function
---@return LuaThread thread
function lua_thread.create_suspended(func) end


---@class LuaScript # экземпляр класса LuaScript
---@field name string # имя скрипта, заданное функцией 'script_name'. Если имя не задано используется название файла
---@field description string # описание скрипта, указанное функцией 'script_description'. Пустая строка, если не указано
---@field version_num int # числовая версия скрипта. 0, если не указано
---@field version string # текстовая версия скрипта. Будет использована числовая версия, если не задано
---@field authors table # список авторов скрипта. Пустой, если не указаны
---@field dependencies table # список зависимостей скрипта. Пустой, если не указаны
---@field path string # полный путь к файлу скрипта
---@field filename string # название файла скрипта, включая расширение
---@field directory string # полный путь директории, из который был загружен скрипт
---@field frozen bool # статус активности потока (приостановлен/активен)
---@field dead bool # статус существования потока. Есть случаи, когда поток уже завершён, а lua-объект скрипта ещё существует. Свойство dead проверяет объект скрипта на валидность
---@field exports any # экспортируемые скриптом значения. Можно получить и функцией import
---@field id int # уникальный идентификатор скрипта
---@field url string # web-адрес скрипта
---@field properties table # список свойств, заданных директивой script_properties
---@field pause fun() # приостанавливает поток скрипта
---@field resume fun() # снимает остановленный поток с паузы
---@field unload fun() # выгружает скрипт
---@field reload fun() # перезагружает скрипт

---@class script
---@field this LuaScript # Возвращает объект LuaScript текущего скрипта. Является аналогом функции thisScript.

---@type script
script = {}

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script/load)
---
---@param file string
---@return LuaScript s
function script.load(file) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script/find)
---
---@param name string
---@return LuaScript s
function script.find(name) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script/list)
---
---@return table list
function script.list() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script/get)
---
---@param scriptId int
---@return LuaScript script
function script.get(scriptId) end


---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCursorActive)
---
---@return bool result
function isCursorActive() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getAllPickups)
---
---@return table pickups
function getAllPickups() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPickupPointerHandle)
---
---@param pickup Pickup
---@return int handle
function getPickupPointerHandle(pickup) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPickupPointer)
---
---@param pickup Pickup
---@return int pointer
function getPickupPointer(pickup) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPickupType)
---
---@param pickup Pickup
---@return int type
function getPickupType(pickup) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPickupModel)
---
---@param pickup Pickup
---@return int model
function getPickupModel(pickup) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectQuaternion)
---
---@param object Object
---@return float x
---@return float y
---@return float z
---@return float w
function getObjectQuaternion(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectQuaternion)
---
---@param object Object
---@param x float
---@param y float
---@param z float
---@param w float
function setObjectQuaternion(object, x, y, z, w) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getVehicleQuaternion)
---
---@param car Vehicle
---@return float x
---@return float y
---@return float z
---@return float w
function getVehicleQuaternion(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleQuaternion)
---
---@param car Vehicle
---@param x float
---@param y float
---@param z float
---@param w float
function setVehicleQuaternion(car, x, y, z, w) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharQuaternion)
---
---@param ped Ped
---@return float x
---@return float y
---@return float z
---@return float w
function getCharQuaternion(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharQuaternion)
---
---@param ped Ped
---@param x float
---@param y float
---@param z float
---@param w float
function setCharQuaternion(ped, x, y, z, w) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadAudioStream)
---
---@param audio zstring
---@return AudioStream handle
function loadAudioStream(audio) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setAudioStreamState)
---
---@param handle AudioStream
---@param state int
function setAudioStreamState(handle, state) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/releaseAudioStream)
---
---@param handle AudioStream
function releaseAudioStream(handle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getAudioStreamLength)
---
---@param handle AudioStream
---@return double length
function getAudioStreamLength(handle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getAudioStreamState)
---
---@param handle AudioStream
---@return int state
function getAudioStreamState(handle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getAudioStreamVolume)
---
---@param audio AudioStream
---@return float volume
function getAudioStreamVolume(audio) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setAudioStreamVolume)
---
---@param audio AudioStream
---@param volume float
function setAudioStreamVolume(audio, volume) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setAudioStreamLooped)
---
---@param audio AudioStream
---@param loop bool
function setAudioStreamLooped(audio, loop) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/load3dAudioStream)
---
---@param audio zstring
---@return AudioStream handle
function load3dAudioStream(audio) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCoordinates)
---
---@param handle AudioStream
---@param posX float
---@param posY float
---@param posZ float
function setPlay3dAudioStreamAtCoordinates(handle, posX, posY, posZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtObject)
---
---@param audio AudioStream
---@param object Object
function setPlay3dAudioStreamAtObject(audio, object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtChar)
---
---@param audio AudioStream
---@param ped Ped
function setPlay3dAudioStreamAtChar(audio, ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCar)
---
---@param audio AudioStream
---@param car Vehicle
function setPlay3dAudioStreamAtCar(audio, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadAudioStreamFromMemory)
---
---@param address uint
---@param size uint
---@return AudioStream handle
function loadAudioStreamFromMemory(address, size) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/load3dAudioStreamFromMemory)
---
---@param address uint
---@param size uint
---@return AudioStream handle
function load3dAudioStreamFromMemory(address, size) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderDrawLine)
---
---@param pos1X float
---@param pos1Y float
---@param pos2X float
---@param pos2Y float
---@param width float
---@param color uint
function renderDrawLine(pos1X, pos1Y, pos2X, pos2Y, width, color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderDrawBox)
---
---@param posX float
---@param posY float
---@param sizeX float
---@param sizeY float
---@param color uint
function renderDrawBox(posX, posY, sizeX, sizeY, color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderDrawBoxWithBorder)
---
---@param posX float
---@param posY float
---@param sizeX float
---@param sizeY float
---@param color uint
---@param bsize float
---@param bcolor uint
function renderDrawBoxWithBorder(posX, posY, sizeX, sizeY, color, bsize, bcolor) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetFontDrawTextLength)
---
---@param font DxFont
---@param text zstring
---@param ignoreColorTags bool? Default value is false
---@return float length
function renderGetFontDrawTextLength(font, text, ignoreColorTags) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetFontDrawHeight)
---
---@param font DxFont
---@return float height
function renderGetFontDrawHeight(font) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetFontCharIndexAt)
---
---@param font DxFont
---@param text string
---@param x float
---@param ignoreColorTags bool? Default value is false
---@return uint index
function renderGetFontCharIndexAt(font, text, x, ignoreColorTags) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetFontCharWidth)
---
---@param font DxFont
---@param char string|uint
---@return float width
function renderGetFontCharWidth(font, char) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderCreateFont)
---
---@param font zstring
---@param height int
---@param flags uint
---@param charset uint? Default value is nil
---@return DxFont font
function renderCreateFont(font, height, flags, charset) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderReleaseFont)
---
---@param font DxFont
function renderReleaseFont(font) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderFontDrawText)
---
---@param font DxFont
---@param text zstring
---@param posX float
---@param posY float
---@param color uint
---@param ignoreColorTags bool? Default value is false
function renderFontDrawText(font, text, posX, posY, color, ignoreColorTags) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderDrawPolygon)
---
---@param posX float
---@param posY float
---@param sizeX float
---@param sizeY float
---@param corners int
---@param rotation float
---@param color uint
function renderDrawPolygon(posX, posY, sizeX, sizeY, corners, rotation, color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderLoadTextureFromFile)
---
---@param file zstring
---@return DxTexture texture
function renderLoadTextureFromFile(file) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderReleaseTexture)
---
---@param texture DxTexture
function renderReleaseTexture(texture) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderDrawTexture)
---
---@param texture DxTexture
---@param posX float
---@param posY float
---@param sizeX float
---@param sizeY float
---@param rotation float
---@param color uint
function renderDrawTexture(texture, posX, posY, sizeX, sizeY, rotation, color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderBegin)
---
---@param type int
function renderBegin(type) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderEnd)
---
function renderEnd() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderColor)
---
---@param color uint
function renderColor(color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderVertex)
---
---@param vX float
---@param vY float
function renderVertex(vX, vY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderSetTexCoord)
---
---@param posX float
---@param posY float
function renderSetTexCoord(posX, posY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderBindTexture)
---
---@param texture DxTexture
function renderBindTexture(texture) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetTextureStruct)
---
---@param texture DxTexture
---@return uint struct
function renderGetTextureStruct(texture) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetTextureSprite)
---
---@param texture DxTexture
---@return uint sprite
function renderGetTextureSprite(texture) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetTextureSize)
---
---@param texture DxTexture
---@return uint sizeX
---@return uint sizeY
function renderGetTextureSize(texture) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderSetRenderState)
---
---@param state int
---@param value uint
function renderSetRenderState(state, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/renderLoadTextureFromFileInMemory)
---
---@param pointer uint
---@param size uint
---@return DxTexture texture
function renderLoadTextureFromFileInMemory(pointer, size) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script_version_number)
---
---@param version int
function script_version_number(version) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script_version)
---
---@param version string
function script_version(version) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script_name)
---
---@param name string
function script_name(name) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script_description)
---
---@param description string
function script_description(description) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script_authors)
---
---@param author string
---@param ... any
function script_authors(author, ...) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script_author)
---
---@param author string
function script_author(author) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script_dependencies)
---
---@param name string
---@param ... any
function script_dependencies(name, ...) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script_moonloader)
---
---@param version int
function script_moonloader(version) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/thisScript)
---
---@return LuaScript s
function thisScript() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/wait)
---
---@param time int
function wait(time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/print)
---
---@param value any
---@param ... any
function print(value, ...) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getGameGlobal)
---
---@param index int
---@return int value
function getGameGlobal(index) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGameGlobal)
---
---@param index int
---@param value int
function setGameGlobal(index, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getGameGlobalPtr)
---
---@param index int
---@return uint ptr
function getGameGlobalPtr(index) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isSampfuncsLoaded)
---
---@return bool loaded
function isSampfuncsLoaded() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCleoLoaded)
---
---@return bool loaded
function isCleoLoaded() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isSampLoaded)
---
---@return bool loaded
function isSampLoaded() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isKeyDown)
---
---@param keyId int
---@return bool state
function isKeyDown(keyId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/reloadScripts)
---
function reloadScripts() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isOpcodesAvailable)
---
---@return bool status
function isOpcodesAvailable() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/representFloatAsInt)
---
---@param f float
---@return int i
function representFloatAsInt(f) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/representIntAsFloat)
---
---@param i int
---@return float i
function representIntAsFloat(i) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGxtEntry)
---
---@param key string
---@param text string
function setGxtEntry(key, text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setFreeGxtEntry)
---
---@param text string
---@return string key
function setFreeGxtEntry(text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getFreeGxtKey)
---
---@return string key
function getFreeGxtKey() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getGxtText)
---
---@param key string
---@return string text
function getGxtText(key) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearGxtEntry)
---
---@param key string
function clearGxtEntry(key) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPauseMenuActive)
---
---@return bool active
function isPauseMenuActive() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isGameWindowForeground)
---
---@return bool foreground
function isGameWindowForeground() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getGameVersion)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getMoonloaderVersion)
---
---@return int version
function getMoonloaderVersion() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/localClock)
---
---@return double time
function localClock() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/freeTextures)
---
function freeTextures() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getWorkingDirectory)
---
---@return string path
function getWorkingDirectory() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getGameDirectory)
---
---@return string path
function getGameDirectory() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/useRenderCommands)
---
---@param enable bool
function useRenderCommands(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/writeMemory)
---
---@param address uint
---@param size uint
---@param value int
---@param virtualProtect bool
function writeMemory(address, size, value, virtualProtect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/readMemory)
---
---@param address uint
---@param size uint
---@param virtualProtect bool
---@return int value
function readMemory(address, size, virtualProtect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadDynamicLibrary)
---
---@param library string
---@return bool result
---@return uint handle
function loadDynamicLibrary(library) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/freeDynamicLibrary)
---
---@param handle uint
function freeDynamicLibrary(handle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getDynamicLibraryProcedure)
---
---@param proc string
---@param handle uint
---@return bool result
---@return uint proc
function getDynamicLibraryProcedure(proc, handle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesFileExist)
---
---@param file string
---@return bool result
function doesFileExist(file) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesDirectoryExist)
---
---@param directory string
---@return bool result
function doesDirectoryExist(directory) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createDirectory)
---
---@param directory string
---@return bool result
function createDirectory(directory) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/popFloat)
---
---@return float val
function popFloat() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isGameVersionOriginal)
---
---@return bool result
function isGameVersionOriginal() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/allocateMemory)
---
---@param size uint
---@return uint memory
function allocateMemory(size) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/freeMemory)
---
---@param memory uint
function freeMemory(memory) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/findFirstFile)
---
---@param mask string
---@return Filesearch handle
---@return string name
function findFirstFile(mask) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/findNextFile)
---
---@param handle Filesearch
---@return string file
function findNextFile(handle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/findClose)
---
---@param handle Filesearch
function findClose(handle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/findAllRandomCharsInSphere)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/findAllRandomVehiclesInSphere)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/findAllRandomObjectsInSphere)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharPointer)
---
---@param ped Ped
---@return uint ptr
function getCharPointer(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarPointer)
---
---@param car Vehicle
---@return uint ptr
function getCarPointer(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectPointer)
---
---@param object Object
---@return uint struct
function getObjectPointer(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/callFunction)
---
---@param address uint
---@param params int
---@param pop int
---@param ... any
---@return int returnValue
function callFunction(address, params, pop, ...) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/callMethod)
---
---@param address uint
---@param struct int
---@param params int
---@param pop int
---@param ... any
---@return int returnValue
function callMethod(address, struct, params, pop, ...) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/storeClosestEntities)
---
---@param ped Ped
---@return Vehicle car
---@return Ped ped
function storeClosestEntities(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchCarEngine)
---
---@param car Vehicle
---@param state bool
function switchCarEngine(car, state) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getTargetBlipCoordinates)
---
---@return bool result
---@return float posX
---@return float posY
---@return float posZ
function getTargetBlipCoordinates() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarNumberOfGears)
---
---@param car Vehicle
---@return int gears
function getCarNumberOfGears(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarCurrentGear)
---
---@param car Vehicle
---@return int gear
function getCarCurrentGear(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarSirenOn)
---
---@param car Vehicle
---@return bool state
function isCarSirenOn(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarEngineOn)
---
---@param car Vehicle
---@return bool state
function isCarEngineOn(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printHelpString)
---
---@param text string
function printHelpString(text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printStyledString)
---
---@param text string
---@param time int
---@param style int
function printStyledString(text, time, style) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printString)
---
---@param text string
---@param time int
function printString(text, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printStringNow)
---
---@param text string
---@param time int
function printStringNow(text, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharPlayerIsTargeting)
---
---@param player Player
---@return bool result
---@return Ped ped
function getCharPlayerIsTargeting(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNameOfVehicleModel)
---
---@param modelId Model
---@return GxtString name
function getNameOfVehicleModel(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/testCheat)
---
---@param text string
---@return bool result
function testCheat(text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/spawnVehicleByCheating)
---
---@param modelId Model
---@return bool result
function spawnVehicleByCheating(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharPointerHandle)
---
---@param ptr uint
---@return Ped handle
function getCharPointerHandle(ptr) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getVehiclePointerHandle)
---
---@param ptr uint
---@return Vehicle handle
function getVehiclePointerHandle(ptr) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectPointerHandle)
---
---@param ptr uint
---@return Object handle
function getObjectPointerHandle(ptr) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/processLineOfSight)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setClipboardText)
---
---@param text string
---@return bool result
function setClipboardText(text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getClipboardText)
---
---@return string text
function getClipboardText() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getStructElement)
---
---@param struct uint
---@param offset int
---@param size uint
---@param unprotect bool? Default value is false
---@return int value
function getStructElement(struct, offset, size, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setStructElement)
---
---@param struct uint
---@param offset int
---@param size uint
---@param value int
---@param unprotect bool? Default value is false
function setStructElement(struct, offset, size, value, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/convertMatrixToQuaternion)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/convertQuaternionToMatrix)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreen)
---
---@param posX float
---@param posY float
---@param posZ float
---@return float wposX
---@return float wposY
function convert3DCoordsToScreen(posX, posY, posZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGameKeyState)
---
---@param key int
---@param state int
function setGameKeyState(key, state) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCursorPos)
---
---@return int posX
---@return int posY
function getCursorPos() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/convertWindowScreenCoordsToGameScreenCoords)
---
---@param wposX float
---@param wposY float
---@return float gposX
---@return float gposY
function convertWindowScreenCoordsToGameScreenCoords(wposX, wposY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/convertGameScreenCoordsToWindowScreenCoords)
---
---@param gposX float
---@param gposY float
---@return float wposX
---@return float wposY
function convertGameScreenCoordsToWindowScreenCoords(gposX, gposY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/convertScreenCoordsToWorld3D)
---
---@param posX float
---@param posY float
---@param depth float
---@return float posX
---@return float posY
---@return float posZ
function convertScreenCoordsToWorld3D(posX, posY, depth) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getModuleHandle)
---
---@param module string
---@return uint handle
function getModuleHandle(module) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getModuleProcAddress)
---
---@param module string
---@param proc string
---@return uint address
function getModuleProcAddress(module, proc) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setVirtualKeyDown)
---
---@param vkey int
---@param down bool
function setVirtualKeyDown(vkey, down) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharKeyDown)
---
---@param ckey int
---@param down bool
function setCharKeyDown(ckey, down) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/downloadUrlToFile)
---
---@param url string
---@param file string
---@param statusCallback function
---@return int index
function downloadUrlToFile(url, file, statusCallback) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isKeyJustPressed)
---
---@param key int
---@return bool state
function isKeyJustPressed(key) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreenEx)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getStructFloatElement)
---
---@param struct uint
---@param offset int
---@param unprotect bool? Default value is false
---@return float value
function getStructFloatElement(struct, offset, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setStructFloatElement)
---
---@param struct uint
---@param offset int
---@param value float
---@param unprotect bool? Default value is false
function setStructFloatElement(struct, offset, value, unprotect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/wasKeyPressed)
---
---@param key int
---@return bool state
function wasKeyPressed(key) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/wasKeyReleased)
---
---@param key int
---@return bool state
function wasKeyReleased(key) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getMousewheelDelta)
---
---@return int delta
function getMousewheelDelta() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/consumeWindowMessage)
---
---@param game bool? Default value is true
---@param scripts bool? Default value is true
function consumeWindowMessage(game, scripts) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addEventHandler)
---
---@param eventName string
---@param callback function
function addEventHandler(eventName, callback) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isGamePaused)
---
---@return bool paused
function isGamePaused() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/gameClock)
---
---@return double time
function gameClock() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script_properties)
---
---@param property string
---@param ... any
function script_properties(property, ...) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/script_url)
---
---@param url string
function script_url(url) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/import)
---
---@param filename string
---@return any imports
function import(filename) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/encodeJson)
---
---@param data table
---@return string json
function encodeJson(data) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/decodeJson)
---
---@param json string
---@return table data
function decodeJson(json) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/showCursor)
---
---@param show bool
---@param lockControls bool? Default value is nil
function showCursor(show, lockControls) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/lockPlayerControl)
---
---@param lock bool
function lockPlayerControl(lock) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerControlLocked)
---
---@return bool locked
function isPlayerControlLocked() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setBlipCoordinates)
---
---@param blip Marker
---@param x float
---@param y float
---@param z float
---@return bool result
function setBlipCoordinates(blip, x, y, z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTargetBlipCoordinates)
---
---@param x float
---@param y float
---@param z float
---@return bool result
function setTargetBlipCoordinates(x, y, z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/placeWaypoint)
---
---@param x float
---@param y float
---@param z float
---@return bool result
function placeWaypoint(x, y, z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeWaypoint)
---
---@return bool result
function removeWaypoint() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getFolderPath)
---
---@param csidl int
---@return string path
function getFolderPath(csidl) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getTimeStepValue)
---
---@return float value
function getTimeStepValue() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getD3DDevicePtr)
---
---@return uint devicePtr
function getD3DDevicePtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getAllObjects)
---
---@return table objects
function getAllObjects() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getAllChars)
---
---@return table peds
function getAllChars() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getAllVehicles)
---
---@return table vehicles
function getAllVehicles() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getGameGlobalFloat)
---
---@param index int
---@return float value
function getGameGlobalFloat(index) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGameGlobalFloat)
---
---@param index int
---@param value float
function setGameGlobalFloat(index, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/shakeCam)
---
---@param shake int
function shakeCam(shake) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createPlayer)
---
---@param modelId Model
---@param atX float
---@param atY float
---@param atZ float
---@return Player player
function createPlayer(modelId, atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createChar)
---
---@param pedtype int
---@param modelId Model
---@param atX float
---@param atY float
---@param atZ float
---@return Ped ped
function createChar(pedtype, modelId, atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/deleteChar)
---
---@param ped Ped
function deleteChar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharCoordinates)
---
---@param ped Ped
---@return float positionX
---@return float positionY
---@return float positionZ
function getCharCoordinates(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharCoordinates)
---
---@param ped Ped
---@param posX float
---@param posY float
---@param posZ float
function setCharCoordinates(ped, posX, posY, posZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInArea2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInArea3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createCar)
---
---@param modelId Model
---@param atX float
---@param atY float
---@param atZ float
---@return Vehicle car
function createCar(modelId, atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/deleteCar)
---
---@param car Vehicle
function deleteCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/carGotoCoordinates)
---
---@param car Vehicle
---@param driveToX float
---@param driveToY float
---@param driveToZ float
function carGotoCoordinates(car, driveToX, driveToY, driveToZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/carWanderRandomly)
---
---@param car Vehicle
function carWanderRandomly(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/carSetIdle)
---
---@param car Vehicle
function carSetIdle(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarCoordinates)
---
---@param car Vehicle
---@return float positionX
---@return float positionY
---@return float positionZ
function getCarCoordinates(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarCoordinates)
---
---@param car Vehicle
---@param atX float
---@param atY float
---@param atZ float
function setCarCoordinates(car, atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarCruiseSpeed)
---
---@param car Vehicle
---@param maxSpeed float
function setCarCruiseSpeed(car, maxSpeed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarDrivingStyle)
---
---@param car Vehicle
---@param behaviour int
function setCarDrivingStyle(car, behaviour) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarMission)
---
---@param car Vehicle
---@param driverBehaviour int
function setCarMission(car, driverBehaviour) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarInArea2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarInArea3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printBig)
---
---@param gxtString GxtString
---@param time int
---@param style int
function printBig(gxtString, time, style) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printText)
---
---@param gxtString GxtString
---@param time int
---@param flag int
function printText(gxtString, time, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printTextNow)
---
---@param gxtString GxtString
---@param time int
---@param flag int
function printTextNow(gxtString, time, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearPrints)
---
function clearPrints() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getTimeOfDay)
---
---@return int hours
---@return int mins
function getTimeOfDay() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTimeOfDay)
---
---@param hours int
---@param minutes int
function setTimeOfDay(hours, minutes) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getMinutesToTimeOfDay)
---
---@param hours int
---@param minutes int
---@return int minutes
function getMinutesToTimeOfDay(hours, minutes) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPointOnScreen)
---
---@param sphereX float
---@param sphereY float
---@param sphereZ float
---@param radius float
---@return bool result
function isPointOnScreen(sphereX, sphereY, sphereZ, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/storeCarCharIsIn)
---
---@param ped Ped
---@return Vehicle car
function storeCarCharIsIn(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInCar)
---
---@param ped Ped
---@param car Vehicle
---@return bool result
function isCharInCar(ped, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInModel)
---
---@param ped Ped
---@param carModel Model
---@return bool result
function isCharInModel(ped, carModel) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnyCar)
---
---@param ped Ped
---@return bool result
function isCharInAnyCar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isButtonPressed)
---
---@param player Player
---@param key int
---@return bool result
function isButtonPressed(player, key) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPadState)
---
---@param player Player
---@param key int
---@return int state
function getPadState(player, key) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeans2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFoot2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharInCar2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCharAnyMeans2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCharOnFoot2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCharInCar2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansChar2d)
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharAnyMeansChar2d(ped, nearPed, radiusX, radiusY, sphere) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFootChar2d)
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX float
---@param radiusY float
---@param sphere bool
function locateCharOnFootChar2d(ped, nearPed, radiusX, radiusY, sphere) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharInCarChar2d)
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharInCarChar2d(ped, nearPed, radiusX, radiusY, sphere) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeans3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFoot3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharInCar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCharAnyMeans3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCharOnFoot3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCharInCar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansChar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFootChar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharInCarChar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createObject)
---
---@param modelId Model
---@param atX float
---@param atY float
---@param atZ float
---@return Object object
function createObject(modelId, atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/deleteObject)
---
---@param object Object
function deleteObject(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/givePlayerMoney)
---
---@param player Player
---@param money int
function givePlayerMoney(player, money) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPlayerMoney)
---
---@param player Player
---@return int money
function getPlayerMoney(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/giveRemoteControlledCarToPlayer)
---
---@param player Player
---@param float2 float
---@param float3 float
---@param float4 float
function giveRemoteControlledCarToPlayer(player, float2, float3, float4) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/alterWantedLevel)
---
---@param player Player
---@param wantedLevel int
function alterWantedLevel(player, wantedLevel) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/alterWantedLevelNoDrop)
---
---@param player Player
---@param minimumWantedLevel int
function alterWantedLevelNoDrop(player, minimumWantedLevel) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isWantedLevelGreater)
---
---@param player Player
---@param level int
---@return bool result
function isWantedLevelGreater(player, level) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearWantedLevel)
---
---@param player Player
function clearWantedLevel(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setDeatharrestState)
---
---@param value bool
function setDeatharrestState(value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasDeatharrestBeenExecuted)
---
---@return bool result
function hasDeatharrestBeenExecuted() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addAmmoToChar)
---
---@param ped Ped
---@param weapon int
---@param ammo int
function addAmmoToChar(ped, weapon, ammo) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerDead)
---
---@param player Player
---@return bool result
function isPlayerDead(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharDead)
---
---@param ped Ped
---@return bool result
function isCharDead(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarDead)
---
---@param car Vehicle
---@return bool result
function isCarDead(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerPressingHorn)
---
---@param player Player
---@return bool result
function isPlayerPressingHorn(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createCharInsideCar)
---
---@param car Vehicle
---@param pedtype Model
---@param model int
---@return Ped ped
function createCharInsideCar(car, pedtype, model) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarModel)
---
---@param car Vehicle
---@param modelId Model
---@return bool result
function isCarModel(car, modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createCarGenerator)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchCarGenerator)
---
---@param carGenerator int
---@param carsToGenerate int
function switchCarGenerator(carGenerator, carsToGenerate) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayOnscreenTimer)
---
---@param var VarId
---@param countInDirection bool
function displayOnscreenTimer(var, countInDirection) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearOnscreenTimer)
---
---@param var VarId
function clearOnscreenTimer(var) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearOnscreenCounter)
---
---@param var VarId
function clearOnscreenCounter(var) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInZone)
---
---@param ped Ped
---@param zoneName GxtString
---@return bool result
function isCharInZone(ped, zoneName) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/pointCameraAtCar)
---
---@param car Vehicle
---@param mode int
---@param switchstyle int
function pointCameraAtCar(car, mode, switchstyle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/pointCameraAtChar)
---
---@param ped Ped
---@param mode int
---@param switchstyle int
function pointCameraAtChar(ped, mode, switchstyle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/restoreCamera)
---
function restoreCamera() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/shakePad)
---
---@param player Player
---@param time int
---@param intensity int
function shakePad(player, time, intensity) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTimeScale)
---
---@param gamespeed float
function setTimeScale(gamespeed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setFixedCameraPosition)
---
---@param positionX float
---@param positionY float
---@param positionZ float
---@param rotationX float
---@param rotationY float
---@param rotationZ float
function setFixedCameraPosition(positionX, positionY, positionZ, rotationX, rotationY, rotationZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/pointCameraAtPoint)
---
---@param pointAtX float
---@param pointAtY float
---@param pointAtZ float
---@param switchstyle int
function pointCameraAtPoint(pointAtX, pointAtY, pointAtZ, switchstyle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForCarOld)
---
---@param car Vehicle
---@param unused int
---@param visibility bool
---@return Marker marker
function addBlipForCarOld(car, unused, visibility) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForCharOld)
---
---@param ped Ped
---@param int2 int
---@param int3 int
---@return Marker marker
function addBlipForCharOld(ped, int2, int3) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeBlip)
---
---@param marker Marker
function removeBlip(marker) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/changeBlipColour)
---
---@param marker Marker
---@param color int
function changeBlipColour(marker, color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForCoordOld)
---
---@param atX float
---@param atY float
---@param atZ float
---@param color int
---@param flag int
---@return Marker marker
function addBlipForCoordOld(atX, atY, atZ, color, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/changeBlipScale)
---
---@param marker Marker
---@param size int
function changeBlipScale(marker, size) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setFadingColour)
---
---@param r int
---@param g int
---@param b int
function setFadingColour(r, g, b) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doFade)
---
---@param _in bool
---@param time int
function doFade(_in, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getFadingStatus)
---
---@return bool result
function getFadingStatus() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addHospitalRestart)
---
---@param atX float
---@param atY float
---@param atZ float
---@param angle float
---@param townNumber int
function addHospitalRestart(atX, atY, atZ, angle, townNumber) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addPoliceRestart)
---
---@param atX float
---@param atY float
---@param atZ float
---@param angle float
---@param townNumber int
function addPoliceRestart(atX, atY, atZ, angle, townNumber) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/overrideNextRestart)
---
---@param atX float
---@param atY float
---@param atZ float
---@param angle float
function overrideNextRestart(atX, atY, atZ, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/drawShadow)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharHeading)
---
---@param ped Ped
---@return float angle
function getCharHeading(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharHeading)
---
---@param ped Ped
---@param angle float
function setCharHeading(ped, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarHeading)
---
---@param car Vehicle
---@return float angle
function getCarHeading(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarHeading)
---
---@param car Vehicle
---@param angle float
function setCarHeading(car, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectHeading)
---
---@param object Object
---@return float angle
function getObjectHeading(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectHeading)
---
---@param object Object
---@param angle float
function setObjectHeading(object, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharTouchingObject)
---
---@param ped Ped
---@param object Object
---@return bool result
function isCharTouchingObject(ped, object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharAmmo)
---
---@param ped Ped
---@param weapon int
---@param ammo int
function setCharAmmo(ped, weapon, ammo) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/declareMissionFlag)
---
---@param flag VarId
function declareMissionFlag(flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForCar)
---
---@param car Vehicle
---@return Marker marker
function addBlipForCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForChar)
---
---@param ped Ped
---@return Marker marker
function addBlipForChar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForObject)
---
---@param object Object
---@return Marker marker
function addBlipForObject(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForCoord)
---
---@param atX float
---@param atY float
---@param atZ float
---@return Checkpoint checkpoint
function addBlipForCoord(atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/changeBlipDisplay)
---
---@param marker Marker
---@param mode int
function changeBlipDisplay(marker, mode) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addOneOffSound)
---
---@param atX float
---@param atY float
---@param atZ float
---@param sound int
function addOneOffSound(atX, atY, atZ, sound) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addContinuousSound)
---
---@param atX float
---@param atY float
---@param atZ float
---@param sound int
---@return int unk
function addContinuousSound(atX, atY, atZ, sound) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeSound)
---
---@param sound int
function removeSound(sound) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarStuckOnRoof)
---
---@param car Vehicle
---@return bool result
function isCarStuckOnRoof(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addUpsidedownCarCheck)
---
---@param car Vehicle
function addUpsidedownCarCheck(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeUpsidedownCarCheck)
---
---@param car Vehicle
function removeUpsidedownCarCheck(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAreaOnFoot2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAreaInCar2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInArea2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaOnFoot2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaInCar2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAreaOnFoot3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAreaInCar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInArea3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaOnFoot3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaInCar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarStoppedInArea2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarStoppedInArea3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCar2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCar2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/giveWeaponToChar)
---
---@param ped Ped
---@param weapon int
---@param ammo int
function giveWeaponToChar(ped, weapon, ammo) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerControl)
---
---@param player Player
---@param canMove bool
---@return bool result
function setPlayerControl(player, canMove) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/forceWeather)
---
---@param weather int
---@return bool result
function forceWeather(weather) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/forceWeatherNow)
---
---@param weather int
---@return bool result
function forceWeatherNow(weather) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/releaseWeather)
---
function releaseWeather() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCurrentCharWeapon)
---
---@param ped Ped
---@param weapon int
function setCurrentCharWeapon(ped, weapon) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectCoordinates)
---
---@param object Object
---@return bool result
---@return float positionX
---@return float positionY
---@return float positionZ
function getObjectCoordinates(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectCoordinates)
---
---@param object Object
---@param atX float
---@param atY float
---@param atZ float
---@return bool result
function setObjectCoordinates(object, atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getGameTimer)
---
---@return int timeMs
function getGameTimer() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/storeWantedLevel)
---
---@param player Player
---@return bool result
---@return int level
function storeWantedLevel(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarStopped)
---
---@param car Vehicle
---@return bool result
function isCarStopped(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/markCharAsNoLongerNeeded)
---
---@param ped Ped
function markCharAsNoLongerNeeded(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/markCarAsNoLongerNeeded)
---
---@param car Vehicle
function markCarAsNoLongerNeeded(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/markObjectAsNoLongerNeeded)
---
---@param object Object
function markObjectAsNoLongerNeeded(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dontRemoveChar)
---
---@param ped Ped
function dontRemoveChar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dontRemoveObject)
---
---@param object Object
function dontRemoveObject(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createCharAsPassenger)
---
---@param car Vehicle
---@param pedtype Model
---@param model int
---@param passengerSeat int
---@return bool result
---@return Ped ped
function createCharAsPassenger(car, pedtype, model, passengerSeat) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printWithNumberBig)
---
---@param gxtString GxtString
---@param number int
---@param time int
---@param style int
---@return bool result
function printWithNumberBig(gxtString, number, time, style) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printWithNumber)
---
---@param gxtString GxtString
---@param number int
---@param time int
---@param flag int
---@return bool result
function printWithNumber(gxtString, number, time, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printWithNumberNow)
---
---@param gxtString GxtString
---@param number int
---@param time int
---@param flag int
---@return bool result
function printWithNumberNow(gxtString, number, time, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchRoadsOn)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchRoadsOff)
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function switchRoadsOff(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumberOfPassengers)
---
---@param car Vehicle
---@return bool result
---@return int passengers
function getNumberOfPassengers(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getMaximumNumberOfPassengers)
---
---@param car Vehicle
---@return int maxPassengers
function getMaximumNumberOfPassengers(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarDensityMultiplier)
---
---@param multiplier float
---@return bool result
function setCarDensityMultiplier(multiplier) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarHeavy)
---
---@param car Vehicle
---@param heavy bool
---@return bool result
function setCarHeavy(car, heavy) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMaxWantedLevel)
---
---@param level int
function setMaxWantedLevel(level) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarInAirProper)
---
---@param car Vehicle
---@return bool result
function isCarInAirProper(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarUpsidedown)
---
---@param car Vehicle
---@return bool result
function isCarUpsidedown(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPlayerChar)
---
---@param player Player
---@return bool result
---@return Ped ped
function getPlayerChar(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/cancelOverrideRestart)
---
---@return bool result
function cancelOverrideRestart() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPoliceIgnorePlayer)
---
---@param player Player
---@param ignored bool
---@return bool result
function setPoliceIgnorePlayer(player, ignored) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startKillFrenzy)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/readKillFrenzyStatus)
---
---@return bool result
---@return int status
function readKillFrenzyStatus() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansCar2d)
---
---@param ped Ped
---@param car Vehicle
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharAnyMeansCar2d(ped, car, radiusX, radiusY, sphere) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFootCar2d)
---
---@param ped Ped
---@param car Vehicle
---@param radiusX float
---@param radiusY float
---@param flag bool
---@return bool result
function locateCharOnFootCar2d(ped, car, radiusX, radiusY, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharInCarCar2d)
---
---@param ped Ped
---@param car Vehicle
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharInCarCar2d(ped, car, radiusX, radiusY, sphere) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansCar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFootCar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharInCarCar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/lockCarDoors)
---
---@param car Vehicle
---@param status int
function lockCarDoors(car, status) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/explodeCar)
---
---@param car Vehicle
---@return bool result
function explodeCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addExplosion)
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius int
---@return bool result
function addExplosion(atX, atY, atZ, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarUpright)
---
---@param car Vehicle
---@return bool result
function isCarUpright(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createPickup)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasPickupBeenCollected)
---
---@param pickup Pickup
---@return bool result
function hasPickupBeenCollected(pickup) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removePickup)
---
---@param pickup Pickup
---@return bool result
function removePickup(pickup) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTaxiLights)
---
---@param taxi Vehicle
---@param light bool
---@return bool result
function setTaxiLights(taxi, light) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printBigQ)
---
---@param gxtString GxtString
---@param time int
---@param style int
---@return bool result
function printBigQ(gxtString, time, style) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTargetCarForMissionGarage)
---
---@param garage GxtString
---@param car Vehicle
---@return bool result
function setTargetCarForMissionGarage(garage, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/applyBrakesToPlayersCar)
---
---@param player Player
---@param apply bool
---@return bool result
function applyBrakesToPlayersCar(player, apply) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharHealth)
---
---@param ped Ped
---@param health int
function setCharHealth(ped, health) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarHealth)
---
---@param car Vehicle
---@param health int
function setCarHealth(car, health) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharHealth)
---
---@param ped Ped
---@return int health
function getCharHealth(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarHealth)
---
---@param car Vehicle
---@return int health
function getCarHealth(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/changeCarColour)
---
---@param car Vehicle
---@param primaryColor int
---@param secondaryColor int
---@return bool result
function changeCarColour(car, primaryColor, secondaryColor) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchPedRoadsOn)
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function switchPedRoadsOn(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchPedRoadsOff)
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function switchPedRoadsOff(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGangWeapons)
---
---@param gang int
---@param weapons1 int
---@param weapons2 int
---@param weapons3 int
function setGangWeapons(gang, weapons1, weapons2, weapons3) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharTouchingObjectOnFoot)
---
---@param ped Ped
---@param object Object
---@return bool result
function isCharTouchingObjectOnFoot(ped, object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadSpecialCharacter)
---
---@param gxtString GxtString
---@param id int
function loadSpecialCharacter(gxtString, id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasSpecialCharacterLoaded)
---
---@param id int
---@return bool result
function hasSpecialCharacterLoaded(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerInRemoteMode)
---
---@param player Player
---@return bool result
function isPlayerInRemoteMode(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCutsceneOffset)
---
---@param posX float
---@param posY float
---@param posZ float
function setCutsceneOffset(posX, posY, posZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setAnimGroupForChar)
---
---@param ped Ped
---@param style string
function setAnimGroupForChar(ped, style) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/requestModel)
---
---@param modelId Model
function requestModel(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasModelLoaded)
---
---@param modelId Model
---@return bool result
function hasModelLoaded(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/markModelAsNoLongerNeeded)
---
---@param modelId Model
function markModelAsNoLongerNeeded(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/drawCorona)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/storeClock)
---
function storeClock() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/restoreClock)
---
function restoreClock() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerPlaying)
---
---@param player Player
---@return bool result
function isPlayerPlaying(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getControllerMode)
---
---@return int mode
function getControllerMode() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCanResprayCar)
---
---@param car Vehicle
---@param sprayable bool
function setCanResprayCar(car, sprayable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/unloadSpecialCharacter)
---
---@param id int
function unloadSpecialCharacter(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/resetNumOfModelsKilledByPlayer)
---
---@param player Player
function resetNumOfModelsKilledByPlayer(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumOfModelsKilledByPlayer)
---
---@param player Player
---@param modelId Model
---@return int quantity
function getNumOfModelsKilledByPlayer(player, modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/activateGarage)
---
---@param garage GxtString
function activateGarage(garage) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createObjectNoOffset)
---
---@param modelId Model
---@param atX float
---@param atY float
---@param atZ float
---@return Object object
function createObjectNoOffset(modelId, atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStopped)
---
---@param ped Ped
---@return bool result
function isCharStopped(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchWidescreen)
---
---@param enable bool
function switchWidescreen(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addSpriteBlipForContactPoint)
---
---@param atX float
---@param atY float
---@param atZ float
---@param icon int
---@return Marker marker
function addSpriteBlipForContactPoint(atX, atY, atZ, icon) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addSpriteBlipForCoord)
---
---@param atX float
---@param atY float
---@param atZ float
---@param type int
---@return Marker marker
function addSpriteBlipForCoord(atX, atY, atZ, type) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharOnlyDamagedByPlayer)
---
---@param ped Ped
---@param enabled bool
function setCharOnlyDamagedByPlayer(ped, enabled) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarOnlyDamagedByPlayer)
---
---@param car Vehicle
---@param enabled bool
function setCarOnlyDamagedByPlayer(car, enabled) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharProofs)
---
---@param ped Ped
---@param BP bool
---@param FP bool
---@param EP bool
---@param CP bool
---@param MP bool
function setCharProofs(ped, BP, FP, EP, CP, MP) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarProofs)
---
---@param car Vehicle
---@param BP bool
---@param FP bool
---@param EP bool
---@param CP bool
---@param MP bool
function setCarProofs(car, BP, FP, EP, CP, MP) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/deactivateGarage)
---
---@param garage GxtString
function deactivateGarage(garage) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarInWater)
---
---@param car Vehicle
---@return bool result
function isCarInWater(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getClosestCharNode)
---
---@param closestToX float
---@param closestToY float
---@param closestToZ float
---@return float nodeX
---@return float nodeY
---@return float nodeZ
function getClosestCharNode(closestToX, closestToY, closestToZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getClosestCarNode)
---
---@param closestToX float
---@param closestToY float
---@param closestToZ float
---@return float nodeX
---@return float nodeY
---@return float nodeZ
function getClosestCarNode(closestToX, closestToY, closestToZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesAccurate)
---
---@param car Vehicle
---@param toX float
---@param toY float
---@param toZ float
function carGotoCoordinatesAccurate(car, toX, toY, toZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarOnScreen)
---
---@param car Vehicle
---@return bool result
function isCarOnScreen(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharOnScreen)
---
---@param ped Ped
---@return bool result
function isCharOnScreen(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectOnScreen)
---
---@param object Object
---@return bool result
function isObjectOnScreen(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getGroundZFor3dCoord)
---
---@param atX float
---@param atY float
---@param atZ float
---@return float z
function getGroundZFor3dCoord(atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startScriptFire)
---
---@param atX float
---@param atY float
---@param atZ float
---@param propagation int
---@param size int
---@return int fire
function startScriptFire(atX, atY, atZ, propagation, size) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isScriptFireExtinguished)
---
---@param fire int
---@return bool result
function isScriptFireExtinguished(fire) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeScriptFire)
---
---@param fire int
function removeScriptFire(fire) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/boatGotoCoords)
---
---@param boat Vehicle
---@param toX float
---@param toY float
---@param toZ float
function boatGotoCoords(boat, toX, toY, toZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/boatStop)
---
---@param car Vehicle
function boatStop(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharShootingInArea)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCurrentCharWeapon)
---
---@param ped Ped
---@param weapon int
---@return bool result
function isCurrentCharWeapon(ped, weapon) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setBoatCruiseSpeed)
---
---@param boat Vehicle
---@param speed float
function setBoatCruiseSpeed(boat, speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCharInZone)
---
---@param zone GxtString
---@param pedtype bool
---@param gang bool
---@param criminal_prostitute bool
---@return Ped ped
function getRandomCharInZone(zone, pedtype, gang, criminal_prostitute) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharShooting)
---
---@param ped Ped
---@return bool result
function isCharShooting(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createMoneyPickup)
---
---@param atX float
---@param atY float
---@param atZ float
---@param cash int
---@param permanenceFlag bool
---@return Pickup pickup
function createMoneyPickup(atX, atY, atZ, cash, permanenceFlag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharAccuracy)
---
---@param ped Ped
---@param accuracy int
function setCharAccuracy(ped, accuracy) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarSpeed)
---
---@param car Vehicle
---@return float speed
function getCarSpeed(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadCutscene)
---
---@param cutscene GxtString
function loadCutscene(cutscene) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createCutsceneObject)
---
---@param modelId Model
---@return Object object
function createCutsceneObject(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCutsceneAnim)
---
---@param cutscene int
---@param anim GxtString
function setCutsceneAnim(cutscene, anim) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startCutscene)
---
function startCutscene() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCutsceneTime)
---
---@return int time
function getCutsceneTime() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCutsceneFinished)
---
---@return bool result
function hasCutsceneFinished() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearCutscene)
---
function clearCutscene() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/restoreCameraJumpcut)
---
function restoreCameraJumpcut() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCollectable1Total)
---
---@param total int
function setCollectable1Total(total) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isProjectileInArea)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharModel)
---
---@param ped Ped
---@param modelId Model
---@return bool result
function isCharModel(ped, modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadSpecialModel)
---
---@param modelId Model
---@param gxtString GxtString
function loadSpecialModel(modelId, gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarForwardX)
---
---@param car Vehicle
---@return float forwardX
function getCarForwardX(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarForwardY)
---
---@param car Vehicle
---@return float forwardY
function getCarForwardY(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/changeGarageType)
---
---@param garage GxtString
---@param type int
function changeGarageType(garage, type) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printWith2NumbersNow)
---
---@param gxtString GxtString
---@param numbers1 int
---@param numbers2 int
---@param time int
---@param flag int
function printWith2NumbersNow(gxtString, numbers1, numbers2, time, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printWith3Numbers)
---
---@param gxtString GxtString
---@param numbers1 int
---@param numbers2 int
---@param numbers3 int
---@param time int
---@param flag int
function printWith3Numbers(gxtString, numbers1, numbers2, numbers3, time, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printWith4Numbers)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printWith4NumbersNow)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printWith6Numbers)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playerMadeProgress)
---
---@param progress int
function playerMadeProgress(progress) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setProgressTotal)
---
---@param maxProgress int
function setProgressTotal(maxProgress) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/registerMissionGiven)
---
function registerMissionGiven() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/registerMissionPassed)
---
---@param mission GxtString
function registerMissionPassed(mission) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeAllScriptFires)
---
function removeAllScriptFires() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByWeapon)
---
---@param ped Ped
---@param weapon int
---@return bool result
function hasCharBeenDamagedByWeapon(ped, weapon) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByWeapon)
---
---@param car Vehicle
---@param weapon int
---@return bool result
function hasCarBeenDamagedByWeapon(car, weapon) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/explodeCharHead)
---
---@param ped Ped
function explodeCharHead(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/anchorBoat)
---
---@param boat Vehicle
---@param anchor bool
function anchorBoat(boat, anchor) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startCarFire)
---
---@param car Vehicle
---@return int fire
function startCarFire(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startCharFire)
---
---@param ped Ped
---@return int fire
function startCharFire(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInArea)
---
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param modelId Model
---@return Vehicle car
function getRandomCarOfTypeInArea(cornerAX, cornerAY, cornerBX, cornerBY, modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasResprayHappened)
---
---@param car Vehicle
---@return bool result
function hasResprayHappened(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCameraZoom)
---
---@param mode int
function setCameraZoom(mode) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createPickupWithAmmo)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarRamCar)
---
---@param car Vehicle
---@param car2 Vehicle
function setCarRamCar(car, car2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerNeverGetsTired)
---
---@param player Player
---@param infiniteRun bool
function setPlayerNeverGetsTired(player, infiniteRun) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerFastReload)
---
---@param player Player
---@param fastReload bool
function setPlayerFastReload(player, fastReload) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharBleeding)
---
---@param ped Ped
---@param bleeding bool
function setCharBleeding(ped, bleeding) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setFreeResprays)
---
---@param enable bool
function setFreeResprays(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharVisible)
---
---@param ped Ped
---@param visible bool
function setCharVisible(ped, visible) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarVisible)
---
---@param car Vehicle
---@param visible bool
function setCarVisible(car, visible) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isAreaOccupied)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayText)
---
---@param posX float
---@param posY float
---@param gxtString GxtString
function displayText(posX, posY, gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextScale)
---
---@param sizeX float
---@param sizeY float
function setTextScale(sizeX, sizeY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextColour)
---
---@param r int
---@param g int
---@param b int
---@param a int
function setTextColour(r, g, b, a) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextJustify)
---
---@param alignJustify bool
function setTextJustify(alignJustify) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextCentre)
---
---@param centered bool
function setTextCentre(centered) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextWrapx)
---
---@param linewidth float
function setTextWrapx(linewidth) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextCentreSize)
---
---@param linewidth float
function setTextCentreSize(linewidth) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextBackground)
---
---@param background bool
function setTextBackground(background) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextProportional)
---
---@param proportional bool
function setTextProportional(proportional) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextFont)
---
---@param font int
function setTextFont(font) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/rotateObject)
---
---@param object Object
---@param fromAngle float
---@param toAngle float
---@param flag bool
---@return bool result
function rotateObject(object, fromAngle, toAngle, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/slideObject)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeCharElegantly)
---
---@param ped Ped
function removeCharElegantly(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharStayInSamePlace)
---
---@param ped Ped
---@param enabled bool
function setCharStayInSamePlace(ped, enabled) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isExplosionInArea)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/placeObjectRelativeToCar)
---
---@param object Object
---@param car Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
function placeObjectRelativeToCar(object, car, offsetX, offsetY, offsetZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/makeObjectTargettable)
---
---@param object Object
---@param targetable bool
function makeObjectTargettable(object, targetable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addArmourToChar)
---
---@param ped Ped
---@param points int
function addArmourToChar(ped, points) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/openGarage)
---
---@param garage GxtString
function openGarage(garage) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/closeGarage)
---
---@param garage GxtString
function closeGarage(garage) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/warpCharFromCarToCoord)
---
---@param ped Ped
---@param placeAtX float
---@param placeAtY float
---@param placeAtZ float
function warpCharFromCarToCoord(ped, placeAtX, placeAtY, placeAtZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setVisibilityOfClosestObjectOfType)
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
---@param modelId Model
---@param visibility bool
function setVisibilityOfClosestObjectOfType(atX, atY, atZ, radius, modelId, visibility) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCharSpottedChar)
---
---@param ped Ped
---@param ped2 Ped
---@return bool result
function hasCharSpottedChar(ped, ped2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasObjectBeenDamaged)
---
---@param object Object
---@return bool result
function hasObjectBeenDamaged(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/warpCharIntoCar)
---
---@param ped Ped
---@param car Vehicle
function warpCharIntoCar(ped, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printWith2NumbersBig)
---
---@param gxtString GxtString
---@param numbers1 int
---@param numbers2 int
---@param time int
---@param style int
function printWith2NumbersBig(gxtString, numbers1, numbers2, time, style) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCameraBehindPlayer)
---
function setCameraBehindPlayer() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createRandomChar)
---
---@param atX float
---@param atY float
---@param atZ float
---@return Ped ped
function createRandomChar(atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isSniperBulletInArea)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectVelocity)
---
---@param object Object
---@param velocityInDirectionX float
---@param velocityInDirectionY float
---@param velocityInDirectionZ float
function setObjectVelocity(object, velocityInDirectionX, velocityInDirectionY, velocityInDirectionZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectCollision)
---
---@param object Object
---@param collision bool
function setObjectCollision(object, collision) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printStringInStringNow)
---
---@param gxtString GxtString
---@param string GxtString
---@param time1 int
---@param time2 int
function printStringInStringNow(gxtString, string, time1, time2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPointObscuredByAMissionEntity)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadAllModelsNow)
---
function loadAllModelsNow() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addToObjectVelocity)
---
---@param object Object
---@param velocityX float
---@param velocityY float
---@param velocityZ float
function addToObjectVelocity(object, velocityX, velocityY, velocityZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/drawSprite)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/drawRect)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadSprite)
---
---@param name string
---@return int id
function loadSprite(name) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadTextureDictionary)
---
---@param txd zstring
---@return bool result
function loadTextureDictionary(txd) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeTextureDictionary)
---
function removeTextureDictionary() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectDynamic)
---
---@param object Object
---@param moveable bool
function setObjectDynamic(object, moveable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharAnimSpeed)
---
---@param ped Ped
---@param animation string
---@param speed float
function setCharAnimSpeed(ped, animation, speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playMissionPassedTune)
---
---@param music int
function playMissionPassedTune(music) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearArea)
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
---@param area bool
function clearArea(atX, atY, atZ, radius, area) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/freezeOnscreenTimer)
---
---@param timer bool
function freezeOnscreenTimer(timer) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchCarSiren)
---
---@param car Vehicle
---@param siren bool
function switchCarSiren(car, siren) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarWatertight)
---
---@param car Vehicle
---@param watertight bool
function setCarWatertight(car, watertight) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharCantBeDraggedOut)
---
---@param ped Ped
---@param locked bool
function setCharCantBeDraggedOut(ped, locked) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/turnCarToFaceCoord)
---
---@param car Vehicle
---@param coordX float
---@param coordY float
function turnCarToFaceCoord(car, coordX, coordY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/drawSphere)
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
function drawSphere(atX, atY, atZ, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarStatus)
---
---@param car Vehicle
---@param action int
function setCarStatus(car, action) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharMale)
---
---@param ped Ped
---@return bool result
function isCharMale(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/policeRadioMessage)
---
---@param float1 float
---@param float2 float
---@param float3 float
function policeRadioMessage(float1, float2, float3) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarStrong)
---
---@param car Vehicle
---@param strong bool
function setCarStrong(car, strong) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchRubbish)
---
---@param int1 bool
function switchRubbish(int1) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchStreaming)
---
---@param streaming bool
function switchStreaming(streaming) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isGarageOpen)
---
---@param garage GxtString
---@return bool result
function isGarageOpen(garage) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isGarageClosed)
---
---@param garage GxtString
---@return bool result
function isGarageClosed(garage) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/swapNearestBuildingModel)
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
---@param from Model
---@param to Model
function swapNearestBuildingModel(atX, atY, atZ, radius, from, to) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchWorldProcessing)
---
---@param cutsceneOnly bool
function switchWorldProcessing(cutsceneOnly) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearAreaOfCars)
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function clearAreaOfCars(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addSphere)
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
---@return int sphere
function addSphere(atX, atY, atZ, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeSphere)
---
---@param sphere int
function removeSphere(sphere) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setEveryoneIgnorePlayer)
---
---@param player Player
---@param ignored bool
function setEveryoneIgnorePlayer(player, ignored) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/storeCarCharIsInNoSave)
---
---@param ped Ped
---@return Vehicle car
function storeCarCharIsInNoSave(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayOnscreenTimerWithString)
---
---@param timer VarId
---@param type int
---@param gxtString GxtString
function displayOnscreenTimerWithString(timer, type, gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayOnscreenCounterWithString)
---
---@param var VarId
---@param type bool
---@param gxtString GxtString
function displayOnscreenCounterWithString(var, type, gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createRandomCarForCarPark)
---
---@param coordsX float
---@param coordsY float
---@param coordsZ float
---@param zAngle float
function createRandomCarForCarPark(coordsX, coordsY, coordsZ, zAngle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setWantedMultiplier)
---
---@param sensitivity float
function setWantedMultiplier(sensitivity) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCameraInFrontOfPlayer)
---
function setCameraInFrontOfPlayer() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarVisiblyDamaged)
---
---@param car Vehicle
---@return bool result
function isCarVisiblyDamaged(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesObjectExist)
---
---@param object Object
---@return bool result
function doesObjectExist(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadScene)
---
---@param atX float
---@param atY float
---@param atZ float
function loadScene(atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addStuckCarCheck)
---
---@param car Vehicle
---@param stuckCheckDistance float
---@param time int
function addStuckCarCheck(car, stuckCheckDistance, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeStuckCarCheck)
---
---@param car Vehicle
function removeStuckCarCheck(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarStuck)
---
---@param car Vehicle
---@return bool result
function isCarStuck(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadMissionAudio)
---
---@param asId int
---@param name int
function loadMissionAudio(asId, name) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasMissionAudioLoaded)
---
---@param id int
---@return bool result
function hasMissionAudioLoaded(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playMissionAudio)
---
---@param id int
function playMissionAudio(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasMissionAudioFinished)
---
---@param id int
---@return bool result
function hasMissionAudioFinished(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getClosestCarNodeWithHeading)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasImportGarageSlotBeenFilled)
---
---@param int1 int
---@param int2 int
---@return bool result
function hasImportGarageSlotBeenFilled(int1, int2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearThisPrint)
---
---@param text GxtString
function clearThisPrint(text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearThisBigPrint)
---
---@param text GxtString
function clearThisBigPrint(text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMissionAudioPosition)
---
---@param id int
---@param locationX float
---@param locationY float
---@param locationZ float
function setMissionAudioPosition(id, locationX, locationY, locationZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/activateSaveMenu)
---
function activateSaveMenu() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasSaveGameFinished)
---
---@return bool result
function hasSaveGameFinished() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/noSpecialCameraForThisGarage)
---
---@param int1 int
function noSpecialCameraForThisGarage(int1) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForPickup)
---
---@param pickup Pickup
---@return Marker marker
function addBlipForPickup(pickup) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPedDensityMultiplier)
---
---@param multiplier float
function setPedDensityMultiplier(multiplier) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextDrawBeforeFade)
---
---@param int1 bool
function setTextDrawBeforeFade(int1) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCollectable1sCollected)
---
---@return int collected
function getCollectable1sCollected() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setSpritesDrawBeforeFade)
---
---@param antialiased bool
function setSpritesDrawBeforeFade(antialiased) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextRightJustify)
---
---@param alignRight bool
function setTextRightJustify(alignRight) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printHelp)
---
---@param gxtString GxtString
function printHelp(gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearHelp)
---
function clearHelp() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/flashHudObject)
---
---@param hudComponent int
function flashHudObject(hudComponent) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGenerateCarsAroundCamera)
---
---@param int1 bool
function setGenerateCarsAroundCamera(int1) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearSmallPrints)
---
function clearSmallPrints() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpsidedownCarNotDamaged)
---
---@param car Vehicle
---@param disableFlippedExplosion bool
function setUpsidedownCarNotDamaged(car, disableFlippedExplosion) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerControllable)
---
---@param player Player
---@return bool result
function isPlayerControllable(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/makePlayerSafe)
---
---@param player Player
function makePlayerSafe(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarColours)
---
---@param car Vehicle
---@return int primaryColor
---@return int secondaryColor
function getCarColours(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setAllCarsCanBeDamaged)
---
---@param enable bool
function setAllCarsCanBeDamaged(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarCanBeDamaged)
---
---@param car Vehicle
---@param enable bool
function setCarCanBeDamaged(car, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setDrunkInputDelay)
---
---@param player Player
---@param handlingResponsiveness int
function setDrunkInputDelay(player, handlingResponsiveness) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharMoney)
---
---@param ped Ped
---@param money int
function setCharMoney(ped, money) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getOffsetFromObjectInWorldCoords)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getOffsetFromCarInWorldCoords)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearMissionAudio)
---
---@param id int
function clearMissionAudio(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setFreeHealthCare)
---
---@param player Player
---@param free bool
function setFreeHealthCare(player, free) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadAndLaunchMissionInternal)
---
---@param mission int
function loadAndLaunchMissionInternal(mission) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectDrawLast)
---
---@param object Object
---@param drawLast bool
function setObjectDrawLast(object, drawLast) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getAmmoInCharWeapon)
---
---@param ped Ped
---@param int int
---@return int ammo
function getAmmoInCharWeapon(ped, int) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setNearClip)
---
---@param clip float
function setNearClip(clip) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setRadioChannel)
---
---@param radioStation int
function setRadioChannel(radioStation) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarTraction)
---
---@param car Vehicle
---@param traction float
function setCarTraction(car, traction) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/areMeasurementsInMetres)
---
---@return bool result
function areMeasurementsInMetres() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/convertMetresToFeet)
---
---@param meters float
---@return float feet
function convertMetresToFeet(meters) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarAvoidLevelTransitions)
---
---@param car Vehicle
---@param avoidLevelTransitions bool
function setCarAvoidLevelTransitions(car, avoidLevelTransitions) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearAreaOfChars)
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function clearAreaOfChars(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTotalNumberOfMissions)
---
---@param totalMissions int
function setTotalNumberOfMissions(totalMissions) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/convertMetresToFeetInt)
---
---@param metric int
---@return int imperial
function convertMetresToFeetInt(metric) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/registerFastestTime)
---
---@param stat int
---@param to int
function registerFastestTime(stat, to) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/registerHighestScore)
---
---@param int1 int
---@param int2 int
function registerHighestScore(int1, int2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/warpCharIntoCarAsPassenger)
---
---@param ped Ped
---@param car Vehicle
---@param passengerSeat int
function warpCharIntoCarAsPassenger(ped, car, passengerSeat) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarPassengerSeatFree)
---
---@param car Vehicle
---@param seat int
---@return bool result
function isCarPassengerSeatFree(car, seat) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharInCarPassengerSeat)
---
---@param car Vehicle
---@param seat int
---@return Ped ped
function getCharInCarPassengerSeat(car, seat) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharIsChrisCriminal)
---
---@param ped Ped
---@param flag bool
function setCharIsChrisCriminal(ped, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startCredits)
---
function startCredits() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/stopCredits)
---
function stopCredits() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/areCreditsFinished)
---
---@return bool result
function areCreditsFinished() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMusicDoesFade)
---
---@param enable bool
function setMusicDoesFade(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarModel)
---
---@param veh Vehicle
---@return Model modelId
function getCarModel(veh) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/areAnyCarCheatsActivated)
---
---@return bool result
function areAnyCarCheatsActivated() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharSuffersCriticalHits)
---
---@param ped Ped
---@param enable bool
function setCharSuffersCriticalHits(ped, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharSittingInCar)
---
---@param ped Ped
---@param car Vehicle
---@return bool result
function isCharSittingInCar(ped, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharSittingInAnyCar)
---
---@param ped Ped
---@return bool result
function isCharSittingInAnyCar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharOnFoot)
---
---@param ped Ped
---@return bool result
function isCharOnFoot(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadSplashScreen)
---
---@param gxtString GxtString
function loadSplashScreen(gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setJamesCarOnPathToPlayer)
---
---@param int1 int
function setJamesCarOnPathToPlayer(int1) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectRotation)
---
---@param object Object
---@param rotationX float
---@param rotationY float
---@param rotationZ float
function setObjectRotation(object, rotationX, rotationY, rotationZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getDebugCameraCoordinates)
---
---@return float X
---@return float Y
---@return float Z
function getDebugCameraCoordinates() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerTargettingChar)
---
---@param player Player
---@param ped Ped
---@return bool result
function isPlayerTargettingChar(player, ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerTargettingObject)
---
---@param player Player
---@param object Object
---@return bool result
function isPlayerTargettingObject(player, object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayTextWithNumber)
---
---@param x float
---@param y float
---@param gxtString GxtString
---@param number int
function displayTextWithNumber(x, y, gxtString, number) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayTextWith2Numbers)
---
---@param x float
---@param y float
---@param gxtString GxtString
---@param numbersX int
---@param numbersY int
function displayTextWith2Numbers(x, y, gxtString, numbersX, numbersY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/failCurrentMission)
---
function failCurrentMission() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setInterpolationParameters)
---
---@param delay float
---@param time int
function setInterpolationParameters(delay, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getDebugCameraPointAt)
---
---@return float X
---@return float Y
---@return float Z
function getDebugCameraPointAt() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCharToCar)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/detachCharFromCar)
---
---@param ped Ped
function detachCharFromCar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarStayInFastLane)
---
---@param car Vehicle
---@param flag bool
function setCarStayInFastLane(car, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearCharLastWeaponDamage)
---
---@param ped Ped
function clearCharLastWeaponDamage(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearCarLastWeaponDamage)
---
---@param car Vehicle
function clearCarLastWeaponDamage(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCopInArea)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getDriverOfCar)
---
---@param car Vehicle
---@return Ped ped
function getDriverOfCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumberOfFollowers)
---
---@param ped Ped
---@return int followers
function getNumberOfFollowers(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/giveRemoteControlledModelToPlayer)
---
---@param player Player
---@param atX float
---@param atY float
---@param atZ float
---@param angle float
---@param RCModel Model
function giveRemoteControlledModelToPlayer(player, atX, atY, atZ, angle, RCModel) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCurrentCharWeapon)
---
---@param ped Ped
---@return int weapon
function getCurrentCharWeapon(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansObject2d)
---
---@param ped Ped
---@param object Object
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharAnyMeansObject2d(ped, object, radiusX, radiusY, sphere) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFootObject2d)
---
---@param ped Ped
---@param object Object
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharOnFootObject2d(ped, object, radiusX, radiusY, sphere) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharInCarObject2d)
---
---@param ped Ped
---@param object Object
---@param radiusX float
---@param radiusY float
---@param sphere bool
---@return bool result
function locateCharInCarObject2d(ped, object, radiusX, radiusY, sphere) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansObject3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFootObject3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharInCarObject3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarTempAction)
---
---@param car Vehicle
---@param action int
---@param time int
function setCarTempAction(car, action, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharOnAnyBike)
---
---@param ped Ped
---@return bool result
function isCharOnAnyBike(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/canCharSeeDeadChar)
---
---@param ped Ped
---@param pedtype int
---@return bool result
function canCharSeeDeadChar(ped, pedtype) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setEnterCarRangeMultiplier)
---
---@param float1 float
function setEnterCarRangeMultiplier(float1) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRemoteControlledCar)
---
---@param player Player
---@return Vehicle car
function getRemoteControlledCar(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPcVersion)
---
---@return bool result
function isPcVersion() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isModelAvailable)
---
---@param modelId Model
---@return bool result
function isModelAvailable(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/shutCharUp)
---
---@param ped Ped
---@param muted bool
function shutCharUp(ped, muted) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setEnableRcDetonate)
---
---@param detonation bool
function setEnableRcDetonate(detonation) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarRandomRouteSeed)
---
---@param car Vehicle
---@param routeSeed int
function setCarRandomRouteSeed(car, routeSeed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isAnyPickupAtCoords)
---
---@param pickupX float
---@param pickupY float
---@param pickupZ float
---@return bool result
function isAnyPickupAtCoords(pickupX, pickupY, pickupZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeAllCharWeapons)
---
---@param ped Ped
function removeAllCharWeapons(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCharGotWeapon)
---
---@param ped Ped
---@param weapon int
---@return bool result
function hasCharGotWeapon(ped, weapon) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTankDetonateCars)
---
---@param tank int
---@param detonate bool
function setTankDetonateCars(tank, detonate) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPositionOfAnalogueSticks)
---
---@param joystick int
---@return int offset1
---@return int offset2
---@return int offset3
---@return int offset4
function getPositionOfAnalogueSticks(joystick) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarOnFire)
---
---@param car Vehicle
---@return bool result
function isCarOnFire(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarTireBurst)
---
---@param car Vehicle
---@param tire int
---@return bool result
function isCarTireBurst(car, tire) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/initialiseObjectPath)
---
---@param int1 int
---@param float2 float
function initialiseObjectPath(int1, float2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectPathSpeed)
---
---@param int1 int
---@param int2 int
function setObjectPathSpeed(int1, int2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectPathPosition)
---
---@param int1 int
---@param float2 float
function setObjectPathPosition(int1, float2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearObjectPath)
---
---@param int1 int
function clearObjectPath(int1) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/heliGotoCoords)
---
---@param heli Vehicle
---@param toX float
---@param toY float
---@param toZ float
---@param altitudeMin float
---@param altitudeMax float
function heliGotoCoords(heli, toX, toY, toZ, altitudeMin, altitudeMax) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getDeadCharPickupCoords)
---
---@param ped Ped
---@return float coordsX
---@return float coordsY
---@return float coordsZ
function getDeadCharPickupCoords(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createProtectionPickup)
---
---@param atX float
---@param atY float
---@param atZ float
---@param int4 int
---@param int5 int
---@return Pickup pickup
function createProtectionPickup(atX, atY, atZ, int4, int5) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnyBoat)
---
---@param ped Ped
---@return bool result
function isCharInAnyBoat(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnyHeli)
---
---@param ped Ped
---@return bool result
function isCharInAnyHeli(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnyPlane)
---
---@param ped Ped
---@return bool result
function isCharInAnyPlane(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInWater)
---
---@param ped Ped
---@return bool result
function isCharInWater(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharWeaponInSlot)
---
---@param ped Ped
---@param slot int
---@return int weapon
---@return int ammo
---@return Model modelId
function getCharWeaponInSlot(ped, slot) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getClosestStraightRoad)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarForwardSpeed)
---
---@param car Vehicle
---@param speed float
function setCarForwardSpeed(car, speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setInteriorVisible)
---
---@param interior int
function setInteriorVisible(interior) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/markCarAsConvoyCar)
---
---@param car Vehicle
---@param convoy bool
function markCarAsConvoyCar(car, convoy) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/resetHavocCausedByPlayer)
---
---@param int1 int
function resetHavocCausedByPlayer(int1) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getHavocCausedByPlayer)
---
---@param int1 int
---@return int int2
function getHavocCausedByPlayer(int1) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createScriptRoadblock)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearAllScriptRoadblocks)
---
function clearAllScriptRoadblocks() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getOffsetFromCharInWorldCoords)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCharBeenPhotographed)
---
---@param ped Ped
---@return bool result
function hasCharBeenPhotographed(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchSecurityCamera)
---
---@param int1 bool
function switchSecurityCamera(int1) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInFlyingVehicle)
---
---@param ped Ped
---@return bool result
function isCharInFlyingVehicle(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addShortRangeSpriteBlipForCoord)
---
---@param atX float
---@param atY float
---@param atZ float
---@param icon int
---@return Marker marker
function addShortRangeSpriteBlipForCoord(atX, atY, atZ, icon) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeliOrientation)
---
---@param heli Vehicle
---@param angle float
function setHeliOrientation(heli, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearHeliOrientation)
---
---@param heli Vehicle
function clearHeliOrientation(heli) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/planeGotoCoords)
---
---@param plane int
---@param X float
---@param Y float
---@param Z float
---@param z1 float
---@param z2 float
function planeGotoCoords(plane, X, Y, Z, z1, z2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNthClosestCarNode)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/drawWeaponshopCorona)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setEnableRcDetonateOnContact)
---
---@param enable bool
function setEnableRcDetonateOnContact(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/freezeCharPosition)
---
---@param ped Ped
---@param locked bool
function freezeCharPosition(ped, locked) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharDrownsInWater)
---
---@param ped Ped
---@param drowns bool
function setCharDrownsInWater(ped, drowns) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectRecordsCollisions)
---
---@param object Object
---@param set bool
function setObjectRecordsCollisions(object, set) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasObjectCollidedWithAnything)
---
---@param object Object
---@return bool result
function hasObjectCollidedWithAnything(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeRcBuggy)
---
function removeRcBuggy() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharArmour)
---
---@param ped Ped
---@return int armour
function getCharArmour(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeliStabiliser)
---
---@param heli Vehicle
---@param limiter bool
function setHeliStabiliser(heli, limiter) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarStraightLineDistance)
---
---@param car Vehicle
---@param radius int
function setCarStraightLineDistance(car, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/popCarBoot)
---
---@param car Vehicle
function popCarBoot(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/shutPlayerUp)
---
---@param player Player
---@param shut bool
function shutPlayerUp(player, shut) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerMood)
---
---@param player Player
---@param flag int
---@param time int
function setPlayerMood(player, flag, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/requestCollision)
---
---@param X float
---@param Y float
function requestCollision(X, Y) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateObject2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/locateObject3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectInWater)
---
---@param object Object
---@return bool result
function isObjectInWater(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectInArea2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectInArea3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskToggleDuck)
---
---@param ped Ped
---@param crouch bool
function taskToggleDuck(ped, crouch) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/requestAnimation)
---
---@param animation string
function requestAnimation(animation) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasAnimationLoaded)
---
---@param animation string
---@return bool result
function hasAnimationLoaded(animation) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeAnimation)
---
---@param animation string
function removeAnimation(animation) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharWaitingForWorldCollision)
---
---@param ped Ped
---@return bool result
function isCharWaitingForWorldCollision(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarWaitingForWorldCollision)
---
---@param car Vehicle
---@return bool result
function isCarWaitingForWorldCollision(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCharToObject)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayNthOnscreenCounterWithString)
---
---@param text VarId
---@param type int
---@param line int
---@param gxtString GxtString
function displayNthOnscreenCounterWithString(text, type, line, gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addSetPiece)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setExtraColours)
---
---@param color int
---@param fade bool
function setExtraColours(color, fade) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearExtraColours)
---
---@param fade bool
function clearExtraColours(fade) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getWheelieStats)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/burstCarTire)
---
---@param car Vehicle
---@param tire int
function burstCarTire(car, tire) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerWearing)
---
---@param player Player
---@param bodypart string
---@param skin int
---@return bool result
function isPlayerWearing(player, bodypart, skin) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerCanDoDriveBy)
---
---@param player Player
---@param mode bool
function setPlayerCanDoDriveBy(player, mode) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createSwatRope)
---
---@param pedtype int
---@param modelId Model
---@param X float
---@param Y float
---@param Z float
---@return int handleAs
function createSwatRope(pedtype, modelId, X, Y, Z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarModelComponents)
---
---@param car Model
---@param variation1 int
---@param variation2 int
function setCarModelComponents(car, variation1, variation2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/closeAllCarDoors)
---
---@param car Vehicle
function closeAllCarDoors(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords2d)
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@return float distance
function getDistanceBetweenCoords2d(x1, y1, x2, y2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords3d)
---
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
---@return float distance
function getDistanceBetweenCoords3d(x1, y1, z1, x2, y2, z2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sortOutObjectCollisionWithCar)
---
---@param object Object
---@param car Vehicle
function sortOutObjectCollisionWithCar(object, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getMaxWantedLevel)
---
---@return int level
function getMaxWantedLevel() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printHelpForever)
---
---@param text GxtString
function printHelpForever(text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/printHelpForeverWithNumber)
---
---@param text GxtString
---@param number int
function printHelpForeverWithNumber(text, number) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createLockedPropertyPickup)
---
---@param pX float
---@param pY float
---@param pZ float
---@param gxtString GxtString
---@return Pickup pickup
function createLockedPropertyPickup(pX, pY, pZ, gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createForsalePropertyPickup)
---
---@param pX float
---@param pY float
---@param pZ float
---@param price int
---@param gxtString GxtString
---@return Pickup pickup
function createForsalePropertyPickup(pX, pY, pZ, price, gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/freezeCarPosition)
---
---@param car Vehicle
---@param locked bool
function freezeCarPosition(car, locked) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByChar)
---
---@param ped Ped
---@param byActor Ped
---@return bool result
function hasCharBeenDamagedByChar(ped, byActor) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByCar)
---
---@param ped Ped
---@param byCar Vehicle
---@return bool result
function hasCharBeenDamagedByCar(ped, byCar) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByChar)
---
---@param car Vehicle
---@param byActor Ped
---@return bool result
function hasCarBeenDamagedByChar(car, byActor) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByCar)
---
---@param car Vehicle
---@param byCar Vehicle
---@return bool result
function hasCarBeenDamagedByCar(car, byCar) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRadioChannel)
---
---@return int radio
function getRadioChannel() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharStayInCarWhenJacked)
---
---@param ped Ped
---@param stay bool
function setCharStayInCarWhenJacked(ped, stay) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerDrunkenness)
---
---@param player Player
---@param drunk int
function setPlayerDrunkenness(player, drunk) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInAreaNoSave)
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param modelId Model
---@return Vehicle car
function getRandomCarOfTypeInAreaNoSave(x1, y1, x2, y2, modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCanBurstCarTires)
---
---@param car Vehicle
---@param vulnerability bool
function setCanBurstCarTires(car, vulnerability) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/fireHunterGun)
---
---@param car Vehicle
function fireHunterGun(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharTouchingVehicle)
---
---@param ped Ped
---@param car Vehicle
---@return bool result
function isCharTouchingVehicle(ped, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharCanBeShotInVehicle)
---
---@param ped Ped
---@param can bool
function setCharCanBeShotInVehicle(ped, can) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadMissionText)
---
---@param table GxtString
function loadMissionText(table) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearCharLastDamageEntity)
---
---@param ped Ped
function clearCharLastDamageEntity(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearCarLastDamageEntity)
---
---@param car Vehicle
function clearCarLastDamageEntity(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/freezeObjectPosition)
---
---@param object Object
---@param freeze bool
function freezeObjectPosition(object, freeze) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeWeaponFromChar)
---
---@param ped Ped
---@param weapon int
function removeWeaponFromChar(ped, weapon) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/makePlayerFireProof)
---
---@param player Player
---@param fireproof bool
function makePlayerFireProof(player, fireproof) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/increasePlayerMaxHealth)
---
---@param player Player
---@param increase int
function increasePlayerMaxHealth(player, increase) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/increasePlayerMaxArmour)
---
---@param player Player
---@param increase int
function increasePlayerMaxArmour(player, increase) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createRandomCharAsDriver)
---
---@param car Vehicle
---@return Ped ped
function createRandomCharAsDriver(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createRandomCharAsPassenger)
---
---@param car Vehicle
---@param seat int
---@return Ped ped
function createRandomCharAsPassenger(car, seat) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/ensurePlayerHasDriveByWeapon)
---
---@param player Player
---@param ammo int
function ensurePlayerHasDriveByWeapon(player, ammo) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/makeHeliComeCrashingDown)
---
---@param heli Vehicle
function makeHeliComeCrashingDown(heli) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addExplosionNoSound)
---
---@param pX float
---@param pY float
---@param pZ float
---@param type int
function addExplosionNoSound(pX, pY, pZ, type) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/linkObjectToInterior)
---
---@param object Object
---@param interior int
function linkObjectToInterior(object, interior) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharNeverTargetted)
---
---@param ped Ped
---@param untargetable bool
function setCharNeverTargetted(ped, untargetable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/wasCutsceneSkipped)
---
---@return bool result
function wasCutsceneSkipped() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnyPoliceVehicle)
---
---@param ped Ped
---@return bool result
function isCharInAnyPoliceVehicle(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesCharExist)
---
---@param ped Ped
---@return bool result
function doesCharExist(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesVehicleExist)
---
---@param car Vehicle
---@return bool result
function doesVehicleExist(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addShortRangeSpriteBlipForContactPoint)
---
---@param pX float
---@param pY float
---@param pZ float
---@param icon int
---@return Marker blip
function addShortRangeSpriteBlipForContactPoint(pX, pY, pZ, icon) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setAllTaxisHaveNitro)
---
---@param toggle bool
function setAllTaxisHaveNitro(toggle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/freezeCarPositionAndDontLoadCollision)
---
---@param car Vehicle
---@param keep bool
function freezeCarPositionAndDontLoadCollision(car, keep) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/freezeCharPositionAndDontLoadCollision)
---
---@param ped Ped
---@param keep bool
function freezeCharPositionAndDontLoadCollision(ped, keep) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerIsInStadium)
---
---@param set bool
function setPlayerIsInStadium(set) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayRadar)
---
---@param enable bool
function displayRadar(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/registerBestPosition)
---
---@param stat int
---@param float float
function registerBestPosition(stat, float) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerInInfoZone)
---
---@param player Player
---@param zone GxtString
---@return bool result
function isPlayerInInfoZone(player, zone) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setLoadCollisionForCarFlag)
---
---@param car Vehicle
---@param enable bool
function setLoadCollisionForCarFlag(car, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setLoadCollisionForCharFlag)
---
---@param ped Ped
---@param enable bool
function setLoadCollisionForCharFlag(ped, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addBigGunFlash)
---
---@param fromX float
---@param fromY float
---@param fromZ float
---@param toX float
---@param toY float
---@param toZ float
function addBigGunFlash(fromX, fromY, fromZ, toX, toY, toZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getProgressPercentage)
---
---@return float progress
function getProgressPercentage() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleToFadeIn)
---
---@param car Vehicle
---@param flag int
function setVehicleToFadeIn(car, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/registerOddjobMissionPassed)
---
function registerOddjobMissionPassed() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerInShortcutTaxi)
---
---@param player Player
---@return bool result
function isPlayerInShortcutTaxi(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharDucking)
---
---@param ped Ped
---@return bool result
function isCharDucking(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setOnscreenCounterFlashWhenFirstDisplayed)
---
---@param text VarId
---@param flashing bool
function setOnscreenCounterFlashWhenFirstDisplayed(text, flashing) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/shuffleCardDecks)
---
---@param shuffle bool
function shuffleCardDecks(shuffle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/fetchNextCard)
---
---@return int card
function fetchNextCard() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectVelocity)
---
---@param object Object
---@return float vecX
---@return float vecY
---@return float vecZ
function getObjectVelocity(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isDebugCameraOn)
---
---@return bool result
function isDebugCameraOn() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addToObjectRotationVelocity)
---
---@param object Object
---@param vecX float
---@param vecY float
---@param vecZ float
function addToObjectRotationVelocity(object, vecX, vecY, vecZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectRotationVelocity)
---
---@param object Object
---@param vecX float
---@param vecY float
---@param vecZ float
function setObjectRotationVelocity(object, vecX, vecY, vecZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectStatic)
---
---@param object Object
---@return bool result
function isObjectStatic(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getAngleBetween2dVectors)
---
---@param vecX float
---@param vecY float
---@param vecX2 float
---@param vecY2 float
---@return float angle
function getAngleBetween2dVectors(vecX, vecY, vecX2, vecY2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/do2dRectanglesCollide)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectRotationVelocity)
---
---@param object Object
---@return float axisX
---@return float axisY
---@return float axisZ
function getObjectRotationVelocity(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addVelocityRelativeToObjectVelocity)
---
---@param object Object
---@param vecX float
---@param vecY float
---@param vecZ float
function addVelocityRelativeToObjectVelocity(object, vecX, vecY, vecZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectSpeed)
---
---@param object Object
---@return float speed
function getObjectSpeed(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/get2dLinesIntersectPoint)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskPause)
---
---@param ped Ped
---@param timeMS int
function taskPause(ped, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskStandStill)
---
---@param ped Ped
---@param timeMS int
function taskStandStill(ped, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFallAndGetUp)
---
---@param ped Ped
---@param int2 bool
---@param time int
function taskFallAndGetUp(ped, int2, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskJump)
---
---@param ped Ped
---@param jump bool
function taskJump(ped, jump) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskTired)
---
---@param ped Ped
---@param timeMS int
function taskTired(ped, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDie)
---
---@param ped Ped
function taskDie(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskLookAtChar)
---
---@param ped Ped
---@param lookAt int
---@param timeMS int
function taskLookAtChar(ped, lookAt, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskLookAtVehicle)
---
---@param ped Ped
---@param lookAt int
---@param timeMS int
function taskLookAtVehicle(ped, lookAt, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskSay)
---
---@param ped Ped
---@param audio int
function taskSay(ped, audio) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskShakeFist)
---
---@param ped Ped
function taskShakeFist(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskCower)
---
---@param ped Ped
function taskCower(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskHandsUp)
---
---@param ped Ped
---@param timeMS int
function taskHandsUp(ped, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDuck)
---
---@param ped Ped
---@param timeMS int
function taskDuck(ped, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskUseAtm)
---
---@param ped Ped
function taskUseAtm(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskScratchHead)
---
---@param ped Ped
function taskScratchHead(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskLookAbout)
---
---@param ped Ped
---@param timeMS int
function taskLookAbout(ped, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskEnterCarAsPassenger)
---
---@param ped Ped
---@param car Vehicle
---@param time int
---@param passengerSeat int
function taskEnterCarAsPassenger(ped, car, time, passengerSeat) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskEnterCarAsDriver)
---
---@param ped Ped
---@param car Vehicle
---@param timeMS int
function taskEnterCarAsDriver(ped, car, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskLeaveCar)
---
---@param ped Ped
---@param car Vehicle
function taskLeaveCar(ped, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskLeaveCarAndFlee)
---
---@param ped Ped
---@param car Vehicle
---@param X float
---@param Y float
---@param Z float
function taskLeaveCarAndFlee(ped, car, X, Y, Z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskCarDriveToCoord)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskCarDriveWander)
---
---@param ped Ped
---@param hijackCar Vehicle
---@param searchRadius float
---@param trafficBehavior int
function taskCarDriveWander(ped, hijackCar, searchRadius, trafficBehavior) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGoStraightToCoord)
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
---@param mode int
---@param time int
function taskGoStraightToCoord(ped, toX, toY, toZ, mode, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskAchieveHeading)
---
---@param ped Ped
---@param angle float
function taskAchieveHeading(ped, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/flushRoute)
---
function flushRoute() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/extendRoute)
---
---@param pointX float
---@param pointY float
---@param pointZ float
function extendRoute(pointX, pointY, pointZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFollowPointRoute)
---
---@param ped Ped
---@param flags1 int
---@param flags2 int
function taskFollowPointRoute(ped, flags1, flags2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGotoChar)
---
---@param ped Ped
---@param toActor Ped
---@param timelimit int
---@param stopWithinRadius float
function taskGotoChar(ped, toActor, timelimit, stopWithinRadius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFleePoint)
---
---@param ped Ped
---@param fromX float
---@param fromY float
---@param fromZ float
---@param awayRadius float
---@param timelimit int
function taskFleePoint(ped, fromX, fromY, fromZ, awayRadius, timelimit) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFleeChar)
---
---@param ped Ped
---@param fromActor Ped
---@param radius float
---@param timelimit int
function taskFleeChar(ped, fromActor, radius, timelimit) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskSmartFleePoint)
---
---@param ped Ped
---@param fromX float
---@param fromY float
---@param fromZ float
---@param stopAtRadius float
---@param timelimit int
function taskSmartFleePoint(ped, fromX, fromY, fromZ, stopAtRadius, timelimit) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskSmartFleeChar)
---
---@param ped Ped
---@param fromActor Ped
---@param originRadius float
---@param timelimit int
function taskSmartFleeChar(ped, fromActor, originRadius, timelimit) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskWanderStandard)
---
---@param ped Ped
function taskWanderStandard(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskKillCharOnFoot)
---
---@param ped Ped
---@param killActor Ped
function taskKillCharOnFoot(ped, killActor) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCar)
---
---@param car Vehicle
---@param path int
function startPlaybackRecordedCar(car, path) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/stopPlaybackRecordedCar)
---
---@param car Vehicle
function stopPlaybackRecordedCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/pausePlaybackRecordedCar)
---
---@param car Vehicle
function pausePlaybackRecordedCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/unpausePlaybackRecordedCar)
---
---@param car Vehicle
function unpausePlaybackRecordedCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarEscortCarLeft)
---
---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarLeft(car, followCar) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarEscortCarRight)
---
---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarRight(car, followCar) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarEscortCarRear)
---
---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarRear(car, followCar) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarEscortCarFront)
---
---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarFront(car, followCar) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFollowPathNodesToCoord)
---
---@param ped Ped
---@param pathX float
---@param pathY float
---@param pathZ float
---@param mode int
---@param time int
function taskFollowPathNodesToCoord(ped, pathX, pathY, pathZ, mode, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAngledArea2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaOnFoot2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaInCar2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledArea2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaOnFoot2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaInCar2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAngledArea3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaOnFoot3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaInCar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledArea3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaOnFoot3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaInCar3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInTaxi)
---
---@param ped Ped
---@return bool result
function isCharInTaxi(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGoToCoordAnyMeans)
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
---@param mode int
---@param useCar Vehicle
function taskGoToCoordAnyMeans(ped, toX, toY, toZ, mode, useCar) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getHeadingFromVector2d)
---
---@param pX float
---@param pY float
---@return float zAngle
function getHeadingFromVector2d(pX, pY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskPlayAnim)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadPathNodesInArea)
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
function loadPathNodesInArea(x1, y1, x2, y2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/releasePathNodes)
---
function releasePathNodes() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadCharDecisionMaker)
---
---@param type int
---@return int maker
function loadCharDecisionMaker(type) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharDecisionMaker)
---
---@param ped Ped
---@param maker int
function setCharDecisionMaker(ped, maker) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextDropshadow)
---
---@param shadow int
---@param r int
---@param g int
---@param b int
---@param a int
function setTextDropshadow(shadow, r, g, b, a) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlaybackGoingOnForCar)
---
---@param car Vehicle
---@return bool result
function isPlaybackGoingOnForCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setSenseRange)
---
---@param ped Ped
---@param accuracy float
function setSenseRange(ped, accuracy) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharPlayingAnim)
---
---@param ped Ped
---@param animation string
---@return bool result
function isCharPlayingAnim(ped, animation) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharAnimPlayingFlag)
---
---@param ped Ped
---@param animation string
---@param flag bool
function setCharAnimPlayingFlag(ped, animation, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharAnimCurrentTime)
---
---@param ped Ped
---@param animation string
---@return float time
function getCharAnimCurrentTime(ped, animation) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharAnimCurrentTime)
---
---@param ped Ped
---@param animation string
---@param time float
function setCharAnimCurrentTime(ped, animation, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/openSequenceTask)
---
---@return int task
function openSequenceTask() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/closeSequenceTask)
---
---@param task int
function closeSequenceTask(task) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/performSequenceTask)
---
---@param ped Ped
---@param task int
function performSequenceTask(ped, task) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharCollision)
---
---@param ped Ped
---@param enable bool
function setCharCollision(ped, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharAnimTotalTime)
---
---@param ped Ped
---@param animation string
---@return float totalTime
function getCharAnimTotalTime(ped, animation) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearSequenceTask)
---
---@param task int
function clearSequenceTask(task) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addAttractor)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearAttractor)
---
---@param handle int
function clearAttractor(handle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createCharAtAttractor)
---
---@param pedtype int
---@param modelId Model
---@param ASOrigin int
---@param task int
---@return Ped ped
function createCharAtAttractor(pedtype, modelId, ASOrigin, task) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskLeaveCarImmediately)
---
---@param ped Ped
---@param car Vehicle
function taskLeaveCarImmediately(ped, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/incrementIntStat)
---
---@param stat int
---@param add int
function incrementIntStat(stat, add) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/incrementFloatStat)
---
---@param stat int
---@param add float
function incrementFloatStat(stat, add) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/decrementIntStat)
---
---@param stat int
---@param int int
function decrementIntStat(stat, int) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/decrementFloatStat)
---
---@param stat int
---@param float float
function decrementFloatStat(stat, float) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/registerIntStat)
---
---@param stat int
---@param int int
function registerIntStat(stat, int) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/registerFloatStat)
---
---@param stat int
---@param value float
function registerFloatStat(stat, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setIntStat)
---
---@param stat int
---@param int int
function setIntStat(stat, int) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setFloatStat)
---
---@param stat int
---@param float float
function setFloatStat(stat, float) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getScriptTaskStatus)
---
---@param ped Ped
---@param task int
---@return int status
function getScriptTaskStatus(ped, task) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createGroup)
---
---@param type int
---@return int group
function createGroup(type) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupLeader)
---
---@param group int
---@param ped Ped
function setGroupLeader(group, ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupMember)
---
---@param group int
---@param ped Ped
function setGroupMember(group, ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeGroup)
---
---@param group int
function removeGroup(group) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskLeaveAnyCar)
---
---@param ped Ped
function taskLeaveAnyCar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskKillCharOnFootWhileDucking)
---
---@param ped Ped
---@param weapon int
---@param flags int
---@param time int
---@param chance int
function taskKillCharOnFootWhileDucking(ped, weapon, flags, time, chance) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskAimGunAtChar)
---
---@param ped Ped
---@param aimAt int
---@param timeMS int
function taskAimGunAtChar(ped, aimAt, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGoToCoordWhileShooting)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskStayInSamePlace)
---
---@param ped Ped
---@param stay bool
function taskStayInSamePlace(ped, stay) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskTurnCharToFaceChar)
---
---@param ped Ped
---@param rotateTo int
function taskTurnCharToFaceChar(ped, rotateTo) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharAtScriptedAttractor)
---
---@param ped Ped
---@param origin int
---@return bool result
function isCharAtScriptedAttractor(ped, origin) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setSequenceToRepeat)
---
---@param pack int
---@param loop bool
function setSequenceToRepeat(pack, loop) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getSequenceProgress)
---
---@param ped Ped
---@return int progess
function getSequenceProgress(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearLookAt)
---
---@param ped Ped
function clearLookAt(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setFollowNodeThresholdDistance)
---
---@param ped Ped
---@param dist float
function setFollowNodeThresholdDistance(ped, dist) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createFxSystem)
---
---@param particle string
---@param pX float
---@param pY float
---@param pZ float
---@param type int
---@return Particle particle
function createFxSystem(particle, pX, pY, pZ, type) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playFxSystem)
---
---@param particle Particle
function playFxSystem(particle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/stopFxSystem)
---
---@param particle Particle
function stopFxSystem(particle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playAndKillFxSystem)
---
---@param particle Particle
function playAndKillFxSystem(particle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/killFxSystem)
---
---@param particle Particle
function killFxSystem(particle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getIntStat)
---
---@param stat int
---@return int stat
function getIntStat(stat) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getFloatStat)
---
---@param stat int
---@return float stat
function getFloatStat(stat) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectRenderScorched)
---
---@param object Object
---@param fireproof bool
function setObjectRenderScorched(object, fireproof) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskLookAtObject)
---
---@param ped Ped
---@param lookAt int
---@param timeMS int
function taskLookAtObject(ped, lookAt, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/limitAngle)
---
---@param angle float
---@return float float
function limitAngle(angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/openCarDoor)
---
---@param car Vehicle
---@param door int
function openCarDoor(car, door) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPickupCoordinates)
---
---@param pickup Pickup
---@return float X
---@return float Y
---@return float Z
function getPickupCoordinates(pickup) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeDecisionMaker)
---
---@param maker int
function removeDecisionMaker(maker) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharModel)
---
---@param ped Ped
---@return Model modelId
function getCharModel(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskAimGunAtCoord)
---
---@param ped Ped
---@param atX float
---@param atY float
---@param atZ float
---@param timeMS int
function taskAimGunAtCoord(ped, atX, atY, atZ, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskShootAtCoord)
---
---@param ped Ped
---@param atX float
---@param atY float
---@param atZ float
---@param timeMS int
function taskShootAtCoord(ped, atX, atY, atZ, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createFxSystemOnChar)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createFxSystemOnCharWithDirection)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createFxSystemOnCar)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createFxSystemOnCarWithDirection)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createFxSystemOnObject)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createFxSystemOnObjectWithDirection)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDestroyCar)
---
---@param ped Ped
---@param car Vehicle
function taskDestroyCar(ped, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDiveAndGetUp)
---
---@param ped Ped
---@param toOffsetX float
---@param toOffsetY float
---@param time int
function taskDiveAndGetUp(ped, toOffsetX, toOffsetY, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/customPlateForNextCar)
---
---@param modelId Model
---@param numberplate string
function customPlateForNextCar(modelId, numberplate) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskShuffleToNextCarSeat)
---
---@param ped Ped
---@param car Vehicle
function taskShuffleToNextCarSeat(ped, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskChatWithChar)
---
---@param ped Ped
---@param withActor int
---@param flag bool
---@param unknownFlag int
function taskChatWithChar(ped, withActor, flag, unknownFlag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCameraToVehicle)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCameraToVehicleLookAtVehicle)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCameraToVehicleLookAtChar)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCameraToChar)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCameraToCharLookAtChar)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/forceCarLights)
---
---@param car Vehicle
---@param lights int
function forceCarLights(car, lights) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addPedtypeAsAttractorUser)
---
---@param ASOrigin int
---@param pedtype int
function addPedtypeAsAttractorUser(ASOrigin, pedtype) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachObjectToCar)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/detachObject)
---
---@param object Object
---@param X float
---@param Y float
---@param Z float
---@param collisionDetection bool
function detachObject(object, X, Y, Z, collisionDetection) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCarToCar)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/detachCar)
---
---@param car Vehicle
---@param X float
---@param Y float
---@param Z float
---@param collisionDetection bool
function detachCar(car, X, Y, Z, collisionDetection) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectAttached)
---
---@param object Object
---@return bool result
function isObjectAttached(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isVehicleAttached)
---
---@param car Vehicle
---@return bool result
function isVehicleAttached(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearCharTasks)
---
---@param ped Ped
function clearCharTasks(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskTogglePedThreatScanner)
---
---@param ped Ped
---@param unknownFlag1 bool
---@param unknownFlag2 bool
---@param unknownFlag3 bool
function taskTogglePedThreatScanner(ped, unknownFlag1, unknownFlag2, unknownFlag3) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/popCarDoor)
---
---@param car Vehicle
---@param door int
---@param visible bool
function popCarDoor(car, door, visible) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/fixCarDoor)
---
---@param car Vehicle
---@param door int
function fixCarDoor(car, door) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskEveryoneLeaveCar)
---
---@param car Vehicle
function taskEveryoneLeaveCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerTargettingAnything)
---
---@param player Player
---@return bool result
function isPlayerTargettingAnything(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getActiveCameraCoordinates)
---
---@return float X
---@return float Y
---@return float Z
function getActiveCameraCoordinates() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getActiveCameraPointAt)
---
---@return float X
---@return float Y
---@return float Z
function getActiveCameraPointAt() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/popCarPanel)
---
---@param car Vehicle
---@param component int
---@param effectFlag bool
function popCarPanel(car, component, effectFlag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/fixCarPanel)
---
---@param car Vehicle
---@param componentB int
function fixCarPanel(car, componentB) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/fixCarTire)
---
---@param car Vehicle
---@param tire int
function fixCarTire(car, tire) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachObjectToObject)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachObjectToChar)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarSpeedVector)
---
---@param car Vehicle
---@return float vecX
---@return float vecY
---@return float vecZ
function getCarSpeedVector(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarMass)
---
---@param car Vehicle
---@return float mass
function getCarMass(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDiveFromAttachmentAndGetUp)
---
---@param ped Ped
---@param timeMS int
function taskDiveFromAttachmentAndGetUp(ped, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCharToBike)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGotoCharOffset)
---
---@param ped Ped
---@param toActor int
---@param timelimit int
---@param approachDistance float
---@param approachAngle float
function taskGotoCharOffset(ped, toActor, timelimit, approachDistance, approachAngle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskLookAtCoord)
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
---@param timeMS int
function taskLookAtCoord(ped, toX, toY, toZ, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hideCharWeaponForScriptedCutscene)
---
---@param ped Ped
---@param hide bool
function hideCharWeaponForScriptedCutscene(ped, hide) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharSpeed)
---
---@param ped Ped
---@return float speed
function getCharSpeed(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupDecisionMaker)
---
---@param group int
---@param maker int
function setGroupDecisionMaker(group, maker) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadGroupDecisionMaker)
---
---@param type int
---@return int maker
function loadGroupDecisionMaker(type) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/disablePlayerSprint)
---
---@param player Player
---@param mode bool
function disablePlayerSprint(player, mode) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskSitDown)
---
---@param ped Ped
---@param timeMS int
function taskSitDown(ped, timeMS) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createSearchlight)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/deleteSearchlight)
---
---@param searchlight Searchlight
function deleteSearchlight(searchlight) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesSearchlightExist)
---
---@param searchlight Searchlight
---@return bool result
function doesSearchlightExist(searchlight) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/moveSearchlightBetweenCoords)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/pointSearchlightAtCoord)
---
---@param searchlight Searchlight
---@param toX float
---@param toY float
---@param toZ float
---@param speed float
function pointSearchlightAtCoord(searchlight, toX, toY, toZ, speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/pointSearchlightAtChar)
---
---@param searchlight Searchlight
---@param ped Ped
---@param speed float
function pointSearchlightAtChar(searchlight, ped, speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInSearchlight)
---
---@param searchlight Searchlight
---@param ped Ped
---@return bool result
function isCharInSearchlight(searchlight, ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCutsceneLoaded)
---
---@return bool result
function hasCutsceneLoaded() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskTurnCharToFaceCoord)
---
---@param ped Ped
---@param atX float
---@param atY float
---@param atZ float
function taskTurnCharToFaceCoord(ped, atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDrivePointRoute)
---
---@param ped Ped
---@param car Vehicle
---@param speed float
function taskDrivePointRoute(ped, car, speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/fireSingleBullet)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isLineOfSightClear)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarRoll)
---
---@param car Vehicle
---@return float roll
function getCarRoll(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/pointSearchlightAtVehicle)
---
---@param searchlight Searchlight
---@param car Vehicle
---@param speed float
function pointSearchlightAtVehicle(searchlight, car, speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isVehicleInSearchlight)
---
---@param int int
---@param car Vehicle
---@return bool result
function isVehicleInSearchlight(int, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createSearchlightOnVehicle)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGoToCoordWhileAiming)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumberOfFiresInRange)
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
---@return int num
function getNumberOfFiresInRange(atX, atY, atZ, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForSearchlight)
---
---@param searchlight Searchlight
---@return Marker marker
function addBlipForSearchlight(searchlight) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/skipToEndAndStopPlaybackRecordedCar)
---
---@param car Vehicle
function skipToEndAndStopPlaybackRecordedCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskCarTempAction)
---
---@param ped Ped
---@param car Vehicle
---@param performAction int
---@param timelimit int
function taskCarTempAction(ped, car, performAction, timelimit) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setLaRiots)
---
---@param enable bool
function setLaRiots(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeCharFromGroup)
---
---@param ped Ped
function removeCharFromGroup(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachSearchlightToSearchlightObject)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchEmergencyServices)
---
---@param enable bool
function switchEmergencyServices(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createCheckpoint)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/deleteCheckpoint)
---
---@param checkpoint Checkpoint
function deleteCheckpoint(checkpoint) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchRandomTrains)
---
---@param enable bool
function switchRandomTrains(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createMissionTrain)
---
---@param type int
---@param atX float
---@param atY float
---@param atZ float
---@param direction bool
---@return Vehicle train
function createMissionTrain(type, atX, atY, atZ, direction) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/deleteMissionTrains)
---
function deleteMissionTrains() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/markMissionTrainsAsNoLongerNeeded)
---
function markMissionTrainsAsNoLongerNeeded() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/deleteAllTrains)
---
function deleteAllTrains() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTrainSpeed)
---
---@param train Vehicle
---@param speed float
function setTrainSpeed(train, speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTrainCruiseSpeed)
---
---@param train Vehicle
---@param speed float
function setTrainCruiseSpeed(train, speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getTrainCaboose)
---
---@param train Vehicle
---@return int caboose
function getTrainCaboose(train) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/deletePlayer)
---
---@param player Player
function deletePlayer(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTwoPlayerCameraMode)
---
---@param mode bool
function setTwoPlayerCameraMode(mode) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskCarMission)
---
---@param ped Ped
---@param car Vehicle
---@param targetCar int
---@param order int
---@param maxSpeed float
---@param trafficFlag int
function taskCarMission(ped, car, targetCar, order, maxSpeed, trafficFlag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGoToObject)
---
---@param ped Ped
---@param toObject int
---@param timelimit int
---@param stopWithinRadius float
function taskGoToObject(ped, toObject, timelimit, stopWithinRadius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskWeaponRoll)
---
---@param ped Ped
---@param roll bool
function taskWeaponRoll(ped, roll) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskCharArrestChar)
---
---@param ped Ped
---@param bustActor int
function taskCharArrestChar(ped, bustActor) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getAvailableVehicleMod)
---
---@param car Vehicle
---@param poolIndex int
---@return Model itemID
function getAvailableVehicleMod(car, poolIndex) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getVehicleModType)
---
---@param component Model
---@return int type
function getVehicleModType(component) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addVehicleMod)
---
---@param car Vehicle
---@param component Model
---@return int componentId
function addVehicleMod(car, component) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeVehicleMod)
---
---@param car Vehicle
---@param componentId int
function removeVehicleMod(car, componentId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/requestVehicleMod)
---
---@param component Model
function requestVehicleMod(component) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasVehicleModLoaded)
---
---@param component Model
---@return bool result
function hasVehicleModLoaded(component) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/markVehicleModAsNoLongerNeeded)
---
---@param component Model
function markVehicleModAsNoLongerNeeded(component) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumAvailablePaintjobs)
---
---@param car Vehicle
---@return int num
function getNumAvailablePaintjobs(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/giveVehiclePaintjob)
---
---@param set int
---@param paintjob int
function giveVehiclePaintjob(set, paintjob) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isGroupMember)
---
---@param ped Ped
---@param group int
---@return bool result
function isGroupMember(ped, group) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isGroupLeader)
---
---@param ped Ped
---@param group int
---@return bool result
function isGroupLeader(ped, group) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupSeparationRange)
---
---@param group int
---@param range float
function setGroupSeparationRange(group, range) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/limitTwoPlayerDistance)
---
---@param distance float
function limitTwoPlayerDistance(distance) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/releaseTwoPlayerDistance)
---
function releaseTwoPlayerDistance() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerPlayerTargetting)
---
---@param can bool
function setPlayerPlayerTargetting(can) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getScriptFireCoords)
---
---@param fire int
---@return float X
---@return float Y
---@return float Z
function getScriptFireCoords(fire) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNthClosestCarNodeWithHeading)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayersCanBeInSeparateCars)
---
---@param allow bool
function setPlayersCanBeInSeparateCars(allow) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesCarHaveStuckCarCheck)
---
---@param car Vehicle
---@return bool result
function doesCarHaveStuckCarCheck(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlaybackSpeed)
---
---@param car Vehicle
---@param speed float
function setPlaybackSpeed(car, speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/areAnyCharsNearChar)
---
---@param ped Ped
---@param range float
---@return bool result
function areAnyCharsNearChar(ped, range) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/skipCutsceneEnd)
---
function skipCutsceneEnd() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPercentageTaggedInArea)
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@return int percentage
function getPercentageTaggedInArea(x1, y1, x2, y2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTagStatusInArea)
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
---@param value bool
function setTagStatusInArea(x1, y1, x2, y2, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesRacing)
---
---@param car Vehicle
---@param toX float
---@param toY float
---@param toZ float
function carGotoCoordinatesRacing(car, toX, toY, toZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCarUsingAi)
---
---@param car Vehicle
---@param path int
function startPlaybackRecordedCarUsingAi(car, path) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/skipInPlaybackRecordedCar)
---
---@param car Vehicle
---@param path float
function skipInPlaybackRecordedCar(car, path) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearCharDecisionMakerEventResponse)
---
---@param maker int
---@param event int
function clearCharDecisionMakerEventResponse(maker, event) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addCharDecisionMakerEventResponse)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskPickUpObject)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dropObject)
---
---@param ped Ped
---@param object bool
function dropObject(ped, object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/explodeCarInCutscene)
---
---@param car Vehicle
function explodeCarInCutscene(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/buildPlayerModel)
---
---@param player Player
function buildPlayerModel(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/planeAttackPlayer)
---
---@param hydra int
---@param car Vehicle
---@param radius float
function planeAttackPlayer(hydra, car, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/planeFlyInDirection)
---
---@param plane int
---@param direction float
---@param altitudemin float
---@param altitudemax float
function planeFlyInDirection(plane, direction, altitudemin, altitudemax) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/planeFollowEntity)
---
---@param plane int
---@param ped Ped
---@param car Vehicle
---@param radius float
function planeFollowEntity(plane, ped, car, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDriveBy)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarStayInSlowLane)
---
---@param car Vehicle
---@param stay bool
function setCarStayInSlowLane(car, stay) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/takeRemoteControlOfCar)
---
---@param player Player
---@param car Vehicle
function takeRemoteControlOfCar(player, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isClosestObjectOfTypeSmashedOrDamaged)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startSettingUpConversation)
---
---@param ped Ped
function startSettingUpConversation(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/finishSettingUpConversation)
---
function finishSettingUpConversation() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isConversationAtNode)
---
---@param ped Ped
---@param gxtString GxtString
---@return bool result
function isConversationAtNode(ped, gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectHealth)
---
---@param object Object
---@return int health
function getObjectHealth(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectHealth)
---
---@param object Object
---@param health int
function setObjectHealth(object, health) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/breakObject)
---
---@param object Object
---@param intensity int
function breakObject(object, intensity) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/heliAttackPlayer)
---
---@param heli Vehicle
---@param player Player
---@param radius float
function heliAttackPlayer(heli, player, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/heliFollowEntity)
---
---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param radius float
function heliFollowEntity(heli, ped, car, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/policeHeliChaseEntity)
---
---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param radius float
function policeHeliChaseEntity(heli, ped, car, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskUseMobilePhone)
---
---@param ped Ped
---@param hold bool
function taskUseMobilePhone(ped, hold) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskWarpCharIntoCarAsDriver)
---
---@param ped Ped
---@param car Vehicle
function taskWarpCharIntoCarAsDriver(ped, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskWarpCharIntoCarAsPassenger)
---
---@param ped Ped
---@param car Vehicle
---@param passengerseat int
function taskWarpCharIntoCarAsPassenger(ped, car, passengerseat) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchCopsOnBikes)
---
---@param generate bool
function switchCopsOnBikes(generate) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isFlameInAngledArea2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isFlameInAngledArea3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addStuckCarCheckWithWarp)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/damageCarPanel)
---
---@param car Vehicle
---@param door int
function damageCarPanel(car, door) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarRoll)
---
---@param car Vehicle
---@param roll float
function setCarRoll(car, roll) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/suppressCarModel)
---
---@param modelId Model
---@return bool result
function suppressCarModel(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dontSuppressCarModel)
---
---@param modelId Model
function dontSuppressCarModel(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dontSuppressAnyCarModels)
---
function dontSuppressAnyCarModels() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPs2KeyboardKeyPressed)
---
---@param key int
---@return bool result
function isPs2KeyboardKeyPressed(key) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPs2KeyboardKeyJustPressed)
---
---@param key int
---@return bool result
function isPs2KeyboardKeyJustPressed(key) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharHoldingObject)
---
---@param ped Ped
---@param liftingObject int
---@return bool result
function isCharHoldingObject(ped, liftingObject) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarCanGoAgainstTraffic)
---
---@param car Vehicle
---@param can bool
function setCarCanGoAgainstTraffic(car, can) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/damageCarDoor)
---
---@param car Vehicle
---@param door int
function damageCarDoor(car, door) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCarInSphereNoSave)
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@param model int
---@return Vehicle car
function getRandomCarInSphereNoSave(X, Y, Z, radius, model) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCharInSphere)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCharBeenArrested)
---
---@param ped Ped
---@return bool result
function hasCharBeenArrested(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlaneThrottle)
---
---@param plane int
---@param throttle float
function setPlaneThrottle(plane, throttle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/heliLandAtCoords)
---
---@param heli Vehicle
---@param X float
---@param Y float
---@param Z float
---@param minaltitude float
---@param maxaltitude float
function heliLandAtCoords(heli, X, Y, Z, minaltitude, maxaltitude) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/planeStartsInAir)
---
---@param hydra int
function planeStartsInAir(hydra) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setRelationship)
---
---@param acquaintance int
---@param pedtype int
---@param toPedtype int
function setRelationship(acquaintance, pedtype, toPedtype) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearRelationship)
---
---@param acquaintance int
---@param pedtype int
---@param toPedtype int
function clearRelationship(acquaintance, pedtype, toPedtype) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearGroupDecisionMakerEventResponse)
---
---@param maker int
---@param event int
function clearGroupDecisionMakerEventResponse(maker, event) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addGroupDecisionMakerEventResponse)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/drawSpriteWithRotation)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskUseAttractor)
---
---@param ped Ped
---@param attractor int
function taskUseAttractor(ped, attractor) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskShootAtChar)
---
---@param ped Ped
---@param atActor int
---@param timelimit int
function taskShootAtChar(ped, atActor, timelimit) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setInformRespectedFriends)
---
---@param flags int
---@param radius float
---@param pedsToScan int
function setInformRespectedFriends(flags, radius, pedsToScan) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharRespondingToEvent)
---
---@param ped Ped
---@param event int
---@return bool result
function isCharRespondingToEvent(ped, event) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectVisible)
---
---@param object Object
---@param visibility bool
function setObjectVisible(object, visibility) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFleeCharAnyMeans)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/flushPatrolRoute)
---
function flushPatrolRoute() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/extendPatrolRoute)
---
---@param X float
---@param Y float
---@param Z float
---@param animation string
---@param IFPFile string
function extendPatrolRoute(X, Y, Z, animation, IFPFile) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playObjectAnim)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setRadarZoom)
---
---@param zoom int
function setRadarZoom(zoom) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesBlipExist)
---
---@param marker Marker
---@return bool result
function doesBlipExist(marker) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadPrices)
---
---@param shopping GxtString
function loadPrices(shopping) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadShop)
---
---@param shopping GxtString
function loadShop(shopping) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumberOfItemsInShop)
---
---@return int num
function getNumberOfItemsInShop() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getItemInShop)
---
---@param index int
---@return int item
function getItemInShop(index) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPriceOfItem)
---
---@param item int
---@return int price
function getPriceOfItem(item) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDead)
---
---@param ped Ped
function taskDead(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarAsMissionCar)
---
---@param car Vehicle
function setCarAsMissionCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setZonePopulationType)
---
---@param zone GxtString
---@param popcycle int
function setZonePopulationType(zone, popcycle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setZoneDealerStrength)
---
---@param zone GxtString
---@param density int
function setZoneDealerStrength(zone, density) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getZoneDealerStrength)
---
---@param zone GxtString
---@return int strength
function getZoneDealerStrength(zone) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setZoneGangStrength)
---
---@param zone GxtString
---@param gang int
---@param density int
function setZoneGangStrength(zone, gang, density) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getZoneGangStrength)
---
---@param zone GxtString
---@param gang int
---@return int density
function getZoneGangStrength(zone, gang) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isMessageBeingDisplayed)
---
---@return bool result
function isMessageBeingDisplayed() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharIsTargetPriority)
---
---@param ped Ped
---@param targetPriority bool
function setCharIsTargetPriority(ped, targetPriority) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/customPlateDesignForNextCar)
---
---@param modelNumplate Model
---@param townTexture int
function customPlateDesignForNextCar(modelNumplate, townTexture) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGotoCar)
---
---@param ped Ped
---@param car Vehicle
---@param timeMS int
---@param stopAtDistance float
function taskGotoCar(ped, car, timeMS, stopAtDistance) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/requestIpl)
---
---@param group string
function requestIpl(group) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeIpl)
---
---@param group string
function removeIpl(group) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeIplDiscreetly)
---
---@param group string
function removeIplDiscreetly(group) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharRelationship)
---
---@param ped Ped
---@param acquaintance int
---@param pedtype int
function setCharRelationship(ped, acquaintance, pedtype) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearCharRelationship)
---
---@param ped Ped
---@param acquaintance int
---@param pedtype int
function clearCharRelationship(ped, acquaintance, pedtype) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearAllCharRelationships)
---
---@param ped Ped
---@param acquaintance int
function clearAllCharRelationships(ped, acquaintance) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarPitch)
---
---@param car Vehicle
---@return float pitch
function getCarPitch(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getActiveInterior)
---
---@return int interior
function getActiveInterior() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/heliKeepEntityInView)
---
---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param minaltitude float
---@param maxaltitude float
function heliKeepEntityInView(heli, ped, car, minaltitude, maxaltitude) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getWeapontypeModel)
---
---@param id int
---@return int model
function getWeapontypeModel(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getWeapontypeSlot)
---
---@param id int
---@return int slot
function getWeapontypeSlot(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getShoppingExtraInfo)
---
---@param item int
---@param flag int
---@return int info
function getShoppingExtraInfo(item, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/givePlayerClothes)
---
---@param player Player
---@param texture int
---@param model int
---@param bodypart int
function givePlayerClothes(player, texture, model, bodypart) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumberOfFiresInArea)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachWinchToHeli)
---
---@param heli Vehicle
---@param magnet bool
function attachWinchToHeli(heli, magnet) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/releaseEntityFromWinch)
---
---@param heli Vehicle
function releaseEntityFromWinch(heli) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getTrainCarriage)
---
---@param train Vehicle
---@param handle int
---@return int carriage
function getTrainCarriage(train, handle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/grabEntityOnWinch)
---
---@param heli Vehicle
---@return Vehicle carHandle
---@return Ped pedHandle
---@return Object objectHandle
function grabEntityOnWinch(heli) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNameOfItem)
---
---@param item int
---@return GxtString name
function getNameOfItem(item) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskClimb)
---
---@param ped Ped
---@param climb bool
function taskClimb(ped, climb) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/buyItem)
---
---@param item int
function buyItem(item) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearCharTasksImmediately)
---
---@param ped Ped
function clearCharTasksImmediately(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/storeClothesState)
---
function storeClothesState() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/restoreClothesState)
---
function restoreClothesState() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRopeHeightForObject)
---
---@param magnet int
---@return float length
function getRopeHeightForObject(magnet) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setRopeHeightForObject)
---
---@param magnet int
---@param length float
function setRopeHeightForObject(magnet, length) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/grabEntityOnRopeForObject)
---
---@param magnet int
---@return Vehicle carHandle
---@return Ped pedHandle
---@return Object objectHandle
function grabEntityOnRopeForObject(magnet) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/releaseEntityFromRopeForObject)
---
---@param magnet int
function releaseEntityFromRopeForObject(magnet) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playerEnteredDockCrane)
---
function playerEnteredDockCrane() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playerEnteredBuildingsiteCrane)
---
function playerEnteredBuildingsiteCrane() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playerLeftCrane)
---
function playerLeftCrane() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/performSequenceTaskFromProgress)
---
---@param ped Ped
---@param sequence int
---@param unkProgress1 int
---@param unkProgress2 int
function performSequenceTaskFromProgress(ped, sequence, unkProgress1, unkProgress2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setNextDesiredMoveState)
---
---@param speed int
function setNextDesiredMoveState(speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGotoCharAiming)
---
---@param ped Ped
---@param followActor int
---@param minradius float
---@param maxradius float
function taskGotoCharAiming(ped, followActor, minradius, maxradius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getSequenceProgressRecursive)
---
---@param ped Ped
---@return int unkProgress1
---@return int unkProgress2
function getSequenceProgressRecursive(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskKillCharOnFootTimed)
---
---@param ped Ped
---@param attackActor int
---@param time int
function taskKillCharOnFootTimed(ped, attackActor, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNearestTagPosition)
---
---@param X float
---@param Y float
---@param Z float
---@return float X
---@return float Y
---@return float Z
function getNearestTagPosition(X, Y, Z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskJetpack)
---
---@param ped Ped
function taskJetpack(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setArea51SamSite)
---
---@param enable bool
function setArea51SamSite(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnySearchlight)
---
---@param ped Ped
---@return bool result
---@return Searchlight searchlight
function isCharInAnySearchlight(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isTrailerAttachedToCab)
---
---@param trailer Vehicle
---@param car Vehicle
---@return bool result
function isTrailerAttachedToCab(trailer, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/detachTrailerFromCab)
---
---@param trailer Vehicle
---@param cab Vehicle
function detachTrailerFromCab(trailer, cab) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPlayerGroup)
---
---@param player Player
---@return int group
function getPlayerGroup(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getLoadedShop)
---
---@return GxtString shop
function getLoadedShop() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getBeatProximity)
---
---@param track int
---@return int int2
---@return int int3
---@return int int4
function getBeatProximity(track) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupDefaultTaskAllocator)
---
---@param group int
---@param command int
function setGroupDefaultTaskAllocator(group, command) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerGroupRecruitment)
---
---@param player Player
---@param enabled bool
function setPlayerGroupRecruitment(player, enabled) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/activateHeliSpeedCheat)
---
---@param heli Vehicle
---@param power int
function activateHeliSpeedCheat(heli, power) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskSetCharDecisionMaker)
---
---@param ped Ped
---@param maker int
function taskSetCharDecisionMaker(ped, maker) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/deleteMissionTrain)
---
---@param train Vehicle
function deleteMissionTrain(train) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/markMissionTrainAsNoLongerNeeded)
---
---@param train Vehicle
function markMissionTrainAsNoLongerNeeded(train) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setBlipAlwaysDisplayOnZoomedRadar)
---
---@param marker Marker
---@param displayAlways bool
function setBlipAlwaysDisplayOnZoomedRadar(marker, displayAlways) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/requestCarRecording)
---
---@param path int
function requestCarRecording(path) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCarRecordingBeenLoaded)
---
---@param path int
---@return bool result
function hasCarRecordingBeenLoaded(path) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMissionTrainCoordinates)
---
---@param train Vehicle
---@param X float
---@param Y float
---@param Z float
function setMissionTrainCoordinates(train, X, Y, Z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskComplexPickupObject)
---
---@param ped Ped
---@param object Object
function taskComplexPickupObject(ped, object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/listenToPlayerGroupCommands)
---
---@param ped Ped
---@param listen bool
function listenToPlayerGroupCommands(ped, listen) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerEnterCarButton)
---
---@param player Player
---@param can bool
function setPlayerEnterCarButton(player, can) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskCharSlideToCoord)
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
---@param angle float
---@param withinRadius float
function taskCharSlideToCoord(ped, toX, toY, toZ, angle, withinRadius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCurrentDayOfWeek)
---
---@return int weekday
function getCurrentDayOfWeek() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/registerScriptBrainForCodeUse)
---
---@param id int
---@param gxtString GxtString
function registerScriptBrainForCodeUse(id, gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/applyForceToCar)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addToCarRotationVelocity)
---
---@param car Vehicle
---@param vecX float
---@param vecY float
---@param vecZ float
function addToCarRotationVelocity(car, vecX, vecY, vecZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarRotationVelocity)
---
---@param car Vehicle
---@param vecX float
---@param vecY float
---@param vecZ float
function setCarRotationVelocity(car, vecX, vecY, vecZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharShootRate)
---
---@param ped Ped
---@param rate int
function setCharShootRate(ped, rate) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isModelInCdimage)
---
---@param modelId Model
---@return bool result
function isModelInCdimage(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeOilPuddlesInArea)
---
---@param x1 float
---@param y1 float
---@param x2 float
---@param y2 float
function removeOilPuddlesInArea(x1, y1, x2, y2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setBlipAsFriendly)
---
---@param marker Marker
---@param type bool
function setBlipAsFriendly(marker, type) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskSwimToCoord)
---
---@param ped Ped
---@param toX float
---@param toY float
---@param toZ float
function taskSwimToCoord(ped, toX, toY, toZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getModelDimensions)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/copyCharDecisionMaker)
---
---@param ped Ped
---@return int maker
function copyCharDecisionMaker(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/copyGroupDecisionMaker)
---
---@param group int
---@return int maker
function copyGroupDecisionMaker(group) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDrivePointRouteAdvanced)
---
---@param ped Ped
---@param car Vehicle
---@param speed float
---@param flag1 int
---@param flag2 int
---@param flag3 int
function taskDrivePointRouteAdvanced(ped, car, speed, flag1, flag2, flag3) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isRelationshipSet)
---
---@param acquaintance int
---@param ofActors int
---@param toActors int
---@return bool result
function isRelationshipSet(acquaintance, ofActors, toActors) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarAlwaysCreateSkids)
---
---@param car Vehicle
---@param enable bool
function setCarAlwaysCreateSkids(car, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCityFromCoords)
---
---@param X float
---@param Y float
---@param Z float
---@return int city
function getCityFromCoords(X, Y, Z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasObjectOfTypeBeenSmashed)
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@param modelId Model
---@return bool result
function hasObjectOfTypeBeenSmashed(X, Y, Z, radius, modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerPerformingWheelie)
---
---@param player Player
---@return bool result
function isPlayerPerformingWheelie(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerPerformingStoppie)
---
---@param player Player
---@return bool result
function isPlayerPerformingStoppie(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCheckpointCoords)
---
---@param checkpoint Checkpoint
---@param X float
---@param Y float
---@param Z float
function setCheckpointCoords(checkpoint, X, Y, Z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/controlCarHydraulics)
---
---@param car Vehicle
---@param f1 float
---@param f2 float
---@param f3 float
---@param f4 float
function controlCarHydraulics(car, f1, f2, f3, f4) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getGroupSize)
---
---@param group int
---@return int numberOfLeaders
---@return int numberOfMembers
function getGroupSize(group) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectCollisionDamageEffect)
---
---@param object Object
---@param destructible bool
function setObjectCollisionDamageEffect(object, destructible) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarFollowCar)
---
---@param car Vehicle
---@param followCar int
---@param radius float
function setCarFollowCar(car, followCar, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playerEnteredQuarryCrane)
---
function playerEnteredQuarryCrane() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playerEnteredLasVegasCrane)
---
function playerEnteredLasVegasCrane() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchEntryExit)
---
---@param interior GxtString
---@param access bool
function switchEntryExit(interior, access) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayTextWithFloat)
---
---@param X float
---@param Y float
---@param GXT GxtString
---@param value float
---@param flag int
function displayTextWithFloat(X, Y, GXT, value, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesGroupExist)
---
---@param group int
---@return bool result
function doesGroupExist(group) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/giveMeleeAttackToChar)
---
---@param ped Ped
---@param fightingStyle int
---@param moves int
function giveMeleeAttackToChar(ped, fightingStyle, moves) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarHydraulics)
---
---@param car Vehicle
---@param hydraulics bool
function setCarHydraulics(car, hydraulics) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/is2playerGameGoingOn)
---
---@return bool result
function is2playerGameGoingOn() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCameraFov)
---
---@return float fov
function getCameraFov() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesCarHaveHydraulics)
---
---@param car Vehicle
---@return bool result
function doesCarHaveHydraulics(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskCharSlideToCoordAndPlayAnim)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getTotalNumberOfPedsKilledByPlayer)
---
---@param player Player
---@return int number
function getTotalNumberOfPedsKilledByPlayer(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getLevelDesignCoordsForObject)
---
---@param object Object
---@param spoot int
---@return float X
---@return float Y
---@return float Z
function getLevelDesignCoordsForObject(object, spoot) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharHighestPriorityEvent)
---
---@param ped Ped
---@return int event
function getCharHighestPriorityEvent(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getParkingNodeInArea)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarCharIsUsing)
---
---@param ped Ped
---@return Vehicle car
function getCarCharIsUsing(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskPlayAnimNonInterruptable)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addStuntJump)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectCoordinatesAndVelocity)
---
---@param object Object
---@param X float
---@param Y float
---@param Z float
function setObjectCoordinatesAndVelocity(object, X, Y, Z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharKindaStayInSamePlace)
---
---@param ped Ped
---@param stay bool
function setCharKindaStayInSamePlace(ped, stay) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFollowPatrolRoute)
---
---@param ped Ped
---@param walkMode int
---@param routeMode int
function taskFollowPatrolRoute(ped, walkMode, routeMode) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAir)
---
---@param ped Ped
---@return bool result
function isCharInAir(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharHeightAboveGround)
---
---@param ped Ped
---@return float height
function getCharHeightAboveGround(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharWeaponSkill)
---
---@param ped Ped
---@param skill int
function setCharWeaponSkill(ped, skill) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextEdge)
---
---@param size int
---@param r int
---@param g int
---@param b int
---@param a int
function setTextEdge(size, r, g, b, a) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarEngineBroken)
---
---@param car Vehicle
---@param broken bool
function setCarEngineBroken(car, broken) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isThisModelABoat)
---
---@param modelId Model
---@return bool result
function isThisModelABoat(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isThisModelAPlane)
---
---@param modelId Model
---@return bool result
function isThisModelAPlane(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isThisModelAHeli)
---
---@param modelId Model
---@return bool result
function isThisModelAHeli(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setFirstPersonInCarCameraMode)
---
---@param enable bool
function setFirstPersonInCarCameraMode(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGreetPartner)
---
---@param ped Ped
---@param ped2 Ped
---@param unk1 float
---@param unk2 int
function taskGreetPartner(ped, ped2, unk1, unk2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeliBladesFullSpeed)
---
---@param heli Vehicle
function setHeliBladesFullSpeed(heli) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayHud)
---
---@param enable bool
function displayHud(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/connectLods)
---
---@param object Object
---@param lod int
function connectLods(object, lod) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMaxFireGenerations)
---
---@param max int
function setMaxFireGenerations(max) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDieNamedAnim)
---
---@param ped Ped
---@param animation string
---@param ifp1 string
---@param ifp2 float
---@param time int
function taskDieNamedAnim(ped, animation, ifp1, ifp2, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerDuckButton)
---
---@param player Player
---@param able bool
function setPlayerDuckButton(player, able) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPoolTableCoords)
---
---@param x1 float
---@param y1 float
---@param z1 float
---@param x2 float
---@param y2 float
---@param z2 float
function setPoolTableCoords(x1, y1, z1, x2, y2, z2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasObjectBeenPhotographed)
---
---@param object Object
---@return bool result
function hasObjectBeenPhotographed(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doCameraBump)
---
---@param rotationZ float
---@param rotationY float
function doCameraBump(rotationZ, rotationY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCurrentDate)
---
---@return int day
---@return int month
function getCurrentDate() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectAnimSpeed)
---
---@param object Object
---@param animation string
---@param speed float
function setObjectAnimSpeed(object, animation, speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectPlayingAnim)
---
---@param object Object
---@param anim string
---@return bool result
function isObjectPlayingAnim(object, anim) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectAnimCurrentTime)
---
---@param object Object
---@param animation string
---@return float progress
function getObjectAnimCurrentTime(object, animation) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectAnimCurrentTime)
---
---@param object Object
---@param animation string
---@param progress float
function setObjectAnimCurrentTime(object, animation, progress) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharVelocity)
---
---@param ped Ped
---@param vecX float
---@param vecY float
---@param vecZ float
function setCharVelocity(ped, vecX, vecY, vecZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharVelocity)
---
---@param ped Ped
---@return float vecX
---@return float vecY
---@return float vecZ
function getCharVelocity(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharRotation)
---
---@param ped Ped
---@param vecX float
---@param vecY float
---@param vecZ float
function setCharRotation(ped, vecX, vecY, vecZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarUprightValue)
---
---@param car Vehicle
---@return float value
function getCarUprightValue(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleInterior)
---
---@param car Vehicle
---@param interior int
function setVehicleInterior(car, interior) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/selectWeaponsForVehicle)
---
---@param car Vehicle
---@param gun bool
function selectWeaponsForVehicle(car, gun) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCityPlayerIsIn)
---
---@param player Player
---@return int city
function getCityPlayerIsIn(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNameOfZone)
---
---@param X float
---@param Y float
---@param Z float
---@return GxtString name
function getNameOfZone(X, Y, Z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/activateInteriorPeds)
---
---@param activate bool
function activateInteriorPeds(activate) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleCanBeTargetted)
---
---@param car Vehicle
---@param unk bool
function setVehicleCanBeTargetted(car, unk) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFollowFootsteps)
---
---@param ped Ped
---@param followActor int
function taskFollowFootsteps(ped, followActor) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/damageChar)
---
---@param ped Ped
---@param health int
---@param affectArmour bool
function damageChar(ped, health, affectArmour) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarCanBeVisiblyDamaged)
---
---@param car Vehicle
---@param can bool
function setCarCanBeVisiblyDamaged(car, can) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeliReachedTargetDistance)
---
---@param heli Vehicle
---@param dist int
function setHeliReachedTargetDistance(heli, dist) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getSoundLevelAtCoords)
---
---@param ped Ped
---@param X float
---@param Y float
---@param Z float
---@return float level
function getSoundLevelAtCoords(ped, X, Y, Z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharAllowedToDuck)
---
---@param ped Ped
---@param enable bool
function setCharAllowedToDuck(ped, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeadingForAttachedPlayer)
---
---@param player Player
---@param toAngle float
---@param rotationSpeed float
function setHeadingForAttachedPlayer(player, toAngle, rotationSpeed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskWalkAlongsideChar)
---
---@param ped Ped
---@param alongisdeActor int
function taskWalkAlongsideChar(ped, alongisdeActor) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createEmergencyServicesCar)
---
---@param car Model
---@param X float
---@param Y float
---@param Z float
function createEmergencyServicesCar(car, X, Y, Z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskKindaStayInSamePlace)
---
---@param ped Ped
---@param stay bool
function taskKindaStayInSamePlace(ped, stay) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCarLooped)
---
---@param car Vehicle
---@param path int
function startPlaybackRecordedCarLooped(car, path) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharInterior)
---
---@param ped Ped
---@param interior int
function setCharInterior(ped, interior) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isAttachedPlayerHeadingAchieved)
---
---@param player Player
---@return bool result
function isAttachedPlayerHeadingAchieved(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/enableEntryExitPlayerGroupWarping)
---
---@param X float
---@param Y float
---@param radius float
---@param access bool
function enableEntryExitPlayerGroupWarping(X, Y, radius, access) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getClosestStealableObject)
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@return Object object
function getClosestStealableObject(X, Y, Z, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isProceduralInteriorActive)
---
---@param interior int
---@return bool result
function isProceduralInteriorActive(interior) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeCarRecording)
---
---@param path int
function removeCarRecording(path) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setZonePopulationRace)
---
---@param zone GxtString
---@param popcycle int
function setZonePopulationRace(zone, popcycle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectOnlyDamagedByPlayer)
---
---@param object Object
---@param player bool
function setObjectOnlyDamagedByPlayer(object, player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createBirds)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleDirtLevel)
---
---@param car Vehicle
---@param level float
function setVehicleDirtLevel(car, level) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGangWarsActive)
---
---@param enable bool
function setGangWarsActive(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isGangWarGoingOn)
---
---@return bool result
function isGangWarGoingOn() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/givePlayerClothesOutsideShop)
---
---@param player Player
---@param clothes string
---@param model string
---@param bodyPart int
function givePlayerClothesOutsideShop(player, clothes, model, bodyPart) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearLoadedShop)
---
function clearLoadedShop() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupSequence)
---
---@param group int
---@param Aspack int
function setGroupSequence(group, Aspack) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharDropsWeaponsWhenDead)
---
---@param ped Ped
---@param droppable bool
function setCharDropsWeaponsWhenDead(ped, droppable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharNeverLeavesGroup)
---
---@param ped Ped
---@param set bool
function setCharNeverLeavesGroup(ped, set) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerFireButton)
---
---@param player Player
---@param able bool
function setPlayerFireButton(player, able) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachFxSystemToCharBone)
---
---@param particle Particle
---@param ped Ped
---@param mode int
function attachFxSystemToCharBone(particle, ped, mode) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/registerAttractorScriptBrainForCodeUse)
---
---@param handle int
---@param script GxtString
function registerAttractorScriptBrainForCodeUse(handle, script) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeadingLimitForAttachedChar)
---
---@param ped Ped
---@param orientation int
---@param limit float
function setHeadingLimitForAttachedChar(ped, orientation, limit) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForDeadChar)
---
---@param ped Ped
---@return Marker blip
function addBlipForDeadChar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getDeadCharCoordinates)
---
---@param ped Ped
---@return float X
---@return float Y
---@return float Z
function getDeadCharCoordinates(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskPlayAnimWithFlags)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleAirResistanceMultiplier)
---
---@param car Vehicle
---@param multiplier float
function setVehicleAirResistanceMultiplier(car, multiplier) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarCoordinatesNoOffset)
---
---@param car Vehicle
---@param X float
---@param Y float
---@param Z float
function setCarCoordinatesNoOffset(car, X, Y, Z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setUsesCollisionOfClosestObjectOfType)
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@param modelId Model
---@param collisionDetection bool
function setUsesCollisionOfClosestObjectOfType(X, Y, Z, radius, modelId, collisionDetection) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTimeOneDayForward)
---
function setTimeOneDayForward() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTimerBeepCountdownTime)
---
---@param timer VarId
---@param reach int
function setTimerBeepCountdownTime(timer, reach) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachTrailerToCab)
---
---@param trailer int
---@param cab int
function attachTrailerToCab(trailer, cab) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isVehicleTouchingObject)
---
---@param car Vehicle
---@param object Object
---@return bool result
function isVehicleTouchingObject(car, object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/enableCraneControls)
---
---@param UP bool
---@param DOWN bool
---@param RELEASE bool
function enableCraneControls(UP, DOWN, RELEASE) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerInPositionForConversation)
---
---@param ped Ped
---@return bool result
function isPlayerInPositionForConversation(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/enableConversation)
---
---@param ped Ped
---@param enable bool
function enableConversation(ped, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCharInSphereOnlyDrugsBuyers)
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@return Ped ped
function getRandomCharInSphereOnlyDrugsBuyers(X, Y, Z, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPedType)
---
---@param ped Ped
---@return int pedtype
function getPedType(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskUseClosestMapAttractor)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/planeAttackPlayerUsingDogFight)
---
---@param hydra int
---@param player Player
---@param radius float
function planeAttackPlayerUsingDogFight(hydra, player, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/canTriggerGangWarWhenOnAMission)
---
---@param can bool
function canTriggerGangWarWhenOnAMission(can) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/controlMovableVehiclePart)
---
---@param car Vehicle
---@param angle float
function controlMovableVehiclePart(car, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/winchCanPickVehicleUp)
---
---@param car Vehicle
---@param attractive bool
function winchCanPickVehicleUp(car, attractive) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/openCarDoorABit)
---
---@param car Vehicle
---@param door int
---@param rotation float
function openCarDoorABit(car, door, rotation) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarDoorFullyOpen)
---
---@param car Vehicle
---@param door int
---@return bool result
function isCarDoorFullyOpen(car, door) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setAlwaysDraw3dMarkers)
---
---@param set bool
function setAlwaysDraw3dMarkers(set) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/streamScript)
---
---@param script int
function streamScript(script) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasStreamedScriptLoaded)
---
---@param script int
---@return bool result
function hasStreamedScriptLoaded(script) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGangWarsTrainingMission)
---
---@param set bool
function setGangWarsTrainingMission(set) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharHasUsedEntryExit)
---
---@param ped Ped
---@param X float
---@param Y float
---@param radius float
function setCharHasUsedEntryExit(ped, X, Y, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharMaxHealth)
---
---@param ped Ped
---@param health int
function setCharMaxHealth(ped, health) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setNightVision)
---
---@param enable bool
function setNightVision(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setInfraredVision)
---
---@param enable bool
function setInfraredVision(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setZoneForGangWarsTraining)
---
---@param zone GxtString
function setZoneForGangWarsTraining(zone) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharCanBeKnockedOffBike)
---
---@param ped Ped
---@param can bool
function setCharCanBeKnockedOffBike(ped, can) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharCoordinatesDontWarpGang)
---
---@param ped Ped
---@param X float
---@param Y float
---@param Z float
function setCharCoordinatesDontWarpGang(ped, X, Y, Z) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addPriceModifier)
---
---@param item int
---@param price int
function addPriceModifier(item, price) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removePriceModifier)
---
---@param item int
function removePriceModifier(item) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/initZonePopulationSettings)
---
function initZonePopulationSettings() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/explodeCarInCutsceneShakeAndBits)
---
---@param car Vehicle
---@param shake bool
---@param effect bool
---@param sound bool
function explodeCarInCutsceneShakeAndBits(car, shake, effect, sound) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isSkipCutsceneButtonPressed)
---
---@return bool result
function isSkipCutsceneButtonPressed() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCutsceneOffset)
---
---@return bool result
---@return float X
---@return float Y
---@return float Z
function getCutsceneOffset() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectScale)
---
---@param object Object
---@param scale float
function setObjectScale(object, scale) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCurrentPopulationZoneType)
---
---@return int popcycle
function getCurrentPopulationZoneType() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createMenu)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMenuColumnOrientation)
---
---@param menu int
---@param column int
---@param alignment int
function setMenuColumnOrientation(menu, column, alignment) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getMenuItemSelected)
---
---@param menu int
---@return int item
function getMenuItemSelected(menu) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getMenuItemAccepted)
---
---@param menu int
---@return int item
function getMenuItemAccepted(menu) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/activateMenuItem)
---
---@param menu int
---@param row int
---@param enable bool
function activateMenuItem(menu, row, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/deleteMenu)
---
---@param menu int
function deleteMenu(menu) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMenuColumn)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setBlipEntryExit)
---
---@param marker Marker
---@param X float
---@param Y float
---@param radius float
function setBlipEntryExit(marker, X, Y, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchDeathPenalties)
---
---@param lose bool
function switchDeathPenalties(lose) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchArrestPenalties)
---
---@param lose bool
function switchArrestPenalties(lose) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setExtraHospitalRestartPoint)
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@param angle float
function setExtraHospitalRestartPoint(X, Y, Z, radius, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setExtraPoliceStationRestartPoint)
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@param angle float
function setExtraPoliceStationRestartPoint(X, Y, Z, radius, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/findNumberTagsTagged)
---
---@return int num
function findNumberTagsTagged() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getTerritoryUnderControlPercentage)
---
---@return int percentage
function getTerritoryUnderControlPercentage() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectInAngledArea2d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectInAngledArea3d)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCharInSphereNoBrain)
---
---@param X float
---@param Y float
---@param Z float
---@param radius float
---@return Ped ped
function getRandomCharInSphereNoBrain(X, Y, Z, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlaneUndercarriageUp)
---
---@param plane int
---@param set bool
function setPlaneUndercarriageUp(plane, set) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/disableAllEntryExits)
---
---@param disable bool
function disableAllEntryExits(disable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachAnimsToModel)
---
---@param modelId Model
---@param externalScript GxtString
function attachAnimsToModel(modelId, externalScript) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectAsStealable)
---
---@param object Object
---@param liftable bool
function setObjectAsStealable(object, liftable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCreateRandomGangMembers)
---
---@param enable bool
function setCreateRandomGangMembers(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addSparks)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getVehicleClass)
---
---@param car Vehicle
---@return int class
function getVehicleClass(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearConversationForChar)
---
---@param ped Ped
function clearConversationForChar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMenuItemWithNumber)
---
---@param panel int
---@param column int
---@param row int
---@param gxtString GxtString
---@param number int
function setMenuItemWithNumber(panel, column, row, gxtString, number) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMenuItemWith2Numbers)
---
---@param panel int
---@param column int
---@param row int
---@param gxtString GxtString
---@param numbers1 int
---@param numbers2 int
function setMenuItemWith2Numbers(panel, column, row, gxtString, numbers1, numbers2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCutsceneModelTexture)
---
---@param cutsceneModel GxtString
---@param textureName GxtString
function setCutsceneModelTexture(cutsceneModel, textureName) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNameOfInfoZone)
---
---@param atX float
---@param atY float
---@param atZ float
---@return GxtString nameB
function getNameOfInfoZone(atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/vehicleCanBeTargettedByHsMissile)
---
---@param car Vehicle
---@param targetable bool
function vehicleCanBeTargettedByHsMissile(car, targetable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setFreebiesInVehicle)
---
---@param car Vehicle
---@param containsGoodies bool
function setFreebiesInVehicle(car, containsGoodies) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setScriptLimitToGangSize)
---
---@param max bool
function setScriptLimitToGangSize(max) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/makePlayerGangDisappear)
---
function makePlayerGangDisappear() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/makePlayerGangReappear)
---
function makePlayerGangReappear() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getClothesItem)
---
---@param player Player
---@param bodypart int
---@return int textureCRC
---@return int modelCRC
function getClothesItem(player, bodypart) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/showUpdateStats)
---
---@param display bool
function showUpdateStats(display) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCoordBlipAppearance)
---
---@param checkpoint Checkpoint
---@param type int
function setCoordBlipAppearance(checkpoint, type) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeathazeEffect)
---
---@param enable bool
function setHeathazeEffect(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isHelpMessageBeingDisplayed)
---
---@return bool result
function isHelpMessageBeingDisplayed() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasObjectBeenDamagedByWeapon)
---
---@param object Object
---@param type int
---@return bool result
function hasObjectBeenDamagedByWeapon(object, type) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearObjectLastWeaponDamage)
---
---@param object Object
function clearObjectLastWeaponDamage(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerJumpButton)
---
---@param player Player
---@param enable bool
function setPlayerJumpButton(player, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getHudColour)
---
---@param interface int
---@return int r
---@return int g
---@return int b
---@return int a
function getHudColour(interface) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/lockDoor)
---
---@param door int
---@param lock bool
function lockDoor(door, lock) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectMass)
---
---@param object Object
---@param mass float
function setObjectMass(object, mass) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectMass)
---
---@param int int
---@return float mass
function getObjectMass(int) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectTurnMass)
---
---@param object Object
---@param turnMass float
function setObjectTurnMass(object, turnMass) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectTurnMass)
---
---@param object Object
---@return float turnMass
function getObjectTurnMass(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setSpecificZoneToTriggerGangWar)
---
---@param zone GxtString
function setSpecificZoneToTriggerGangWar(zone) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearSpecificZonesToTriggerGangWar)
---
function clearSpecificZonesToTriggerGangWar() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setActiveMenuItem)
---
---@param panel int
---@param activeRow int
function setActiveMenuItem(panel, activeRow) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/markStreamedScriptAsNoLongerNeeded)
---
---@param externalScript int
function markStreamedScriptAsNoLongerNeeded(externalScript) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeStreamedScript)
---
---@param externalScript int
function removeStreamedScript(externalScript) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMessageFormatting)
---
---@param priority bool
---@param leftmargin int
---@param maxwidth int
function setMessageFormatting(priority, leftmargin, maxwidth) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startNewStreamedScript)
---
---@param externalScript int
---@param args table
function startNewStreamedScript(externalScript, args) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setWeatherToAppropriateTypeNow)
---
function setWeatherToAppropriateTypeNow() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/winchCanPickObjectUp)
---
---@param object Object
---@param enable bool
function winchCanPickObjectUp(object, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchAudioZone)
---
---@param zone GxtString
---@param enableSound bool
function switchAudioZone(zone, enableSound) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarEngineOn)
---
---@param car Vehicle
---@param on bool
function setCarEngineOn(car, on) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarLightsOn)
---
---@param car Vehicle
---@param lights bool
function setCarLightsOn(car, lights) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getUserOfClosestMapAttractor)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchRoadsBackToOriginal)
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function switchRoadsBackToOriginal(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchPedRoadsBackToOriginal)
---
---@param cornerAX float
---@param cornerAY float
---@param cornerAZ float
---@param cornerBX float
---@param cornerBY float
---@param cornerBZ float
function switchPedRoadsBackToOriginal(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPlaneUndercarriagePosition)
---
---@param plane int
---@return int landingGearStatus
function getPlaneUndercarriagePosition(plane) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraSetVectorTrack)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraSetLerpFov)
---
---@param from float
---@param to float
---@param timelimit int
---@param smoothTransition bool
function cameraSetLerpFov(from, to, timelimit, smoothTransition) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchAmbientPlanes)
---
---@param enable bool
function switchAmbientPlanes(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setDarknessEffect)
---
---@param enable bool
---@param value int
function setDarknessEffect(enable, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraResetNewScriptables)
---
function cameraResetNewScriptables() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumberOfInstancesOfStreamedScript)
---
---@param externalScript int
---@return int value
function getNumberOfInstancesOfStreamedScript(externalScript) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/allocateStreamedScriptToRandomPed)
---
---@param externalScript int
---@param actorModel Model
---@param priority int
function allocateStreamedScriptToRandomPed(externalScript, actorModel, priority) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/allocateStreamedScriptToObject)
---
---@param externalScript int
---@param objectModel Model
---@param priority int
---@param radius float
---@param type int
function allocateStreamedScriptToObject(externalScript, objectModel, priority, radius, type) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getGroupMember)
---
---@param group int
---@param member int
---@return int handle
function getGroupMember(group, member) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getWaterHeightAtCoords)
---
---@param atX float
---@param atY float
---@param ignoreWaves bool
---@return float height
function getWaterHeightAtCoords(atX, atY, ignoreWaves) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraPersistTrack)
---
---@param lock bool
function cameraPersistTrack(lock) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraPersistPos)
---
---@param lock bool
function cameraPersistPos(lock) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraPersistFov)
---
---@param lock bool
function cameraPersistFov(lock) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraIsVectorMoveRunning)
---
---@return bool result
function cameraIsVectorMoveRunning() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraIsVectorTrackRunning)
---
---@return bool result
function cameraIsVectorTrackRunning() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraSetVectorMove)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/drawWindow)
---
---@param cornerAX float
---@param cornerAY float
---@param cornerBX float
---@param cornerBY float
---@param gxtString GxtString
---@param style int
function drawWindow(cornerAX, cornerAY, cornerBX, cornerBY, gxtString, style) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCarToObject)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGarageResprayFree)
---
---@param garage GxtString
---@param free bool
function setGarageResprayFree(garage, free) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharBulletproofVest)
---
---@param ped Ped
---@param enable bool
function setCharBulletproofVest(ped, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCinemaCamera)
---
---@param lock bool
function setCinemaCamera(lock) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharFireDamageMultiplier)
---
---@param ped Ped
---@param multiplier float
function setCharFireDamageMultiplier(ped, multiplier) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupFollowStatus)
---
---@param group int
---@param status bool
function setGroupFollowStatus(group, status) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setSearchlightClipIfColliding)
---
---@param searchlight Searchlight
---@param flag bool
function setSearchlightClipIfColliding(searchlight, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasPlayerBoughtItem)
---
---@param item int
---@return bool result
function hasPlayerBoughtItem(item) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCameraInFrontOfChar)
---
---@param ped Ped
function setCameraInFrontOfChar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPlayerMaxArmour)
---
---@param player Player
---@return int maxArmour
function getPlayerMaxArmour(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharUsesUpperbodyDamageAnimsOnly)
---
---@param ped Ped
---@param uninterupted bool
function setCharUsesUpperbodyDamageAnimsOnly(ped, uninterupted) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharSayContext)
---
---@param ped Ped
---@param speech int
---@return int spokenPhrase
function setCharSayContext(ped, speech) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addExplosionVariableShake)
---
---@param atX float
---@param atY float
---@param atZ float
---@param type int
---@param cameraShake float
function addExplosionVariableShake(atX, atY, atZ, type, cameraShake) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachMissionAudioToChar)
---
---@param id int
---@param ped Ped
function attachMissionAudioToChar(id, ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/updatePickupMoneyPerDay)
---
---@param pickup Pickup
---@param cash int
function updatePickupMoneyPerDay(pickup, cash) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNameOfEntryExitCharUsed)
---
---@param ped Ped
---@return GxtString interiorName
function getNameOfEntryExitCharUsed(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPositionOfEntryExitCharUsed)
---
---@param ped Ped
---@return float coordX
---@return float coordY
---@return float coordZ
---@return int number
function getPositionOfEntryExitCharUsed(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharTalking)
---
---@param ped Ped
---@return bool result
function isCharTalking(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/disableCharSpeech)
---
---@param ped Ped
---@param disable bool
function disableCharSpeech(ped, disable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/enableCharSpeech)
---
---@param ped Ped
function enableCharSpeech(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpSkip)
---
---@param posX float
---@param posY float
---@param posZ float
---@param angle float
function setUpSkip(posX, posY, posZ, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearSkip)
---
function clearSkip() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/preloadBeatTrack)
---
---@param soundtrack int
function preloadBeatTrack(soundtrack) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getBeatTrackStatus)
---
---@return int status
function getBeatTrackStatus() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playBeatTrack)
---
function playBeatTrack() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/stopBeatTrack)
---
function stopBeatTrack() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/findMaxNumberOfGroupMembers)
---
---@return int max
function findMaxNumberOfGroupMembers() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/vehicleDoesProvideCover)
---
---@param car Vehicle
---@param providesCover bool
function vehicleDoesProvideCover(car, providesCover) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createSnapshotPickup)
---
---@param atX float
---@param atY float
---@param atZ float
---@return Pickup pickup
function createSnapshotPickup(atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createHorseshoePickup)
---
---@param atX float
---@param atY float
---@param atZ float
---@return Pickup pickup
function createHorseshoePickup(atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createOysterPickup)
---
---@param atX float
---@param atY float
---@param atZ float
---@return Pickup pickup
function createOysterPickup(atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasObjectBeenUprooted)
---
---@param object Object
---@return bool result
function hasObjectBeenUprooted(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addSmokeParticle)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStuckUnderCar)
---
---@param ped Ped
---@return bool result
function isCharStuckUnderCar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/controlCarDoor)
---
---@param car Vehicle
---@param door int
---@param unlatch int
---@param angle float
function controlCarDoor(car, door, unlatch, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getDoorAngleRatio)
---
---@param car Vehicle
---@param door int
---@return float angle
function getDoorAngleRatio(car, door) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerDisplayVitalStatsButton)
---
---@param player Player
---@param display bool
function setPlayerDisplayVitalStatsButton(player, display) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharKeepTask)
---
---@param ped Ped
---@param keepTasks bool
function setCharKeepTask(ped, keepTasks) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createMenuGrid)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharSwimming)
---
---@param ped Ped
---@return bool result
function isCharSwimming(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharSwimState)
---
---@param ped Ped
---@return int status
function getCharSwimState(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startCharFacialTalk)
---
---@param ped Ped
---@param time int
function startCharFacialTalk(ped, time) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/stopCharFacialTalk)
---
---@param ped Ped
function stopCharFacialTalk(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isBigVehicle)
---
---@param car Vehicle
---@return bool result
function isBigVehicle(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchPoliceHelis)
---
---@param enable bool
function switchPoliceHelis(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/storeCarModState)
---
function storeCarModState() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/restoreCarModState)
---
function restoreCarModState() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCurrentCarMod)
---
---@param car Vehicle
---@param slot int
---@return Model modelId
function getCurrentCarMod(car, slot) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarLowRider)
---
---@param car Vehicle
---@return bool result
function isCarLowRider(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarStreetRacer)
---
---@param car Vehicle
---@return bool result
function isCarStreetRacer(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/forceDeathRestart)
---
function forceDeathRestart() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/syncWater)
---
function syncWater() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharCoordinatesNoOffset)
---
---@param ped Ped
---@param atX float
---@param atY float
---@param atZ float
function setCharCoordinatesNoOffset(ped, atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesScriptFireExist)
---
---@param fire int
---@return bool result
function doesScriptFireExist(fire) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/resetStuffUponResurrection)
---
function resetStuffUponResurrection() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isEmergencyServicesVehicle)
---
---@param car Vehicle
---@return bool result
function isEmergencyServicesVehicle(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/killFxSystemNow)
---
---@param particle Particle
function killFxSystemNow(particle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectWithinBrainActivationRange)
---
---@param player Player
---@return bool result
function isObjectWithinBrainActivationRange(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/copySharedCharDecisionMaker)
---
---@param from int
---@return int to
function copySharedCharDecisionMaker(from) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtPosition)
---
---@param atX float
---@param atY float
---@param atZ float
---@param event int
function reportMissionAudioEventAtPosition(atX, atY, atZ, event) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtObject)
---
---@param at int
---@param event int
function reportMissionAudioEventAtObject(at, event) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachMissionAudioToObject)
---
---@param id int
---@param object Object
function attachMissionAudioToObject(id, object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumCarColours)
---
---@param car Vehicle
---@return int colours
function getNumCarColours(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/extinguishFireAtPoint)
---
---@param atX float
---@param atY float
---@param atZ float
---@param radius float
function extinguishFireAtPoint(atX, atY, atZ, radius) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasTrainDerailed)
---
---@param train Vehicle
---@return bool result
function hasTrainDerailed(train) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharForceDieInCar)
---
---@param ped Ped
---@param stayInCarWhenDead bool
function setCharForceDieInCar(ped, stayInCarWhenDead) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setOnlyCreateGangMembers)
---
---@param enable bool
function setOnlyCreateGangMembers(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectModel)
---
---@param object Object
---@return Model modelId
function getObjectModel(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharUsesCollisionClosestObjectOfType)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearAllScriptFireFlags)
---
function clearAllScriptFireFlags() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarBlockingCar)
---
---@param car Vehicle
---@return int blockingCar
function getCarBlockingCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCurrentVehiclePaintjob)
---
---@param car Vehicle
---@return int paintjob
function getCurrentVehiclePaintjob(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setHelpMessageBoxSize)
---
---@param width int
function setHelpMessageBoxSize(width) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setGunshotSenseRangeForRiot2)
---
---@param range float
function setGunshotSenseRangeForRiot2(range) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarMovingComponentOffset)
---
---@param car Vehicle
---@return float angle
function getCarMovingComponentOffset(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setNamedEntryExitFlag)
---
---@param interior GxtString
---@param bitmask int
---@param flag bool
function setNamedEntryExitFlag(interior, bitmask, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/pauseCurrentBeatTrack)
---
---@param paused bool
function pauseCurrentBeatTrack(paused) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerWeaponsScrollable)
---
---@param player Player
---@param scrollable bool
function setPlayerWeaponsScrollable(player, scrollable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/markRoadNodeAsDontWander)
---
---@param atX float
---@param atY float
---@param atZ float
function markRoadNodeAsDontWander(atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/unmarkAllRoadNodesAsDontWander)
---
function unmarkAllRoadNodesAsDontWander() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCheckpointHeading)
---
---@param checkpoint Checkpoint
---@param angle float
function setCheckpointHeading(checkpoint, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMissionRespectTotal)
---
---@param respect int
function setMissionRespectTotal(respect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/awardPlayerMissionRespect)
---
---@param respect int
function awardPlayerMissionRespect(respect) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarCollision)
---
---@param car Vehicle
---@param collision bool
function setCarCollision(car, collision) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/changePlaybackToUseAi)
---
---@param car Vehicle
function changePlaybackToUseAi(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraSetShakeSimulationSimple)
---
---@param type int
---@param timelimit float
---@param intensity float
function cameraSetShakeSimulationSimple(type, timelimit, intensity) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isNightVisionActive)
---
---@return bool result
function isNightVisionActive() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCreateRandomCops)
---
---@param enable bool
function setCreateRandomCops(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskSetIgnoreWeaponRangeFlag)
---
---@param ped Ped
---@param ignore bool
function taskSetIgnoreWeaponRangeFlag(ped, ignore) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskPickUpSecondObject)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dropSecondObject)
---
---@param ped Ped
---@param to bool
function dropSecondObject(ped, to) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeObjectElegantly)
---
---@param object Object
function removeObjectElegantly(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/drawCrosshair)
---
---@param draw bool
function drawCrosshair(draw) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpConversationNodeWithSpeech)
---
---@param question GxtString
---@param answerY GxtString
---@param answerN GxtString
---@param questionWav int
---@param answerYWav int
---@param answerNWav int
function setUpConversationNodeWithSpeech(question, answerY, answerN, questionWav, answerYWav, answerNWav) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/showBlipsOnAllLevels)
---
---@param enable bool
function showBlipsOnAllLevels(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharDruggedUp)
---
---@param ped Ped
---@param druggedUp bool
function setCharDruggedUp(ped, druggedUp) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharHeadMissing)
---
---@param ped Ped
---@return bool result
function isCharHeadMissing(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getHashKey)
---
---@param string string
---@return int CRC32
function getHashKey(string) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpConversationEndNodeWithSpeech)
---
---@param gxtString GxtString
---@param speech int
function setUpConversationEndNodeWithSpeech(gxtString, speech) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/randomPassengerSay)
---
---@param passengers int
---@param audioTable int
function randomPassengerSay(passengers, audioTable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hideAllFrontendBlips)
---
---@param hide bool
function hideAllFrontendBlips(hide) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerInCarCameraMode)
---
---@param mode int
function setPlayerInCarCameraMode(mode) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnyTrain)
---
---@param ped Ped
---@return bool result
function isCharInAnyTrain(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpSkipAfterMission)
---
---@param posX float
---@param posY float
---@param posZ float
---@param angle float
function setUpSkipAfterMission(posX, posY, posZ, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleIsConsideredByPlayer)
---
---@param car Vehicle
---@param accessible bool
function setVehicleIsConsideredByPlayer(car, accessible) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCarModelInMemory)
---
---@param unk bool
---@return Model modelId
---@return int class
function getRandomCarModelInMemory(unk) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarDoorLockStatus)
---
---@param car Vehicle
---@return int doorStatus
function getCarDoorLockStatus(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setClosestEntryExitFlag)
---
---@param atX float
---@param atY float
---@param radius float
---@param bitmask int
---@param flag bool
function setClosestEntryExitFlag(atX, atY, radius, bitmask, flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharSignalAfterKill)
---
---@param ped Ped
---@param signal bool
function setCharSignalAfterKill(ped, signal) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharWantedByPolice)
---
---@param ped Ped
---@param wanted bool
function setCharWantedByPolice(ped, wanted) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setZoneNoCops)
---
---@param zone GxtString
---@param disableCops bool
function setZoneNoCops(zone, disableCops) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlood)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayCarNames)
---
---@param show bool
function displayCarNames(show) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayZoneNames)
---
---@param show bool
function displayZoneNames(show) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarDoorDamaged)
---
---@param car Vehicle
---@param door int
---@return bool result
function isCarDoorDamaged(car, door) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharCoordinatesDontWarpGangNoOffset)
---
---@param ped Ped
---@param atX float
---@param atY float
---@param atZ float
function setCharCoordinatesDontWarpGangNoOffset(ped, atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMinigameInProgress)
---
---@param enable bool
function setMinigameInProgress(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isMinigameInProgress)
---
---@return bool result
function isMinigameInProgress() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setForceRandomCarModel)
---
---@param modelId Model
function setForceRandomCarModel(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInAngledAreaNoSave)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/addNextMessageToPreviousBriefs)
---
---@param int1 bool
function addNextMessageToPreviousBriefs(int1) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/failKillFrenzy)
---
function failKillFrenzy() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCopVehicleInArea3dNoSave)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPetrolTankWeakpoint)
---
---@param car Vehicle
---@param enabled bool
function setPetrolTankWeakpoint(car, enabled) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharUsingMapAttractor)
---
---@param ped Ped
---@return bool result
function isCharUsingMapAttractor(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerModel)
---
---@param player Player
---@param modelId Model
function setPlayerModel(player, modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/areSubtitlesSwitchedOn)
---
---@return bool result
function areSubtitlesSwitchedOn() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeCharFromCarMaintainPosition)
---
---@param ped Ped
---@param car Vehicle
function removeCharFromCarMaintainPosition(ped, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectProofs)
---
---@param object Object
---@param BP bool
---@param FP bool
---@param EP bool
---@param CP bool
---@param MP bool
function setObjectProofs(object, BP, FP, EP, CP, MP) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarTouchingCar)
---
---@param car1 Vehicle
---@param car2 Vehicle
---@return bool result
function isCarTouchingCar(car1, car2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesObjectHaveThisModel)
---
---@param object Object
---@param modelId Model
---@return bool result
function doesObjectHaveThisModel(object, modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setTrainForcedToSlowDown)
---
---@param train Vehicle
---@param forced bool
function setTrainForcedToSlowDown(train, forced) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isVehicleOnAllWheels)
---
---@param car Vehicle
---@return bool result
function isVehicleOnAllWheels(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesPickupExist)
---
---@param pickup Pickup
---@return bool result
function doesPickupExist(pickup) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/enableAmbientCrime)
---
---@param enable bool
function enableAmbientCrime(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearWantedLevelInGarage)
---
function clearWantedLevelInGarage() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharSayContextImportant)
---
---@param ped Ped
---@param soundslot int
---@param flags1 bool
---@param flags2 bool
---@param flags3 bool
---@return int unk
function setCharSayContextImportant(ped, soundslot, flags1, flags2, flags3) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharSayScript)
---
---@param ped Ped
---@param sound int
---@param flags1 bool
---@param flags2 bool
---@param flags3 bool
function setCharSayScript(ped, sound, flags1, flags2, flags3) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/forceInteriorLightingForPlayer)
---
---@param player Player
---@param force bool
function forceInteriorLightingForPlayer(player, force) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/useDetonator)
---
function useDetonator() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isMoneyPickupAtCoords)
---
---@param atX float
---@param atY float
---@param atZ float
---@return bool result
function isMoneyPickupAtCoords(atX, atY, atZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setMenuColumnWidth)
---
---@param panel int
---@param column int
---@param width int
function setMenuColumnWidth(panel, column, width) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/makeRoomInPlayerGangForMissionPeds)
---
---@param group int
function makeRoomInPlayerGangForMissionPeds(group) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharGettingInToACar)
---
---@param ped Ped
---@return bool result
function isCharGettingInToACar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpSkipForSpecificVehicle)
---
---@param posX float
---@param posY float
---@param posZ float
---@param angle float
---@param car Vehicle
function setUpSkipForSpecificVehicle(posX, posY, posZ, angle, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarModelValue)
---
---@param modelId Model
---@return int price
function getCarModelValue(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createCarGeneratorWithPlate)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/findTrainDirection)
---
---@param train Vehicle
---@return bool result
function findTrainDirection(train) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setAircraftCarrierSamSite)
---
---@param enable bool
function setAircraftCarrierSamSite(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/drawLightWithRange)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/enableBurglaryHouses)
---
---@param enable bool
function enableBurglaryHouses(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerControlOn)
---
---@param player Player
---@return bool result
function isPlayerControlOn(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharActiveInterior)
---
---@param ped Ped
---@return int interior
function getCharActiveInterior(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/giveNonPlayerCarNitro)
---
---@param car Vehicle
function giveNonPlayerCarNitro(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/playerTakeOffGoggles)
---
---@param player Player
---@param useAnim bool
function playerTakeOffGoggles(player, useAnim) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/allowFixedCameraCollision)
---
---@param allow bool
function allowFixedCameraCollision(allow) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCharSpottedCharInFront)
---
---@param ped Ped
---@param ped2 Ped
---@return bool result
function hasCharSpottedCharInFront(ped, ped2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/forceBigMessageAndCounter)
---
---@param stayOnScreen bool
function forceBigMessageAndCounter(stayOnScreen) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleCameraTweak)
---
---@param carModel Model
---@param distance float
---@param altitudeMultiplier float
---@param angleX float
function setVehicleCameraTweak(carModel, distance, altitudeMultiplier, angleX) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/resetVehicleCameraTweak)
---
function resetVehicleCameraTweak() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtChar)
---
---@param ped Ped
---@param event int
function reportMissionAudioEventAtChar(ped, event) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doesDecisionMakerExist)
---
---@param maker int
---@return bool result
function doesDecisionMakerExist(maker) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/ignoreHeightDifferenceFollowingNodes)
---
---@param ped Ped
---@param ignore bool
function ignoreHeightDifferenceFollowingNodes(ped, ignore) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/shutAllCharsUp)
---
---@param enable bool
function shutAllCharsUp(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharGetOutUpsideDownCar)
---
---@param ped Ped
---@param canGetOut bool
function setCharGetOutUpsideDownCar(ped, canGetOut) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtCar)
---
---@param car Vehicle
---@param event int
function reportMissionAudioEventAtCar(car, event) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/doWeaponStuffAtStartOf2pGame)
---
function doWeaponStuffAtStartOf2pGame() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasGameJustReturnedFromFrontend)
---
---@return bool result
function hasGameJustReturnedFromFrontend() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCurrentLanguage)
---
---@return int language
function getCurrentLanguage() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectIntersectingWorld)
---
---@param object Object
---@return bool result
function isObjectIntersectingWorld(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getStringWidth)
---
---@param gxtString GxtString
---@return int width
function getStringWidth(gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/resetVehicleHydraulics)
---
---@param car Vehicle
function resetVehicleHydraulics(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setRespawnPointForDurationOfMission)
---
---@param posX float
---@param posY float
---@param posZ float
function setRespawnPointForDurationOfMission(posX, posY, posZ) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isThisModelACar)
---
---@param modelId Model
---@return bool result
function isThisModelACar(modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchOnGroundSearchlight)
---
---@param searchlight Searchlight
---@param lightsThroughObstacles bool
function switchOnGroundSearchlight(searchlight, lightsThroughObstacles) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isGangWarFightingGoingOn)
---
---@return bool result
function isGangWarFightingGoingOn() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isNextStationAllowed)
---
---@param train Vehicle
---@return bool result
function isNextStationAllowed(train) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/skipToNextAllowedStation)
---
---@param train Vehicle
function skipToNextAllowedStation(train) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getStringWidthWithNumber)
---
---@param gxtString GxtString
---@param number int
---@return int width
function getStringWidthWithNumber(gxtString, number) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/shutCharUpForScriptedSpeech)
---
---@param ped Ped
---@param muted bool
function shutCharUpForScriptedSpeech(ped, muted) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/enableDisabledAttractorsOnObject)
---
---@param object Object
---@param enable bool
function enableDisabledAttractorsOnObject(object, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/loadSceneInDirection)
---
---@param coordX float
---@param coordY float
---@param coordZ float
---@param angle float
function loadSceneInDirection(coordX, coordY, coordZ, angle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerUsingJetpack)
---
---@param player Player
---@return bool result
function isPlayerUsingJetpack(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearThisPrintBigNow)
---
---@param style int
function clearThisPrintBigNow(style) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasLanguageChanged)
---
---@return bool result
function hasLanguageChanged() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/incrementIntStatNoMessage)
---
---@param stat int
---@param value int
function incrementIntStatNoMessage(stat, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setExtraCarColours)
---
---@param car Vehicle
---@param tertiaryColor int
---@param quaternaryColor int
function setExtraCarColours(car, tertiaryColor, quaternaryColor) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getExtraCarColours)
---
---@param car Vehicle
---@return int tertiaryColor
---@return int quaternaryColor
function getExtraCarColours(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/manageAllPopulation)
---
function manageAllPopulation() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setNoResprays)
---
---@param enable bool
function setNoResprays(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCarBeenResprayed)
---
---@param car Vehicle
---@return bool result
function hasCarBeenResprayed(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/attachMissionAudioToCar)
---
---@param audioId int
---@param car Vehicle
function attachMissionAudioToCar(audioId, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setHasBeenOwnedForCarGenerator)
---
---@param generator int
---@param owned bool
function setHasBeenOwnedForCarGenerator(generator, owned) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpConversationNodeWithScriptedSpeech)
---
---@param questionGXT GxtString
---@param answerYesGXT GxtString
---@param answerNoGXT GxtString
---@param questionWAV int
---@param answerYesWAV int
---@param answerNoWAV int
function setUpConversationNodeWithScriptedSpeech(questionGXT, answerYesGXT, answerNoGXT, questionWAV, answerYesWAV, answerNoWAV) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setAreaName)
---
---@param gxtString GxtString
function setAreaName(gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskPlayAnimSecondary)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharTouchingChar)
---
---@param ped Ped
---@param ped2 Ped
---@return bool result
function isCharTouchingChar(ped, ped2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/disableHeliAudio)
---
---@param helicopter Vehicle
---@param disable bool
function disableHeliAudio(helicopter, disable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskHandGesture)
---
---@param ped Ped
---@param ped2 Ped
function taskHandGesture(ped, ped2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/takePhoto)
---
---@param unk bool
function takePhoto(unk) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/incrementFloatStatNoMessage)
---
---@param stat int
---@param value float
function incrementFloatStatNoMessage(stat, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerGroupToFollowAlways)
---
---@param player Player
---@param followAlways bool
function setPlayerGroupToFollowAlways(player, followAlways) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/improveCarByCheating)
---
---@param car Vehicle
---@param affectedByCheats bool
function improveCarByCheating(car, affectedByCheats) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/changeCarColourFromMenu)
---
---@param panelID int
---@param car Vehicle
---@param colorslot int
---@param activeRow int
function changeCarColourFromMenu(panelID, car, colorslot, activeRow) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/highlightMenuItem)
---
---@param panel int
---@param row int
---@param highlight bool
function highlightMenuItem(panel, row, highlight) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setDisableMilitaryZones)
---
---@param disable bool
function setDisableMilitaryZones(disable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCameraPositionUnfixed)
---
---@param xAngle float
---@param zAngle float
function setCameraPositionUnfixed(xAngle, zAngle) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setRadioToPlayersFavouriteStation)
---
function setRadioToPlayersFavouriteStation() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setDeathWeaponsPersist)
---
---@param ped Ped
---@param persist bool
function setDeathWeaponsPersist(ped, persist) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharSwimSpeed)
---
---@param ped Ped
---@param speed float
function setCharSwimSpeed(ped, speed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerClimbing)
---
---@param player Player
---@return bool result
function isPlayerClimbing(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isThisHelpMessageBeingDisplayed)
---
---@param gxtString GxtString
---@return bool result
function isThisHelpMessageBeingDisplayed(gxtString) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isWidescreenOnInOptions)
---
---@return bool result
function isWidescreenOnInOptions() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/drawSubtitlesBeforeFade)
---
---@param flag bool
function drawSubtitlesBeforeFade(flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/drawOddjobTitleBeforeFade)
---
---@param flag bool
function drawOddjobTitleBeforeFade(flag) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFollowPathNodesToCoordWithRadius)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPhotoCameraEffect)
---
---@param firstPersonView bool
function setPhotoCameraEffect(firstPersonView) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/fixCar)
---
---@param car Vehicle
function fixCar(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerGroupToFollowNever)
---
---@param player Player
---@param neverFollow bool
function setPlayerGroupToFollowNever(player, neverFollow) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharAttachedToAnyCar)
---
---@param ped Ped
---@return bool result
function isCharAttachedToAnyCar(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/storeCarCharIsAttachedToNoSave)
---
---@param car Vehicle
---@return Ped ped
function storeCarCharIsAttachedToNoSave(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpSkipForVehicleFinishedByScript)
---
---@param posX float
---@param posY float
---@param posZ float
---@param angle float
---@param car Vehicle
function setUpSkipForVehicleFinishedByScript(posX, posY, posZ, angle, car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isSkipWaitingForScriptToFadeIn)
---
---@return bool result
function isSkipWaitingForScriptToFadeIn() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/forceAllVehicleLightsOff)
---
---@param off bool
function forceAllVehicleLightsOff(off) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPlayerInCarCameraMode)
---
---@return int mode
function getPlayerInCarCameraMode() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isLastBuildingModelShotByPlayer)
---
---@param player Player
---@param modelId Model
---@return bool result
function isLastBuildingModelShotByPlayer(player, modelId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/clearLastBuildingModelShotByPlayer)
---
---@param player Player
function clearLastBuildingModelShotByPlayer(player) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpConversationEndNodeWithScriptedSpeech)
---
---@param dialogueGxt GxtString
---@param wav int
function setUpConversationEndNodeWithScriptedSpeech(dialogueGxt, wav) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/activatePimpCheat)
---
---@param enable bool
function activatePimpCheat(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCharInAreaOffsetNoSave)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setScriptCoopGame)
---
---@param enable bool
function setScriptCoopGame(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createUser3dMarker)
---
---@param atX float
---@param atY float
---@param atZ float
---@param color int
---@return Marker marker
function createUser3dMarker(atX, atY, atZ, color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/removeUser3dMarker)
---
---@param marker Marker
function removeUser3dMarker(marker) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getRidOfPlayerProstitute)
---
function getRidOfPlayerProstitute() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/displayNonMinigameHelpMessages)
---
---@param display bool
function displayNonMinigameHelpMessages(display) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setRailtrackResistanceMult)
---
---@param tracksFriction float
function setRailtrackResistanceMult(tracksFriction) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/switchObjectBrains)
---
---@param externalScript int
---@param canBeStreamedIn bool
function switchObjectBrains(externalScript, canBeStreamedIn) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/finishSettingUpConversationNoSubtitles)
---
function finishSettingUpConversationNoSubtitles() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/allowPauseInWidescreen)
---
---@param enable bool
function allowPauseInWidescreen(enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getPcMouseMovement)
---
---@return float x
---@return float y
function getPcMouseMovement() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isPcUsingJoypad)
---
---@return bool result
function isPcUsingJoypad() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isMouseUsingVerticalInversion)
---
---@return bool result
function isMouseUsingVerticalInversion() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/startNewCustomScript)
---
---@param filepath zstring
---@param args table
---@return bool result
function startNewCustomScript(filepath, args) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/launchCustomMission)
---
---@param filepath zstring
---@param args table
function launchCustomMission(filepath, args) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getScmThreadStructNamed)
---
---@param thread GxtString
---@return int handle
function getScmThreadStructNamed(thread) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setCleoSharedVar)
---
---@param var int
---@param value int
function setCleoSharedVar(var, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCleoSharedVar)
---
---@param var int
---@return int value
function getCleoSharedVar(var) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSpawnPlayer)
---
function sampSpawnPlayer() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetBase)
---
---@return uint handle
function sampGetBase() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampAddChatMessage)
---
---@param text zstring
---@param color uint
function sampAddChatMessage(text, color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendChat)
---
---@param text zstring
function sampSendChat(text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isSampAvailable)
---
---@return bool result
function isSampAvailable() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampRequestClass)
---
---@param class int
function sampRequestClass(class) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendScmEvent)
---
---@param event int
---@param id int
---@param param1 int
---@param param2 int
function sampSendScmEvent(event, id, param1, param2) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetSpecialAction)
---
---@param action int
function sampSetSpecialAction(action) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendDeathByPlayer)
---
---@param playerId int
---@param reason int
function sampSendDeathByPlayer(playerId, reason) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCarHandleBySampVehicleId)
---
---@param id int
---@return bool result
---@return Vehicle car
function sampGetCarHandleBySampVehicleId(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCharHandleBySampPlayerId)
---
---@param id int
---@return bool result
---@return Ped ped
function sampGetCharHandleBySampPlayerId(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsChatInputActive)
---
---@return bool result
function sampIsChatInputActive() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetSendrate)
---
---@param type int
---@param rate int
function sampSetSendrate(type, rate) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsPlayerConnected)
---
---@param id int
---@return bool result
function sampIsPlayerConnected(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerStructPtr)
---
---@param id int
---@return uint structPtr
function sampGetPlayerStructPtr(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerHealth)
---
---@param id int
---@return int health
function sampGetPlayerHealth(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerArmor)
---
---@param id int
---@return int armor
function sampGetPlayerArmor(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetGamestate)
---
---@param gamestate int
function sampSetGamestate(gamestate) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampDisconnectWithReason)
---
---@param timeout bool
function sampDisconnectWithReason(timeout) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetLocalPlayerName)
---
---@param name zstring
function sampSetLocalPlayerName(name) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerPing)
---
---@param id int
---@return int ping
function sampGetPlayerPing(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerIdByCharHandle)
---
---@param ped Ped
---@return bool result
---@return int id
function sampGetPlayerIdByCharHandle(ped) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetVehicleIdByCarHandle)
---
---@param car Vehicle
---@return bool result
---@return int id
function sampGetVehicleIdByCarHandle(car) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetStreamedOutPlayerPos)
---
---@param id int
---@return bool result
---@return float posX
---@return float posY
---@return float posZ
function sampGetStreamedOutPlayerPos(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendEnterVehicle)
---
---@param id int
---@param passenger bool
function sampSendEnterVehicle(id, passenger) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendExitVehicle)
---
---@param id int
function sampSendExitVehicle(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendSpawn)
---
function sampSendSpawn() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendDamageVehicle)
---
---@param car Vehicle
---@param panel int
---@param doors int
---@param lights int
---@param tires int
function sampSendDamageVehicle(car, panel, doors, lights, tires) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampRegisterChatCommand)
---
---@param cmd zstring
---@param func function
---@return bool result
function sampRegisterChatCommand(cmd, func) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerNickname)
---
---@param id int
---@return zstring name
function sampGetPlayerNickname(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerColor)
---
---@param id int
---@return uint color
function sampGetPlayerColor(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampConnectToServer)
---
---@param ip zstring
---@param port uint
function sampConnectToServer(ip, port) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCurrentServerAddress)
---
---@return zstring ip
---@return uint port
function sampGetCurrentServerAddress() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCurrentServerName)
---
---@return zstring name
function sampGetCurrentServerName() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampShowDialog)
---
---@param id int
---@param caption zstring
---@param text zstring
---@param button1 zstring
---@param button2 zstring
---@param style int
function sampShowDialog(id, caption, text, button1, button2, style) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampHasDialogRespond)
---
---@param id int
---@return bool result
---@return int button
---@return int list
---@return zstring input
function sampHasDialogRespond(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetNewBitStream)
---
---@return Bitstream bs
function raknetNewBitStream() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetDeleteBitStream)
---
---@param bs Bitstream
function raknetDeleteBitStream(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetResetBitStream)
---
---@param bs Bitstream
function raknetResetBitStream(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBool)
---
---@param bs Bitstream
---@param value bool
function raknetBitStreamWriteBool(bs, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt8)
---
---@param bs Bitstream
---@param value int
function raknetBitStreamWriteInt8(bs, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt16)
---
---@param bs Bitstream
---@param value int
function raknetBitStreamWriteInt16(bs, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt32)
---
---@param bs Bitstream
---@param value int
function raknetBitStreamWriteInt32(bs, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteFloat)
---
---@param bs Bitstream
---@param value float
function raknetBitStreamWriteFloat(bs, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBuffer)
---
---@param bs Bitstream
---@param dest uint
---@param size uint
function raknetBitStreamWriteBuffer(bs, dest, size) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBitStream)
---
---@param bs Bitstream
---@param bitStream Bitstream
function raknetBitStreamWriteBitStream(bs, bitStream) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteString)
---
---@param bs Bitstream
---@param str string
function raknetBitStreamWriteString(bs, str) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetSendRpcEx)
---
---@param rpc int
---@param bs Bitstream
---@param priority int
---@param reliability int
---@param channel int
---@param timestamp bool
function raknetSendRpcEx(rpc, bs, priority, reliability, channel, timestamp) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetSendBitStreamEx)
---
---@param bs Bitstream
---@param priority int
---@param reliability int
---@param channel int
function raknetSendBitStreamEx(bs, priority, reliability, channel) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampCreate3dText)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampDestroy3dText)
---
---@param textlabel int
function sampDestroy3dText(textlabel) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIs3dTextDefined)
---
---@param _3dText int
---@return bool result
function sampIs3dTextDefined(_3dText) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampCloseCurrentDialogWithButton)
---
---@param button int
function sampCloseCurrentDialogWithButton(button) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogListItem)
---
---@return int list
function sampGetCurrentDialogListItem() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogListItem)
---
---@param list int
function sampSetCurrentDialogListItem(list) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogEditboxText)
---
---@return zstring text
function sampGetCurrentDialogEditboxText() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogEditboxText)
---
---@param text zstring
function sampSetCurrentDialogEditboxText(text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsDialogActive)
---
---@return bool result
function sampIsDialogActive() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogType)
---
---@return int type
function sampGetCurrentDialogType() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogId)
---
---@return int id
function sampGetCurrentDialogId() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetGamestate)
---
---@return int gamestate
function sampGetGamestate() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetObjectHandleBySampId)
---
---@param id int
---@return Object object
function sampGetObjectHandleBySampId(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPickupHandleBySampId)
---
---@param id int
---@return Pickup pickup
function sampGetPickupHandleBySampId(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetObjectSampIdByHandle)
---
---@param object Object
---@return int objectId
function sampGetObjectSampIdByHandle(object) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPickupSampIdByHandle)
---
---@param pickup Pickup
---@return int pickupId
function sampGetPickupSampIdByHandle(pickup) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetListboxItemsCount)
---
---@return int count
function sampGetListboxItemsCount() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerAnimationId)
---
---@param playerId int
---@return int animid
function sampGetPlayerAnimationId(playerId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetAnimationNameAndFile)
---
---@param animid int
---@return zstring file
---@return zstring name
function sampGetAnimationNameAndFile(animid) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampFindAnimationIdByNameAndFile)
---
---@param name zstring
---@param file zstring
---@return int id
function sampFindAnimationIdByNameAndFile(name, file) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getScreenResolution)
---
---@return int resX
---@return int resY
function getScreenResolution() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetListboxItemText)
---
---@param item int
---@return zstring text
function sampGetListboxItemText(item) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsPlayerPaused)
---
---@param id int
---@return bool result
function sampIsPlayerPaused(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampToggleCursor)
---
---@param show bool
function sampToggleCursor(show) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsLocalPlayerSpawned)
---
---@return bool result
function sampIsLocalPlayerSpawned() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerSpecialAction)
---
---@param id int
---@return int action
function sampGetPlayerSpecialAction(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampUnregisterChatCommand)
---
---@param cmd zstring
---@return bool result
function sampUnregisterChatCommand(cmd) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsPlayerNpc)
---
---@param id int
---@return bool result
function sampIsPlayerNpc(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerScore)
---
---@param id int
---@return int score
function sampGetPlayerScore(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetChatString)
---
---@param id int
---@param text zstring
---@param prefix zstring
---@param color uint
---@param pcolor uint
function sampSetChatString(id, text, prefix, color, pcolor) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetChatString)
---
---@param id int
---@return zstring text
---@return zstring prefix
---@return uint color
---@return uint pcolor
function sampGetChatString(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetChatInputText)
---
---@param text zstring
function sampSetChatInputText(text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetChatInputText)
---
---@return zstring text
function sampGetChatInputText() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampfuncsLog)
---
---@param msg zstring
function sampfuncsLog(msg) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetChatInputEnabled)
---
---@param enabled bool
function sampSetChatInputEnabled(enabled) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetRakclientInterface)
---
---@return uint rakclientPtr
function sampGetRakclientInterface() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetRakpeer)
---
---@return uint rakpeer
function sampGetRakpeer() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetRakclientFuncAddressByIndex)
---
---@param index int
---@return uint address
function sampGetRakclientFuncAddressByIndex(index) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetRpcCallbackByRpcId)
---
---@param index int
---@return uint callbackAddress
function sampGetRpcCallbackByRpcId(index) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetRpcNodeByRpcId)
---
---@param index int
---@return uint node
function sampGetRpcNodeByRpcId(index) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetSampInfoPtr)
---
---@return uint sampPtr
function sampGetSampInfoPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutCreateDialog)
---
---@param name zstring
---@return DxutDialog dialog
function dxutCreateDialog(name) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutPopEvent)
---
---@param dialog DxutDialog
---@return bool result
---@return int event
---@return int id
function dxutPopEvent(dialog) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutAddButton)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutAddCheckbox)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetDialogPos)
---
---@param dialog DxutDialog
---@param posX int
---@param posY int
---@param sizeX int
---@param sizeY int
function dxutSetDialogPos(dialog, posX, posY, sizeX, sizeY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetDialogPosAndSize)
---
---@param dialog DxutDialog
---@return int posX
---@return int posY
---@return int sizeX
---@return int sizeY
function dxutGetDialogPosAndSize(dialog) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetDialogVisible)
---
---@param dialog DxutDialog
---@param visible bool
function dxutSetDialogVisible(dialog, visible) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutIsDialogVisible)
---
---@param dialog DxutDialog
---@return bool result
function dxutIsDialogVisible(dialog) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutAddEditbox)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetControlText)
---
---@param dialog DxutDialog
---@param id int
---@return zstring text
function dxutGetControlText(dialog, id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetSendRpc)
---
---@param rpc int
---@param bs Bitstream
function raknetSendRpc(rpc, bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetSendBitStream)
---
---@param bs Bitstream
function raknetSendBitStream(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsCursorActive)
---
---@return bool result
function sampIsCursorActive() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetCursorMode)
---
---@param mode int
function sampSetCursorMode(mode) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCursorMode)
---
---@return int mode
function sampGetCursorMode() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetControlVisible)
---
---@param dialog DxutDialog
---@param id int
---@param visible bool
function dxutSetControlVisible(dialog, id, visible) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutAddStatic)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutIsCheckboxChecked)
---
---@param dialog DxutDialog
---@param id int
---@return bool result
function dxutIsCheckboxChecked(dialog, id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetDialogBackgroundColor)
---
---@param dialog DxutDialog
---@param color uint
function dxutSetDialogBackgroundColor(dialog, color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetControlText)
---
---@param dialog DxutDialog
---@param id int
---@param text zstring
function dxutSetControlText(dialog, id, text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutControlIsVisible)
---
---@param dialog DxutDialog
---@param id int
---@return bool result
function dxutControlIsVisible(dialog, id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutAddSlider)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetSliderValue)
---
---@param dialog DxutDialog
---@param id int
---@return int value
function dxutGetSliderValue(dialog, id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetSliderValue)
---
---@param dialog DxutDialog
---@param id int
---@param value int
function dxutSetSliderValue(dialog, id, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutAddListbox)
---
---@param dialog DxutDialog
---@param id int
---@param posX int
---@param posY int
---@param sizeX int
---@param sizeY int
function dxutAddListbox(dialog, id, posX, posY, sizeX, sizeY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutListboxInsertItem)
---
---@param dialog DxutDialog
---@param id int
---@param element zstring
---@param data uint
---@param after int
function dxutListboxInsertItem(dialog, id, element, data, after) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetListboxSelectedItemAndCount)
---
---@param dialog DxutDialog
---@param id int
---@return int element
---@return int count
function dxutGetListboxSelectedItemAndCount(dialog, id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutListboxDeleteItem)
---
---@param dialog DxutDialog
---@param id int
---@param element int
function dxutListboxDeleteItem(dialog, id, element) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetListboxItemTextAndData)
---
---@param dialog DxutDialog
---@param id int
---@param element int
---@return zstring text
---@return uint data
function dxutGetListboxItemTextAndData(dialog, id, element) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutCheckboxSetChecked)
---
---@param dialog DxutDialog
---@param id int
---@param checked bool
function dxutCheckboxSetChecked(dialog, id, checked) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutEnableDialogCaption)
---
---@param dialog DxutDialog
---@param enable bool
function dxutEnableDialogCaption(dialog, enable) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutIsDialogCaptionEnabled)
---
---@param dialog DxutDialog
---@return bool result
function dxutIsDialogCaptionEnabled(dialog) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetDialogMinimized)
---
---@param dialog DxutDialog
---@param minimized bool
function dxutSetDialogMinimized(dialog, minimized) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutIsDialogMinimized)
---
---@param dialog DxutDialog
---@return bool result
function dxutIsDialogMinimized(dialog) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutDeleteControl)
---
---@param dialog DxutDialog
---@param id int
function dxutDeleteControl(dialog, id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutDeleteDialog)
---
---@param dialog DxutDialog
function dxutDeleteDialog(dialog) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetFocusOnControl)
---
---@param dialog DxutDialog
---@param id int
function dxutSetFocusOnControl(dialog, id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetControlSize)
---
---@param dialog DxutDialog
---@param id int
---@param sizeX int
---@param sizeY int
function dxutSetControlSize(dialog, id, sizeX, sizeY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetControlSize)
---
---@param dialog DxutDialog
---@param id int
---@return int sizeX
---@return int sizeY
function dxutGetControlSize(dialog, id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetControlPos)
---
---@param dialog DxutDialog
---@param id int
---@param posX int
---@param posY int
function dxutSetControlPos(dialog, id, posX, posY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetControlPos)
---
---@param dialog DxutDialog
---@param id int
---@return int posX
---@return int posY
function dxutGetControlPos(dialog, id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetCheckboxColor)
---
---@param dialog DxutDialog
---@param id int
---@param color uint
function dxutSetCheckboxColor(dialog, id, color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutIsDialogExists)
---
---@param dialog DxutDialog
---@return bool result
function dxutIsDialogExists(dialog) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetServerSettingsPtr)
---
---@return uint settingsPtr
function sampGetServerSettingsPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetSampPoolsPtr)
---
---@return uint poolsPtr
function sampGetSampPoolsPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetChatInfoPtr)
---
---@return uint chatPtr
function sampGetChatInfoPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetInputInfoPtr)
---
---@return uint inputPtr
function sampGetInputInfoPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetDialogInfoPtr)
---
---@return uint dialogPtr
function sampGetDialogInfoPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetKillInfoPtr)
---
---@return uint kill
function sampGetKillInfoPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetMiscInfoPtr)
---
---@return uint miscPtr
function sampGetMiscInfoPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetTextdrawPoolPtr)
---
---@return uint tdpoolPtr
function sampGetTextdrawPoolPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetObjectPoolPtr)
---
---@return int objpoolPtr
function sampGetObjectPoolPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetGangzonePoolPtr)
---
---@return uint gzpoolPtr
function sampGetGangzonePoolPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetTextlabelPoolPtr)
---
---@return uint tlabelpoolPtr
function sampGetTextlabelPoolPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerPoolPtr)
---
---@return uint playerpoolPtr
function sampGetPlayerPoolPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetVehiclePoolPtr)
---
---@return uint vehpoolPtr
function sampGetVehiclePoolPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPickupPoolPtr)
---
---@return uint pickuppoolPtr
function sampGetPickupPoolPtr() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampStorePlayerOnfootData)
---
---@param id int
---@param dstBuffer uint
function sampStorePlayerOnfootData(id, dstBuffer) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampStorePlayerIncarData)
---
---@param id int
---@param dstBuffer uint
function sampStorePlayerIncarData(id, dstBuffer) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampStorePlayerPassengerData)
---
---@param id int
---@param dstBuffer uint
function sampStorePlayerPassengerData(id, dstBuffer) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampStorePlayerTrailerData)
---
---@param id int
---@param dstBuffer uint
function sampStorePlayerTrailerData(id, dstBuffer) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampStorePlayerAimData)
---
---@param id int
---@param dstBuffer uint
function sampStorePlayerAimData(id, dstBuffer) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendRconCommand)
---
---@param cmd zstring
function sampSendRconCommand(cmd) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendOnfootData)
---
---@param dataPtr uint
function sampSendOnfootData(dataPtr) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendIncarData)
---
---@param dataPtr uint
function sampSendIncarData(dataPtr) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendPassengerData)
---
---@param dataPtr uint
function sampSendPassengerData(dataPtr) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendAimData)
---
---@param dataPtr uint
function sampSendAimData(dataPtr) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendBulletData)
---
---@param dataPtr uint
function sampSendBulletData(dataPtr) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendTrailerData)
---
---@param dataPtr uint
function sampSendTrailerData(dataPtr) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendUnoccupiedData)
---
---@param dataPtr uint
function sampSendUnoccupiedData(dataPtr) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendSpectatorData)
---
---@param dataPtr uint
function sampSendSpectatorData(dataPtr) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendClickPlayer)
---
---@param id int
---@param source int
function sampSendClickPlayer(id, source) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendDialogResponse)
---
---@param id int
---@param button int
---@param listitem int
---@param input zstring
function sampSendDialogResponse(id, button, listitem, input) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendClickTextdraw)
---
---@param id int
function sampSendClickTextdraw(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendGiveDamage)
---
---@param id int
---@param damage float
---@param weapon int
---@param bodypart int
function sampSendGiveDamage(id, damage, weapon, bodypart) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendTakeDamage)
---
---@param id int
---@param damage float
---@param weapon int
---@param bodypart int
function sampSendTakeDamage(id, damage, weapon, bodypart) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendEditObject)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendEditAttachedObject)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendInteriorChange)
---
---@param id int
function sampSendInteriorChange(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendRequestSpawn)
---
function sampSendRequestSpawn() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendPickedUpPickup)
---
---@param id int
function sampSendPickedUpPickup(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendMenuSelectRow)
---
---@param id int
function sampSendMenuSelectRow(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendMenuQuit)
---
function sampSendMenuQuit() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendVehicleDestroyed)
---
---@param id int
function sampSendVehicleDestroyed(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsScoreboardOpen)
---
---@return bool result
function sampIsScoreboardOpen() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampToggleScoreboard)
---
---@param show bool
function sampToggleScoreboard(show) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetDialogText)
---
---@return zstring text
function sampGetDialogText() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetDialogCaption)
---
---@return zstring caption
function sampGetDialogCaption() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetDialogClientside)
---
---@param clientside bool
function sampSetDialogClientside(clientside) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsDialogClientside)
---
---@return bool result
function sampIsDialogClientside() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsChatVisible)
---
---@return bool result
function sampIsChatVisible() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetChatDisplayMode)
---
---@return int mode
function sampGetChatDisplayMode() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetChatDisplayMode)
---
---@param mode int
function sampSetChatDisplayMode(mode) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/pauseScmThread)
---
---@param thread uint
function pauseScmThread(thread) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/resumeScmThread)
---
---@param thread uint
function resumeScmThread(thread) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBool)
---
---@param bs Bitstream
---@return bool value
function raknetBitStreamReadBool(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt8)
---
---@param bs Bitstream
---@return int value
function raknetBitStreamReadInt8(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt16)
---
---@param bs Bitstream
---@return int value
function raknetBitStreamReadInt16(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt32)
---
---@param bs Bitstream
---@return int value
function raknetBitStreamReadInt32(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadFloat)
---
---@param bs Bitstream
---@return float value
function raknetBitStreamReadFloat(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBuffer)
---
---@param bs Bitstream
---@param dest uint
---@param size uint
function raknetBitStreamReadBuffer(bs, dest, size) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadString)
---
---@param bs Bitstream
---@param size uint
---@return string value
function raknetBitStreamReadString(bs, size) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamResetReadPointer)
---
---@param bs Bitstream
function raknetBitStreamResetReadPointer(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamResetWritePointer)
---
---@param bs Bitstream
function raknetBitStreamResetWritePointer(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamIgnoreBits)
---
---@param bs Bitstream
---@param amount int
function raknetBitStreamIgnoreBits(bs, amount) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetWriteOffset)
---
---@param bs Bitstream
---@param offset int
function raknetBitStreamSetWriteOffset(bs, offset) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetReadOffset)
---
---@param bs Bitstream
---@param offset int
function raknetBitStreamSetReadOffset(bs, offset) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBitsUsed)
---
---@param bs Bitstream
---@return uint value
function raknetBitStreamGetNumberOfBitsUsed(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBytesUsed)
---
---@param bs Bitstream
---@return uint value
function raknetBitStreamGetNumberOfBytesUsed(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfUnreadBits)
---
---@param bs Bitstream
---@return uint value
function raknetBitStreamGetNumberOfUnreadBits(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetWriteOffset)
---
---@param bs Bitstream
---@return int value
function raknetBitStreamGetWriteOffset(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetReadOffset)
---
---@param bs Bitstream
---@return int value
function raknetBitStreamGetReadOffset(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetDataPtr)
---
---@param bs Bitstream
---@return uint value
function raknetBitStreamGetDataPtr(bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamDecodeString)
---
---@param bs Bitstream
---@param size int
---@return zstring string
function raknetBitStreamDecodeString(bs, size) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamEncodeString)
---
---@param bs Bitstream
---@param string zstring
function raknetBitStreamEncodeString(bs, string) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetEmulRpcReceiveBitStream)
---
---@param rpc int
---@param bs Bitstream
function raknetEmulRpcReceiveBitStream(rpc, bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetEmulPacketReceiveBitStream)
---
---@param packet int
---@param bs Bitstream
function raknetEmulPacketReceiveBitStream(packet, bs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetGetRpcName)
---
---@param rpc int
---@return zstring name
function raknetGetRpcName(rpc) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetGetPacketName)
---
---@param packet int
---@return zstring name
function raknetGetPacketName(packet) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setSampfuncsGlobalVar)
---
---@param var zstring
---@param value int
---@return bool result
function setSampfuncsGlobalVar(var, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVar)
---
---@param var zstring
---@return bool result
---@return int value
function getSampfuncsGlobalVar(var) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampCreate3dTextEx)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGet3dTextInfoById)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSet3dTextString)
---
---@param id int
---@param text zstring
function sampSet3dTextString(id, text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawCreate)
---
---@param id int
---@param text zstring
---@param posX float
---@param posY float
function sampTextdrawCreate(id, text, posX, posY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetBoxColorAndSize)
---
---@param id int
---@param box int
---@param color uint
---@param sizeX float
---@param sizeY float
function sampTextdrawSetBoxColorAndSize(id, box, color, sizeX, sizeY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetAlign)
---
---@param id int
---@param align int
function sampTextdrawSetAlign(id, align) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetProportional)
---
---@param id int
---@param proportional int
function sampTextdrawSetProportional(id, proportional) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetStyle)
---
---@param id int
---@param style int
function sampTextdrawSetStyle(id, style) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetShadow)
---
---@param id int
---@param shadow int
---@param color uint
function sampTextdrawSetShadow(id, shadow, color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetOutlineColor)
---
---@param id int
---@param outline int
---@param color uint
function sampTextdrawSetOutlineColor(id, outline, color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetModelRotationZoomVehColor)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetString)
---
---@param id int
---@param text zstring
function sampTextdrawSetString(id, text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetPos)
---
---@param id int
---@param posX float
---@param posY float
function sampTextdrawSetPos(id, posX, posY) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetLetterSizeAndColor)
---
---@param id int
---@param letSizeX float
---@param letSizeY float
---@param color uint
function sampTextdrawSetLetterSizeAndColor(id, letSizeX, letSizeY, color) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetBoxEnabledColorAndSize)
---
---@param id int
---@return int box
---@return uint color
---@return float sizeX
---@return float sizeY
function sampTextdrawGetBoxEnabledColorAndSize(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetAlign)
---
---@param id int
---@return int align
function sampTextdrawGetAlign(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetProportional)
---
---@param id int
---@return int prop
function sampTextdrawGetProportional(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetStyle)
---
---@param id int
---@return int style
function sampTextdrawGetStyle(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetShadowColor)
---
---@param id int
---@return int shadow
---@return uint color
function sampTextdrawGetShadowColor(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetOutlineColor)
---
---@param id int
---@return int outline
---@return uint color
function sampTextdrawGetOutlineColor(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetModelRotationZoomVehColor)
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
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetString)
---
---@param id int
---@return zstring text
function sampTextdrawGetString(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetPos)
---
---@param id int
---@return float posX
---@return float posY
function sampTextdrawGetPos(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetLetterSizeAndColor)
---
---@param id int
---@return float letSizeX
---@return float letSizeY
---@return uint color
function sampTextdrawGetLetterSizeAndColor(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawIsExists)
---
---@param id int
---@return bool result
function sampTextdrawIsExists(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawDelete)
---
---@param id int
function sampTextdrawDelete(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isSampfuncsGlobalVarDefined)
---
---@param var zstring
---@return bool result
function isSampfuncsGlobalVarDefined(var) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVarAccessForThread)
---
---@param var zstring
---@param thread uint
---@return bool read
---@return bool write
function getSampfuncsGlobalVarAccessForThread(var, thread) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/runSampfuncsConsoleCommand)
---
---@param cmd zstring
function runSampfuncsConsoleCommand(cmd) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampfuncsRegisterConsoleCommand)
---
---@param cmd zstring
---@param func function
---@return bool result
function sampfuncsRegisterConsoleCommand(cmd, func) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampfuncsUnregisterConsoleCommand)
---
---@param cmd zstring
---@return bool result
function sampfuncsUnregisterConsoleCommand(cmd) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/createScmThreadAtPointer)
---
---@param pointer uint
---@param args table
---@return uint thread
function createScmThreadAtPointer(pointer, args) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setScmThreadLocalVar)
---
---@param thread uint
---@param var int
---@param value any
function setScmThreadLocalVar(thread, var, value) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getScmThreadLocalVar)
---
---@param thread uint
---@param var int
---@return int value
function getScmThreadLocalVar(thread, var) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/destroyScmThread)
---
---@param thread uint
function destroyScmThread(thread) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/restartScmThread)
---
---@param thread uint
---@param args table
function restartScmThread(thread, args) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleActive)
---
---@return bool result
function isSampfuncsConsoleActive() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetClientCommandDescription)
---
---@param cmd zstring
---@param text zstring
function sampSetClientCommandDescription(cmd, text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/setSampfuncsConsoleCommandDescription)
---
---@param cmd zstring
---@param text zstring
function setSampfuncsConsoleCommandDescription(cmd, text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampForceVehicleSync)
---
---@param id int
function sampForceVehicleSync(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampForceUnoccupiedSyncSeatId)
---
---@param id int
---@param seatId int
function sampForceUnoccupiedSyncSeatId(id, seatId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampForceOnfootSync)
---
function sampForceOnfootSync() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampForceAimSync)
---
function sampForceAimSync() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampForceTrailerSync)
---
---@param id int
function sampForceTrailerSync(id) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampForcePassengerSyncSeatId)
---
---@param id int
---@param seatId int
function sampForcePassengerSyncSeatId(id, seatId) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampForceStatsSync)
---
function sampForceStatsSync() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampForceWeaponsSync)
---
function sampForceWeaponsSync() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetMaxPlayerId)
---
---@param streamed bool
---@return int id
function sampGetMaxPlayerId(streamed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerCount)
---
---@param streamed bool
---@return int count
function sampGetPlayerCount(streamed) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampProcessChatInput)
---
---@param text zstring
function sampProcessChatInput(text) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsChatCommandDefined)
---
---@param cmd zstring
---@return bool result
function sampIsChatCommandDefined(cmd) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleCommandDefined)
---
---@param cmd zstring
---@return bool result
function isSampfuncsConsoleCommandDefined(cmd) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/getCleoLibraryVersion)
---
---@return int version
function getCleoLibraryVersion() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/main)
---
function main() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onExitScript)
---
---@param quitGame bool
function onExitScript(quitGame) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onQuitGame)
---
function onQuitGame() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onScriptLoad)
---
---@param s LuaScript
function onScriptLoad(s) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onScriptTerminate)
---
---@param s LuaScript
---@param quitGame bool
function onScriptTerminate(s, quitGame) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onSystemInitialized)
---
function onSystemInitialized() end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onScriptMessage)
---
---@param msg string
---@param s LuaScript
function onScriptMessage(msg, s) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onSystemMessage)
---
---@param msg string
---@param type int
---@param s LuaScript
function onSystemMessage(msg, type, s) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onReceivePacket)
---
---@param id int
---@param bitStream Bitstream
---@return bool process=true
---@return int id
---@return Bitstream bitStream
function onReceivePacket(id, bitStream) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onReceiveRpc)
---
---@param id int
---@param bitStream Bitstream
---@return bool process=true
---@return int id
---@return Bitstream bitStream
function onReceiveRpc(id, bitStream) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onSendPacket)
---
---@param id int
---@param bitStream Bitstream
---@param priority int
---@param reliability int
---@param orderingChannel int
---@return bool process=true
---@return int id
---@return Bitstream bitStream
---@return int priority
---@return int reliability
---@return int orderingChannel
function onSendPacket(id, bitStream, priority, reliability, orderingChannel) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onSendRpc)
---
---@param id int
---@param bitStream Bitstream
---@param priority int
---@param reliability int
---@param orderingChannel int
---@param shiftTs bool
---@return bool process=true
---@return int id
---@return Bitstream bitStream
---@return int priority
---@return int reliability
---@return int orderingChannel
---@return bool shiftTs
function onSendRpc(id, bitStream, priority, reliability, orderingChannel, shiftTs) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onWindowMessage)
---
---@param msg uint
---@param wparam uint
---@param lparam int
function onWindowMessage(msg, wparam, lparam) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onStartNewGame)
---
---@param mpack int
function onStartNewGame(mpack) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onLoadGame)
---
---@param saveData table
function onLoadGame(saveData) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/onSaveGame)
---
---@param saveData table
---@return table newSaveData
function onSaveGame(saveData) end

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/PLAYER_PED)
---
---@type Ped
PLAYER_PED = 0

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/PLAYER_HANDLE)
---
---@type Player
PLAYER_HANDLE = 0

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/PLAYER_PED)
---
---@type Ped
playerPed = 0

---
--- [Open the wiki](https://wiki.blast.hk/moonloader/lua/PLAYER_HANDLE)
---
---@type Player
playerHandle = 0
