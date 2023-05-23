---@meta
---@diagnostic disable: lowercase-global, missing-return

---@alias bool boolean # логический
---@alias int number # целочисленный со знаком, 4 байта
---@alias uint number # целочисленный без знака, 4 байта
---@alias float number # число с плавающей точкой, 4 байта
---@alias double number # число с плавающей точкой двойной точности, 8 байт
---@alias zstring string # нуль-терминированная строка (в Lua обычная строка)

---@class Ped # скриптовый хэндл игрового персонажа
---@class Marker # скриптовый хэндл маркера
---@class Pickup # скриптовый хэндл пикапа
---@class Searchlight # скриптовый хэндл прожектора
---@class Particle # скриптовый хэндл визуального эффекта
---@class Checkpoint # скриптовый хэндл чекпоинта
---@class Vehicle # скриптовый хэндл транспортного средства
---@class Object # скриптовый хэндл игрового объекта
---@class Player # идентификатор игрока

---@alias GxtString string # короткая строка-идентификатор GXT-записи
---@alias Model uint # идентификатор игровой модели
---@alias Bitstream uint # указатель на объект BitStream
---@alias VarId uint # индекс скриптовой глобальной переменной

---@class DxutDialog # хэндл DXUT-диалога SAMPFUNCS

---@class DxFont # экземпляр шрифта DirectX
---@class DxTexture # экземпляр текстуры DirectX
---@class AudioStream # экземпляр аудиопотока BASS
---@class Filesearch # хэндл поиска файлов

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
lua_thread = {}

---
--- Создаёт новый поток и сразу же запускает его с указанными параметрами.  
--- Для создания потока приостановленным нужно использовать функцию `lua_thread.create_suspended`.  
--- За примерами и всеми подробностями о потоках обратитесь к статье <a href="Скриптовые потоки">https://wiki.blast.hk/moonloader/scripting/threads</a>.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/lua_thread/create">Open the wiki</a></b>  
---
---@param func function функция потока, которая начнёт исполнение сразу после создания потока
---@param ... any параметры, с которыми будет вызвана функция
---@return LuaThread thread экземпляр `LuaThread`
function lua_thread.create(func, ...) end

---
--- Создаёт новый поток в состоянии ожидания запуска. Такой поток не начнёт выполнение сразу же после создания, вместо чего будет находиться в ожидании активации функцией lua_thread:run.  
--- Для создания потока с безотложным запуском нужно использовать функцию lua_thread.create.  
--- За примерами и всеми подробностями о потоках обратитесь к статье Скриптовые потоки.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/lua_thread/create_suspended">Open the wiki</a></b>  
---
---@param func function функция потока, которая выполнится после вызова `thread:run()`
---@return LuaThread thread экземпляр `LuaThread`
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

---
--- Возвращает `LuaScript` скрипта, из которого была вызвана функция.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/thisScript">Open the wiki</a></b>  
---
---@return LuaScript script скрипт
function thisScript() end

---@class script
script = {}

---
--- Статическое свойство. Возвращает объект `LuaScript` текущего скрипта. Является аналогом функции `thisScript`.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/this">Open the wiki</a></b>  
---
---@type LuaScript
script.this = {}

---
--- Загружает скрипт из файла и возвращает объект `LuaScript`.  
--- Функция пытается загрузить скрипт в следующем порядке путей:
---  - рабочая директория + путь
---  - рабочая директория + путь + .lua(c)
---  - абсолютный путь
---  - абсолютный путь + .lua(c)
---
--- Возвращает `nil`, если скрипт не был загружен.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/load">Open the wiki</a></b>  
---
---@param file string путь к файлу
---@return LuaScript script скрипт
function script.load(file) end

---
--- Ищет загруженный скрипт по имени. Возвращает объект `LuaScript`, если скрипт найден, в противном случае возвращает `nil`.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/find">Open the wiki</a></b>  
---
---@param name string название скрипта
---@return LuaScript script скрипт
function script.find(name) end

---
--- Возвращает массив загруженных скриптов.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/list">Open the wiki</a></b>  
---
---@return LuaScript[] list массив `LuaScript` загруженных скриптов
function script.list() end

--- 
--- Получает загруженный скрипт по его уникальному идентификатору и возвращает объект `LuaScript`.  
--- Возвращает `nil`, если скрипта с таким идентификатором нет.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/get">Open the wiki</a></b>  
---
---@param scriptId int идентификатор скрипта
---@return LuaScript script скрипт
function script.get(scriptId) end

---
--- Проверяет, активен ли курсор  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCursorActive">Open the wiki</a></b>  
---
---@return bool result результат
function isCursorActive() end

---
--- Возвращает массив со всеми пикапами  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAllPickups">Open the wiki</a></b>  
---
---@return Pickup[] pickups пикапы
function getAllPickups() end

---
--- Возвращает хэндл пикапа по указателю на экземляр класса CPickup.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupPointerHandle">Open the wiki</a></b>  
---
---@param handle int указатель
---@return Pickup pickup хэндл пикапа
function getPickupPointerHandle(handle) end

---
--- Возвращает указатель на структуру пикапа  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupPointer">Open the wiki</a></b>  
---
---@param pickup Pickup хэндл
---@return int pointer указатель
function getPickupPointer(pickup) end

---@alias PickupType
---| 0 # Отображается не всегда. Не может быть подобран.
---| 1 # Отображается всегда.
---| 2 # Проподает после поднятия, появляется через 30 секунд, если игрок находится на дистанции хотя бы 15 метров от пикапа.
---| 3 # Пропадает после поднятия, появляется после смерти.
---| 4 # Пропадает через 15-20 секунд. Появляется после смерти.
---| 8 # Пропадает после поднятия.
---| 11 # Взрывается через несколько секунд после создания (бомбы?)
---| 12 # Взрывается через несколько секунд после создания.
---| 13 # Невидимый. Издаёт звук чекпоинта, когда подобран на автомобиле.
---| 14 # Пропадает после поднятия, но может быть подобран только на автомобиле. Издоаёт звук чекпоинта.
---| 15 # Тоже самое, что и тип 2.
---| 18 # Похож на тип 1. Нажатие `TAB` заставит его пропасть.
---| 19 # Пропадаёт после поднятия, но не появляется вновь. Издаёт звук поднятия денег.
---| 20 # Похож на тип 1. Пропадает, когда ты его фотографируешь (используя фотоаппарат).
---| 22 # Тоже самое, что и тип 3.

---
--- Возвращает тип пикапа  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupType">Open the wiki</a></b>  
---
---@param pickup Pickup хэндл пикапа
---@return PickupType type тип пикапа
function getPickupType(pickup) end

---
--- Возвращает модель пикапа  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupModel">Open the wiki</a></b>  
---
---@param pickup Pickup хэндл пикапа
---@return int model модель
function getPickupModel(pickup) end

---
--- Возвращает кватернион вращения объекта  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectQuaternion">Open the wiki</a></b>  
---
---@param object Object объект
---@return float x
---@return float y
---@return float z
---@return float w
function getObjectQuaternion(object) end

---
--- Задаёт кватернион вращения объекта  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectQuaternion">Open the wiki</a></b>  
---
---@param object Object объект
---@param x float
---@param y float
---@param z float
---@param w float
function setObjectQuaternion(object, x, y, z, w) end

---
--- Возвращает кватернион вращения транспортного средства  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getVehicleQuaternion">Open the wiki</a></b>  
---
---@param car Vehicle транспорт
---@return float x
---@return float y
---@return float z
---@return float w
function getVehicleQuaternion(car) end

---
--- Задаёт кватернион вращения транспортного средства  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleQuaternion">Open the wiki</a></b>  
---
---@param car Vehicle транспорт
---@param x float
---@param y float
---@param z float
---@param w float
function setVehicleQuaternion(car, x, y, z, w) end

---
--- Возвращает кватернион вращения персонажа  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharQuaternion">Open the wiki</a></b>  
---
---@param ped Ped персонаж
---@return float x
---@return float y
---@return float z
---@return float w
function getCharQuaternion(ped) end

---
--- Задаёт кватернион вращения персонажа  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharQuaternion">Open the wiki</a></b>  
---
---@param ped Ped персонаж
---@param x float
---@param y float
---@param z float
---@param w float
function setCharQuaternion(ped, x, y, z, w) end

---
--- Загружает аудио из файла или по веб-адресу  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadAudioStream">Open the wiki</a></b>  
---
---@param audio zstring путь к файлу или Web-адрес
---@return AudioStream handle аудиопоток
function loadAudioStream(audio) end

---@alias AudioStreamState
---| 0 # Остановлен (закончен)
---| 1 # Играет
---| 2 # Приостановлен
---| 3 # Возобновлён

---
--- Задаёт новый статус аудиопотоку  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAudioStreamState">Open the wiki</a></b>  
---
---@param handle AudioStream аудиопоток
---@param state AudioStreamState состояние
function setAudioStreamState(handle, state) end

---
--- Освобождает загруженный аудиопоток.  
--- Использовать не необходимо, т.к. аудиопотоки освобождаются автоматически сборщиком мусора.  
---
--- ### Пример использования  
---
--- ```lua
---   -- не правильно:
---   releaseAudioStream(audiostream)
---   -- правильно:
---   audiostream = nil
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releaseAudioStream">Open the wiki</a></b>  
---
---@param handle AudioStream аудиопоток
---@deprecated
function releaseAudioStream(handle) end

---
--- Возвращает длительность аудиопотока в секундах  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAudioStreamLength">Open the wiki</a></b>  
---
---@param handle AudioStream аудиопоток
---@return double length длительность
function getAudioStreamLength(handle) end

---
--- Возвращает статус аудиопотока  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAudioStreamState">Open the wiki</a></b>  
---
---@param handle AudioStream аудиопоток
---@return AudioStreamState state статус
function getAudioStreamState(handle) end

---
--- Возвращает громкость аудиопотока  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAudioStreamVolume">Open the wiki</a></b>  
---
---@param audio AudioStream аудиопоток
---@return float volume громкость (1.0 - 100%, 0.0 - 0%)
function getAudioStreamVolume(audio) end

---
--- Устанавливает громкость аудиопотока  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAudioStreamVolume">Open the wiki</a></b>  
---
---@param audio AudioStream аудиопоток
---@param volume float громкость (1.0 - 100%, 0.0 - 0%)
function setAudioStreamVolume(audio, volume) end

---
--- Переключает статус зацикленности аудиопотока  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAudioStreamLooped">Open the wiki</a></b>  
---
---@param audio AudioStream аудиопоток
---@param loop bool зациклить
function setAudioStreamLooped(audio, loop) end

---
--- Загружает аудиопоток с поддержкой объёмного (3D) звука  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/load3dAudioStream">Open the wiki</a></b>  
---
---@param audio zstring путь к файлу или веб-адрес
---@return AudioStream handle загруженный аудиопоток
function load3dAudioStream(audio) end

---
--- Устанавливает 3D-аудиопотоку позицию в мире игры  
---
--- ### Пример использования  
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
---@param handle AudioStream аудиопоток
---@param posX float
---@param posY float
---@param posZ float
function setPlay3dAudioStreamAtCoordinates(handle, posX, posY, posZ) end

---
--- Прикрепляет 3D-звук к объекту  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtObject">Open the wiki</a></b>  
---
---@param audio AudioStream аудиопоток
---@param object Object объект
function setPlay3dAudioStreamAtObject(audio, object) end

---
--- Прикрепляет 3D-звук к персонажу  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtChar">Open the wiki</a></b>  
---
---@param audio AudioStream аудиопоток
---@param ped Ped персонаж
function setPlay3dAudioStreamAtChar(audio, ped) end

---
--- Прикрепляет 3D-звук к транспортному средству  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCar">Open the wiki</a></b>  
---
---@param audio AudioStream аудиопоток
---@param car Vehicle транспорт
function setPlay3dAudioStreamAtCar(audio, car) end

---
--- Загружает аудиопоток из файла в памяти процесса  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadAudioStreamFromMemory">Open the wiki</a></b>  
---
---@param address uint адрес памяти
---@param size uint размер файла
---@return AudioStream handle загруженный аудиопоток
function loadAudioStreamFromMemory(address, size) end

---
--- Загружает аудиопоток с объёмным звучанием из файла в памяти процесса  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/load3dAudioStreamFromMemory">Open the wiki</a></b>  
---
---@param address uint адрес памяти
---@param size uint размер
---@return AudioStream handle загруженный аудиопоток
function load3dAudioStreamFromMemory(address, size) end

---
--- Отображает на экране линию от точки `pos1x, pos1y` до точки `pos2x, pos2y`  
---
--- ### Пример использования  
---
--- ```lua
---   while true do
---     renderDrawLine(100, 100, 200, 200, 2.0, 0xFFD00000) -- непрозрачный красный цвет
---     wait(0) -- задержка на один кадр
---   end
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawLine">Open the wiki</a></b>  
---
---@param pos1X float координата X первой точки
---@param pos1Y float координата Y первой точки
---@param pos2X float координата X второй точки
---@param pos2Y float координата Y второй точки
---@param width float ширина линии
---@param color uint цвет линии в формате ARGB
function renderDrawLine(pos1X, pos1Y, pos2X, pos2Y, width, color) end

---
--- Рисует прямоугольник в указанных координатах с определённым размером  
---
--- ### Пример использования  
---
--- ```lua
---   renderDrawBox(10, 15, 200, 80, 0xAA00CC00)
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawBox">Open the wiki</a></b>  
---
---@param posX float координата X
---@param posY float координата Y
---@param sizeX float ширина
---@param sizeY float высота
---@param color uint цвет в ARGB
function renderDrawBox(posX, posY, sizeX, sizeY, color) end

---
--- Рисует прямоугольник с границей  
---
--- ### Пример использования  
---
--- ```lua
---   renderDrawBoxWithBorder(10, 15, 200, 80, 0xAA00CC00, 3, 0x90000000)
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawBoxWithBorder">Open the wiki</a></b>  
---
---@param posX float координата X
---@param posY float координата Y
---@param sizeX float ширина
---@param sizeY float высота
---@param color uint цвет в ARGB
---@param bsize float толщина границы
---@param bcolor uint цвет границы в ARGB
function renderDrawBoxWithBorder(posX, posY, sizeX, sizeY, color, bsize, bcolor) end

---
--- Вычисляет ширину заданного текста для загруженного шрифта и возвращает результат в пикселях.  
---
--- ### Пример использования  
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
---@param font DxFont шрифт
---@param text zstring текст
---@param ignoreColorTags bool? пропуск цветовых тегов (по умолчанию = `false`)
---@return float length ширина в пикселях
function renderGetFontDrawTextLength(font, text, ignoreColorTags) end

---
--- Возвращает высоту загруженного шрифта в пикселях  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetFontDrawHeight">Open the wiki</a></b>  
---
---@param font DxFont шрифт
---@return float height высота
function renderGetFontDrawHeight(font) end

---
--- Возвращает индекс символа в тексте по позиции в пикселях  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetFontCharIndexAt">Open the wiki</a></b>  
---
---@param font DxFont шрифт
---@param text string текст
---@param x float смещение в пикселях
---@param ignoreColorTags bool? пропуск цветовых тегов (по умолчанию = `false`)
---@return uint index индекс символа
function renderGetFontCharIndexAt(font, text, x, ignoreColorTags) end

---
--- Получает ширину определённого символа и возвращает результат в пикселях  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetFontCharWidth">Open the wiki</a></b>  
---
---@param font DxFont шрифт
---@param char string|uint символ
---@return float width ширина символа
function renderGetFontCharWidth(font, char) end

---
--- Загружает установленный в системе шрифт по названию. Можно задать стиль шрифта и требуемую кодировку.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderCreateFont">Open the wiki</a></b>  
---
---@param font zstring название
---@param height int высота
---@param flags uint флаги
---@param charset uint? кодировка
---@return DxFont font шрифт
function renderCreateFont(font, height, flags, charset) end

---
--- Освобождает объект шрифта.  
--- Загруженные шрифты выгружаются автоматически сборщиком мусора, так что использование этой функции необязательно, она существует лишь для обеспечения совместимости со старыми версиями.  
---
--- ### Пример использования  
---
--- ```lua
---   renderReleaseFont(my_font)
---   -- правильнее:
---   my_font = nil
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderReleaseFont">Open the wiki</a></b>  
---
---@param font DxFont шрифт
---@deprecated
function renderReleaseFont(font) end

---
--- Отображает текст на экране, используя загруженный шрифт.  
--- Поддерживает цветовые теги в формате `{RRGGBB}` и `{AARRGGBB}`, и символ переноса строки `\n`.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderFontDrawText">Open the wiki</a></b>  
---
---@param font DxFont шрифт
---@param text zstring текст
---@param posX float координата X
---@param posY float координата Y
---@param color uint цвет в ARGB
---@param ignoreColorTags bool? если задано `true`, цветовые теги не станут обрабатываться (по умолчанию = `false`)
function renderFontDrawText(font, text, posX, posY, color, ignoreColorTags) end

---
--- Отображает многоугольник в указанных координатах с заданным вращением и количеством углов  
---
--- ### Пример использования  
---
--- ```lua
---   -- пятиугольник по центру экрана
---   local sx, sy = getScreenResolution()
---   renderDrawPolygon(sx / 2, sy / 2, 150, 150, 5, 0.0, 0xFF1166AA)
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawPolygon">Open the wiki</a></b>  
---
---@param posX float координата X центра
---@param posY float координата Y центра
---@param sizeX float ширина
---@param sizeY float высота
---@param corners int количество вершин
---@param rotation float вращение в градусах
---@param color uint цвет фигуры в формате ARGB
function renderDrawPolygon(posX, posY, sizeX, sizeY, corners, rotation, color) end

---
--- Загружает текстуру из файла  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderLoadTextureFromFile">Open the wiki</a></b>  
---
---@param file zstring путь к файлу
---@return DxTexture texture текстура
function renderLoadTextureFromFile(file) end

---
--- Освобождает загруженную текстуру.  
--- Применять необязательно, т.к. все загруженные текстуры освобождаются сборщиком мусора.  
--- Функция оставлена для обеспечения совместимости со старыми версиями.  
---
--- ### Пример использования  
---
--- ```lua
---   renderReleaseTexture(texture )
---   -- правильнее:
---   texture  = nil
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderReleaseTexture">Open the wiki</a></b>  
---
---@param texture DxTexture текстура
function renderReleaseTexture(texture) end

---
--- Отображает загруженную текстуру по заданным координатам, с указанным размером и вращением  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawTexture">Open the wiki</a></b>  
---
---@param texture DxTexture текстура
---@param posX float координата X
---@param posY float координата Y
---@param sizeX float ширина
---@param sizeY float высота
---@param rotation float вращение
---@param color uint цвет в ARGB
function renderDrawTexture(texture, posX, posY, sizeX, sizeY, rotation, color) end

---@alias RenderType
---| 1 # список точек
---| 2 # набор линий
---| 3 # ломаная линия
---| 4 # набор треугольников
---| 5 # серия связанных треугольников (многоугольник)
---| 6 # серия связанных треугольников с единым центром

---
--- Начало рисования фигуры определённым методом.  
--- Подробнее о каждом методе построения примитивов: <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/bb147291(v=vs.85).aspx">MSDN</a>  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderBegin">Open the wiki</a></b>  
---
---@param type RenderType метод
function renderBegin(type) end

---
--- Завершение рисования фигуры.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderEnd">Open the wiki</a></b>  
---
function renderEnd() end

---
--- Задаёт цвет фигуры. Должна быть вызвана перед добавлением вершины  
---
--- ### Пример использования  
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
---@param color uint цвет в ARGB
function renderColor(color) end

---
--- Добавляет вершину в фигуру по абсолютным координатам  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderVertex">Open the wiki</a></b>  
---
---@param vX float координата X
---@param vY float координата Y
function renderVertex(vX, vY) end

---
--- Указывает, какая точка текстуры будет прикреплена к следующей вершине.  
--- Координаты точки задаются в диапазоне от `0.0` до `1.0`, относительно размеров всей текстуры.  
--- Должна быть вызвана перед каждым добавлением вершины, к которой нужно прикрепить текстуру.  
--- Без вызова `renderBindTexture` не будет иметь эффекта  
---
--- ### Пример использования  
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
---@param posX float относительные координата X текстуры
---@param posY float относительные координата Y текстуры
function renderSetTexCoord(posX, posY) end

---
--- Задаёт фигуре текстуру. Каждой фигуре может быть задана только одна текстура.  
--- Значение `nil` сбросит заданную текстуру.  
--- Эта функция должна быть использована совместно с `renderSetTexCoord`  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderBindTexture">Open the wiki</a></b>  
---
---@param texture DxTexture текстура
function renderBindTexture(texture) end

---
--- Возвращает указатель на объект `IDirect3DTexture9`, принадлежащий текстуре  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetTextureStruct">Open the wiki</a></b>  
---
---@param texture DxTexture текстура
---@return uint struct указатель
function renderGetTextureStruct(texture) end

---
--- Возвращает указатель на объект ID3DXSprite, принадлежащий текстуре  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetTextureSprite">Open the wiki</a></b>  
---
---@param texture DxTexture текстура
---@return uint sprite указатель
function renderGetTextureSprite(texture) end

---
--- Возвращает размеры изображения  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetTextureSize">Open the wiki</a></b>  
---
---@param texture DxTexture текстура
---@return uint sizeX ширина
---@return uint sizeY высота
function renderGetTextureSize(texture) end

---
--- Устанавливает значение рендерстейта.  
--- Подробнее о рендерстейтах: <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/bb172599(v=vs.85).aspx">MSDN</a>  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderSetRenderState">Open the wiki</a></b>  
---
---@param state int тип
---@param value uint новое значение
function renderSetRenderState(state, value) end

---
--- Загружает текстуру из файла в памяти процесса  
---
--- ### Пример использования  
---
--- ```lua
---   local memory = require 'memory'
---   -- загрузка текстуры вшитой внутрь самого скрипта
---   function main()
---     repeat wait(0) until isSampAvailable()
---     texture = renderLoadTextureFromFileInMemory(memory.strptr(texture), #texture)
---   end
---   -- сама текстура
---   texture = "\x89\x50\x4E\x47\x0D\x0A\x1A\x0A\x00\x00\x00..."
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderLoadTextureFromFileInMemory">Open the wiki</a></b>  
---
---@param pointer uint адрес памяти
---@param size uint размер файла
---@return DxTexture texture текстура
function renderLoadTextureFromFileInMemory(pointer, size) end

---
--- Задаёт числовую версию скрипта. Предназначена преимущественно для системы проверки обновлений.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_version_number">Open the wiki</a></b>  
---
---@param version int версия
function script_version_number(version) end

---
--- Задаёт текстовую версию скрипта.  
---
--- ### Пример использования  
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
---@param version string версия
function script_version(version) end

---
--- Задаёт название скрипта.  
--- Если название не задать, то в качестве названия будет выступать имя файла скрипта.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_name">Open the wiki</a></b>  
---
---@param name string название
function script_name(name) end

---
--- Задаёт описание скрипта.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_description">Open the wiki</a></b>  
---
---@param description string текст описания
function script_description(description) end

---
--- Задаёт нескольких авторов скрипта.  
--- Имеет аналог с более подходящим названием для указания одного автора - `script_author`.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_authors">Open the wiki</a></b>  
---
---@param author string первый автор скрипта
---@param ... string авторы скрипта
function script_authors(author, ...) end

---
--- Задаёт автора или нескольких авторов скрипта.  
--- Имеет аналог с более подходящим названием для указания нескольких авторов - <a class="is-internal-link is-valid-page" href="/moonloader/lua/script_authors">script_authors</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/script_author">Open the wiki</a>  
---
---@param author string автор скрипта
function script_author(author) end

---
--- Задаёт зависимости скрипта.  
--- На текущий момент предназначен только для вывода.  
--- В будущем получит дополнительную функциональность.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_dependencies">Open the wiki</a></b>  
---
---@param name string первая зависимость
---@param ... string зависимости
function script_dependencies(name, ...) end

---
--- Задаёт минимальную требуемую версию MoonLoader.  
--- Если версия не соответствует, выводит сообщение об ошибке, но не прекращает работу скрипта.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/script_moonloader">Open the wiki</a>  
---
---@param version int версия
function script_moonloader(version) end

---
--- Приостанавливает выполнение сопрограммы `main` на заданное время в миллисекундах.  
--- Может быть вызвана только изнутри `main` и скриптовых потоков.  
--- Если функция вызвана изнутри `main` и значение `time` равно `-1`, то скрипт будет приостановлен на бесконечный период времени, это может быть использовано для прекращения активного исполнения скрипта, но чтобы он продолжал работать и обрабатывать события.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/wait">Open the wiki</a></b>  
---
---@param time int время в миллисекундах
function wait(time) end

---
--- Возвращает значение глобальной переменной игры по её индексу.  
--- Для получения дробного значения дополнительно используется функция <a class="is-internal-link is-valid-page" href="/moonloader/lua/representIntAsFloat">representIntAsFloat</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getGameGlobal">Open the wiki</a>  
---
---@param index int номер переменной
---@return int value значение
function getGameGlobal(index) end

---
--- Задаёт значение глобальной переменной игры по её индексу.  
--- Для записи дробного значения дополнительно используется функция <a class="is-internal-link is-valid-page" href="/moonloader/lua/representFloatAsInt">representFloatAsInt</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setGameGlobal">Open the wiki</a>  
---
---@param index int номер переменной
---@param value int значение
function setGameGlobal(index, value) end

---
--- Возвращает адрес глобальной переменной игры по индексу.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getGameGlobalPtr">Open the wiki</a>  
---
---@param index int номер переменной
---@return int ptr адрес
function getGameGlobalPtr(index) end

---
--- Проверяет плагин <a class="is-internal-link is-valid-page" href="/sampfuncs">SAMPFUNCS</a> на подключенность к игре.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isSampfuncsLoaded">Open the wiki</a>  
---
---@return bool loaded статус
function isSampfuncsLoaded() end

---
--- Проверяет плагин CLEO на подключенность к игре.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCleoLoaded">Open the wiki</a>  
---
---@return bool loaded статус
function isCleoLoaded() end

---
--- Проверяет, запущен ли SA:MP.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isSampLoaded">Open the wiki</a>  
---
---@return bool loaded результат
function isSampLoaded() end

---
--- Проверяет, зажата ли клавиша.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isKeyDown">Open the wiki</a>  
---
---@param keyId int виртуальный ид клавиши
---@return bool state статус
function isKeyDown(keyId) end

---
--- Выгружает все загруженные скрипты и загружает заново из рабочей директории, учитывая добавленные и убранные.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/reloadScripts">Open the wiki</a>  
---
function reloadScripts() end

---
--- Проверяет, доступны ли функции опкодов для использования.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isOpcodesAvailable">Open the wiki</a>  
---
---@return bool status статус
function isOpcodesAvailable() end

---
--- Представляет значение числа с плавающей точкой как целое.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/representFloatAsInt">Open the wiki</a>  
---
---@param f float число с плавающей точкой
---@return int i число с плавающей точкой в представлении целого
function representFloatAsInt(f) end

---
--- Представляет значение целого в виде числа с плавающей точкой.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/representIntAsFloat">Open the wiki</a>  
---
---@param i int целое значение
---@return float i число с плавающей точкой
function representIntAsFloat(i) end

---
--- Создаёт или перезаписывает существующую GXT-запись.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setGxtEntry">Open the wiki</a>  
---
---@param key string ключ GXT-записи
---@param text string текст
function setGxtEntry(key, text) end

---
--- Создаёт [новую]{.ul} GXT-запись с уникальным ключём и возвращает его.  
--- Для изменения используйте функцию <a class="is-internal-link is-valid-page" href="/moonloader/lua/setGxtEntry">setGxtEntry</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setFreeGxtEntry">Open the wiki</a>  
---
---@param text string текст
---@return string key ключ созданной записи
function setFreeGxtEntry(text) end

---
--- Генерирует и возвращает [новый]{.ul} уникальный ключ для создания GXT-записи.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getFreeGxtKey">Open the wiki</a>  
---
---@return string key сгенерированный GXT ключ
function getFreeGxtKey() end

---
--- Возвращает текст GXT-записи по ключу, поиск производится включая записи игры.  
--- Возвращает пустую строку, если запись не существует.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getGxtText">Open the wiki</a>  
---
---@param key string ключ GXT-записи
---@return string text текст
function getGxtText(key) end

---
--- Удаляет GXT-запись по ключу, не затрагивает игровые записи.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/clearGxtEntry">Open the wiki</a>  
---
---@param key string ключ GXT-записи
function clearGxtEntry(key) end

---
--- Проверяет, открыто ли игровое меню паузы.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isPauseMenuActive">Open the wiki</a>  
---
---@return bool active статус
function isPauseMenuActive() end

---
--- Проверяет, находится ли окно игры на переднем плане.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isGameWindowForeground">Open the wiki</a>  
---
---@return bool foreground результат
function isGameWindowForeground() end

---
--- Возвращает информацию о версии игры  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getGameVersion">Open the wiki</a>  
---
---@return int major версия
---@return int minor версия
---@return int majorRev версия
---@return int minorRev версия
---@return int game часть серии
---@return int region регион
---@return bool steam Steam-версия
---@return bool cracked взломана
function getGameVersion() end

---
--- Возвращает номер версии MoonLoader.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getMoonloaderVersion">Open the wiki</a>  
---
---@return int version версия
function getMoonloaderVersion() end

---
--- Возвращает значение внутреннего таймера в виде дробного в формате 'секунды.миллисекунды'.  
--- В отличие от системного таймера os.clock(), этот таймер работает только если игра активна (не свёрнута и находится на переднем плане).  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/localClock">Open the wiki</a>  
---
---@return double time время
function localClock() end

---
--- Освобождает все загруженные функцией <a class="is-internal-link is-invalid-page" href="/moonloader/lua/loadSprite">loadSprite</a> текстуры, принадлежащие вызвавшему скрипту.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/freeTextures">Open the wiki</a>  
---
function freeTextures() end

---
--- Возвращает полный путь к рабочей директории MoonLoader.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getWorkingDirectory">Open the wiki</a>  
---
---@return string path путь
function getWorkingDirectory() end

---
--- Возвращает полный путь к директории игры.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getGameDirectory">Open the wiki</a>  
---
---@return string path путь
function getGameDirectory() end

---
--- Активирует или отключает рендер текста и текстур опкодами игры.  
--- Аналог опкода <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/03F0">03F0</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/useRenderCommands">Open the wiki</a>  
---
---@param enable bool статус
function useRenderCommands(enable) end

---
--- Записывает значение в память процесса по указанному адресу.  
--- Аналог опкода CLEO <a class="is-internal-link is-valid-page" href="/gta-sa/opcodes/0A8C">0A8C</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/writeMemory">Open the wiki</a>  
---
---@param address int адрес памяти
---@param size int размер (от 1 до 4)
---@param value int размер (от 1 до 4)
---@param virtualProtect bool флаг снятия протекции
function writeMemory(address, size, value, virtualProtect) end

---
--- Читает значение из памяти процесса по указанному адресу.  
--- Аналог опкода CLEO <a class="is-internal-link is-valid-page" href="/gta-sa/opcodes/0A8D">0A8D</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/readMemory">Open the wiki</a>  
---
---@param address int адрес памяти
---@param size int размер (от 1 до 4)
---@param virtualProtect bool флаг снятия протекции
---@return int value значение
function readMemory(address, size, virtualProtect) end

---
--- Загружает динамическую библиотеку по названию и возвращает её хендл (адрес).  
--- Аналог опкода CLEO <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/0AA2">0AA2</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/loadDynamicLibrary">Open the wiki</a>  
---
---@param library string название библиотеки
---@return bool result результат выполнения
---@return int handle хендл библиотеки
function loadDynamicLibrary(library) end

---
--- Выгружает динамическую библиотеку по её хендлу.  
--- Аналог опкода CLEO <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/0AA3">0AA3</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/freeDynamicLibrary">Open the wiki</a>  
---
---@param handle int хендл библиотеки
function freeDynamicLibrary(handle) end

---
--- Получает адрес экспортируемой функции по названию и хендлу библиотеки.  
--- Аналог опкода CLEO <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/0AA4">0AA4</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getDynamicLibraryProcedure">Open the wiki</a>  
---
---@param proc string имя функции
---@param handle int хендл библиотеки
---@return bool result результат выполнения
---@return int proc адрес функции
function getDynamicLibraryProcedure(proc, handle) end

---
--- Проверяет файл на существование.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesFileExist">Open the wiki</a></b>  
---
---@param file string путь
---@return bool result результат выполнения
function doesFileExist(file) end

---
--- Проверяет директорию на существование.  
--- Аналог опкода CLEO <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/0AE4">0AE4</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/doesDirectoryExist">Open the wiki</a>  
---
---@param directory string путь
---@return bool result результат выполнения
function doesDirectoryExist(directory) end

---
--- Создаёт иерархию директорий для указанного пути.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createDirectory">Open the wiki</a></b>  
---
---@param directory string путь
---@return bool result результат выполнения
function createDirectory(directory) end

---
--- Извлекает верхнее значение из стека FPU и возвращает его.  
--- Аналог опкода CLEO <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/0AE9">0AE9</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/popFloat">Open the wiki</a>  
---
---@return float val значение
function popFloat() end

---
--- Проверяет версию игры, если версия игры 1.0 US, то вернет true.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isGameVersionOriginal">Open the wiki</a>  
---
---@return bool result результат проверки
function isGameVersionOriginal() end

---
--- Выделяет память и возвращает указатель на выделенную область.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/allocateMemory">Open the wiki</a>  
---
---@param size int количество выделяемой памяти в байтах
---@return int memory указатель на выделенную память
function allocateMemory(size) end

---
--- Освобождает выделенную память.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/freeMemory">Open the wiki</a>  
---
---@param memory int указатель на выделенный участок памяти
function freeMemory(memory) end

---
--- Начинает поиск файла по указанной маске.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/findFirstFile">Open the wiki</a>  
---
---@param mask string путь и маска названия файла (например, "moonloader/*.lua")
---@return Filesearch handle хэндл сессии поиска
---@return string name имя файла
function findFirstFile(mask) end

---
--- Продолжает поиск файла по открытой сессии поиска файлов.  
--- Сессия поиска создаётся функцией <a class="is-internal-link is-valid-page" href="/moonloader/lua/findFirstFile">findFirstFile</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/findNextFile">Open the wiki</a>  
---
---@param handle Filesearch сессия поиска
---@return string file имя файла
function findNextFile(handle) end

---
--- Закрывает сессию поиска файлов.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/findClose">Open the wiki</a>  
---
---@param handle Filesearch хэндл сессии поиска
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
--- Возвращает указатель на объект класса CPed по хэндлу персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCharPointer">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@return int ptr указатель
function getCharPointer(ped) end

---
--- Возвращает указатель на объект класса CVehicle по хэндлу транспортного средства.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCarPointer">Open the wiki</a>  
---
---@param car Vehicle хэндл транспорта
---@return int ptr указатель
function getCarPointer(car) end

---
--- Возвращает указатель на экземпляр класса CObject по хэндлу объекта.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getObjectPointer">Open the wiki</a>  
---
---@param object Object хэндл объекта
---@return int struct указатель
function getObjectPointer(object) end

---
--- Производит вызов функцию по адресу. Все аргументы функции передаются после параметра `pop`.  
--- Значения, занесённые в таблицу, будут переданы по указателю.  
--- Использование в критичных для производительности местах не рекомендуется, в таких случаях вместо этой функции лучше использовать FFI.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/callFunction">Open the wiki</a></b>  
---
---@param address uint адрес функции
---@param params int количество параметров
---@param pop int выравнивание стека (количество аргументов либо 0, в зависимости от вида функции)
---@param ... any аргументы
---@return int returnValue возвращаемое значение функции
function callFunction(address, params, pop, ...) end

---
--- Производит вызов метода класса по адресу. Все аргументы функции передаются после параметра `pop`.  
--- Значения, занесённые в таблицу, будут переданы по указателю.  
--- Использование в критичных для производительности местах не рекомендуется, в таких случаях вместо этой функции лучше использовать FFI.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/callMethod">Open the wiki</a></b>
---
---@param address uint адрес функции
---@param struct int указатель на объект
---@param params int количество параметров
---@param pop int выравнивание стека (количество аргументов либо 0, в зависимости от вида функции)
---@param ... any аргументы
---@return int returnValue возвращаемое значение функции
function callMethod(address, struct, params, pop, ...) end

---
--- Возвращает хэндлы ближайшего транспорта и персонажа к другому персонажу.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/storeClosestEntities">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@return Vehicle car хэндл ближайшего ТС
---@return Ped ped хэндл ближайшего персонажа
function storeClosestEntities(ped) end

---
--- Задаёт статус двигателя автомобиля.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/switchCarEngine">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@param state bool статус двигателя
function switchCarEngine(car, state) end

---
--- Проверяет существует ли пользовательская метка на карте и возвращает ее координаты.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getTargetBlipCoordinates">Open the wiki</a>  
---
---@return bool result результат проверки
---@return float posX координаты метки
---@return float posY координаты метки
---@return float posZ координаты метки
function getTargetBlipCoordinates() end

---
--- Возвращает количество передач автомобиля.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCarNumberOfGears">Open the wiki</a>  
---
---@param car Vehicle хэндл автомобиля
---@return int gears количество передач
function getCarNumberOfGears(car) end

---
--- Возвращает текущую передачу автомобиля.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCarCurrentGear">Open the wiki</a>  
---
---@param car Vehicle хэндл автомобиля
---@return int gear передача
function getCarCurrentGear(car) end

---
--- Проверяет включена ли сирена.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarSirenOn">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@return bool state статус сирены
function isCarSirenOn(car) end

---
--- Проверяет заведен ли двигатель машины.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarEngineOn">Open the wiki</a>  
---
---@param car Vehicle хендл машины
---@return bool state статус двигателя
function isCarEngineOn(car) end

---
--- Выводит в левом верхнем углу панель с текстом на короткое время (как при активации чит-кодов).  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/printHelpString">Open the wiki</a>  
---
---@param text string текст (на русском может не выводиться)
function printHelpString(text) end

---
--- Выводит стилизованный текст на определённое время.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/printStyledString">Open the wiki</a>  
---
---@param text string текст
---@param time int время в миллисекундах
---@param style int стиль (1-7)
function printStyledString(text, time, style) end

---
--- Выводит текст в нижней части экрана, добавляя его в очередь, если на момент вызова выводится другой текст.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/printString">Open the wiki</a>  
---
---@param text string текст
---@param time int время отображения текста в миллисекундах
function printString(text, time) end

---
--- Выводит текст в нижней части экрана, минуя очередь.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/printStringNow">Open the wiki</a>  
---
---@param text string текст
---@param time int время показа текста
function printStringNow(text, time) end

---
--- Проверяет, целится ли игрок в другого персонажа, и возвращает его хэндл.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCharPlayerIsTargeting">Open the wiki</a>  
---
---@param player Player хэндл игрока
---@return bool result результат проверки
---@return Ped ped хэндл персонажа
function getCharPlayerIsTargeting(player) end

---
--- Возвращает сокращенное название модели машины.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getNameOfVehicleModel">Open the wiki</a>  
---
---@param modelId Model модель машины
---@return GxtString name название модели (до 7 символов)
function getNameOfVehicleModel(modelId) end

---
--- Проверяет был ли введён указанный текст на клавиатуре.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/testCheat">Open the wiki</a>  
---
---@param text string текст
---@return bool result статус
function testCheat(text) end

---
--- Создаёт транспорт перед игроком.  
--- Нет необходимости загружать модель самостоятельно.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/spawnVehicleByCheating">Open the wiki</a>  
---
---@param modelId Model модель транспортного средства
---@return bool result результат выполнения
function spawnVehicleByCheating(modelId) end

---
--- Возвращает хэндл персонажа по указателю на экземляр класса CPed.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCharPointerHandle">Open the wiki</a>  
---
---@param ptr int указатель
---@return Ped handle хэндл персонажа
function getCharPointerHandle(ptr) end

---
--- Возвращает хэндл транспортного средства по указателю на экземляр класса CVehicle.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getVehiclePointerHandle">Open the wiki</a>  
---
---@param ptr int указатель
---@return Vehicle handle хэндл транспорта
function getVehiclePointerHandle(ptr) end

---
--- Возвращает хэндл объект по указателю на экземляр класса CObject.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getObjectPointerHandle">Open the wiki</a>  
---
---@param ptr int указатель
---@return Object handle хэндл объекта
function getObjectPointerHandle(ptr) end

---@class CollisionPointData
---@field pos float[] позиция точки соприкосновения XYZ
---@field normal float[] вектор нормали к поверхности соприкосновения
---@field surfaceType int[] типы поверхности
---@field pieceType int[] типы детали
---@field depth float какая-то глубина чего-то
---@field entity int указатель на объект сущности, с которой произошло столкновение
---@field entityType int тип сущности

---
--- Ищет точку соприкосновения в трёхмерном пространстве между двумя координатами, по направлению прямой из позиции `origin` к `target`.  
--- Имеет флаги, определяющие, какие типы объектов нужно проверять на столкновение.  
--- Возвращает таблицу с информацией о точке соприкосновения.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/processLineOfSight">Open the wiki</a></b>  
---
---@param originX float начальная позиция X
---@param originY float начальная позиция Y
---@param originZ float начальная позиция Z
---@param targetX float конечная позиция X
---@param targetY float конечная позиция Y
---@param targetZ float конечная позиция Z
---@param checkSolid bool? статичные объекты (напр. любые постройки). По стандарту = `true`
---@param car bool? транспорт. По стандарту = `false`
---@param ped bool? персонажи. По стандарту = `false`
---@param object bool? динамические объекты. По стандарту = `false`
---@param particle bool? визуальные эффекты. По стандарту = `false`
---@param seeThrough bool? учитывать прозрачные объекты. По стандарту = `false`
---@param ignoreSomeObjects bool? игнорировать некоторые динамические объекты. По стандарту = `false`
---@param shootThrough bool? учитывать объекты, простреливаемые насквозь. По стандарту = `false`
---@return bool result результат выполнения
---@return CollisionPointData colPoint информация о точке соприкосновения
function processLineOfSight(originX, originY, originZ, targetX, targetY, targetZ, checkSolid, car, ped, object, particle, seeThrough, ignoreSomeObjects, shootThrough) end

---
--- Записывает текст в буфер обмена Windows.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setClipboardText">Open the wiki</a>  
---
---@param text string текст
---@return bool result результат выполнения
function setClipboardText(text) end

---
--- Читает текст из буфера обмена Windows.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getClipboardText">Open the wiki</a>  
---
---@return string text текст
function getClipboardText() end

---
--- Читает значение целого из памяти по адресу и указанному оффсету размером от 1-го до 4-х байт.  
--- Для чтения числа с плавающей точкой используйте `getStructFloatElement` либо `representIntAsFloat`.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getStructElement">Open the wiki</a></b>  
---
---@param struct uint указатель на начало структуры
---@param offset int оффсет
---@param size uint размер
---@param unprotect bool? снять защиту памяти. По стандарту = `false`
---@return int value значение
function getStructElement(struct, offset, size, unprotect) end

---
--- Записывает значение целого в память по адресу и указанному оффсету размером от 1-го до 4-х байт.  
--- Для записи числа с плавающей точкой используйте `setStructFloatElement` либо `representFloatAsInt`.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setStructElement">Open the wiki</a></b>  
---
---@param struct uint указатель на структуру
---@param offset int оффсет
---@param size uint размер
---@param value int значение
---@param unprotect bool? снять защиту памяти. По стандарту = `false`
function setStructElement(struct, offset, size, value, unprotect) end

---
--- Создаёт кватернион из матрицы вращения.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/convertMatrixToQuaternion">Open the wiki</a>  
---
---@param rightX float pitch
---@param rightY float pitch
---@param rightZ float pitch
---@param frontX float roll
---@param frontY float roll
---@param frontZ float roll
---@param upX float yaw
---@param upY float yaw
---@param upZ float yaw
---@return float w кватернион
---@return float x кватернион
---@return float y кватернион
---@return float z кватернион
function convertMatrixToQuaternion(rightX, rightY, rightZ, frontX, frontY, frontZ, upX, upY, upZ) end

---
--- Создаёт матрицу вращения из кватерниона.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/convertQuaternionToMatrix">Open the wiki</a>  
---
---@param w float кватернион
---@param x float кватернион
---@param y float кватернион
---@param z float кватернион
---@return float rightX pitch
---@return float rightY pitch
---@return float rightZ pitch
---@return float frontX roll
---@return float frontY roll
---@return float frontZ roll
---@return float upX yaw
---@return float upY yaw
---@return float upZ yaw
function convertQuaternionToMatrix(w, x, y, z) end

---
--- Конвертирует игровые 3D координаты в экранные.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreen">Open the wiki</a>  
---
---@param posX float игровые 3D координаты
---@param posY float игровые 3D координаты
---@param posZ float игровые 3D координаты
---@return float wposX экранные координаты
---@return float wposY экранные координаты
function convert3DCoordsToScreen(posX, posY, posZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGameKeyState">Open the wiki</a></b>
---
---@param key int
---@param state int
function setGameKeyState(key, state) end

---
--- Возвращает позицию курсора.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCursorPos">Open the wiki</a>  
---
---@return int posX координаты
---@return int posY координаты
function getCursorPos() end

---
--- Конвертирует пиксельные координаты в игровые экранные координаты.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/convertWindowScreenCoordsToGameScreenCoords">Open the wiki</a>  
---
---@param wposX float пиксельные координаты
---@param wposY float пиксельные координаты
---@return float gposX игровые координаты
---@return float gposY игровые координаты
function convertWindowScreenCoordsToGameScreenCoords(wposX, wposY) end

---
--- Конвертирует игровые экранные координаты в пиксельные.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/convertGameScreenCoordsToWindowScreenCoords">Open the wiki</a>  
---
---@param gposX float игровые координаты
---@param gposY float игровые координаты
---@return float wposX пиксельные координаты
---@return float wposY пиксельные координаты
function convertGameScreenCoordsToWindowScreenCoords(gposX, gposY) end

---
--- Создаёт точку в 3D-пространстве игры из экранных координат и указанной глубины.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/convertScreenCoordsToWorld3D">Open the wiki</a>  
---
---@param posX float экранные координаты
---@param posY float экранные координаты
---@param depth float глубина
---@return float posX координаты точки в мире
---@return float posY координаты точки в мире
---@return float posZ координаты точки в мире
function convertScreenCoordsToWorld3D(posX, posY, depth) end

---
--- Возвращает адрес DLL-модуля по названию.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getModuleHandle">Open the wiki</a>  
---
---@param module string название
---@return int handle адрес
function getModuleHandle(module) end

---
--- Получает адрес экспортируемой процедуры по названию модуля и процедуры.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getModuleProcAddress">Open the wiki</a>  
---
---@param module string название модуля
---@param proc string название процедуры
---@return int address адрес
function getModuleProcAddress(module, proc) end

---
--- Эмулирует нажатие виртуальной клавиши.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setVirtualKeyDown">Open the wiki</a>  
---
---@param vkey int ID клавиши
---@param down bool статус нажатия: true - нажата, false - отпущена
function setVirtualKeyDown(vkey, down) end

---
--- Эмулирует нажатие символьной клавиши.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCharKeyDown">Open the wiki</a>  
---
---@param ckey int ID символа
---@param down bool статус нажатия: true - нажата, false - отпущена
function setCharKeyDown(ckey, down) end

---@alias DownloadingCallback fun(id: int, status: int, p1: any, p2: any): boolean

---
--- Загружает файл из интернета по URL по протоколу HTTP.  
--- Процесс загрузки полностью контролируем с помощью обработчика загрузки и может быть отменён.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/downloadUrlToFile">Open the wiki</a></b>  
---
---@param url string uRL ресурса
---@param file string путь к файлу
---@param statusCallback DownloadingCallback? функция-обработчик статуса загрузки, является необязательным параметром
---@return int index идентификатор загрузки
function downloadUrlToFile(url, file, statusCallback) end

---
--- Проверяет была ли клавиша нажата.  
--- Псевдоним функции <a class="is-internal-link is-valid-page" href="/moonloader/lua/wasKeyPressed">wasKeyPressed</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isKeyJustPressed">Open the wiki</a>  
---
---@param key int ID клавиши
---@return bool state результат проверки
function isKeyJustPressed(key) end

---
--- Конвертирует мировые 3D-координаты в экранные. Расширенный вариант функции `convert3DCoordsToScreen`,
--- имеет дополнительные аргументы и возвращаемые значения.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreenEx">Open the wiki</a></b>  
---
---@param posX float мировые координата X
---@param posY float мировые координата Y
---@param posZ float мировые координата Z
---@param checkMin bool? проверять минимальное расстояние до камеры. По стандарту = `false`
---@param checkMax bool? проверять максимальное расстояние до камеры. По стандарту = `false`
---@return bool result результат преобразования
---@return float x экранная координата X в пикселях
---@return float y экранная координата Y в пикселях
---@return float z неизвестно
---@return float w неизвестно
---@return float h неизвестно
function convert3DCoordsToScreenEx(posX, posY, posZ, checkMin, checkMax) end

---
--- Читает число с плавающей точкой из памяти по адресу и указанному оффсету размером в 4 байта.  
--- Для чтения целого используйте функцию `getStructElement`.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getStructFloatElement">Open the wiki</a></b>  
---
---@param struct uint адрес начала структуры
---@param offset int оффсет
---@param unprotect bool? снять защиту памяти. По стандарту = `false`
---@return float value прочитанное значение
function getStructFloatElement(struct, offset, unprotect) end

---
--- Записывает число с плавающей точкой в память по адресу и указанному оффсету.  
--- Для записи целого используйте функцию `setStructElement`.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setStructFloatElement">Open the wiki</a></b>  
---
---@param struct uint адрес начала структуры
---@param offset int оффсет
---@param value float значение
---@param unprotect bool? снять защиту памяти. По стандарту = `false`
function setStructFloatElement(struct, offset, value, unprotect) end

---
--- Проверяет была ли клавиша нажата.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/wasKeyPressed">Open the wiki</a>  
---
---@param key int ID клавиши
---@return bool state результат проверки
function wasKeyPressed(key) end

---
--- Проверяет была ли клавиша отпущена после нажатия.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/wasKeyReleased">Open the wiki</a>  
---
---@param key int ID клавиши
---@return bool state результат проверки
function wasKeyReleased(key) end

---
--- Получает значение, на сколько делений было прокручено колесо мыши.  
--- Значение может быть отрицательным и положительным,<br/>  
--- а также нулём, если колесо прокручено не было.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getMousewheelDelta">Open the wiki</a>  
---
---@return int delta значение прокрутки
function getMousewheelDelta() end

---
--- Помечает текущее обрабатываемое оконное сообщение для игнорирования.  
--- Игнорирование сообщения может быть отменено вызовом функции с параметрами `false`.  
--- Предназначена для использования только изнутри события `onWindowMessage`.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/consumeWindowMessage">Open the wiki</a></b>  
---
---@param game bool? игнорировать сообщение для игры (оно не будет передано игре, но будет передано Lua скриптам). По стандарту = `true`
---@param scripts bool? игнорировать сообщение для Lua скриптов. По стандарту = `true`
function consumeWindowMessage(game, scripts) end

---
--- Добавляет обработчик <a href="https://wiki.blast.hk/moonloader/events">события</a> по названию.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addEventHandler">Open the wiki</a></b>  
---
---@param eventName string название события
---@param callback function функция-обработчик
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
function addEventHandler(eventName, callback) end

---
--- Проверяет, находится ли игра на паузе.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isGamePaused">Open the wiki</a>  
---
---@return bool paused статус
function isGamePaused() end

---
--- Возвращает значение игрового таймера в виде дробного в формате 'секунды.миллисекунды'.  
--- В отличие от системного таймера os.clock() и функции <a class="is-internal-link is-valid-page" href="/moonloader/lua/localClock">localClock</a>, этот таймер работает только если игра не находится на паузе.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/gameClock">Open the wiki</a>  
---
---@return double time время
function gameClock() end

---@alias ScriptProperty
---| '"work-in-pause"' # Указывает, что скрипт будет продолжать исполнение во время паузы игры (с условием, что игра развёрнута и находится на переднем плане).
---| '"forced-reloading-only"' # апрещает автоматическую перезагрузку скрипта, оставляя возможность только принудительной перезагрузки.

---
--- Функция задаёт различные настройки поведения скрипта.  
--- Каждое свойство задаётся исходя из его названия, переданного в виде строки в качестве аргумента функции.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_properties">Open the wiki</a></b>  
---
---@param property string первое свойство
---@param ... ScriptProperty свойства
function script_properties(property, ...) end

---
--- Задаёт Web-адрес для скрипта.  
--- Адрес может быть любым, как и прямой ссылкой на файл, так и на страницей любого сайта.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/script_url">Open the wiki</a>  
---
---@param url string ссылка
function script_url(url) end

---
--- Импортирует экспортируемые данные другого скрипта по имени файла, функция загружает скрипт самостоятельно, если он ещё не загружен.<br/>  
--- Предотвращает повторную загрузку скрипта при стартовой загрузке скриптов из рабочей директории, т.е.  
--- функцию можно вызывать и в глобальной области (вне <a class="is-internal-link is-valid-page" href="/moonloader/lua/main">main</a> и <a class="is-internal-link is-valid-page" href="/moonloader/scripting/threads">потоков</a>), не опасаясь возникновения проблем.<br/>  
--- При повторном вызове для того же скрипта будет использоваться ранее полученное значение, если скрипт не был перезагружен или выгружен.<br/>  
--- Возвращает <code>nil</code> и текст ошибки, если попытка импорта завершилась неудачей.<br/>  
--- Подробнее об экспорте см.  
--- на странице <a class="is-internal-link is-valid-page" href="/moonloader/exports">Экспорт</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/import">Open the wiki</a>  
---
---@param filename string имя файла Lua-скрипта
---@return any imports импортированные данные из другого скрипта, обычно это таблица
function import(filename) end

---
--- Преобразует таблицу Lua в <a class="is-external-link" href="https://ru.wikipedia.org/wiki/JSON">JSON</a>-строку.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/encodeJson">Open the wiki</a>  
---
---@param data table таблица с данными
---@return string json строка в формате JSON
function encodeJson(data) end

---
--- Преобразует <a class="is-external-link" href="https://ru.wikipedia.org/wiki/JSON">JSON</a>-строку в таблицу Lua.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/decodeJson">Open the wiki</a>  
---
---@param json string данные JSON в виде строки
---@return table data результирующая таблица
function decodeJson(json) end

---
--- Показывает или скрывает системный курсор, блокируя вращение камеры и управление игроком (опционально).  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/showCursor">Open the wiki</a></b>  
---
---@param show bool активировать/деактивировать
---@param lockControls bool? заблокировать управление игроком. По стандарту = `false`
function showCursor(show, lockControls) end

---
--- Блокирует управление игроком.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/lockPlayerControl">Open the wiki</a>  
---
---@param lock bool статус блокировки
function lockPlayerControl(lock) end

---
--- Возвращает статус блокировки управления игроком, заданный функцией <a class="is-internal-link is-valid-page" href="/moonloader/lua/lockPlayerControl">lockPlayerControl</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isPlayerControlLocked">Open the wiki</a>  
---
---@return bool locked статус блокировки
function isPlayerControlLocked() end

---
--- Перемещает маркер карты в заданные координаты.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setBlipCoordinates">Open the wiki</a>  
---
---@param blip Marker хэндл маркера
---@param x float новые координаты
---@param y float новые координаты
---@param z float новые координаты
---@return bool result результат выполнения
function setBlipCoordinates(blip, x, y, z) end

---
--- Перемещает маркер пользовательской точки назначения в заданные координаты.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setTargetBlipCoordinates">Open the wiki</a>  
---
---@param x float новые координаты
---@param y float новые координаты
---@param z float новые координаты
---@return bool result результат выполнения
function setTargetBlipCoordinates(x, y, z) end

---
--- Устанавливает пользовательскую точку назначения на заданные координаты.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/placeWaypoint">Open the wiki</a>  
---
---@param x float координаты
---@param y float координаты
---@param z float координаты
---@return bool result результат выполнения
function placeWaypoint(x, y, z) end

---
--- Скрывает иконку пользовательской точки назначения.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/removeWaypoint">Open the wiki</a>  
---
---@return bool result результат выполнения
function removeWaypoint() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getFolderPath">Open the wiki</a></b>
---
---@param csidl int
---@return string path
function getFolderPath(csidl) end

---
--- Возвращает значение разницы во времени между предыдущим и текущим кадром (но это не точно).  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getTimeStepValue">Open the wiki</a>  
---
---@return float value значение
function getTimeStepValue() end

---
--- Возвращает указатель на используемый игрой экземпляр класса IDirect3DDevice9.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getD3DDevicePtr">Open the wiki</a>  
---
---@return uint devicePtr указатель
function getD3DDevicePtr() end

---
--- Возвращает массив со всеми созданными динамическими объектами.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getAllObjects">Open the wiki</a>  
---
---@return table objects таблица с хэндлами объектов
function getAllObjects() end

---
--- Возвращает массив с хэндлами всех созданных персонажей, включая персонажа игрока.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getAllChars">Open the wiki</a>  
---
---@return table peds таблица с хэндлами персонажей
function getAllChars() end

---
--- Возвращает массив с хэндлами всех созданных транспортных средств, включая транспорт, в котором находится игрок.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getAllVehicles">Open the wiki</a>  
---
---@return table vehicles таблица с хэндлами транспортных средств
function getAllVehicles() end

---
--- Возвращает значение глобальной скриптовой переменной числа с плавающей точкой  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getGameGlobalFloat">Open the wiki</a>  
---
---@param index int индекс переменной
---@return float value значение
function getGameGlobalFloat(index) end

---
--- Задаёт новое значение глобальной скриптовой переменной числа с плавающей точкой  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setGameGlobalFloat">Open the wiki</a>  
---
---@param index int индекс переменной
---@param value float новое значение
function setGameGlobalFloat(index, value) end

---
--- Создаёт эффект «тряски» камеры.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/shakeCam">Open the wiki</a>  
---
---@param shake int значение амплитуды
function shakeCam(shake) end

---
--- Создаёт (спавнит) модель игрока в игровом мире.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/createPlayer">Open the wiki</a>  
---
---@param modelId int ИД модели
---@param atX float X-координата
---@param atY float Y-координата
---@param atZ float Z-координата
---@return Player player хендл игрока
function createPlayer(modelId, atX, atY, atZ) end

---
--- Создает персонажа в заданных координатах с указанной моделью и поведением пешехода.  
--- Хэндл персонажа записывается в указанную переменную.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/createChar">Open the wiki</a>  
---
---@param pedtype int тип пешехода.
---@param modelId Model модель персонажа.
---@param atX float float координаты персонажа X
---@param atY float float координаты персонажа Y
---@param atZ float float координаты персонажа Z
---@return Ped ped хэндл персонажа.
function createChar(pedtype, modelId, atX, atY, atZ) end

---
--- Удаляет персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/deleteChar">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
function deleteChar(ped) end

---
--- Получает координаты актера.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCharCoordinates">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@return float positionX координаты персонажа X
---@return float positionY координаты персонажа Y
---@return float positionZ координаты персонажа Z
function getCharCoordinates(ped) end

---
--- Телепортирует определенного персонажа на указанные координаты.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCharCoordinates">Open the wiki</a>  
---
---@param ped Ped хэндл актера
---@param posX float координаты X
---@param posY float координаты Y
---@param posZ float координаты Z
function setCharCoordinates(ped, posX, posY, posZ) end

---
--- Проверяет, находится ли персонаж в указанной прямоугольной зоне.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharInArea2d">Open the wiki</a>  
---
---@param ped Ped хендл персонажа игрока
---@param cornerAX float первая X координата
---@param cornerAY float первая Y координата
---@param cornerBX float вторая X координата
---@param cornerBY float вторая Y координата
---@param sphere bool поиск в сфере
---@return bool result результат проверки
function isCharInArea2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- Проверяет, находится ли персонаж в указанной кубической зоне.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharInArea3d">Open the wiki</a>  
---
---@param ped Ped хендл персонажа игрока
---@param cornerAX float первая X координата
---@param cornerAY float первая Y координата
---@param cornerAZ float первая Z координата
---@param cornerBX float вторая X координата
---@param cornerBY float вторая Y координата
---@param cornerBZ float вторая Z координата
---@param sphere bool поиск в сфере
---@return bool result результат проверки
function isCharInArea3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- Создает транспорт на указанных координатах.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/createCar">Open the wiki</a>  
---
---@param modelId Model номер модели машины
---@param atX float X координата
---@param atY float Y координата
---@param atZ float Z координата
---@return Vehicle car хендл транспорта
function createCar(modelId, atX, atY, atZ) end

---
--- Удаляет транспорт.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/deleteCar">Open the wiki</a>  
---
---@param car Vehicle Хендл транспорта
function deleteCar(car) end

---
--- Ведет машину на заданные координаты.<br/>  
--- Процесс выглядит, как если бы за рулем машины сидел NPC.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/carGotoCoordinates">Open the wiki</a>  
---
---@param car Vehicle Хендл транспорта
---@param driveToX float X координата
---@param driveToY float Y координата
---@param driveToZ float Z координата
function carGotoCoordinates(car, driveToX, driveToY, driveToZ) end

---
--- Устанавливает машине сумасшедшее вождение  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/carWanderRandomly">Open the wiki</a>  
---
---@param car Vehicle хэндл автомобиля
function carWanderRandomly(car) end

---
--- Устанавливает нормальное вождение автомобиля  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/carSetIdle">Open the wiki</a>  
---
---@param car Vehicle хэндл автомобиля
function carSetIdle(car) end

---
--- Получает координаты машины.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCarCoordinates">Open the wiki</a>  
---
---@param car Vehicle Хэндл машины.
---@return float positionX
---@return float positionY
---@return float positionZ Координаты (XYZ)
function getCarCoordinates(car) end

---
--- Задаёт позицию транспортного средства.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCarCoordinates">Open the wiki</a>  
---
---@param car Vehicle хэндл ТС
---@param atX float координаты
---@param atY float координаты
---@param atZ float координаты
function setCarCoordinates(car, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCruiseSpeed">Open the wiki</a></b>
---
---@param car Vehicle
---@param maxSpeed float
function setCarCruiseSpeed(car, maxSpeed) end

---
--- Устанавливает аккуратность вождения  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCarDrivingStyle">Open the wiki</a>  
---
---@param car Vehicle хэндл автомобиля
---@param behaviour int уровень аккуратности вождения
function setCarDrivingStyle(car, behaviour) end

---@alias DriverBehaviour
---| 1 # едет по дороге сам по себе
---| 2 # врезается в машину игрока останавливаясь на светофорах
---| 4 # едет за игроком проезжая светофоры
---| 7 # едет задом
---| 8 # едет по дороге и вне дороги

---
--- Устанавливает автомобилю поведение  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCarMission">Open the wiki</a>  
---
---@param car Vehicle хэндл автомобиля
---@param driverBehaviour DriverBehaviour стиль вождения
function setCarMission(car, driverBehaviour) end

---
--- Проверяет, находится ли транспорт в указанной прямоугольной зоне.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarInArea2d">Open the wiki</a>  
---
---@param car Vehicle хендл транспорта игрока
---@param cornerAX float первая X координата
---@param cornerAY float первая Y координата
---@param cornerBX float вторая X координата
---@param cornerBY float вторая Y координата
---@param sphere bool поиск в сфере
---@return bool result результат проверки
function isCarInArea2d(car, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- Проверяет, находится ли транспорт в указанной кубической зоне.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarInArea3d">Open the wiki</a>  
---
---@param car Vehicle хендл транспорта игрока
---@param cornerAX float первая X координата
---@param cornerAY float первая Y координата
---@param cornerAZ float первая Z координата
---@param cornerBX float вторая X координата
---@param cornerBY float вторая Y координата
---@param cornerBZ float вторая Z координата
---@param sphere bool поиск в сфере
---@return bool result результат проверки
function isCarInArea3d(car, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- Выводит стилизованный текст из GXT на определённое время.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/printBig">Open the wiki</a>  
---
---@param gxtString GxtString ключ из GXT
---@param time int время в миллисекундах
---@param style int стиль (1-7)
function printBig(gxtString, time, style) end

---
--- Отображает текстовую строку с низким приоритетом в нижней части экрана, в течение указанного времени.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/printText">Open the wiki</a>  
---
---@param gxtString GxtString ключ из GXT
---@param time int время в миллисекундах
---@param flag int Флаг
function printText(gxtString, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printTextNow">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param time int
---@param flag int
function printTextNow(gxtString, time, flag) end

---
--- Удаляет с экрана все текстовые сообщения игры.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/clearPrints">Open the wiki</a>  
---
function clearPrints() end

---
--- Возвращает текущее игровое время.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getTimeOfDay">Open the wiki</a>  
---
---@return int hours количество часов
---@return int mins количество минут
function getTimeOfDay() end

---
--- Меняет текущее время сервера, на указанное в функции.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setTimeOfDay">Open the wiki</a>  
---
---@param hours int количество часов
---@param minutes int количество минут
function setTimeOfDay(hours, minutes) end

---
--- Получает остаток минут до указаного времени  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getMinutesToTimeOfDay">Open the wiki</a>  
---
---@param hours int часы
---@param minutes int минуты
---@return int minutes остаток минут
function getMinutesToTimeOfDay(hours, minutes) end

---
--- Проверяет находится ли точка на экране в заданном радиусе.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isPointOnScreen">Open the wiki</a>  
---
---@param sphereX float координаты точки X
---@param sphereY float координаты точки Y
---@param sphereZ float координаты точки Z
---@param radius float радиус
---@return bool radius результат проверки
function isPointOnScreen(sphereX, sphereY, sphereZ, radius) end

---
--- Получает хэндл машины в которой сидит персонаж.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/storeCarCharIsIn">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@return Vehicle car хэндл машины
function storeCarCharIsIn(ped) end

---
--- Проверяет находится ли игрок в указанной машине.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharInCar">Open the wiki</a>  
---
---@param ped Ped хэндл актера
---@param car Vehicle хэндл машины
---@return bool result результат проверки
function isCharInCar(ped, car) end

---
--- Проверяет находиться ли игрок в модели машины(Пример: 494 - Hotring)  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharInModel">Open the wiki</a>  
---
---@param ped Ped хэндл персоонажа
---@param carModel Model модель машины
---@return bool result результат проверки
function isCharInModel(ped, carModel) end

---
--- Проверяет находится ли игрок в любой машине.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyCar">Open the wiki</a>  
---
---@param ped Ped хэндл актера
---@return bool result результат проверки
function isCharInAnyCar(ped) end

---
--- Возвращает <em>true</em>, если игрок нажимает указанную клавишу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isButtonPressed">Open the wiki</a>  
---
---@param player Player хендл игрока
---@param key int идентификатор клавиши
---@return bool result результат проверки
function isButtonPressed(player, key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPadState">Open the wiki</a></b>
---
---@param player Player
---@param key int
---@return int state
function getPadState(player, key) end

---
--- Проверяет находится ли персонаж в радиусе координат  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeans2d">Open the wiki</a>  
---
---@param ped Ped хэндл актера
---@param pointX float координата X
---@param pointY float координата Y
---@param radiusX float радиус по X
---@param radiusY float радиус по Y
---@param sphere bool поиск в сфере
---@return bool result результат проверки
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
--- Создает объект.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/createObject">Open the wiki</a>  
---
---@param modelId Model модель объекта
---@param atX float координаты где будет создан объект X
---@param atY float координаты где будет создан объект X
---@param atZ float координаты где будет создан объект X
---@return Object object хэндл объекта
function createObject(modelId, atX, atY, atZ) end

---
--- Удаляет объект.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/deleteObject">Open the wiki</a>  
---
---@param object Object хэндл объекта
function deleteObject(object) end

---
--- Дать денег персонажу.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/givePlayerMoney">Open the wiki</a>  
---
---@param player Player хендл игрока
---@param money int деньги
function givePlayerMoney(player, money) end

---
--- Возвращает количество денег игрока.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getPlayerMoney">Open the wiki</a>  
---
---@return int money баланс
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
--- Устанавливает уровень розыска игроку  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/alterWantedLevel">Open the wiki</a>  
---
---@param player Player хэндл игрока
---@param wantedLevel int уровень розыска
function alterWantedLevel(player, wantedLevel) end

---
--- Устанавливает уровень розыска игроку, при этом не сбрасывая его в дальнейшем  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/alterWantedLevelNoDrop">Open the wiki</a>  
---
---@param player Player хэндл игрока
---@param minimumWantedLevel int минимальный уровень розыска
function alterWantedLevelNoDrop(player, minimumWantedLevel) end

---
--- Сравнивает уровень розыска, возвращает true если уровень розыска больше указаного  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isWantedLevelGreater">Open the wiki</a>  
---
---@param player Player хэндл
---@param level int уровень розыска для сравнения
---@return bool result результат
function isWantedLevelGreater(player, level) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearWantedLevel">Open the wiki</a></b>
---
---@param player Player
function clearWantedLevel(player) end

---
--- Устанавливает состояние персонажа: убит или арестован  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setDeatharrestState">Open the wiki</a>  
---
---@param value bool состояние
function setDeatharrestState(value) end

---
--- Проверяет, умер ли персонаж или арестован  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/hasDeatharrestBeenExecuted">Open the wiki</a>  
---
---@return bool result результат проверки
function hasDeatharrestBeenExecuted() end

---
--- Добавляет патроны персонажу, если у него есть оружие.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/addAmmoToChar">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@param weapon int ID оружия
---@param ammo int число патронов
function addAmmoToChar(ped, weapon, ammo) end

---
--- Проверяет мертв ли игрок.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isPlayerDead">Open the wiki</a>  
---
---@param player Player хэндл игрока
---@return bool result результат проверки
function isPlayerDead(player) end

---
--- Проверяет мертв ли персонаж.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharDead">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@return bool result результат проверки
function isCharDead(ped) end

---
--- Проверяет взорвана ли машина.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarDead">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@return bool result результат проверки
function isCarDead(car) end

---
--- Проверяет сигналит ли игрок в машине.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isPlayerPressingHorn">Open the wiki</a>  
---
---@param player Player хэндл игрока
---@return bool result результат проверки
function isPlayerPressingHorn(player) end

---
--- Создает персонажа сидящем в машине на водительском сиденье.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/createCharInsideCar">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@param pedtype Model модель персонажа
---@param model int модель
---@return Ped ped хэндл персонажа
function createCharInsideCar(car, pedtype, model) end

---
--- Проверяет указанную машину на модель.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarModel">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@param modelId Model модель машины
---@return bool result результат проверки(возвращает true, если модель совпадает)
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
--- Восстанавливает камеру в обычное положение.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/restoreCamera">Open the wiki</a>  
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
--- Устанавливает скорость игры.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setTimeScale">Open the wiki</a>  
---
---@param gamespeed float скорость
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
--- Удаляет маркер.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/removeBlip">Open the wiki</a>  
---
---@param marker Marker Хендл маркера.
function removeBlip(marker) end

---
--- Меняет цвет маркера.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/changeBlipColour">Open the wiki</a>  
---
---@param marker Marker Хендл маркера.
---@param color int Цвет.
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
--- Меняет размер маркера.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/changeBlipScale">Open the wiki</a>  
---
---@param marker Marker Хендл маркера.
---@param size int Размер. (3 - стандартный)
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
--- Проверяет, затухает ли прямо сейчас в игре экран.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getFadingStatus">Open the wiki</a>  
---
---@return bool result результат проверки
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
--- Возвращает Z-угол(поворот) персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCharHeading">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@return float angle угол поворота
function getCharHeading(ped) end

---
--- Устанавливает Z-угол(поворот) персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCharHeading">Open the wiki</a>  
---
---@param ped Ped хендл персонажа игрока
---@param angle float угол поворота
function setCharHeading(ped, angle) end

---
--- Возвращает Z-угол(поворот) транспорта.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCarHeading">Open the wiki</a>  
---
---@param car Vehicle хендл транспорта
---@return float angle угол поворота
function getCarHeading(car) end

---
--- Устанавливает Z-угол(поворот) транспорта.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCarHeading">Open the wiki</a>  
---
---@param car Vehicle хендл транспорта
---@param angle float угол поворота
function setCarHeading(car, angle) end

---
--- Получает угол поворота объекта  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getObjectHeading">Open the wiki</a>  
---
---@param object Object скриптовый хендл объекта
---@return float angle угол поворота объекта
function getObjectHeading(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectHeading">Open the wiki</a></b>
---
---@param object Object
---@param angle float
function setObjectHeading(object, angle) end

---
--- Узнает, касается ли персонаж объекта  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharTouchingObject">Open the wiki</a>  
---
---@param ped Ped скриптовый хендл персонажа
---@param object Object скриптовый хендл объекта
---@return bool result результат выполнения функции
function isCharTouchingObject(ped, object) end

---
--- Устанавливает количество патронов в указанное оружие.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCharAmmo">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@param weapon int ID оружия
---@param ammo int число патронов
function setCharAmmo(ped, weapon, ammo) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/declareMissionFlag">Open the wiki</a></b>
---
---@param flag VarId
function declareMissionFlag(flag) end

---
--- Создает маркер над автомобилем.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/addBlipForCar">Open the wiki</a>  
---
---@param car Vehicle Хендл машины.
---@return Marker marker Хендл маркера.
function addBlipForCar(car) end

---
--- Добавляет маркер над персонажем.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/addBlipForChar">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@return Marker marker хендл маркера
function addBlipForChar(ped) end

---
--- Создает маркер над объектом.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/addBlipForObject">Open the wiki</a>  
---
---@param object Object Хендл объекта.
---@return Marker marker Хендл маркера.
function addBlipForObject(object) end

---
--- Создает маркер на указанных координатах.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/addBlipForCoord">Open the wiki</a>  
---
---@param atX float
---@param atY float
---@param atZ float Координаты (XYZ)
---@return Checkpoint checkpoint Хендл маркера.
function addBlipForCoord(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeBlipDisplay">Open the wiki</a></b>
---
---@param marker Marker
---@param mode int
function changeBlipDisplay(marker, mode) end

---
--- Проигрывает короткий звук.<br/>  
--- Если указаны координаты - то звук проиграется на указанных координатах.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/addOneOffSound">Open the wiki</a>  
---
---@param atX float координата X
---@param atY float координата Y
---@param atZ float координата Z
---@param sound int идентификатор звука
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
--- Удаляет проигрываемый звук  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/removeSound">Open the wiki</a>  
---
---@param sound int ID звука
function removeSound(sound) end

---
--- Возвращает <code>true</code> если машина перевёрнута (застряла на крыше), то есть транспорт был добавлен к проверке <a class="is-internal-link is-invalid-page" href="/moonloader/lua/addUpsidedownCarCheck">addUpsidedownCarCheck</a> и его движения в перевернутом состоянии минимальны.  
--- Проверка срабатывает и с взорванным транспортом.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarStuckOnRoof">Open the wiki</a>  
---
---@param car Vehicle хэндл транспорта
---@return bool result результат
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
--- Выдает ID оружия и кол-во патронов.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/giveWeaponToChar">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@param weapon int ID оружия
---@param ammo int количество патронов
function giveWeaponToChar(ped, weapon, ammo) end

---
--- Устанавливает возможность передвижения персонажа  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setPlayerControl">Open the wiki</a>  
---
---@param player Player хендл игрока
---@param canMove bool может ли игрок передвигаться true - может, false - не может.
---@return bool result результат выполнения
function setPlayerControl(player, canMove) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceWeather">Open the wiki</a></b>
---
---@param weather int
---@return bool result
function forceWeather(weather) end

---
--- Моментально устанавливает погоду  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/forceWeatherNow">Open the wiki</a>  
---
---@param weather int id погоды
function forceWeatherNow(weather) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releaseWeather">Open the wiki</a></b>
---
function releaseWeather() end

---
--- Дает персонажу в руки указанное оружие.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCurrentCharWeapon">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@param weapon int ID оружия
function setCurrentCharWeapon(ped, weapon) end

---
--- Возвращает координаты указанного объекта.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getObjectCoordinates">Open the wiki</a>  
---
---@param object Object хендл объекта
---@return bool result результат проверки
---@return float atX x координата
---@return float atY y координата
---@return float atZ z координата
function getObjectCoordinates(object) end

---
--- Устанавливает указанный объект на указанные координаты.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setObjectCoordinates">Open the wiki</a>  
---
---@param object Object хендл объекта
---@param atX float x координата
---@param atY float y координата
---@param atZ float z координата
---@return bool result результат проверки
function setObjectCoordinates(object, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameTimer">Open the wiki</a></b>
---
---@return int timeMs
function getGameTimer() end

---
--- Возвращает текущий уровень розыска персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/storeWantedLevel">Open the wiki</a>  
---
---@param player Player хендл игрока
---@return bool result результат проверки
---@return int level уровень розыска
function storeWantedLevel(player) end

---
--- Проверяет стоит ли машина на месте.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarStopped">Open the wiki</a>  
---
---@param car Vehicle Хендл машины.
---@return bool result Результат проверки.
function isCarStopped(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markCharAsNoLongerNeeded">Open the wiki</a></b>
---
---@param ped Ped
function markCharAsNoLongerNeeded(ped) end

---
--- Помечает транспорт как более ненужный для скриптового движка и что он может быть удален в любое время игрой  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/markCarAsNoLongerNeeded">Open the wiki</a>  
---
---@param car Vehicle хендл транспорта
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
--- Создает персонажа сидящем в машине на пассажирском сидении.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/createCharAsPassenger">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@return bool result результат
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
--- Возвращает количество пассажиров в автомобиле  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getNumberOfPassengers">Open the wiki</a>  
---
---@param car Vehicle хэндл транспорта
---@return bool result результат проверки
---@return int passengers количество пассажиров
function getNumberOfPassengers(car) end

---
--- Возвращает максимальное количество пассажиров для данного транспортного средства  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getMaximumNumberOfPassengers">Open the wiki</a>  
---
---@param car Vehicle скриптовый хэндл транспортного средства
---@return int maxPassengers количество пассажиров
function getMaximumNumberOfPassengers(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarDensityMultiplier">Open the wiki</a></b>
---
---@param multiplier float
---@return bool result
function setCarDensityMultiplier(multiplier) end

---
---   
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCarHeavy">Open the wiki</a>  
---
---@return bool result утяжелена ли машина
function setCarHeavy(car, heavy) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMaxWantedLevel">Open the wiki</a></b>
---
---@param level int
function setMaxWantedLevel(level) end

---
--- Проверяет, когда машина отрывается от земли.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarInAirProper">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@return bool result результат проверки
function isCarInAirProper(car) end

---
---   
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarUpsidedown">Open the wiki</a>  
---
function isCarUpsidedown(car) end

---
--- Получает хэндл персонажа игрока  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getPlayerChar">Open the wiki</a>  
---
---@param player Player хэндл игрока
---@return bool result результат
---@return Ped ped хэндл игрока
function getPlayerChar(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cancelOverrideRestart">Open the wiki</a></b>
---
---@return bool result
function cancelOverrideRestart() end

---
--- Устанавливает, должны ли полицейские игнорировать игрока независимо от уровня.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setPoliceIgnorePlayer">Open the wiki</a>  
---
---@param player Player хендл игрока
---@param ignored bool true - включить игнорирование, false - выключить игнорирование
---@return bool result результат
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
--- Устанавливает, открыты или закрыты двери т/с  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/lockCarDoors">Open the wiki</a>  
---
---@param car Vehicle хендл транспортного средства
---@param status int статус
function lockCarDoors(car, status) end

---
--- Взрывает транспортное средство.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/explodeCar">Open the wiki</a>  
---
---@param car Vehicle скриптовый хендл транспортного средства
---@return bool result результат выполнения операции
function explodeCar(car) end

---
--- Вызывает эффект взрыва на экране.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/addExplosion">Open the wiki</a>  
---
---@param atX float Координата X взрыва
---@param atY float Координата Y взрыва
---@param atZ float Координата Z взрыва
---@param radius int Радиус взрыва
---@return bool result Результат
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
--- Удаляет пикап.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/removePickup">Open the wiki</a>  
---
---@param pickup Pickup скриптовый хендл пикапа
---@return bool result результат выполнения операции
function removePickup(pickup) end

---
--- Устанавливает свечение шашки такси  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setTaxiLights">Open the wiki</a>  
---
---@param taxi Vehicle такси
---@param light bool состояние
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
--- Установить/Снять тормоза(невозможность двигаться) у авто<br/>  
--- Если "тормоза" установить, то как бы игрок не пытался двигаться в авто он будет стоять на месте  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/applyBrakesToPlayersCar">Open the wiki</a>  
---
---@param player Player хендл игрока
---@param apply bool статус
---@return bool result статус
function applyBrakesToPlayersCar(player, apply) end

---
--- Устанавливает персонажу уровень здоровья.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCharHealth">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа.
---@param health int Число здоровья.
function setCharHealth(ped, health) end

---
--- Устанавливает уровень здоровья машине.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCarHealth">Open the wiki</a>  
---
---@param car Vehicle Хендл машины.
---@param health int Уровень здоровья.
function setCarHealth(car, health) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharHealth">Open the wiki</a></b>
---
---@param ped Ped
---@return int health
function getCharHealth(ped) end

---
--- Получает состояние машины.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCarHealth">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@return int health Состояние машины
function getCarHealth(car) end

---
--- Меняет цвет машины.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/changeCarColour">Open the wiki</a>  
---
---@param car Vehicle Хендл автомобиля.
---@param primaryColor int Первичный цвет.
---@param secondaryColor int Вторичный цвет.
---@return bool result Результат выполнения.
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
--- Устанавливает указанной банде оружие которое она может использовать.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setGangWeapons">Open the wiki</a>  
---
---@param gang int номер банды
---@param weapons1 int ID первого оружия которое может использовать банда
---@param weapons2 int ID второго оружия которое может использовать банда
---@param weapons3 int ID третьего оружия которое может использовать банда
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
--- Загружает указанную модель.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/requestModel">Open the wiki</a>  
---
---@param modelId Model номер модели
---@return bool result
function requestModel(modelId) end

---
--- Проверяет загружена ли модель.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/hasModelLoaded">Open the wiki</a>  
---
---@param modelId Model номер модель
---@return bool result
function hasModelLoaded(modelId) end

---
--- Помечает загруженную ранее модель как более ненужную для скриптового движка  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/markModelAsNoLongerNeeded">Open the wiki</a>  
---
---@param modelId Model номер модели
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
--- Сбрасывает количество раз, сколько раз игрок уничтожил определенную модель.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/resetNumOfModelsKilledByPlayer">Open the wiki</a>  
---
---@param player Player хендл игрока
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
--- Проверяет двигается ли игрок.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharStopped">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@return bool result результат проверки
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
--- Устанавливает иммунитет персонажу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCharProofs">Open the wiki</a>  
---
---@param ped Ped Хэндл персонажа
---@param BP bool иммунитет от пуль
---@param FP bool иммунитет от огня
---@param EP bool иммунитет от взрывов
---@param CP bool иммунитет от ударений
---@param MP bool иммунитет от оружия ближнего боя в т.ч. и кулаков
function setCharProofs(ped, BP, FP, EP, CP, MP) end

---
--- Устанавливает иммунитет машине  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCarProofs">Open the wiki</a>  
---
---@param car Vehicle Хэндл транспорта
---@param BP bool иммунитет от пуль
---@param FP bool иммунитет от огня
---@param EP bool иммунитет от взрывов
---@param CP bool иммунитет от ударений
---@param MP bool иммунитет от оружия ближнего боя в т.ч. и кулаков
function setCarProofs(car, BP, FP, EP, CP, MP) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deactivateGarage">Open the wiki</a></b>
---
---@param garage GxtString
function deactivateGarage(garage) end

---
--- Проверяет находиться ли машина в воде.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarInWater">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@return bool result результат проверки
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
--- Проверяет видна ли машина.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarOnScreen">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@return bool result результат проверки
function isCarOnScreen(car) end

---
--- Проверяет виден ли персонаж.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharOnScreen">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@return bool result результат проверки
function isCharOnScreen(ped) end

---
--- Проверяет виден ли объект.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isObjectOnScreen">Open the wiki</a>  
---
---@param object Object хэндл объекта
---@return bool result результат проверки
function isObjectOnScreen(object) end

---
--- Находит высоту относительно 3д координат.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getGroundZFor3dCoord">Open the wiki</a>  
---
---@param atX float
---@param atY float
---@param atZ float Координаты
---@return float z Результат
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
--- Заглушить мотор т/c  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/boatStop">Open the wiki</a>  
---
---@param car Vehicle хэндл т/c
function boatStop(car) end

---
--- Проверяет выстрелил ли персонаж в заданной зоне.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharShootingInArea">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа.
---@param cornerAX float Координаты зоны.
---@param cornerAY float Координаты зоны.
---@param cornerBX float Координаты зоны.
---@param cornerBY float Координаты зоны.
---@param weapon int ID оружия
---@return bool result Результат проверки.
function isCharShootingInArea(ped, cornerAX, cornerAY, cornerBX, cornerBY, weapon) end

---
--- Проверяет держит ли игрок в руках указанное оружие.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCurrentCharWeapon">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@param weapon int ид оружия
---@return bool result Результат проверки
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
--- Проверяет выстрелил ли персонаж.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharShooting">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа
---@return bool result Результат проверки
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
--- Получает скорость машины по ее хендлу.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCarSpeed">Open the wiki</a>  
---
---@param car Vehicle Хендл машины
---@return float speed Скорость машины
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
--- Восстанавливает камеру в исходное положение  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/restoreCameraJumpcut">Open the wiki</a>  
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
--- Сверяет модель персонажа с указанной.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharModel">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа.
---@param modelId Model Номер модели.
---@return bool result Результат проверки.
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
--- Проверяет с указанного оружия было попадание по персонажу.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByWeapon">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@param weapon int ID оружия
---@return bool result результат проверки
function hasCharBeenDamagedByWeapon(ped, weapon) end

---
--- Проверяет с указанного ли оружия было попадание в машину.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByWeapon">Open the wiki</a>  
---
---@param car Vehicle хендл машины
---@param weapon int ID оружия
---@return bool result Результат проверки
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
--- Воспламеняет машину по ее хендлу.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/startCarFire">Open the wiki</a>  
---
---@param car Vehicle хендл транспорта
function startCarFire(car) end

---
--- Воспломиняет персонажа по его хендлу.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/startCharFire">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа
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
--- Устанавливает режим камеры  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCameraZoom">Open the wiki</a>  
---
---@param mode int режим камеры 0/1/2
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
--- Игроку не нужно будет перезаряжаться.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setPlayerFastReload">Open the wiki</a>  
---
---@param player Player хендл игрока
---@param fastReload bool true - включить, false - выключить
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
--- Устанавливает актёру невидимость  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCharVisible">Open the wiki</a>  
---
---@param ped Ped актёр
---@param visible bool значение невидимости
function setCharVisible(ped, visible) end

---
--- Устанавливает машине невидимость.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCarVisible">Open the wiki</a>  
---
---@param car Vehicle Хендл транспорта
---@param visible bool Значение невидимости
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
--- Плавно удаляет модель игрока.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/removeCharElegantly">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
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
--- Вытаскивает персонажа из машины на указанные координаты.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/warpCharFromCarToCoord">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@param placeAtX float координата X.
---@param placeAtY float координата Y.
---@param placeAtZ float координата Z.
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
--- Помещает педа в указанный транспорт  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/warpCharIntoCar">Open the wiki</a>  
---
---@param ped Ped хендл педа/актера
---@param car Vehicle хендл транспорта
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
--- Создает персонажа в заданных координатах с рандомной моделью и поведением пешехода.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/createRandomChar">Open the wiki</a>  
---
---@param atX float координата персонажа X.
---@param atY float координата персонажа Y.
---@param atZ float координата персонажа Z.
---@return Ped ped хэндл персонажа.
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
--- Устанавливает коллизию определенному объекту.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setObjectCollision">Open the wiki</a>  
---
---@param object Object хэндл объекта
---@param collision bool состояние
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
--- Загрузка ранее запрошенных моделей  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/loadAllModelsNow">Open the wiki</a>  
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
--- Устанавливает скорость анимации персонажу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCharAnimSpeed">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@param animation string название анимации
---@param speed float скорость анимации
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
--- Проверяет является ли персонаж мужским.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharMale">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа.
---@return bool result результат проверки.
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
--- Устанавливает игнорирование пешеходов к игроку.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setEveryoneIgnorePlayer">Open the wiki</a>  
---
---@param player Player хендл
---@param ignored bool true - включить игнорирование, false - выключить игнорирование
function setEveryoneIgnorePlayer(player, ignored) end

---
--- Возвращает хендл машины, используемый педом.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/storeCarCharIsInNoSave">Open the wiki</a>  
---
---@param ped Ped хендл педа/актера
---@return Vehicle car хендл машины
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
--- Помещает камеру перед игроком, указывая на игрока.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCameraInFrontOfPlayer">Open the wiki</a>  
---
function setCameraInFrontOfPlayer() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarVisiblyDamaged">Open the wiki</a></b>
---
---@param car Vehicle
---@return bool result
function isCarVisiblyDamaged(car) end

---
--- Проверяет, существует ли объект, возвращает true если объект существует  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/doesObjectExist">Open the wiki</a>  
---
---@param object Object хэндл объекта
---@return bool result результат
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
--- Создает маркер над пикапом.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/addBlipForPickup">Open the wiki</a>  
---
---@param pickup Pickup Хендл пикапа.
---@return Marker marker Хендл маркера.
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
--- Получает цвета автомобиля.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCarColours">Open the wiki</a>  
---
---@param car Vehicle Хендл машины.
---@return int primaryColor Первичный цвет.
---@return int secondaryColor Вторичный цвет.
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
--- Получает количество патронов у персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getAmmoInCharWeapon">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@param int int ID оружия
---@return int ammo количество патронов
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
--- Телепортирует персонажа в автомобиль на выбранное сидение  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/warpCharIntoCarAsPassenger">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@param car Vehicle хэндл машины
---@param passengerSeat int номер сидения
function warpCharIntoCarAsPassenger(ped, car, passengerSeat) end

---
--- Проверяет, доступно ли пассажирское сидение  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarPassengerSeatFree">Open the wiki</a>  
---
---@param car Vehicle хэндл транспорта
---@param seat int номер сидения
---@return bool result результат проверки
function isCarPassengerSeatFree(car, seat) end

---
--- Получает хэндл игрока, который сидит на сидении транспортного средства  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCharInCarPassengerSeat">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@param seat int номер сидения
---@return Ped ped хэндл персонажа
function getCharInCarPassengerSeat(car, seat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharIsChrisCriminal">Open the wiki</a></b>
---
---@param ped Ped
---@param flag bool
function setCharIsChrisCriminal(ped, flag) end

---
--- Вызывает титры после прохождения игры на экран.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/startCredits">Open the wiki</a>  
---
function startCredits() end

---
--- Убирает титры после прохождения игры с экрана.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/stopCredits">Open the wiki</a>  
---
function stopCredits() end

---
--- Проверяет, закончились ли титры окончания игры.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/areCreditsFinished">Open the wiki</a>  
---
---@return bool result Результат проверки
function areCreditsFinished() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMusicDoesFade">Open the wiki</a></b>
---
---@param enable bool
function setMusicDoesFade(enable) end

---
--- Возвращает ID транспорта по хендл машины  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCarModel">Open the wiki</a>  
---
---@param veh Vehicle хендл машины
---@return Model modelId ID транспорта
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
--- Проверяет, сидит ли хэндл в указанном т/c  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharSittingInCar">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа игрока
---@param car Vehicle хэндл т/с
---@return bool result результат
function isCharSittingInCar(ped, car) end

---
--- Проверяет находится ли игрок в любой машине  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharSittingInAnyCar">Open the wiki</a>  
---
---@param ped Ped хэндл
---@return bool result результат
function isCharSittingInAnyCar(ped) end

---
--- Проверяет не находится ли персонаж в транспорте.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharOnFoot">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@return bool result результат проверки
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
--- Возвращает позицию отладочной камеры.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getDebugCameraCoordinates">Open the wiki</a>  
---
---@return float X координаты
---@return float Y координаты
---@return float Z координаты
function getDebugCameraCoordinates() end

---
--- Проверяет, целится ли игрок в конкретного персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isPlayerTargettingChar">Open the wiki</a>  
---
---@param player Player хэндл игрока
---@param ped Ped хэндл персонажа
---@return bool result результат проверки
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
--- Возвращает координаты на которые указывает отладочная камера.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getDebugCameraPointAt">Open the wiki</a>  
---
---@return float X координаты
---@return float Y координаты
---@return float Z координаты
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
--- Очищает последний урон нанесённый персонажу.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/clearCharLastWeaponDamage">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
function clearCharLastWeaponDamage(ped) end

---
--- Очищает последний нанесенный урон машине.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/clearCarLastWeaponDamage">Open the wiki</a>  
---
---@param car Vehicle хендл машины
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
--- Возвращает водителя указанного транспортного средства  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getDriverOfCar">Open the wiki</a>  
---
---@param car Vehicle скриптовый хендл транспортного средства
---@return Ped ped скриптовый хендл персонажа
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
--- Получает оружие находящееся в руках у персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCurrentCharWeapon">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@return int weapon оружие
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
--- Возвращает <code>true</code> если пед находится на мотоцикле/велосипеде  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharOnAnyBike">Open the wiki</a>  
---
---@param ped Ped хендл педа/актера
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
--- Проверяет доступна ли модель для использования.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isModelAvailable">Open the wiki</a>  
---
---@param modelId Model Номер модели.
---@return bool result Результат.
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
--- Проверяет есть ли на указанных координатах любой пикап.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isAnyPickupAtCoords">Open the wiki</a>  
---
---@param pickupX float
---@param pickupY float
---@param pickupZ float Координаты (XYZ)
---@return bool result Результат.
function isAnyPickupAtCoords(pickupX, pickupY, pickupZ) end

---
--- Удаляет все оружие у персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/removeAllCharWeapons">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
function removeAllCharWeapons(ped) end

---
--- Проверяет наличие указанного оружия у персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/hasCharGotWeapon">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@param weapon int ID оружия
---@return bool result результат проверки
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
--- Проверяет, горит ли автомобиль.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarOnFire">Open the wiki</a>  
---
---@param car Vehicle хендл машины
---@return bool state состояние автомобиля
function isCarOnFire(car) end

---
--- Возвращает <code>true</code> при спущенном колесе автомобиля  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCarTireBurst">Open the wiki</a>  
---
---@param car Vehicle автомобиль
---@param tire int номер колеса
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
--- Проверяет педа на нахождение в т/c типа "Лодка"  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyBoat">Open the wiki</a>  
---
---@param ped Ped
---@return bool result
function isCharInAnyBoat(ped) end

---
--- Проверяет педа на нахождение в т/с типа "Вертолет"  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyHeli">Open the wiki</a>  
---
---@param ped Ped
---@return bool result
function isCharInAnyHeli(ped) end

---
--- Проверяет хэндл на нахождение в т/с типа "Самолёт"  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyPlane">Open the wiki</a>  
---
---@param ped Ped хэндл
---@return bool result результат
function isCharInAnyPlane(ped) end

---
--- Проверяет педа на нахождение в воде  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharInWater">Open the wiki</a>  
---
---@param ped Ped хэндл игрока
---@return bool result
function isCharInWater(ped) end

---
--- Получает данные об оружии в указанном слоте.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCharWeaponInSlot">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@param slot int номер слота
---@return int weapon ID оружия
---@return int ammo количество патронов к оружию
---@return Model model модель оружия
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
--- Возвращает позицию педа с указанным смещением  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getOffsetFromCharInWorldCoords">Open the wiki</a>  
---
---@param ped Ped хендл педа/актера
---@param offsetX float смещение по оси X
---@param offsetY float смещение по оси Y
---@param offsetZ float смещение по оси Z
---@return float X позиция по оси X
---@return float Y позиция по оси Y
---@return float Z позиция по оси Z
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
--- Замораживает координаты персонажа по его хендлу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/freezeCharPosition">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа
---@param locked bool Статус заморозки
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
--- Возвращает количество брони у педа  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCharArmour">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@return int armour значение брони
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
--- Проверяет нахождение объекта в указанных координат в определенном радиусе  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/locateObject2d">Open the wiki</a>  
---
---@param object Object
---@param X float Позиция по оси X
---@param Y float Позиция по оси Y
---@param radiusX float Дистанция проверки по оси X
---@param radiusY float Дистанция проверки по оси Y
---@param sphere bool Отображать проверяемую дистанцию в виде сферы
---@return bool result
function locateObject2d(object, X, Y, radiusX, radiusY, sphere) end

---
--- Проверяет нахождение объекта в указанных координат в определенном радиусе  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/locateObject3d">Open the wiki</a>  
---
---@param object Object
---@param X float Позиция по оси X
---@param Y float Позиция по оси Y
---@param Z float Позиция по оси Z
---@param radiusX float Дистанция проверки по оси X
---@param radiusY float Дистанция проверки по оси Y
---@param radiusZ float Дистанция проверки по оси Z
---@param sphere bool Отображать проверяемую дистанцию в виде сферы
---@return bool result
function locateObject3d(object, X, Y, Z, radiusX, radiusY, radiusZ, sphere) end

---
--- Проверяет нахождение объекта в воде  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isObjectInWater">Open the wiki</a>  
---
---@param object Object
---@return bool result
function isObjectInWater(object) end

---
--- Проверяет нахождение объекта в указанном квадрате  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isObjectInArea2d">Open the wiki</a>  
---
---@param object Object
---@param cornerAX float Начальная координата по оси X
---@param cornerAY float Начальная координата по оси Y
---@param cornerBX float Конечная координата по оси X
---@param cornerBY float Конечная координата по оси Y
---@param sphere bool Отображать границы квадрата в виде сферы
---@return bool result
function isObjectInArea2d(object, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- Проверяет нахождение объекта в указанном кубе  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isObjectInArea3d">Open the wiki</a>  
---
---@param object Object
---@param cornerAX float Начальная координата по оси X
---@param cornerAY float Начальная координата по оси Y
---@param cornerAZ float Начальная координата по оси Z
---@param cornerBX float Конечная координата по оси X
---@param cornerBY float Конечная координата по оси Y
---@param cornerBZ float Конечная координата по оси Z
---@param flag bool Отображать границы куба в виде сферы
---@return bool result
function isObjectInArea3d(object, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, flag) end

---
--- Заставляет персонажа присесть (как на кнопку <code>C</code>) или наоборот, встать.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/taskToggleDuck">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@param crouch bool если true, персонаж присядет, если false - встанет.
function taskToggleDuck(ped, crouch) end

---
--- Предварительная загрузка файла анимации  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/requestAnimation">Open the wiki</a>  
---
---@param animation string файл анимаций
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
--- Спускает шину у автомобиля.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/burstCarTire">Open the wiki</a>  
---
---@param car Vehicle скриптовый хендл транспортного средства
---@param tire int шина
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
--- Получение дистанции между двумя точками в игровом мире (3D)  
---
--- ### Пример использования  
---
--- ```lua
--   function main()
--     sampRegisterChatCommand('prv', function(id) -- данный код при вводе /prv id получит дистанцию между вами и другим игроком
--        local res, ped = sampGetCharHandleBySampPlayerId(id)
--        if res then
--           local x, y, z = getCharCoordinates(PLAYER_PED)
--           local mX, mY, mZ = getCharCoordinates(ped)
--           local dist = getDistanceBetweenCoords3d(x, y, z, mX, mY, mZ)
--           sampAddChatMessage('Дистанция между вами: '..dist, 0x00DD00)
--        end
--     end)
--     wait(-1) -- не забываем ставить минусовую задержку в конце main, чтобы скрипт не завершал свою работу
--   end
--- ```  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords3d">Open the wiki</a></b>  
---
---@param x1 float координата X первой точки
---@param y1 float координата Y первой точки
---@param z1 float координата Z первой точки
---@param x2 float координата X второй точки
---@param y2 float координата Y второй точки
---@param z2 float координата Z второй точки
---@return float distance дистанция
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
--- Удаляет указанное оружие у персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/removeWeaponFromChar">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@param weapon int ID оружия
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
--- Проверяет управляет ли хэндл полицейской машиной  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyPoliceVehicle">Open the wiki</a>  
---
---@param ped Ped хэндл
---@return bool result результат
function isCharInAnyPoliceVehicle(ped) end

---
--- Проверяет хэндл на существование  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/doesCharExist">Open the wiki</a>  
---
---@param ped Ped хэндл
---@return bool result результат
function doesCharExist(ped) end

---
--- Проверяет существование транспорта.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/doesVehicleExist">Open the wiki</a>  
---
---@param car Vehicle хэндл транспорта
---@return bool result результат проверки
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
---   
---
--- <a href="https://wiki.blast.hk/moonloader/lua/displayRadar">Open the wiki</a>  
---
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
--- Проверяет сидит ли персонаж  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharDucking">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@return bool result результат проверки
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
--- Отправляет смерть персонажа по его хендлу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/taskDie">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа
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
--- Воспроизводит анимацию где персонаж стоит расслабленно и смотрит по сторонам  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/taskScratchHead">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа
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

---@alias RideType
---| 0 # едет обычно придерживаясь полосы
---| 2 # напрямую не сворачивая
---| 3 # едет по всей дорогe
---| 4 # садится в автомобиль

---@alias DriveType
---| 0 # останавливаясь на светофорах и перед машинами
---| 5 # останавливаясь на светофорах и объезжая машины
---| 2 # проезжая светофоры и объезжая машины
---| 4 # проезжая светофоры и останавливаясь перед машинами
---| 7 # едет строго по дороге проезжая светофоры и не останавливаясь едет "через" машины

---
--- Заставляет актёра ехать на координаты определенным способом  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/taskCarDriveToCoord">Open the wiki</a>  
---
---@param ped Ped хендл игрока
---@param car Vehicle хендл транспорта
---@param toX float позиция к которой начнет ехать актёр (X)
---@param toY float позиция к которой начнет ехать актёр (Y)
---@param toZ float позиция к которой начнет ехать актёр (Z)
---@param speed float скорость с которой машина будет ехать
---@param rideType RideType Способ езды
---@param model int модель чего-то
---@param driveType DriveType Тип вождения
function taskCarDriveToCoord(ped, car, toX, toY, toZ, speed, rideType, model, driveType) end

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
--- Заставляет актёра воспроизвести / сбить анимацию.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/taskPlayAnim">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@param animation string имя анимации
---@param IFP string файл анимации
---@param framedelta float скорость анимации
---@param loop bool повторение анимации (`true` - да, `false` - нет)
---@param lockX bool блокировка позиции по X (`true` - да, `false` - нет)
---@param lockY bool блокировка позиции по Y (`true` - да, `false` - нет)
---@param lockF bool возврат в исходное положение (true - возвращать, false - не возвращать)
---@param time int время воспроизведения
function taskPlayAnim(ped, animation, IFP, framedelta, loop, lockX, lockY, lockF, time) end

---
--- Загружает пути NPC из одиночной игры в прямоугольной зоне.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/loadPathNodesInArea">Open the wiki</a>  
---
---@param x1 float x-координата одного угла зоны
---@param y1 float y-координата одного угла зоны
---@param x2 float x-координата второго угла зоны
---@param y2 float y-координата второго угла зоны
function loadPathNodesInArea(x1, y1, x2, y2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releasePathNodes">Open the wiki</a></b>
---
function releasePathNodes() end

---
--- Создает маркер поведения актера с заданным типом.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/loadCharDecisionMaker">Open the wiki</a>  
---
---@param type int тип поведения
---@return int maker маркер модели поведения
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
--- проверяет, выполняет ли пед указанную анимацию.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharPlayingAnim">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@param animation string название анимации
---@return bool result Результат проверки
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
--- Устанавливает коллизию персонажу.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCharCollision">Open the wiki</a>  
---
---@param ped Ped Хэндл персонажа
---@param enable bool Статус (true\false)
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
--- Возвращает координаты пикапа  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getPickupCoordinates">Open the wiki</a>  
---
---@param pickup Pickup хэндл пикапа
---@return float X - X координата
---@return float Y - Y координата
---@return float Z - Z координата
function getPickupCoordinates(pickup) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeDecisionMaker">Open the wiki</a></b>
---
---@param maker int
function removeDecisionMaker(maker) end

---
--- Возвращает ID скина по хэндлу персонажа.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharModel">Open the wiki</a></b>  
---
---@param ped Ped хэндл персонажа
---@return Model modelId ID скина
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
--- Чинит шину у транспортного средства.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/fixCarTire">Open the wiki</a>  
---
---@param car Vehicle скриптовый хендл транспортного средства
---@param tire int шина
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
--- Возвращает скорость машины относительно её направления.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCarSpeedVector">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@return float vecX скорость по X
---@return float vecY скорость по Y
---@return float vecZ скорость по Z
function getCarSpeedVector(car) end

---
--- Возвращает массу автомобиля  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCarMass">Open the wiki</a>  
---
---@param car Vehicle хэндл автомобиля
---@return float mass масса автомобиля
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
--- Скрывает все оружие у персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/hideCharWeaponForScriptedCutscene">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@param hide bool будет ли скрыто оружие(true/false)
function hideCharWeaponForScriptedCutscene(ped, hide) end

---
--- Получает скорость движения персонажа по его хендлу.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCharSpeed">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа
---@return float speed Значение скорости
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
--- Создает летящую пулю на указанных координатах и в указанном направлении.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/fireSingleBullet">Open the wiki</a>  
---
---@param fromX float точка создания по X
---@param fromY float точка создания по Y
---@param fromZ float точка создания по Z
---@param targetX float направление по X
---@param targetY float направление по Y
---@param targetZ float направление по Z
---@param energy int урон пули
function fireSingleBullet(fromX, fromY, fromZ, targetX, targetY, targetZ, energy) end

---
--- Делает проверку на наличие обьектов определенных типов между точками в трёхмерном пространстве  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isLineOfSightClear">Open the wiki</a>  
---
---@param fromX float координата X первой точки
---@param fromY float координата Y первой точки
---@param fromZ float координата Z первой точки
---@param toX float координата X второй точки
---@param toY float координата Y второй точки
---@param toZ float координата Z второй точки
---@param checkBuildings bool учитывать здания
---@param checkVehicles bool учитывать транспортные средства
---@param checkActors bool учитывать игроков
---@param checkObjects bool учитывать объекты
---@param checkParticles bool учитывать частицы
---@return bool result результат проверки
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
--- Ведет машину на указанные координаты.  
--- В отличии от <strong>carGotoCoordinates</strong> и <strong>carGotoCoordinatesAccurate</strong>, эта функция игнорирует игровые ПДД.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesRacing">Open the wiki</a>  
---
---@param car Vehicle хэндл машины
---@param toX float координата по X
---@param toY float координата по Y
---@param toZ float координата по Z
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
--- Получает уровень здоровья объекта.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getObjectHealth">Open the wiki</a>  
---
---@param object Object Хендл объекта.
---@return int health Уровень здоровья.
function getObjectHealth(object) end

---
--- Устанавливает уровень здоровья объекту.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setObjectHealth">Open the wiki</a>  
---
---@param object Object Хендл объекта.
---@param health int Уровень здоровья.
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
--- Устанавливает увеличение у радара  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setRadarZoom">Open the wiki</a>  
---
---@param zoom int значение для увеличения
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
--- Функция получает айди интерьера, в котором находится Ваш персонаж  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getActiveInterior">Open the wiki</a>  
---
---@return int interior Айди интерьера
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
--- Получает модель оружия из его ID.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getWeapontypeModel">Open the wiki</a>  
---
---@param id int ID оружия
---@return int model номер модели
function getWeapontypeModel(id) end

---
--- Возвращает слот указанного оружия.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getWeapontypeSlot">Open the wiki</a>  
---
---@param id int ID оружия
---@return int slot номер слота
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
--- Выдает джетпак персонажу по его хендлу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/taskJetpack">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа
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
--- Устанавливает, может ли игрок входить и выходить из машины.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setPlayerEnterCarButton">Open the wiki</a>  
---
---@param player Player хендл игрока
---@param can bool true - может, false - не может
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
--- Помещает игрока в кран на карьере недалеко от Лас-Вентурса.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/playerEnteredQuarryCrane">Open the wiki</a>  
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
--- Устанавливает на автомобиль гидравлику  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCarHydraulics">Open the wiki</a>  
---
---@param car Vehicle скриптовый хэндл транспортного средства
---@param hydraulics bool true - включить, false - выключить.
function setCarHydraulics(car, hydraulics) end

---
--- Проверяет, находиться ли игра в режиме 2 игроков.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/is2playerGameGoingOn">Open the wiki</a>  
---
---@return bool result результат
function is2playerGameGoingOn() end

---
--- Возвращает поле зрения.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCameraFov">Open the wiki</a>  
---
---@return float fov поле зрения
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
--- Вынуждает актера воссоздать / очистить неприкосновенную анимацию.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/taskPlayAnimNonInterruptable">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@param animation string имя анимации
---@param IFP string файл анимации
---@param framedelta float скорость анимации
---@param loop bool повторение анимации (true - да, false - нет)
---@param lockX bool блокировка позиции по X (`true` - да, `false` - нет)
---@param lockY bool блокировка позиции по Y (`true` - да, `false` - нет)
---@param lockF bool возврат в исходное положение (true - возвращать, false - не возвращать)
---@param time int время воспроизведения
function taskPlayAnimNonInterruptable(ped, animation, IFP, framedelta, loop, lockX, lockY, lockF, time) end

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
--- Проверяет находится ли персонаж в воздухе.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharInAir">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа
---@return bool result Результат
function isCharInAir(ped) end

---
--- Возвращает точное значение высоты над землёй относительно персонажа  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCharHeightAboveGround">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа
---@return float height Результат
function getCharHeightAboveGround(ped) end

---
--- Устанавливает персонажу уровень владения оружием(скилл)  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCharWeaponSkill">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@param skill int уровень владения
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
--- Проверяет, является ли указанная модель лодкой.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isThisModelABoat">Open the wiki</a>  
---
---@param modelId Model идентификатор игровой модели
---@return bool result true - является, false - не является
function isThisModelABoat(modelId) end

---
--- Проверяет, является ли указанная модель самолётом.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isThisModelAPlane">Open the wiki</a>  
---
---@param modelId Model идентификатор игровой модели
---@return bool result true - является, false - не является
function isThisModelAPlane(modelId) end

---
--- Проверяет, является ли указанная модель вертолётом.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isThisModelAHeli">Open the wiki</a>  
---
---@param modelId Model идентификатор игровой модели
---@return bool result true - является, false - не является
function isThisModelAHeli(modelId) end

---
--- Включает вид бампера автомобиля для камеры.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setFirstPersonInCarCameraMode">Open the wiki</a>  
---
---@param enable bool true - включить, false - выключить
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
--- Устанавливает отображение/скрытие худа.  
--- Оставляя радар.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/displayHud">Open the wiki</a>  
---
---@param enable bool статус худа
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
--- Получает текущий ID города, возвращает 0 если игрок не в городе.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCityPlayerIsIn">Open the wiki</a>  
---
---@param player Player хендл игрока
---@return int city ID города
function getCityPlayerIsIn(player) end

---
--- Получение название района/части карты.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getNameOfZone">Open the wiki</a>  
---
---@param X float координаты X
---@param Y float координаты Y
---@param Z float координаты Z
---@return GxtString name название района
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
--- Устанавливает интерьер актёру.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCharInterior">Open the wiki</a>  
---
---@param ped Ped хендл персонажа
---@param interior int ID интерьера
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
--- Захват/отображение территорий в игре  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setGangWarsTrainingMission">Open the wiki</a>  
---
---@param set bool статус отображения (false - да, true - нет)
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
--- Включает игроку ночное зрение  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setNightVision">Open the wiki</a>  
---
---@param enable bool true - включить, false - выключить
function setNightVision(enable) end

---
--- Включает игроку инфракрасное зрение  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setInfraredVision">Open the wiki</a>  
---
---@param enable bool true - включить, false - выключить
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
--- Проверяет с указанного ли оружия было попадание по объекту.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/hasObjectBeenDamagedByWeapon">Open the wiki</a>  
---
---@param object Object хендл объекта
---@param type int ID оружия
---@return bool result результат проверки
function hasObjectBeenDamagedByWeapon(object, type) end

---
--- Очищает объект от последнего нанесенного урона.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/clearObjectLastWeaponDamage">Open the wiki</a>  
---
---@param object Object хендл объекта
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
--- Помещает камеру перед указанным игроком.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCameraInFrontOfChar">Open the wiki</a>  
---
---@param ped Ped хендл игрока
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
--- Проверяет плавает ли пед  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isCharSwimming">Open the wiki</a>  
---
---@param ped Ped хендл педа
---@return bool result результат
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
--- Возвращает ид объекта по его хендлу.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getObjectModel">Open the wiki</a>  
---
---@param object Object хендл объекта
---@return int id ID объекта
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
--- Устанавливает / отключает коллизию транспортному средству.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCarCollision">Open the wiki</a>  
---
---@param car Vehicle хендл транспортного средства
---@param collision bool статус коллизии
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
--- Меняет скин игрока.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setPlayerModel">Open the wiki</a>  
---
---@param player Player хендл игрока
---@param modelId Model ID скина
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
--- Задает иммунитет объекту  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setObjectProofs">Open the wiki</a>  
---
---@param object Object хендл объекта
---@param BP bool иммунитет от пуль
---@param FP bool иммунитет от огня
---@param EP bool иммунитет от взрывов
---@param CP bool иммунитет от ударений
---@param MP bool иммунитет от оружия ближнего боя в т.ч. и кулаков
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
--- Использует детонатор  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/useDetonator">Open the wiki</a>  
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
--- Функция возвращает айди интерьера, в котором находится персонаж по его хендлу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getCharActiveInterior">Open the wiki</a>  
---
---@param ped Ped Хендл персонажа
---@return int interior Айди интерьера
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
--- Проверяет, использует ли игрок джетпак  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isPlayerUsingJetpack">Open the wiki</a>  
---
---@param player Player скриптовый хэндл игрока
---@return bool result результат выполнения операции
function isPlayerUsingJetpack(player) end

---
--- Удаляет стилизованный текст, который был воспроизведен через <a class="is-internal-link is-valid-page" href="/moonloader/lua/printBig">printBig</a>  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/clearThisPrintBigNow">Open the wiki</a>  
---
---@param style int тип стиля
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
--- Сделать снимок экрана, снимок будет сохранён в <code>Мои Документы\GTA San Andreas User Files\Gallery</code>  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/takePhoto">Open the wiki</a>  
---
---@param unk bool результат выполнения
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
--- Устанавливает радиостанцию ​​транспортного средства, на котором игрок находится в настоящее время, на любимую станцию, полученную из статистики.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setRadioToPlayersFavouriteStation">Open the wiki</a>  
---
function setRadioToPlayersFavouriteStation() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setDeathWeaponsPersist">Open the wiki</a></b>
---
---@param ped Ped
---@param persist bool
function setDeathWeaponsPersist(ped, persist) end

---
--- Устанавливает скорость плавания игроку  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setCharSwimSpeed">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@param speed float скорость
function setCharSwimSpeed(ped, speed) end

---
--- Возвращает true, если игрок перелазит/лезет на что-то (стена, забор, любое препятствие).  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isPlayerClimbing">Open the wiki</a>  
---
---@param player Player хендл игрока
---@return bool result результат
function isPlayerClimbing(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isThisHelpMessageBeingDisplayed">Open the wiki</a></b>
---
---@param gxtString GxtString
---@return bool result
function isThisHelpMessageBeingDisplayed(gxtString) end

---
---   
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isWidescreenOnInOptions">Open the wiki</a>  
---
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
--- Чинит транспортное средство.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/fixCar">Open the wiki</a>  
---
---@param car Vehicle скриптовый хендл транспортного средства
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
--- Возвращает выбранный режим камеры текущего автомобиля.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getPlayerInCarCameraMode">Open the wiki</a>  
---
---@return int mode ID режима камеры.
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
--- Отменяет любые приглашения проститутки, полученные в игре, и заставляет всех текущих проституток уйти.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getRidOfPlayerProstitute">Open the wiki</a>  
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
--- Отправляет локального игрока на спавн.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSpawnPlayer">Open the wiki</a>  
---
function sampSpawnPlayer() end

---
--- Возвращает адрес samp.dll  
--- То же самое, что и `getModuleHandle("samp.dll")`  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetBase">Open the wiki</a></b>  
---
---@return uint handle адрес
function sampGetBase() end

--- 
--- Добавляет в окно чата SA:MP сообщение заданного цвета  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampAddChatMessage">Open the wiki</a></b>  
---
---@param text zstring текст сообщения
---@param color uint цвет
function sampAddChatMessage(text, color) end

---
--- Отправляет на сервер текстовое сообщение или команду, если сообщение начинается с символа '/'  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendChat">Open the wiki</a></b>  
---
---@param text zstring текст сообщения
function sampSendChat(text) end

---
--- Проверяет инициализацию структур SA:MP  
--- Если функция вернула `false`, то использование любых функций, начинающихся на `samp` вызовет ошибку  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampAvailable">Open the wiki</a></b>  
---
---@return bool result статус
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
--- Устанавливает специальное действие локальному игроку  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetSpecialAction">Open the wiki</a></b>  
---
---@param action int Специальное действие. Подробнее см. <a href="здесь">https://sampwiki.blast.hk/wiki/SpecialActions</a>
function sampSetSpecialAction(action) end

---
--- Убивает игрока.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendDeathByPlayer">Open the wiki</a></b>  
---
---@param playerId int ID игрока
---@param reason int причина смерти
function sampSendDeathByPlayer(playerId, reason) end

---
--- Получает хендл т/с по его иду. Если автомобиля нет в зоне стрима, то возвращает false.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCarHandleBySampVehicleId">Open the wiki</a></b>  
---
---@param id int ID т/c
---@return bool result результат
---@return Vehicle car хендл т/c
function sampGetCarHandleBySampVehicleId(id) end

---
--- Получает хендл игрока по его иду.
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCharHandleBySampPlayerId">Open the wiki</a></b>  
---
---@param id int ID игрока
---@return bool result результат
---@return Ped ped хендл игрока
function sampGetCharHandleBySampPlayerId(id) end

---
--- Проверяет открыт ли инпут чата.
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsChatInputActive">Open the wiki</a></b>  
---
---@return bool result результат проверки
function sampIsChatInputActive() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetSendrate">Open the wiki</a></b>
---
---@param type int
---@param rate int
function sampSetSendrate(type, rate) end

---
--- Проверяет подключен ли игрок к серверу.
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsPlayerConnected">Open the wiki</a></b>  
---
---@param id int ID игрока
---@return bool result результат выполнения
function sampIsPlayerConnected(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerStructPtr">Open the wiki</a></b>
---
---@param id int
---@return uint structPtr
function sampGetPlayerStructPtr(id) end

---
--- Получает уровень здоровья игрока.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerHealth">Open the wiki</a>  
---
---@param id int ИД игрока.
---@return int health Уровень здоровья.
function sampGetPlayerHealth(id) end

---
--- Получает уровень здоровья игрока.
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerArmor">Open the wiki</a></b>  
---
---@param id int ИД игрока.
---@return int armor Уровень здоровья.
function sampGetPlayerArmor(id) end

---@alias GameState
---| 0 # GAMESTATE_NONE (ничего)
---| 1 # GAMESTATE_WAIT_CONNECT (установка соедения с сервером)
---| 2 # GAMESTATE_AWAIT_JOIN (соеденение установление, подключение)
---| 3 # GAMESTATE_CONNECTED (подключёно к серверу)
---| 4 # GAMESTATE_RESTARTING (сервер перезагружается)
---| 5 # GAMESTATE_DISCONNECTED (сервер закрыл соеденение)

---
--- Устанавливает статус подключения к серверу.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetGamestate">Open the wiki</a></b>  
---
---@param gamestate GameState статус
function sampSetGamestate(gamestate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampDisconnectWithReason">Open the wiki</a></b>
---
---@param timeout bool
function sampDisconnectWithReason(timeout) end

---
--- Устанавливает локальному игроку новый ник.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSetLocalPlayerName">Open the wiki</a>  
---
---@param name string новый ник
function sampSetLocalPlayerName(name) end

---
--- Получает пинг игрока.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerPing">Open the wiki</a>  
---
---@param id int ИД игрока.
---@return int ping Пинг.
function sampGetPlayerPing(id) end

---
--- Получает SAMP ID игрока по хэндлу персонажа.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerIdByCharHandle">Open the wiki</a>  
---
---@param ped Ped хэндл персонажа
---@return bool result результат выполнения
---@return int id ID игрока
function sampGetPlayerIdByCharHandle(ped) end

---
--- Получает ID транспортного средства по его хендлу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetVehicleIdByCarHandle">Open the wiki</a>  
---
---@param car Vehicle скриптовый хендл транспортного средства
---@return bool result результат выполнения операции
---@return int id ID транспортного средства
function sampGetVehicleIdByCarHandle(car) end

---
--- Получает позицию игрока, который находится вне зоны стрима, если сервер даёт на это разрешение.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetStreamedOutPlayerPos">Open the wiki</a>  
---
---@param id int ID игрока
---@return bool result результат
---@return float posX координаты
---@return float posY координаты
---@return float posZ координаты
function sampGetStreamedOutPlayerPos(id) end

---
--- Отправляет пакет о посадке в транспортное средство.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendEnterVehicle">Open the wiki</a>  
---
---@param id int ID транспортного средства
---@param passenger bool true - на пассажирское место, false - на водительское.
function sampSendEnterVehicle(id, passenger) end

---
--- Отправляет RPC - `RPC_EXITVEHICLE`  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendExitVehicle">Open the wiki</a>  
---
---@param id int ид транспорта
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
--- Регистрирует новую команду чата SA:MP с возможностью задать ей произвольное поведение.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampRegisterChatCommand">Open the wiki</a></b>  
---
---@param cmd zstring команда без символа '/'
---@param func fun(argument: string) функция-обработчик
---@return bool result результат выполнения
function sampRegisterChatCommand(cmd, func) end

---
--- Получает ник игрока по его ID.
---
--- ### Пример использования  
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
--- Получает ник игрока по его ID.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerNickname">Open the wiki</a>  
---
function sampGetPlayerNickname(id) end

---
--- Получает цвет игрока из scoreboard'a  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerColor">Open the wiki</a></b>  
---
---@param id int ИД игрока.
---@return uint color Цвет(ARGB).
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
--- Получает информацию с локального диалога (нужно использовать в цикле)  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampHasDialogRespond">Open the wiki</a>  
---
---@param id int id локального диалога
---@return bool result результат, возвращает true если диалог открыт
---@return int button номер кнопки
---@return int list выбранная строка в списке
---@return zstring input текст
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
--- Записывает значение типа boolean в BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBool">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@param value bool значение
function raknetBitStreamWriteBool(bs, value) end

---
--- Записывает значение типа byte в BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt8">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@param value int значение
function raknetBitStreamWriteInt8(bs, value) end

---
--- Записывает значение типа short (2 байта) в BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt16">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@param value int значение
function raknetBitStreamWriteInt16(bs, value) end

---
--- Записывает значение типа integer (4 байта) в BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt32">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@param value int значение
function raknetBitStreamWriteInt32(bs, value) end

---
--- Записывает значение типа float (4 байта) в BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteFloat">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@param value float значение
function raknetBitStreamWriteFloat(bs, value) end

---
--- Записывает буффер указанного размера в BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBuffer">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@param dest int буффер
---@param size int размер
function raknetBitStreamWriteBuffer(bs, dest, size) end

---
--- Записывает BitStream в BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBitStream">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@param other Bitstream bitStream (который записываем)
function raknetBitStreamWriteBitStream(bs, other) end

---
--- Записывает строку в BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteString">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@param str string строка
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
--- Создает SAMP объект --- 3D-текст  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampCreate3dText">Open the wiki</a>  
---
---@param text zstring Содержимое
---@param color int Цвет (ARGB)
---@param posX float Позиция/смещение относительно крепления по оси X
---@param posY float Позиция/смещение относительно крепления по оси Y
---@param posZ float Позиция/смещение относительно крепления по оси Z
---@param distance float Дистанция при которой будет виден 3D-текст
---@param ignoreWalls bool Виден за объектами/стенами
---@param playerId int Крепление к игроку по ид (-1 --- отключить)
---@param vehicleId int Крепление к т/с по ид (-1 --- отключить)
---@return int textlabel ид созданного 3D-текста
function sampCreate3dText(text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId) end

---
--- Удаляет 3D текст.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampDestroy3dText">Open the wiki</a>  
---
---@param textlabel int указатель на 3D текст
function sampDestroy3dText(textlabel) end

---
--- Проверяет 3D текст на существование.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampIs3dTextDefined">Open the wiki</a>  
---
---@param _3dText int ID 3D текста
---@return bool result результат проверки
function sampIs3dTextDefined(_3dText) end

---
--- Закрывает открытый диалог с указанием нажатой кнопки.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampCloseCurrentDialogWithButton">Open the wiki</a></b>  
---
---@param button int номер кнопки
function sampCloseCurrentDialogWithButton(button) end

---
--- Возвращает номер элемента из списка (диалога), который в данный момент активен  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogListItem">Open the wiki</a>  
---
---@return int list номер элемента из списка (диалога)
function sampGetCurrentDialogListItem() end

---
--- Выбирает элемент из списка (диалога)  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogListItem">Open the wiki</a>  
---
---@param list int номер элемента
function sampSetCurrentDialogListItem(list) end

---
--- Возвращает текст из полей диалога 1 стиля  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogEditboxText">Open the wiki</a>  
---
---@return zstring text текст
function sampGetCurrentDialogEditboxText() end

---
--- Вставляет текст в поле для ввода диалога 1 стиля  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogEditboxText">Open the wiki</a>  
---
---@param text zstring текст
function sampSetCurrentDialogEditboxText(text) end

---
--- Проверяет, активен ли любой SA:MP-диалог.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsDialogActive">Open the wiki</a></b>  
---
---@return bool result статус
function sampIsDialogActive() end

---
--- Возвращает стиль активного диалога  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogType">Open the wiki</a>  
---
---@return int type стиль
function sampGetCurrentDialogType() end

---
--- Возвращает ID последнего(открытого) диалогового окна  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogId">Open the wiki</a></b>  
---
---@return int id ID диалогового окна
function sampGetCurrentDialogId() end

---
--- Возвращает текущий gamestate.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetGamestate">Open the wiki</a></b>  
---
---@return GameState gamestate ID gamestate
function sampGetGamestate() end

---
--- Возвращает хендл объекта по его иду.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetObjectHandleBySampId">Open the wiki</a>  
---
---@param id int ID объекта
---@return Object object хендл объекта
function sampGetObjectHandleBySampId(id) end

---
--- Получает хэндл пикапа по его id  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetPickupHandleBySampId">Open the wiki</a>  
---
---@param id int id пикапа
function sampGetPickupHandleBySampId(id) end

---
--- Получает ID объекта по его хендлу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetObjectSampIdByHandle">Open the wiki</a>  
---
---@param object Object handle объекта
---@return int objectId ID объекта
function sampGetObjectSampIdByHandle(object) end

---
--- Получает id пикапа через его handle  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetPickupSampIdByHandle">Open the wiki</a>  
---
---@param pickup Pickup handle пикапа
function sampGetPickupSampIdByHandle(pickup) end

---
--- Возвращает общее кол-во элементов в списке (последнего)открытого диалога.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetListboxItemsCount">Open the wiki</a>  
---
---@return int count кол-во элементов
function sampGetListboxItemsCount() end

---
--- Получает ид текущей анимации игрока.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerAnimationId">Open the wiki</a>  
---
---@param playerId int ИД игрока.
---@return int animid ИД анимации.
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
--- Получает текущее разрешение экрана в пикселях  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getScreenResolution">Open the wiki</a>  
---
---@return int resX ширина экрана
---@return int resY высота экрана
function getScreenResolution() end

---
--- Получает текст из листбокса по его номеру  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetListboxItemText">Open the wiki</a>  
---
---@param item int номер элемента
---@return zstring text текст
function sampGetListboxItemText(item) end

---
--- Проверяет, находится ли указанный игрок на паузе  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampIsPlayerPaused">Open the wiki</a>  
---
---@param id int id игрока
---@return bool result результат
function sampIsPlayerPaused(id) end

---
--- Переключает видимость курсора SAMP  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampToggleCursor">Open the wiki</a>  
---
---@param show bool статус
function sampToggleCursor(show) end

---
--- Проверяет, заспавнился ли игрок.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampIsLocalPlayerSpawned">Open the wiki</a>  
---
---@return bool result статус
function sampIsLocalPlayerSpawned() end

---
--- Возвращает ид специального действия игрока.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerSpecialAction">Open the wiki</a>  
---
---@param id int ID игрока
---@return int action ID специального действия
function sampGetPlayerSpecialAction(id) end

---
--- Отменяет регистрацию команды, созданной с помощью функции <a class="is-internal-link is-valid-page" href="/moonloader/lua/sampRegisterChatCommand">sampRegisterChatCommand</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampUnregisterChatCommand">Open the wiki</a>  
---
---@param cmd string команда
---@return bool result результат выполнения
function sampUnregisterChatCommand(cmd) end

---
--- Проверяет, является ли указанный игрок NPC  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampIsPlayerNpc">Open the wiki</a>  
---
---@param id int id игрока
---@return bool result результат
function sampIsPlayerNpc(id) end

---
--- Получает очки игрока.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerScore">Open the wiki</a>  
---
---@param id int ИД игрока.
---@return int score Очки.
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
--- Получает данные о сообщении в окне чата.<br/>  
--- А именно: string text, string prefix, int color, int pcolor  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetChatString">Open the wiki</a>  
---
---@param id int Номер строки чата
---@return string text Текст сообщения
---@return string prefix Префикс
---@return int color Цвет сообщения
---@return int pcolor int pcolor
function sampGetChatString(id) end

---
--- Вставляет в поле чата текст.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSetChatInputText">Open the wiki</a>  
---
---@param text zstring Строка
function sampSetChatInputText(text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetChatInputText">Open the wiki</a></b>
---
---@return zstring text
function sampGetChatInputText() end

---
--- Добавляет в консоль и лог-файл SAMPFUNCS текстовое сообщение.  
--- Отличается от опкода тем, что не принимает динамическое количество аргументов для форматирования.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampfuncsLog">Open the wiki</a>  
---
---@param msg string текст
function sampfuncsLog(msg) end

---
--- Открывает/Закрывает чат  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSetChatInputEnabled">Open the wiki</a>  
---
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
--- Создаёт dxut диалог  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutCreateDialog">Open the wiki</a>  
---
---@param name zstring заголовок
---@return DxutDialog dialog указатель на объект диалога
function dxutCreateDialog(name) end

---
--- Возвращает последнее id события и компонента которое произошло с указанным диалогом  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutPopEvent">Open the wiki</a>  
---
---@param dialog DxutDialog указатель на объект диалога
---@return bool result результат
---@return int events id события
---@return int id id компонента
function dxutPopEvent(dialog) end

---
--- Создаёт кнопку на Dxut диалоге  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutAddButton">Open the wiki</a>  
---
---@param dialog DxutDialog указатель на объект диалога
---@param id int уникальный id кнопки
---@param text zstring надпись на кнопке
---@param posX int позиция кнопки
---@param posY int позиция кнопки
---@param sizeX int размер кнопки
---@param sizeY int размер кнопки
function dxutAddButton(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- Создаёт чекбокс в Dxut диалоге  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutAddCheckbox">Open the wiki</a>  
---
---@param dialog DxutDialog указатель на объект диалога
---@param id int уникальный id чекбокса
---@param text zstring название чекбокса
---@param posX int позиция чекбокса
---@param posY int позиция чекбокса
---@param sizeX int размер чекбокса
---@param sizeY int размер чекбокса
function dxutAddCheckbox(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- Устанавливает позицию и размер Dxut диалогу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutSetDialogPos">Open the wiki</a>  
---
---@param dialog DxutDialog указатель на объект диалога
---@param posX int позиция диалога
---@param posY int позиция диалога
---@param sizeX int размер диалога
---@param sizeY int размер диалога
function dxutSetDialogPos(dialog, posX, posY, sizeX, sizeY) end

---
--- Получает позицию и размер Dxut диалога  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutGetDialogPosAndSize">Open the wiki</a>  
---
---@param dialog DxutDialog указатель на объект диалога
---@return int posX позиция диалога
---@return int posY позиция диалога
---@return int sizeX размер диалога
---@return int sizeY размер диалога
function dxutGetDialogPosAndSize(dialog) end

---
--- Устанавливает видимость диалогу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutSetDialogVisible">Open the wiki</a>  
---
---@param dialog DxutDialog указатель на объект диалога
---@param visible bool видимость диалога (если true-виден, если false-не виден)
function dxutSetDialogVisible(dialog, visible) end

---
--- Проверяет, виден ли Dxut диалог, возвращает true если диалог виден и наоборот  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutIsDialogVisible">Open the wiki</a>  
---
---@param dialog DxutDialog указатель на объект диалога
---@return bool result результат
function dxutIsDialogVisible(dialog) end

---
--- Добавляет поле для ввода текста в Dxut диалоге  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutAddEditbox">Open the wiki</a>  
---
---@param dialog DxutDialog указатель на объект Dxut диалога
---@param id int уникальный id
---@param text zstring название
---@param posX int позиция
---@param posY int позиция
---@param sizeX int размер
---@param sizeY int размер
function dxutAddEditbox(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- Возвращает текст компонента по id  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutGetControlText">Open the wiki</a>  
---
---@param dialog DxutDialog указатель на объект диалога
---@param id int id компонента
---@return zstring text текст
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
--- Проверяет, виден ли курсор  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampIsCursorActive">Open the wiki</a>  
---
---@return bool result результат
function sampIsCursorActive() end

---
--- Устанавливает режим курсора SAMP.<br/>  
--- Доступные режимы:<br/>  
--- 0 - Отключен.<br/>  
--- 1 - Управление клавиатурой заблокировано, курсор отключен.<br/>  
--- 2 - Управление клавиатурой и мышкой заблокировано, курсор включен.<br/>  
--- 3 - Управление мышкой заблокировано, курсор включен.<br/>  
--- 4 - Управление мышкой заблокировано, курсор отключен.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSetCursorMode">Open the wiki</a>  
---
---@param mode int Режим
function sampSetCursorMode(mode) end

---
--- Возвращает текущий режим курсора  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetCursorMode">Open the wiki</a>  
---
---@return int mode ID режима
function sampGetCursorMode() end

---
--- Устанавливает видимость компонента Dxut диалога  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutSetControlVisible">Open the wiki</a>  
---
---@param dialog DxutDialog указатель на объект диалога
---@param id int id компонента диалога
---@param visible bool видимость компонента
function dxutSetControlVisible(dialog, id, visible) end

---
--- Создаёт статистический текст на Dxut диалоге  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutAddStatic">Open the wiki</a>  
---
---@param dialog DxutDialog указатель на объект диалога
---@param id int уникальный id текста
---@param text zstring текст
---@param posX int позиция
---@param posY int позиция
---@param sizeX int размер
---@param sizeY int размер
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
--- Получает размеры компонента  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/dxutGetControlSize">Open the wiki</a>  
---
---@param dialog DxutDialog Диалог
---@param id int ID компонента
---@return int sizeX ширина
---@return int sizeY высота
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
--- Возвращает указатель на структуру поля ввода в чате  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetInputInfoPtr">Open the wiki</a>  
---
---@return uint inputPtr указатель
function sampGetInputInfoPtr() end

---
--- Возвращает указатель на структуру диалогов  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetDialogInfoPtr">Open the wiki</a>  
---
---@return uint dialogPtr указатель
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
--- Получает указатель на структуру текстдравов.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetTextdrawPoolPtr">Open the wiki</a>  
---
---@return int tdpool структура
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
--- Возвращает указатель на пул игроков  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerPoolPtr">Open the wiki</a>  
---
---@return uint playerpoolPtr указатель
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
--- Отправляет onFootData серверу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendOnfootData">Open the wiki</a>  
---
---@param dataPtr uint заполненная структура
function sampSendOnfootData(dataPtr) end

---
--- Отправляет IncarData серверу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendIncarData">Open the wiki</a>  
---
---@param dataPtr uint заполненная структура
function sampSendIncarData(dataPtr) end

---
--- Отправляет PassengerData серверу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendPassengerData">Open the wiki</a>  
---
---@param dataPtr uint заполненная структура
function sampSendPassengerData(dataPtr) end

---
--- Отправляет AimData серверу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendAimData">Open the wiki</a>  
---
---@param dataPtr uint заполненная структура
function sampSendAimData(dataPtr) end

---
--- Отправляет BulletData серверу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendBulletData">Open the wiki</a>  
---
---@param dataPtr uint заполненная структура
function sampSendBulletData(dataPtr) end

---
--- Отправляет TrailerData серверу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendTrailerData">Open the wiki</a>  
---
---@param dataPtr uint заполненная структура
function sampSendTrailerData(dataPtr) end

---
--- Отправляет UnoccupiedData серверу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendUnoccupiedData">Open the wiki</a>  
---
---@param dataPtr uint заполненная структура
function sampSendUnoccupiedData(dataPtr) end

---
--- Отправляет SpectatorData серверу  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendSpectatorData">Open the wiki</a>  
---
---@param dataPtr uint заполненная структура
function sampSendSpectatorData(dataPtr) end

---@alias ClickSource
---| 0 # Нажатие в Scoreboard

---
--- Отправляет RPC - RPC_CLICKPLAYER  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendClickPlayer">Open the wiki</a>  
---
---@param id int ид игрока
---@param source ClickSource источник вызова
function sampSendClickPlayer(id, source) end

---
--- Отправляет RPC - RPC_DIALOGRESPONSE  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendDialogResponse">Open the wiki</a>  
---
---@param id int ид диалога
---@param button int ид кнопки (0 / 1)
---@param listitem int номер элемента списка (от 0)
---@param input zstring текст введенный в поле
function sampSendDialogResponse(id, button, listitem, input) end

---
--- Отправляет RPC ClickTextdraw на сервер.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendClickTextdraw">Open the wiki</a>  
---
---@param id int ID текстдрава
function sampSendClickTextdraw(id) end

---
--- Отправляет RPC о нанесении урона другому игроку.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendGiveDamage">Open the wiki</a>  
---
---@param id int ID игрока
---@param damage float количество урона
---@param weapon int ID оружия
---@param bodypart int часть тела
function sampSendGiveDamage(id, damage, weapon, bodypart) end

---
--- Отправляет RPC о получении урона от другого игрока.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendTakeDamage">Open the wiki</a>  
---
---@param id int ID игрока
---@param damage float количество урона
---@param weapon int ID оружия
---@param bodypart int часть тела
function sampSendTakeDamage(id, damage, weapon, bodypart) end

---
--- Отправляет RPC о изменении структуры объекта в режиме его редактирования.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendEditObject">Open the wiki</a>  
---
---@param playerObject bool `false` --- глобальный объект / `true` --- объект для одного игрока
---@param objectId int ID объекта
---@param response int Тип ответа (от 0 до 2)
---@param posX float Позиция объекта X
---@param posY float Позиция объекта Y
---@param posZ float Позиция объекта Z
---@param rotX float Поворот объекта X
---@param rotY float Поворот объекта Y
---@param rotZ float Поворот объекта Z
function sampSendEditObject(playerObject, objectId, response, posX, posY, posZ, rotX, rotY, rotZ) end

---
--- Отправляет RPC о изменении прикрепленного объекта в режиме редактирования объекта.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendEditAttachedObject">Open the wiki</a>  
---
---@param response int Cтатус ответа(0 --- нажата отмена(ESC) / 1 --- сохранено)
---@param index int Индекс/слот объекта
---@param model int Модель объекта
---@param bone int ID кости к которой присоединен объект
---@param offsetX float Смещение объекта X
---@param offsetY float Смещение объекта Y
---@param offsetZ float Смещение объекта Z
---@param rotX float Поворот объекта X
---@param rotY float Поворот объекта Y
---@param rotZ float Поворот объекта Z
---@param scaleX float Масштаб объекта X
---@param scaleY float Масштаб объекта Y
---@param scaleZ float Масштаб объекта Z
function sampSendEditAttachedObject(response, index, model, bone, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ) end

---
--- Отправляет RPC - RPC_SETINTERIORID  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendInteriorChange">Open the wiki</a>  
---
---@param id int
function sampSendInteriorChange(id) end

---
--- Отправляет RPC - RPC_REQUESTSPAWN  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendRequestSpawn">Open the wiki</a>  
---
function sampSendRequestSpawn() end

---
--- Отправляет RPC - RPC_PICKEDUPPICKUP  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendPickedUpPickup">Open the wiki</a>  
---
---@param id int
function sampSendPickedUpPickup(id) end

---
--- Отправляет RPC - RPC_MENUSELECT  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendMenuSelectRow">Open the wiki</a>  
---
---@param id int номер строки меню
function sampSendMenuSelectRow(id) end

---
--- Отправляет RPC - RPC_MENUQUIT  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendMenuQuit">Open the wiki</a>  
---
function sampSendMenuQuit() end

---
--- Отправляет RPC - RPC_VEHICLEDESTROYED  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSendVehicleDestroyed">Open the wiki</a>  
---
---@param id int ид т/с
function sampSendVehicleDestroyed(id) end

---
--- Проверяет видимость списка игроков (TAB)  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampIsScoreboardOpen">Open the wiki</a>  
---
---@return bool result
function sampIsScoreboardOpen() end

---
--- Переключает видимость списка игроков (TAB)  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampToggleScoreboard">Open the wiki</a>  
---
---@param show bool статус
function sampToggleScoreboard(show) end

---
--- Возвращает основной текст последнего или активного диалогового окна.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetDialogText">Open the wiki</a>  
---
---@return string text текст
function sampGetDialogText() end

---
--- Возвращает заголовок последнего открытого диалога  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetDialogCaption">Open the wiki</a>  
---
---@return zstring caption
function sampGetDialogCaption() end

---
--- Устанавливает сторону (клиентская/серверная) диалога.<br/>  
--- Если указана клиентская, то информация после закрытия диалога (Dialog Response) не будет отправлена на сервер  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSetDialogClientside">Open the wiki</a>  
---
---@param clientside bool
function sampSetDialogClientside(clientside) end

---
--- Проверяет диалог на то, что тот принадлежит клиентской стороне  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampIsDialogClientside">Open the wiki</a>  
---
---@return bool result
function sampIsDialogClientside() end

---
--- Проверяет видимость чата  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampIsChatVisible">Open the wiki</a>  
---
---@return bool result
function sampIsChatVisible() end

---@alias ChatDisplayMode
---| 2 # обычный
---| 1 # без тени у текста
---| 0 # не виден

---
--- Возвращает режим отображения чата  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetChatDisplayMode">Open the wiki</a>  
---
---@return ChatDisplayMode mode
function sampGetChatDisplayMode() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetChatDisplayMode">Open the wiki</a></b>
---
---@param mode ChatDisplayMode
function sampSetChatDisplayMode(mode) end

---
--- Останавливает scm поток  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/pauseScmThread">Open the wiki</a>  
---
---@param thread uint номер потока
function pauseScmThread(thread) end

---
--- Возобновляет исполнение SCM-потока.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/resumeScmThread">Open the wiki</a>  
---
---@param thread uint указатель на поток
function resumeScmThread(thread) end

---
--- Читает значение типа boolean из BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBool">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@return bool value результирующее значение
function raknetBitStreamReadBool(bs) end

---
--- Читает значение типа byte из BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt8">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@return int value результирующее значение
function raknetBitStreamReadInt8(bs) end

---
--- Читает значение типа short (2 байта) из BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt16">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@return int value результирующее значение
function raknetBitStreamReadInt16(bs) end

---
--- Читает значение типа integer (4 байта) из BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt32">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@return int value результирующее значение
function raknetBitStreamReadInt32(bs) end

---
--- Читает значение типа float из BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadFloat">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@return float value результирующее значение
function raknetBitStreamReadFloat(bs) end

---
--- Читает буффер указанного размера из BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBuffer">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@param dest int буффер
---@param size int размер
function raknetBitStreamReadBuffer(bs, dest, size) end

---
--- Читает строку указанной длины (переменный размер) из BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadString">Open the wiki</a>  
---
---@param bs Bitstream bitStream
---@param size int длина строки
---@return string value результирующее значение
function raknetBitStreamReadString(bs, size) end

---
--- Сбрасывает указатель чтения битстрима  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamResetReadPointer">Open the wiki</a>  
---
---@param bs Bitstream
function raknetBitStreamResetReadPointer(bs) end

---
--- Сбрасывает указатель записи битстрима  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamResetWritePointer">Open the wiki</a>  
---
---@param bs Bitstream
function raknetBitStreamResetWritePointer(bs) end

---
--- Осуществляет пропуск битов в указателе чтения/записи битстрима  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamIgnoreBits">Open the wiki</a>  
---
---@param bs Bitstream
---@param amount int количество битов
function raknetBitStreamIgnoreBits(bs, amount) end

---
--- Устанавливает смещение для последующей записи в битстрим  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetWriteOffset">Open the wiki</a>  
---
---@param bs Bitstream
---@param offset int смещение (в битах)
function raknetBitStreamSetWriteOffset(bs, offset) end

---
--- Устанавливает смещение для последующего чтения битстрима  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetReadOffset">Open the wiki</a>  
---
---@param bs Bitstream
---@param offset int смещение (в битах)
function raknetBitStreamSetReadOffset(bs, offset) end

---
--- Возвращает количество записанных битов в битстриме  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBitsUsed">Open the wiki</a>  
---
---@param bs Bitstream
---@return int value
function raknetBitStreamGetNumberOfBitsUsed(bs) end

---
--- Возвращает количество записанных байтов в битстриме  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBytesUsed">Open the wiki</a>  
---
---@param bs Bitstream
---@return int value
function raknetBitStreamGetNumberOfBytesUsed(bs) end

---
--- Возвращает количество непрочитанных битов в битстриме  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfUnreadBits">Open the wiki</a>  
---
---@param bs Bitstream
---@return int value
function raknetBitStreamGetNumberOfUnreadBits(bs) end

---
--- Возвращает текущий оффсет записи в BitStream.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetWriteOffset">Open the wiki</a>  
---
---@param bs Bitstream Указатель на BitStream
---@return int value Оффсет
function raknetBitStreamGetWriteOffset(bs) end

---
--- Возвращает текущий оффсет чтения из BitStream'а.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetReadOffset">Open the wiki</a>  
---
---@param bs Bitstream Указатель на BitStream
---@return int value Оффсет
function raknetBitStreamGetReadOffset(bs) end

---
--- Возвращает указатель на данные BitStream'а.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetDataPtr">Open the wiki</a>  
---
---@param bs Bitstream BitStream
---@return uint value указатель на структуру данных
function raknetBitStreamGetDataPtr(bs) end

---
--- Декриптует строку из BitStream`a и записывает её в буфер  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamDecodeString">Open the wiki</a>  
---
---@param bs Bitstream Указатель на BitStream
---@param size int Размер буфера
---@return zstring string Буфер
function raknetBitStreamDecodeString(bs, size) end

---
--- Криптует строку и записывает в BitStream  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamEncodeString">Open the wiki</a>  
---
---@param bs Bitstream Указатель на BitStream
---@param string zstring Буфер
function raknetBitStreamEncodeString(bs, string) end

---
--- Эмулирует входящий RPC с помощью данных BitStream'а.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetEmulRpcReceiveBitStream">Open the wiki</a>  
---
---@param rpc int ID RPC
---@param bs Bitstream Указатель на BitStream
function raknetEmulRpcReceiveBitStream(rpc, bs) end

---
--- Эмулирует входящий пакет с помощью даннных BitStream'а.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetEmulPacketReceiveBitStream">Open the wiki</a>  
---
---@param packet int ID пакета
---@param bs int Указатель на BitStream
function raknetEmulPacketReceiveBitStream(packet, bs) end

---
--- Возвращает наименование RPC по его ид  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetGetRpcName">Open the wiki</a>  
---
---@param rpc int ид RPC
---@return zstring name
function raknetGetRpcName(rpc) end

---
--- Возвращает наименование пакета по его ид  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/raknetGetPacketName">Open the wiki</a>  
---
---@param packet int ид пакета
---@return zstring name
function raknetGetPacketName(packet) end

---
--- Устанавливает новое значение (регистрирует) для глобальной переменной SAMPFUNCS  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setSampfuncsGlobalVar">Open the wiki</a>  
---
---@param var zstring наименование переменной
---@param value int значение переменной
---@return bool result
function setSampfuncsGlobalVar(var, value) end

---
--- Возвращает значение глобальной переменной, зарегистрированной с помощью SAMPFUNCS  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVar">Open the wiki</a>  
---
---@param var zstring наименование переменной
---@return bool result переменная найдена
---@return int value значение переменной
function getSampfuncsGlobalVar(var) end

---
--- Создает (перезаписывает) SAMP объект --- 3D-текст.<br/>  
--- В отличии от <a class="is-internal-link is-valid-page" href="/moonloader/lua/sampCreate3dText">sampCreate3dText</a> данная функция взаимодействует с SAMP пулом напрямую.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampCreate3dTextEx">Open the wiki</a>  
---
---@param id int Ид создаваемого/перезаписываемого 3D-текста
---@param text zstring Содержимое
---@param color int Цвет (ARGB)
---@param posX float Позиция/смещение относительно крепления по оси X
---@param posY float Позиция/смещение относительно крепления по оси Y
---@param posZ float Позиция/смещение относительно крепления по оси Z
---@param distance float Дистанция при которой будет виден 3D-текст
---@param ignoreWalls bool Виден за объектами/стенами
---@param playerId int Крепление к игроку по ид (-1 --- отключить)
---@param vehicleId int Крепление к т/с по ид (-1 --- отключить)
function sampCreate3dTextEx(id, text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId) end

---
--- Получает параметры 3D текста.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGet3dTextInfoById">Open the wiki</a>  
---
---@param id int ID 3D Текста
---@return string string текст.
---@return int color цвет.
---@return float posX
---@return float posY
---@return float posZ координаты 3D текста(XYZ)
---@return float distance дистанция.
---@return bool ignoreWalls виден ли через стены.
---@return int playerId если прикреплен к игроку, то возвращает его ид.
---@return int vehicleId если прикреплен к т/с, то возвращает его ид
function sampGet3dTextInfoById(id) end

---
--- Устанавливает 3D тексту новый текст.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSet3dTextString">Open the wiki</a>  
---
---@param id int ID 3D текста.
---@param text string текст
function sampSet3dTextString(id, text) end

---
--- Создает текстдрав c заданными параметрами.  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawCreate">Open the wiki</a></b>  
---
---@param id int ID текстдрава
---@param text zstring текст текстдрава
---@param posX float координата X текстдрава
---@param posY float координата Y текстдрава
function sampTextdrawCreate(id, text, posX, posY) end

---
--- Устанавливает параметры прямоугольника текстдраву.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetBoxColorAndSize">Open the wiki</a>  
---
---@param id int ID текстдрава
---@param box int статус
---@param color int цвет
---@param sizeX float
---@param sizeY float размеры
function sampTextdrawSetBoxColorAndSize(id, box, color, sizeX, sizeY) end

---
--- Задает выравнивание текста текстдраву.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetAlign">Open the wiki</a>  
---
---@param id int ID текстдрава
---@param align int тип выравнивания
function sampTextdrawSetAlign(id, align) end

---
--- Устанавливает масштабирование текста текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetProportional">Open the wiki</a>  
---
---@param id int ID текстдрава
---@param proportional int статус
function sampTextdrawSetProportional(id, proportional) end

---
--- Устанавливает стиль текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetStyle">Open the wiki</a>  
---
---@param id int ID текстдрава
---@param style int стиль
function sampTextdrawSetStyle(id, style) end

---
--- Устанавливает тень текстдраву.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetShadow">Open the wiki</a>  
---
---@param id int ID текстдрава
---@param shadow int размер тени
---@param color int цвет
function sampTextdrawSetShadow(id, shadow, color) end

---
--- Устанавливает текстдраву обводку  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetOutlineColor">Open the wiki</a>  
---
---@param id int ID текстдрава
---@param outline int толщина обводки
---@param color int цвет
function sampTextdrawSetOutlineColor(id, outline, color) end

---
--- Устанавливает модель объекта/машины текстдраву со стилем 5.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetModelRotationZoomVehColor">Open the wiki</a>  
---
---@param id int ID текстдрава
---@param model int номер модели
---@param rotX float вращение модели по осям (XYZ)
---@param rotY float вращение модели по осям (XYZ)
---@param rotZ float вращение модели по осям (XYZ)
---@param zoom float дальность камеры
---@param clr1 int первичный цвет
---@param clr2 int вторичный цвет
function sampTextdrawSetModelRotationZoomVehColor(id, model, rotX, rotY, rotZ, zoom, clr1, clr2) end

---
--- Устанавливает текст текстдраву.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetString">Open the wiki</a>  
---
---@param id int ID текстдрава
---@param text string текст
function sampTextdrawSetString(id, text) end

---
--- Устанавливает позицию текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetPos">Open the wiki</a>  
---
---@param id int ID текстдрава
---@param posX float
---@param posY float позиция текстдрава (XY)
function sampTextdrawSetPos(id, posX, posY) end

---
--- Устанавливает параметры символов текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetLetterSizeAndColor">Open the wiki</a>  
---
---@param id int ID текстдрава
---@param letSizeX float
---@param letSizeY float Размер
---@param color int цвет
function sampTextdrawSetLetterSizeAndColor(id, letSizeX, letSizeY, color) end

---
--- Получает параметры прямоугольника текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetBoxEnabledColorAndSize">Open the wiki</a>  
---
---@param id int ID текстдрава
---@return int box статус.
---@return int color цвет.
---@return float sizeX
---@return float sizeY размер
function sampTextdrawGetBoxEnabledColorAndSize(id) end

---
--- Получает тип выравнивания текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetAlign">Open the wiki</a>  
---
---@param id int ID текстдрава
---@return int align тип
function sampTextdrawGetAlign(id) end

---
--- Получает статус масштабирования текста в пропорциональном соотношении указанного текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetProportional">Open the wiki</a>  
---
---@param id int ID текстдрава
---@return int prop пропорция
function sampTextdrawGetProportional(id) end

---
--- Получает стиль текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetStyle">Open the wiki</a>  
---
---@param id int ID текстдрава
---@return int style стиль
function sampTextdrawGetStyle(id) end

---
--- Получает параметры тени текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetShadowColor">Open the wiki</a>  
---
---@param id int ID текстдрава
---@return int shadow размер.
---@return int color цвет
function sampTextdrawGetShadowColor(id) end

---
--- Получает параметры обводки текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetOutlineColor">Open the wiki</a>  
---
---@param id int ID текстдрава
---@return int outline толщина.
---@return int color цвет
function sampTextdrawGetOutlineColor(id) end

---
--- Получает параметры модели текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetModelRotationZoomVehColor">Open the wiki</a>  
---
---@param id int ID текстдрава
---@return int model модель
---@return float rotX
---@return float rotY
---@return float rotZ поворот по осям(XYZ)
---@return float zoom отдаление камеры
---@return int clr1
---@return int clr2 первичный и вторичный цвета
function sampTextdrawGetModelRotationZoomVehColor(id) end

---
--- Получает текст текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetString">Open the wiki</a>  
---
---@param id int ID текстдрава
---@return string text текст
function sampTextdrawGetString(id) end

---
--- Получает позицию текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetPos">Open the wiki</a>  
---
---@param id int ID текстдрава
---@return float posX
---@return float posY позиция по X и Y
function sampTextdrawGetPos(id) end

---
--- Получает длину, ширину и цвет текстдрава.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetLetterSizeAndColor">Open the wiki</a>  
---
---@param id int ID текстдрава
---@return float letSizeX
---@return float letSizeY размер.
---@return int color цвет
function sampTextdrawGetLetterSizeAndColor(id) end

---
--- Проверяет текстдрав на существование.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawIsExists">Open the wiki</a>  
---
---@param id int ID текстдрава
---@return bool result результат проверки
function sampTextdrawIsExists(id) end

---
--- Удаляет текстдрав.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawDelete">Open the wiki</a>  
---
---@param id int ID текстдрава
function sampTextdrawDelete(id) end

---
--- Проверяет существование глобальной переменной, зарегистрированной с помощью SAMPFUNCS  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isSampfuncsGlobalVarDefined">Open the wiki</a>  
---
---@param var zstring наименование переменной
---@return bool result
function isSampfuncsGlobalVarDefined(var) end

---
--- Возвращает разрешения записи/чтения глобальной переменной, зарегистрированной с помощью SAMPFUNCS, для указанного SCM-потока  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVarAccessForThread">Open the wiki</a>  
---
---@param var zstring наименование переменной
---@param thread int указатель на поток
---@return int read чтение (bool?)
---@return int write запись (bool?)
function getSampfuncsGlobalVarAccessForThread(var, thread) end

---
--- Выполняет указанную консольную SAMPFUNCS команду  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/runSampfuncsConsoleCommand">Open the wiki</a>  
---
---@param cmd zstring
function runSampfuncsConsoleCommand(cmd) end

---
--- Добавляет новую команду в консоль SAMPFUNCS.  
--- От оригинального опкода отличается дополнительн  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampfuncsRegisterConsoleCommand">Open the wiki</a>  
---
---@param cmd string команда
---@param func function функция-обработчик
---@return bool result результат выполнения
function sampfuncsRegisterConsoleCommand(cmd, func) end

---
--- Отменяет регистрацию консольной команды, созданной с помощью функции <a class="is-internal-link is-valid-page" href="/moonloader/lua/sampfuncsRegisterConsoleCommand">sampfuncsRegisterConsoleCommand</a>.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampfuncsUnregisterConsoleCommand">Open the wiki</a>  
---
---@param cmd string команда
---@return bool result результат выполнения
function sampfuncsUnregisterConsoleCommand(cmd) end

---
--- Создает SCM-поток, содержимое которого будет определено из участка памяти  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/createScmThreadAtPointer">Open the wiki</a>  
---
---@param pointer int Указатель на участок памяти
---@param args table Передаваемые значения/аргументы
---@return int thread Указатель на поток
function createScmThreadAtPointer(pointer, args) end

---
--- Устанавливает новое значение переменной в SCM-потоке  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setScmThreadLocalVar">Open the wiki</a>  
---
---@param thread int Указатель на поток
---@param var int Номер переменной
---@param value int Значение
function setScmThreadLocalVar(thread, var, value) end

---
--- Возвращает значение переменной в SCM-потоке  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/getScmThreadLocalVar">Open the wiki</a>  
---
---@param thread int Указатель на поток
---@param var int Номер переменной
---@return int value
function getScmThreadLocalVar(thread, var) end

---
--- Уничтожает ранее созданный SCM-поток  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/destroyScmThread">Open the wiki</a>  
---
---@param thread int Указатель на поток
function destroyScmThread(thread) end

---
--- Перезагружает ранее созданный SCM-поток  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/restartScmThread">Open the wiki</a>  
---
---@param thread int Указатель на поток
---@param args table Передаваемые значения/аргументы в поток
function restartScmThread(thread, args) end

---
--- Проверяет видимость/активность консоли SAMPFUNCS  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleActive">Open the wiki</a>  
---
---@return bool result
function isSampfuncsConsoleActive() end

---
--- Устанавливает описание для клиентской команды  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampSetClientCommandDescription">Open the wiki</a>  
---
---@param cmd zstring Команда
---@param text zstring Описание
function sampSetClientCommandDescription(cmd, text) end

---
--- Устанавливает описание для консольной команды  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/setSampfuncsConsoleCommandDescription">Open the wiki</a>  
---
---@param cmd zstring Команда
---@param text zstring Описание
function setSampfuncsConsoleCommandDescription(cmd, text) end

---
--- Принудительная отправка пакета синхронизации - PACKET_VEHICLE_SYNC  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampForceVehicleSync">Open the wiki</a>  
---
---@param id int SAMP ид т/с
function sampForceVehicleSync(id) end

---
--- Принудительная отправка пакета синхронизации - PACKET_UNOCCUPIED_SYNC  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampForceUnoccupiedSyncSeatId">Open the wiki</a>  
---
---@param id int SAMP ид т/с
---@param seatId int Номер сиденья
function sampForceUnoccupiedSyncSeatId(id, seatId) end

---
--- Принудительная отправка пакета синхронизации - PACKET_PLAYER_SYNC  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampForceOnfootSync">Open the wiki</a>  
---
function sampForceOnfootSync() end

---
--- Принудительная отправка пакета синхронизации - PACKET_AIM_SYNC  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampForceAimSync">Open the wiki</a>  
---
function sampForceAimSync() end

---
--- Принудительная отправка пакета синхронизации - PACKET_TRAILER_SYNC  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampForceTrailerSync">Open the wiki</a>  
---
---@param id int SAMP ид трейлера
function sampForceTrailerSync(id) end

---
--- Принудительная отправка пакета синхронизации - PACKET_PASSENGER_SYNC  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampForcePassengerSyncSeatId">Open the wiki</a>  
---
---@param id int SAMP ид т/с
---@param seatId int Номер сиденья
function sampForcePassengerSyncSeatId(id, seatId) end

---
--- Принудительная отправка пакета синхронизации - PACKET_STATS_UPDATE  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampForceStatsSync">Open the wiki</a>  
---
function sampForceStatsSync() end

---
--- Принудительная отправка пакета синхронизации - PACKET_WEAPONS_UPDATE  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampForceWeaponsSync">Open the wiki</a>  
---
function sampForceWeaponsSync() end

---
--- Возвращает максимальный SAMP ид игрока на сервере/в зоне прорисовки (стриме)  
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetMaxPlayerId">Open the wiki</a></b>  
---
---@param streamed bool Поиск в стриме
---@return int id ID игрока
function sampGetMaxPlayerId(streamed) end

---
--- Возвращает количество игроков.  
--- При <strong>streamed = <em>false</em></strong> возвращает количество игроков на сервере, при противоположном значении - количество игроков в зоне прорисовки (стриме)  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerCount">Open the wiki</a>  
---
---@param streamed bool Поиск в стриме
---@return int count
function sampGetPlayerCount(streamed) end

---
--- Передает строку на обработку к ChatInput (поле для ввода в чате)<br/>  
--- FIXME Запрещен вызов внутри тела любой зарегистрированной команды (с помощью опкода <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/0b34">0B34</a> или функции <a class="is-internal-link is-valid-page" href="/moonloader/lua/sampRegisterChatCommand">sampRegisterChatCommand</a>)  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampProcessChatInput">Open the wiki</a>  
---
---@param text zstring Команда/строка
function sampProcessChatInput(text) end

---
--- Проверяет существование клиентской команды, зарегистрированной SAMPFUNCS  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/sampIsChatCommandDefined">Open the wiki</a>  
---
---@param cmd zstring
---@return bool result
function sampIsChatCommandDefined(cmd) end

---
--- Проверяет существование консольной команды SAMPFUNCS  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleCommandDefined">Open the wiki</a>  
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
--- Основная функция, вызывается единожды за запуск скрипта.  
--- В ней можно использовать задержки `wait` и бесконечные циклы, при этом не нарушая работу игры.  
--- Вдействительности событие `main` является не событием, а сопрограммой, выполняющейся в отдельном Lua-потоке.  
--- Это и даёт возможность прерывать её выполнение на какой-то промежуток времени и затем продолжать работу с того же места без каких-либо негативных последствий.  
---
--- ### Пример  
---
--- ```lua
---   function main()
---     -- загрузим что-нибудь перед тем, как запустить бесконечный цикл
---     loadStuff()
---     key1_timesPressed = 0
---   
---     -- бесконечный цикл - в данном примере именно в нём реализована основная часть скрипта
---     while true do
---       -- в нём обязательно должна присутствовать хотя-бы нулевая задержка, иначе игра попросту зависнет
---       -- объясняется это тем, что весь процесс игры выполняется последовательно, в том числе и скрипты MoonLoader-а
---       -- и поэтому периодически игре нужно давать возможность обработаться, делая паузу в каждом бесконечном цикле любого скрипта
---       -- нулевая задержка приостановит выполнение скрипта ровно на один кадр (задержка в main не оказывает влияния на выполнение остальных событий)
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
--- Основная функция, вызывается единожды за запуск скрипта.  
--- В ней можно использовать задержки (<a class="is-internal-link is-valid-page" href="/moonloader/lua/wait">wait</a>) и бесконечные циклы, при этом не нарушая работу игры.<br/>  
--- В действительности событие main является не событием, а сопрограммой, выполняющейся в отдельном Lua-потоке.<br/>  
--- Это и даёт возможность прерывать её выполнение на какой-то промежуток времени и затем продолжать работу с того же места без каких-либо негативных последствий.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/main">Open the wiki</a>  
---
function main() end

---
--- Хэндл персонажа игрока.  
--- Применим во многих функциях, принимающих значение типа Char в качестве параметра.  
---
--- <a href="https://wiki.blast.hk/moonloader/lua/PLAYER_PED">Open the wiki</a>  
---

