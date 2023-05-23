---@meta
---@diagnostic disable: lowercase-global, missing-return

---@alias boolean boolean # логический
---@alias number number # целочисленный со знаком, 4 байта
---@alias number number # целочисленный без знака, 4 байта
---@alias number number # число с плавающей точкой, 4 байта
---@alias number number # число с плавающей точкой двойной точности, 8 байт
---@alias string string # нуль-терминированная строка (в Lua обычная строка)

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
---@alias Model number # идентификатор игровой модели
---@alias Bitstream number # указатель на объект BitStream
---@alias VarId number # индекс скриптовой глобальной переменной

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
--- Создаёт новый поток и сразу же запускает его с указанными параметрами.<br/>
--- Для создания потока приостановленным нужно использовать функцию `lua_thread.create_suspended`.<br/>
--- За примерами и всеми подробностями о потоках обратитесь к статье <a href="Скриптовые потоки">https://wiki.blast.hk/moonloader/scripting/threads</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/lua_thread/create">Open the wiki</a></b><br/>
---
---@param func function функция потока, которая начнёт исполнение сразу после создания потока
---@param ... any параметры, с которыми будет вызвана функция
---@return LuaThread thread экземпляр `LuaThread`
function lua_thread.create(func, ...) end

---
--- Создаёт новый поток в состоянии ожидания запуска. Такой поток не начнёт выполнение сразу же после создания, вместо чего будет находиться в ожидании активации функцией lua_thread:run.<br/>
--- Для создания потока с безотложным запуском нужно использовать функцию lua_thread.create.<br/>
--- За примерами и всеми подробностями о потоках обратитесь к статье Скриптовые потоки.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/lua_thread/create_suspended">Open the wiki</a></b><br/>
---
---@param func function функция потока, которая выполнится после вызова `thread:run()`
---@return LuaThread thread экземпляр `LuaThread`
function lua_thread.create_suspended(func) end

---@class LuaScript # экземпляр класса LuaScript
---@field name string # имя скрипта, заданное функцией 'script_name'. Если имя не задано используется название файла
---@field description string # описание скрипта, указанное функцией 'script_description'. Пустая строка, если не указано
---@field version_num number # числовая версия скрипта. 0, если не указано
---@field version string # текстовая версия скрипта. Будет использована числовая версия, если не задано
---@field authors table # список авторов скрипта. Пустой, если не указаны
---@field dependencies table # список зависимостей скрипта. Пустой, если не указаны
---@field path string # полный путь к файлу скрипта
---@field filename string # название файла скрипта, включая расширение
---@field directory string # полный путь директории, из который был загружен скрипт
---@field frozen boolean # статус активности потока (приостановлен/активен)
---@field dead boolean # статус существования потока. Есть случаи, когда поток уже завершён, а lua-объект скрипта ещё существует. Свойство dead проверяет объект скрипта на валидность
---@field exports any # экспортируемые скриптом значения. Можно получить и функцией import
---@field id number # уникальный идентификатор скрипта
---@field url string # web-адрес скрипта
---@field properties table # список свойств, заданных директивой script_properties
---@field pause fun() # приостанавливает поток скрипта
---@field resume fun() # снимает остановленный поток с паузы
---@field unload fun() # выгружает скрипт
---@field reload fun() # перезагружает скрипт

---
--- Возвращает `LuaScript` скрипта, из которого была вызвана функция.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/thisScript">Open the wiki</a></b><br/>
---
---@return LuaScript script скрипт
function thisScript() end

---@class script
script = {}

---
--- Статическое свойство. Возвращает объект `LuaScript` текущего скрипта. Является аналогом функции `thisScript`.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/this">Open the wiki</a></b><br/>
---
---@type LuaScript
script.this = {}

---
--- Загружает скрипт из файла и возвращает объект `LuaScript`.<br/>
--- Функция пытается загрузить скрипт в следующем порядке путей:
---  - рабочая директория + путь
---  - рабочая директория + путь + .lua(c)
---  - абсолютный путь
---  - абсолютный путь + .lua(c)
---
--- Возвращает `nil`, если скрипт не был загружен.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/load">Open the wiki</a></b><br/>
---
---@param file string путь к файлу
---@return LuaScript script скрипт
function script.load(file) end

---
--- Ищет загруженный скрипт по имени. Возвращает объект `LuaScript`, если скрипт найден, в противном случае возвращает `nil`.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/find">Open the wiki</a></b><br/>
---
---@param name string название скрипта
---@return LuaScript script скрипт
function script.find(name) end

---
--- Возвращает массив загруженных скриптов.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/list">Open the wiki</a></b><br/>
---
---@return LuaScript[] list массив `LuaScript` загруженных скриптов
function script.list() end

---
--- Получает загруженный скрипт по его уникальному идентификатору и возвращает объект `LuaScript`.<br/>
--- Возвращает `nil`, если скрипта с таким идентификатором нет.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script/get">Open the wiki</a></b><br/>
---
---@param scriptId number идентификатор скрипта
---@return LuaScript script скрипт
function script.get(scriptId) end

---
--- Проверяет, активен ли курсор<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCursorActive">Open the wiki</a></b><br/>
---
---@return boolean result результат
function isCursorActive() end

---
--- Возвращает массив со всеми пикапами<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAllPickups">Open the wiki</a></b><br/>
---
---@return Pickup[] pickups пикапы
function getAllPickups() end

---
--- Возвращает хэндл пикапа по указателю на экземляр класса CPickup.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupPointerHandle">Open the wiki</a></b><br/>
---
---@param handle number указатель
---@return Pickup pickup хэндл пикапа
function getPickupPointerHandle(handle) end

---
--- Возвращает указатель на структуру пикапа<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupPointer">Open the wiki</a></b><br/>
---
---@param pickup Pickup хэндл
---@return number pointer указатель
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
--- Возвращает тип пикапа<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupType">Open the wiki</a></b><br/>
---
---@param pickup Pickup хэндл пикапа
---@return PickupType type тип пикапа
function getPickupType(pickup) end

---
--- Возвращает модель пикапа<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupModel">Open the wiki</a></b><br/>
---
---@param pickup Pickup хэндл пикапа
---@return number model модель
function getPickupModel(pickup) end

---
--- Возвращает кватернион вращения объекта<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectQuaternion">Open the wiki</a></b><br/>
---
---@param object Object объект
---@return number x
---@return number y
---@return number z
---@return number w
function getObjectQuaternion(object) end

---
--- Задаёт кватернион вращения объекта<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectQuaternion">Open the wiki</a></b><br/>
---
---@param object Object объект
---@param x number
---@param y number
---@param z number
---@param w number
function setObjectQuaternion(object, x, y, z, w) end

---
--- Возвращает кватернион вращения транспортного средства<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getVehicleQuaternion">Open the wiki</a></b><br/>
---
---@param car Vehicle транспорт
---@return number x
---@return number y
---@return number z
---@return number w
function getVehicleQuaternion(car) end

---
--- Задаёт кватернион вращения транспортного средства<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleQuaternion">Open the wiki</a></b><br/>
---
---@param car Vehicle транспорт
---@param x number
---@param y number
---@param z number
---@param w number
function setVehicleQuaternion(car, x, y, z, w) end

---
--- Возвращает кватернион вращения персонажа<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharQuaternion">Open the wiki</a></b><br/>
---
---@param ped Ped персонаж
---@return number x
---@return number y
---@return number z
---@return number w
function getCharQuaternion(ped) end

---
--- Задаёт кватернион вращения персонажа<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharQuaternion">Open the wiki</a></b><br/>
---
---@param ped Ped персонаж
---@param x number
---@param y number
---@param z number
---@param w number
function setCharQuaternion(ped, x, y, z, w) end

---
--- Загружает аудио из файла или по веб-адресу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadAudioStream">Open the wiki</a></b><br/>
---
---@param audio string путь к файлу или Web-адрес
---@return AudioStream handle аудиопоток
function loadAudioStream(audio) end

---@alias AudioStreamState
---| 0 # Остановлен (закончен)
---| 1 # Играет
---| 2 # Приостановлен
---| 3 # Возобновлён

---
--- Задаёт новый статус аудиопотоку<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAudioStreamState">Open the wiki</a></b><br/>
---
---@param handle AudioStream аудиопоток
---@param state AudioStreamState состояние
function setAudioStreamState(handle, state) end

---
--- Освобождает загруженный аудиопоток.<br/>
--- Использовать не необходимо, т.к. аудиопотоки освобождаются автоматически сборщиком мусора.<br/>
---
--- ### Пример использования<br/>
---
--- ```lua
---   -- не правильно:
---   releaseAudioStream(audiostream)
---   -- правильно:
---   audiostream = nil
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releaseAudioStream">Open the wiki</a></b><br/>
---
---@param handle AudioStream аудиопоток
---@deprecated
function releaseAudioStream(handle) end

---
--- Возвращает длительность аудиопотока в секундах<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAudioStreamLength">Open the wiki</a></b><br/>
---
---@param handle AudioStream аудиопоток
---@return number length длительность
function getAudioStreamLength(handle) end

---
--- Возвращает статус аудиопотока<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAudioStreamState">Open the wiki</a></b><br/>
---
---@param handle AudioStream аудиопоток
---@return AudioStreamState state статус
function getAudioStreamState(handle) end

---
--- Возвращает громкость аудиопотока<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAudioStreamVolume">Open the wiki</a></b><br/>
---
---@param audio AudioStream аудиопоток
---@return number volume громкость (1.0 - 100%, 0.0 - 0%)
function getAudioStreamVolume(audio) end

---
--- Устанавливает громкость аудиопотока<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAudioStreamVolume">Open the wiki</a></b><br/>
---
---@param audio AudioStream аудиопоток
---@param volume number громкость (1.0 - 100%, 0.0 - 0%)
function setAudioStreamVolume(audio, volume) end

---
--- Переключает статус зацикленности аудиопотока<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAudioStreamLooped">Open the wiki</a></b><br/>
---
---@param audio AudioStream аудиопоток
---@param loop boolean зациклить
function setAudioStreamLooped(audio, loop) end

---
--- Загружает аудиопоток с поддержкой объёмного (3D) звука<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/load3dAudioStream">Open the wiki</a></b><br/>
---
---@param audio string путь к файлу или веб-адрес
---@return AudioStream handle загруженный аудиопоток
function load3dAudioStream(audio) end

---
--- Устанавливает 3D-аудиопотоку позицию в мире игры<br/>
---
--- ### Пример использования<br/>
---
--- ```lua
---   local as_action = require('moonloader').audiostream_state
---   local as = load3dAudioStream('moonloader/resource/audio/sound.mp3')
---   local x, y, z = getCharCoordinates(PLAYER_PED)
---   setPlay3dAudioStreamAtCoordinates(as, x, y, z)
---   setAudioStreamState(audio, as_action.PLAY)
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCoordinates">Open the wiki</a></b><br/>
---
---@param handle AudioStream аудиопоток
---@param posX number
---@param posY number
---@param posZ number
function setPlay3dAudioStreamAtCoordinates(handle, posX, posY, posZ) end

---
--- Прикрепляет 3D-звук к объекту<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtObject">Open the wiki</a></b><br/>
---
---@param audio AudioStream аудиопоток
---@param object Object объект
function setPlay3dAudioStreamAtObject(audio, object) end

---
--- Прикрепляет 3D-звук к персонажу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtChar">Open the wiki</a></b><br/>
---
---@param audio AudioStream аудиопоток
---@param ped Ped персонаж
function setPlay3dAudioStreamAtChar(audio, ped) end

---
--- Прикрепляет 3D-звук к транспортному средству<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCar">Open the wiki</a></b><br/>
---
---@param audio AudioStream аудиопоток
---@param car Vehicle транспорт
function setPlay3dAudioStreamAtCar(audio, car) end

---
--- Загружает аудиопоток из файла в памяти процесса<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadAudioStreamFromMemory">Open the wiki</a></b><br/>
---
---@param address number адрес памяти
---@param size number размер файла
---@return AudioStream handle загруженный аудиопоток
function loadAudioStreamFromMemory(address, size) end

---
--- Загружает аудиопоток с объёмным звучанием из файла в памяти процесса<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/load3dAudioStreamFromMemory">Open the wiki</a></b><br/>
---
---@param address number адрес памяти
---@param size number размер
---@return AudioStream handle загруженный аудиопоток
function load3dAudioStreamFromMemory(address, size) end

---
--- Отображает на экране линию от точки `pos1x, pos1y` до точки `pos2x, pos2y`<br/>
---
--- ### Пример использования<br/>
---
--- ```lua
---   while true do
---     renderDrawLine(100, 100, 200, 200, 2.0, 0xFFD00000) -- непрозрачный красный цвет
---     wait(0) -- задержка на один кадр
---   end
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawLine">Open the wiki</a></b><br/>
---
---@param pos1X number координата X первой точки
---@param pos1Y number координата Y первой точки
---@param pos2X number координата X второй точки
---@param pos2Y number координата Y второй точки
---@param width number ширина линии
---@param color number цвет линии в формате ARGB
function renderDrawLine(pos1X, pos1Y, pos2X, pos2Y, width, color) end

---
--- Рисует прямоугольник в указанных координатах с определённым размером<br/>
---
--- ### Пример использования<br/>
---
--- ```lua
---   renderDrawBox(10, 15, 200, 80, 0xAA00CC00)
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawBox">Open the wiki</a></b><br/>
---
---@param posX number координата X
---@param posY number координата Y
---@param sizeX number ширина
---@param sizeY number высота
---@param color number цвет в ARGB
function renderDrawBox(posX, posY, sizeX, sizeY, color) end

---
--- Рисует прямоугольник с границей<br/>
---
--- ### Пример использования<br/>
---
--- ```lua
---   renderDrawBoxWithBorder(10, 15, 200, 80, 0xAA00CC00, 3, 0x90000000)
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawBoxWithBorder">Open the wiki</a></b><br/>
---
---@param posX number координата X
---@param posY number координата Y
---@param sizeX number ширина
---@param sizeY number высота
---@param color number цвет в ARGB
---@param bsize number толщина границы
---@param bcolor number цвет границы в ARGB
function renderDrawBoxWithBorder(posX, posY, sizeX, sizeY, color, bsize, bcolor) end

---
--- Вычисляет ширину заданного текста для загруженного шрифта и возвращает результат в пикселях.<br/>
---
--- ### Пример использования<br/>
---
--- ```lua
---   local friends = {'Kalcor', 'Jacob', 'Sacky'}
---   local x = 10
---   for _, v in ipairs(friends) do
---     renderFontDrawText(my_font, v, x, 300, 0xFFFFCDCD)
---     x = x + 5 + renderGetFontDrawTextLength(my_font, v)
---   end
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetFontDrawTextLength">Open the wiki</a></b><br/>
---
---@param font DxFont шрифт
---@param text string текст
---@param ignoreColorTags boolean? пропуск цветовых тегов (по умолчанию = `false`)
---@return number length ширина в пикселях
function renderGetFontDrawTextLength(font, text, ignoreColorTags) end

---
--- Возвращает высоту загруженного шрифта в пикселях<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetFontDrawHeight">Open the wiki</a></b><br/>
---
---@param font DxFont шрифт
---@return number height высота
function renderGetFontDrawHeight(font) end

---
--- Возвращает индекс символа в тексте по позиции в пикселях<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetFontCharIndexAt">Open the wiki</a></b><br/>
---
---@param font DxFont шрифт
---@param text string текст
---@param x number смещение в пикселях
---@param ignoreColorTags boolean? пропуск цветовых тегов (по умолчанию = `false`)
---@return number index индекс символа
function renderGetFontCharIndexAt(font, text, x, ignoreColorTags) end

---
--- Получает ширину определённого символа и возвращает результат в пикселях<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetFontCharWidth">Open the wiki</a></b><br/>
---
---@param font DxFont шрифт
---@param char string|number символ
---@return number width ширина символа
function renderGetFontCharWidth(font, char) end

---
--- Загружает установленный в системе шрифт по названию. Можно задать стиль шрифта и требуемую кодировку.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderCreateFont">Open the wiki</a></b><br/>
---
---@param font string название
---@param height number высота
---@param flags number флаги
---@param charset number? кодировка
---@return DxFont font шрифт
function renderCreateFont(font, height, flags, charset) end

---
--- Освобождает объект шрифта.<br/>
--- Загруженные шрифты выгружаются автоматически сборщиком мусора, так что использование этой функции необязательно, она существует лишь для обеспечения совместимости со старыми версиями.<br/>
---
--- ### Пример использования<br/>
---
--- ```lua
---   renderReleaseFont(my_font)
---   -- правильнее:
---   my_font = nil
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderReleaseFont">Open the wiki</a></b><br/>
---
---@param font DxFont шрифт
---@deprecated
function renderReleaseFont(font) end

---
--- Отображает текст на экране, используя загруженный шрифт.<br/>
--- Поддерживает цветовые теги в формате `{RRGGBB}` и `{AARRGGBB}`, и символ переноса строки `\n`.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderFontDrawText">Open the wiki</a></b><br/>
---
---@param font DxFont шрифт
---@param text string текст
---@param posX number координата X
---@param posY number координата Y
---@param color number цвет в ARGB
---@param ignoreColorTags boolean? если задано `true`, цветовые теги не станут обрабатываться (по умолчанию = `false`)
function renderFontDrawText(font, text, posX, posY, color, ignoreColorTags) end

---
--- Отображает многоугольник в указанных координатах с заданным вращением и количеством углов<br/>
---
--- ### Пример использования<br/>
---
--- ```lua
---   -- пятиугольник по центру экрана
---   local sx, sy = getScreenResolution()
---   renderDrawPolygon(sx / 2, sy / 2, 150, 150, 5, 0.0, 0xFF1166AA)
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawPolygon">Open the wiki</a></b><br/>
---
---@param posX number координата X центра
---@param posY number координата Y центра
---@param sizeX number ширина
---@param sizeY number высота
---@param corners number количество вершин
---@param rotation number вращение в градусах
---@param color number цвет фигуры в формате ARGB
function renderDrawPolygon(posX, posY, sizeX, sizeY, corners, rotation, color) end

---
--- Загружает текстуру из файла<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderLoadTextureFromFile">Open the wiki</a></b><br/>
---
---@param file string путь к файлу
---@return DxTexture texture текстура
function renderLoadTextureFromFile(file) end

---
--- Освобождает загруженную текстуру.<br/>
--- Применять необязательно, т.к. все загруженные текстуры освобождаются сборщиком мусора.<br/>
--- Функция оставлена для обеспечения совместимости со старыми версиями.<br/>
---
--- ### Пример использования<br/>
---
--- ```lua
---   renderReleaseTexture(texture )
---   -- правильнее:
---   texture  = nil
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderReleaseTexture">Open the wiki</a></b><br/>
---
---@param texture DxTexture текстура
function renderReleaseTexture(texture) end

---
--- Отображает загруженную текстуру по заданным координатам, с указанным размером и вращением<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderDrawTexture">Open the wiki</a></b><br/>
---
---@param texture DxTexture текстура
---@param posX number координата X
---@param posY number координата Y
---@param sizeX number ширина
---@param sizeY number высота
---@param rotation number вращение
---@param color number цвет в ARGB
function renderDrawTexture(texture, posX, posY, sizeX, sizeY, rotation, color) end

---@alias RenderType
---| 1 # список точек
---| 2 # набор линий
---| 3 # ломаная линия
---| 4 # набор треугольников
---| 5 # серия связанных треугольников (многоугольник)
---| 6 # серия связанных треугольников с единым центром

---
--- Начало рисования фигуры определённым методом.<br/>
--- Подробнее о каждом методе построения примитивов: <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/bb147291(v=vs.85).aspx">MSDN</a><br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderBegin">Open the wiki</a></b><br/>
---
---@param type RenderType метод
function renderBegin(type) end

---
--- Завершение рисования фигуры.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderEnd">Open the wiki</a></b><br/>
---
function renderEnd() end

---
--- Задаёт цвет фигуры. Должна быть вызвана перед добавлением вершины<br/>
---
--- ### Пример использования<br/>
---
--- ```lua
---   renderColor(0xFFFF0000)
---   renderVertex(10, 100)
---   renderColor(0xFF0000FF)
---   renderVertex(200, 100)
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderColor">Open the wiki</a></b><br/>
---
---@param color number цвет в ARGB
function renderColor(color) end

---
--- Добавляет вершину в фигуру по абсолютным координатам<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderVertex">Open the wiki</a></b><br/>
---
---@param vX number координата X
---@param vY number координата Y
function renderVertex(vX, vY) end

---
--- Указывает, какая точка текстуры будет прикреплена к следующей вершине.<br/>
--- Координаты точки задаются в диапазоне от `0.0` до `1.0`, относительно размеров всей текстуры.<br/>
--- Должна быть вызвана перед каждым добавлением вершины, к которой нужно прикрепить текстуру.<br/>
--- Без вызова `renderBindTexture` не будет иметь эффекта<br/>
---
--- ### Пример использования<br/>
---
--- ```lua
---   renderColor(0xFFFFFFFF)
---   renderBindTexture(tex)
---   renderSetTexCoord(0.0, 0.0)
---   renderVertex(100, 100)
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderSetTexCoord">Open the wiki</a></b><br/>
---
---@param posX number относительные координата X текстуры
---@param posY number относительные координата Y текстуры
function renderSetTexCoord(posX, posY) end

---
--- Задаёт фигуре текстуру. Каждой фигуре может быть задана только одна текстура.<br/>
--- Значение `nil` сбросит заданную текстуру.<br/>
--- Эта функция должна быть использована совместно с `renderSetTexCoord`<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderBindTexture">Open the wiki</a></b><br/>
---
---@param texture DxTexture текстура
function renderBindTexture(texture) end

---
--- Возвращает указатель на объект `IDirect3DTexture9`, принадлежащий текстуре<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetTextureStruct">Open the wiki</a></b><br/>
---
---@param texture DxTexture текстура
---@return number struct указатель
function renderGetTextureStruct(texture) end

---
--- Возвращает указатель на объект ID3DXSprite, принадлежащий текстуре<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetTextureSprite">Open the wiki</a></b><br/>
---
---@param texture DxTexture текстура
---@return number sprite указатель
function renderGetTextureSprite(texture) end

---
--- Возвращает размеры изображения<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderGetTextureSize">Open the wiki</a></b><br/>
---
---@param texture DxTexture текстура
---@return number sizeX ширина
---@return number sizeY высота
function renderGetTextureSize(texture) end

---
--- Устанавливает значение рендерстейта.<br/>
--- Подробнее о рендерстейтах: <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/bb172599(v=vs.85).aspx">MSDN</a><br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderSetRenderState">Open the wiki</a></b><br/>
---
---@param state number тип
---@param value number новое значение
function renderSetRenderState(state, value) end

---
--- Загружает текстуру из файла в памяти процесса<br/>
---
--- ### Пример использования<br/>
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
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/renderLoadTextureFromFileInMemory">Open the wiki</a></b><br/>
---
---@param pointer number адрес памяти
---@param size number размер файла
---@return DxTexture texture текстура
function renderLoadTextureFromFileInMemory(pointer, size) end

---
--- Задаёт числовую версию скрипта. Предназначена преимущественно для системы проверки обновлений.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_version_number">Open the wiki</a></b><br/>
---
---@param version number версия
function script_version_number(version) end

---
--- Задаёт текстовую версию скрипта.<br/>
---
--- ### Пример использования<br/>
---
--- ```lua
---   script_version("0.2.3-beta")
--- <br/>
---   function main()
---     -- ...
---   end
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_version">Open the wiki</a></b><br/>
---
---@param version string версия
function script_version(version) end

---
--- Задаёт название скрипта.<br/>
--- Если название не задать, то в качестве названия будет выступать имя файла скрипта.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_name">Open the wiki</a></b><br/>
---
---@param name string название
function script_name(name) end

---
--- Задаёт описание скрипта.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_description">Open the wiki</a></b><br/>
---
---@param description string текст описания
function script_description(description) end

---
--- Задаёт нескольких авторов скрипта.<br/>
--- Имеет аналог с более подходящим названием для указания одного автора - `script_author`.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_authors">Open the wiki</a></b><br/>
---
---@param author string первый автор скрипта
---@param ... string авторы скрипта
function script_authors(author, ...) end

---
--- Задаёт автора или нескольких авторов скрипта.<br/>
--- Имеет аналог с более подходящим названием для указания нескольких авторов - <a class="is-internal-link is-valid-page" href="/moonloader/lua/script_authors">script_authors</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_author">Open the wiki</a></b><br/>
---
---@param author string автор скрипта
function script_author(author) end

---
--- Задаёт зависимости скрипта.<br/>
--- На текущий момент предназначен только для вывода.<br/>
--- В будущем получит дополнительную функциональность.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_dependencies">Open the wiki</a></b><br/>
---
---@param name string первая зависимость
---@param ... string зависимости
function script_dependencies(name, ...) end

---
--- Задаёт минимальную требуемую версию MoonLoader.<br/>
--- Если версия не соответствует, выводит сообщение об ошибке, но не прекращает работу скрипта.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_moonloader">Open the wiki</a></b><br/>
---
---@param version number версия
function script_moonloader(version) end

---
--- Приостанавливает выполнение сопрограммы `main` на заданное время в миллисекундах.<br/>
--- Может быть вызвана только изнутри `main` и скриптовых потоков.<br/>
--- Если функция вызвана изнутри `main` и значение `time` равно `-1`, то скрипт будет приостановлен на бесконечный период времени, это может быть использовано для прекращения активного исполнения скрипта, но чтобы он продолжал работать и обрабатывать события.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/wait">Open the wiki</a></b><br/>
---
---@param time number время в миллисекундах
function wait(time) end

---
--- Возвращает значение глобальной переменной игры по её индексу.<br/>
--- Для получения дробного значения дополнительно используется функция <a class="is-internal-link is-valid-page" href="/moonloader/lua/representIntAsFloat">representIntAsFloat</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameGlobal">Open the wiki</a></b><br/>
---
---@param index number номер переменной
---@return number value значение
function getGameGlobal(index) end

---
--- Задаёт значение глобальной переменной игры по её индексу.<br/>
--- Для записи дробного значения дополнительно используется функция <a class="is-internal-link is-valid-page" href="/moonloader/lua/representFloatAsInt">representFloatAsInt</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGameGlobal">Open the wiki</a></b><br/>
---
---@param index number номер переменной
---@param value number значение
function setGameGlobal(index, value) end

---
--- Возвращает адрес глобальной переменной игры по индексу.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameGlobalPtr">Open the wiki</a></b><br/>
---
---@param index number номер переменной
---@return number ptr адрес
function getGameGlobalPtr(index) end

---
--- Проверяет плагин <a class="is-internal-link is-valid-page" href="/sampfuncs">SAMPFUNCS</a> на подключенность к игре.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampfuncsLoaded">Open the wiki</a></b><br/>
---
---@return boolean loaded статус
function isSampfuncsLoaded() end

---
--- Проверяет плагин CLEO на подключенность к игре.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCleoLoaded">Open the wiki</a></b><br/>
---
---@return boolean loaded статус
function isCleoLoaded() end

---
--- Проверяет, запущен ли SA:MP.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampLoaded">Open the wiki</a></b><br/>
---
---@return boolean loaded результат
function isSampLoaded() end

---
--- Проверяет, зажата ли клавиша.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isKeyDown">Open the wiki</a></b><br/>
---
---@param keyId number виртуальный ид клавиши
---@return boolean state статус
function isKeyDown(keyId) end

---
--- Выгружает все загруженные скрипты и загружает заново из рабочей директории, учитывая добавленные и убранные.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/reloadScripts">Open the wiki</a></b><br/>
---
function reloadScripts() end

---
--- Проверяет, доступны ли функции опкодов для использования.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isOpcodesAvailable">Open the wiki</a></b><br/>
---
---@return boolean status статус
function isOpcodesAvailable() end

---
--- Представляет значение числа с плавающей точкой как целое.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/representFloatAsInt">Open the wiki</a></b><br/>
---
---@param f number число с плавающей точкой
---@return number i число с плавающей точкой в представлении целого
function representFloatAsInt(f) end

---
--- Представляет значение целого в виде числа с плавающей точкой.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/representIntAsFloat">Open the wiki</a></b><br/>
---
---@param i number целое значение
---@return number i число с плавающей точкой
function representIntAsFloat(i) end

---
--- Создаёт или перезаписывает существующую GXT-запись.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGxtEntry">Open the wiki</a></b><br/>
---
---@param key string ключ GXT-записи
---@param text string текст
function setGxtEntry(key, text) end

---
--- Создаёт [новую]{.ul} GXT-запись с уникальным ключём и возвращает его.<br/>
--- Для изменения используйте функцию <a class="is-internal-link is-valid-page" href="/moonloader/lua/setGxtEntry">setGxtEntry</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFreeGxtEntry">Open the wiki</a></b><br/>
---
---@param text string текст
---@return string key ключ созданной записи
function setFreeGxtEntry(text) end

---
--- Генерирует и возвращает [новый]{.ul} уникальный ключ для создания GXT-записи.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getFreeGxtKey">Open the wiki</a></b><br/>
---
---@return string key сгенерированный GXT ключ
function getFreeGxtKey() end

---
--- Возвращает текст GXT-записи по ключу, поиск производится включая записи игры.<br/>
--- Возвращает пустую строку, если запись не существует.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGxtText">Open the wiki</a></b><br/>
---
---@param key string ключ GXT-записи
---@return string text текст
function getGxtText(key) end

---
--- Удаляет GXT-запись по ключу, не затрагивает игровые записи.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearGxtEntry">Open the wiki</a></b><br/>
---
---@param key string ключ GXT-записи
function clearGxtEntry(key) end

---
--- Проверяет, открыто ли игровое меню паузы.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPauseMenuActive">Open the wiki</a></b><br/>
---
---@return boolean active статус
function isPauseMenuActive() end

---
--- Проверяет, находится ли окно игры на переднем плане.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGameWindowForeground">Open the wiki</a></b><br/>
---
---@return boolean foreground результат
function isGameWindowForeground() end

---
--- Возвращает информацию о версии игры<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameVersion">Open the wiki</a></b><br/>
---
---@return number major версия
---@return number minor версия
---@return number majorRev версия
---@return number minorRev версия
---@return number game часть серии
---@return number region регион
---@return boolean steam Steam-версия
---@return boolean cracked взломана
function getGameVersion() end

---
--- Возвращает номер версии MoonLoader.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMoonloaderVersion">Open the wiki</a></b><br/>
---
---@return number version версия
function getMoonloaderVersion() end

---
--- Возвращает значение внутреннего таймера в виде дробного в формате 'секунды.миллисекунды'.<br/>
--- В отличие от системного таймера os.clock(), этот таймер работает только если игра активна (не свёрнута и находится на переднем плане).<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/localClock">Open the wiki</a></b><br/>
---
---@return number time время
function localClock() end

---
--- Освобождает все загруженные функцией <a class="is-internal-link is-invalid-page" href="/moonloader/lua/loadSprite">loadSprite</a> текстуры, принадлежащие вызвавшему скрипту.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freeTextures">Open the wiki</a></b><br/>
---
function freeTextures() end

---
--- Возвращает полный путь к рабочей директории MoonLoader.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getWorkingDirectory">Open the wiki</a></b><br/>
---
---@return string path путь
function getWorkingDirectory() end

---
--- Возвращает полный путь к директории игры.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameDirectory">Open the wiki</a></b><br/>
---
---@return string path путь
function getGameDirectory() end

---
--- Активирует или отключает рендер текста и текстур опкодами игры.<br/>
--- Аналог опкода <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/03F0">03F0</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/useRenderCommands">Open the wiki</a></b><br/>
---
---@param enable boolean статус
function useRenderCommands(enable) end

---
--- Записывает значение в память процесса по указанному адресу.<br/>
--- Аналог опкода CLEO <a class="is-internal-link is-valid-page" href="/gta-sa/opcodes/0A8C">0A8C</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/writeMemory">Open the wiki</a></b><br/>
---
---@param address number адрес памяти
---@param size number размер (от 1 до 4)
---@param value number размер (от 1 до 4)
---@param virtualProtect boolean флаг снятия протекции
function writeMemory(address, size, value, virtualProtect) end

---
--- Читает значение из памяти процесса по указанному адресу.<br/>
--- Аналог опкода CLEO <a class="is-internal-link is-valid-page" href="/gta-sa/opcodes/0A8D">0A8D</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/readMemory">Open the wiki</a></b><br/>
---
---@param address number адрес памяти
---@param size number размер (от 1 до 4)
---@param virtualProtect boolean флаг снятия протекции
---@return number value значение
function readMemory(address, size, virtualProtect) end

---
--- Загружает динамическую библиотеку по названию и возвращает её хендл (адрес).<br/>
--- Аналог опкода CLEO <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/0AA2">0AA2</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadDynamicLibrary">Open the wiki</a></b><br/>
---
---@param library string название библиотеки
---@return boolean result результат выполнения
---@return number handle хендл библиотеки
function loadDynamicLibrary(library) end

---
--- Выгружает динамическую библиотеку по её хендлу.<br/>
--- Аналог опкода CLEO <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/0AA3">0AA3</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freeDynamicLibrary">Open the wiki</a></b><br/>
---
---@param handle number хендл библиотеки
function freeDynamicLibrary(handle) end

---
--- Получает адрес экспортируемой функции по названию и хендлу библиотеки.<br/>
--- Аналог опкода CLEO <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/0AA4">0AA4</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDynamicLibraryProcedure">Open the wiki</a></b><br/>
---
---@param proc string имя функции
---@param handle number хендл библиотеки
---@return boolean result результат выполнения
---@return number proc адрес функции
function getDynamicLibraryProcedure(proc, handle) end

---
--- Проверяет файл на существование.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesFileExist">Open the wiki</a></b><br/>
---
---@param file string путь
---@return boolean result результат выполнения
function doesFileExist(file) end

---
--- Проверяет директорию на существование.<br/>
--- Аналог опкода CLEO <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/0AE4">0AE4</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesDirectoryExist">Open the wiki</a></b><br/>
---
---@param directory string путь
---@return boolean result результат выполнения
function doesDirectoryExist(directory) end

---
--- Создаёт иерархию директорий для указанного пути.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createDirectory">Open the wiki</a></b><br/>
---
---@param directory string путь
---@return boolean result результат выполнения
function createDirectory(directory) end

---
--- Извлекает верхнее значение из стека FPU и возвращает его.<br/>
--- Аналог опкода CLEO <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/0AE9">0AE9</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/popFloat">Open the wiki</a></b><br/>
---
---@return number val значение
function popFloat() end

---
--- Проверяет версию игры, если версия игры 1.0 US, то вернет true.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGameVersionOriginal">Open the wiki</a></b><br/>
---
---@return boolean result результат проверки
function isGameVersionOriginal() end

---
--- Выделяет память и возвращает указатель на выделенную область.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/allocateMemory">Open the wiki</a></b><br/>
---
---@param size number количество выделяемой памяти в байтах
---@return number memory указатель на выделенную память
function allocateMemory(size) end

---
--- Освобождает выделенную память.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freeMemory">Open the wiki</a></b><br/>
---
---@param memory number указатель на выделенный участок памяти
function freeMemory(memory) end

---
--- Начинает поиск файла по указанной маске.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findFirstFile">Open the wiki</a></b><br/>
---
---@param mask string путь и маска названия файла (например, "moonloader/*.lua")
---@return Filesearch handle хэндл сессии поиска
---@return string name имя файла
function findFirstFile(mask) end

---
--- Продолжает поиск файла по открытой сессии поиска файлов.<br/>
--- Сессия поиска создаётся функцией <a class="is-internal-link is-valid-page" href="/moonloader/lua/findFirstFile">findFirstFile</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findNextFile">Open the wiki</a></b><br/>
---
---@param handle Filesearch сессия поиска
---@return string file имя файла
function findNextFile(handle) end

---
--- Закрывает сессию поиска файлов.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findClose">Open the wiki</a></b><br/>
---
---@param handle Filesearch хэндл сессии поиска
function findClose(handle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findAllRandomCharsInSphere">Open the wiki</a></b>
---
---@param posX number
---@param posY number
---@param posZ number
---@param radius number
---@param findNext boolean
---@param skipDead boolean
---@return boolean result
---@return Ped ped
function findAllRandomCharsInSphere(posX, posY, posZ, radius, findNext, skipDead) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findAllRandomVehiclesInSphere">Open the wiki</a></b>
---
---@param posX number
---@param posY number
---@param posZ number
---@param radius number
---@param findNext boolean
---@param skipWrecked boolean
---@return boolean result
---@return Vehicle car
function findAllRandomVehiclesInSphere(posX, posY, posZ, radius, findNext, skipWrecked) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findAllRandomObjectsInSphere">Open the wiki</a></b>
---
---@param posX number
---@param posY number
---@param posZ number
---@param radius number
---@param findNext boolean
---@return boolean result
---@return Object object
function findAllRandomObjectsInSphere(posX, posY, posZ, radius, findNext) end

---
--- Возвращает указатель на объект класса CPed по хэндлу персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharPointer">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@return number ptr указатель
function getCharPointer(ped) end

---
--- Возвращает указатель на объект класса CVehicle по хэндлу транспортного средства.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarPointer">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл транспорта
---@return number ptr указатель
function getCarPointer(car) end

---
--- Возвращает указатель на экземпляр класса CObject по хэндлу объекта.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectPointer">Open the wiki</a></b><br/>
---
---@param object Object хэндл объекта
---@return number struct указатель
function getObjectPointer(object) end

---
--- Производит вызов функцию по адресу. Все аргументы функции передаются после параметра `pop`.<br/>
--- Значения, занесённые в таблицу, будут переданы по указателю.<br/>
--- Использование в критичных для производительности местах не рекомендуется, в таких случаях вместо этой функции лучше использовать FFI.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/callFunction">Open the wiki</a></b><br/>
---
---@param address number адрес функции
---@param params number количество параметров
---@param pop number выравнивание стека (количество аргументов либо 0, в зависимости от вида функции)
---@param ... any аргументы
---@return number returnValue возвращаемое значение функции
function callFunction(address, params, pop, ...) end

---
--- Производит вызов метода класса по адресу. Все аргументы функции передаются после параметра `pop`.<br/>
--- Значения, занесённые в таблицу, будут переданы по указателю.<br/>
--- Использование в критичных для производительности местах не рекомендуется, в таких случаях вместо этой функции лучше использовать FFI.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/callMethod">Open the wiki</a></b>
---
---@param address number адрес функции
---@param struct number указатель на объект
---@param params number количество параметров
---@param pop number выравнивание стека (количество аргументов либо 0, в зависимости от вида функции)
---@param ... any аргументы
---@return number returnValue возвращаемое значение функции
function callMethod(address, struct, params, pop, ...) end

---
--- Возвращает хэндлы ближайшего транспорта и персонажа к другому персонажу.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/storeClosestEntities">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@return Vehicle car хэндл ближайшего ТС
---@return Ped ped хэндл ближайшего персонажа
function storeClosestEntities(ped) end

---
--- Задаёт статус двигателя автомобиля.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchCarEngine">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@param state boolean статус двигателя
function switchCarEngine(car, state) end

---
--- Проверяет существует ли пользовательская метка на карте и возвращает ее координаты.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTargetBlipCoordinates">Open the wiki</a></b><br/>
---
---@return boolean result результат проверки
---@return number posX координаты метки
---@return number posY координаты метки
---@return number posZ координаты метки
function getTargetBlipCoordinates() end

---
--- Возвращает количество передач автомобиля.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarNumberOfGears">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл автомобиля
---@return number gears количество передач
function getCarNumberOfGears(car) end

---
--- Возвращает текущую передачу автомобиля.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarCurrentGear">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл автомобиля
---@return number gear передача
function getCarCurrentGear(car) end

---
--- Проверяет включена ли сирена.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarSirenOn">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@return boolean state статус сирены
function isCarSirenOn(car) end

---
--- Проверяет заведен ли двигатель машины.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarEngineOn">Open the wiki</a></b><br/>
---
---@param car Vehicle хендл машины
---@return boolean state статус двигателя
function isCarEngineOn(car) end

---
--- Выводит в левом верхнем углу панель с текстом на короткое время (как при активации чит-кодов).<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printHelpString">Open the wiki</a></b><br/>
---
---@param text string текст (на русском может не выводиться)
function printHelpString(text) end

---
--- Выводит стилизованный текст на определённое время.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printStyledString">Open the wiki</a></b><br/>
---
---@param text string текст
---@param time number время в миллисекундах
---@param style number стиль (1-7)
function printStyledString(text, time, style) end

---
--- Выводит текст в нижней части экрана, добавляя его в очередь, если на момент вызова выводится другой текст.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printString">Open the wiki</a></b><br/>
---
---@param text string текст
---@param time number время отображения текста в миллисекундах
function printString(text, time) end

---
--- Выводит текст в нижней части экрана, минуя очередь.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printStringNow">Open the wiki</a></b><br/>
---
---@param text string текст
---@param time number время показа текста
function printStringNow(text, time) end

---
--- Проверяет, целится ли игрок в другого персонажа, и возвращает его хэндл.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharPlayerIsTargeting">Open the wiki</a></b><br/>
---
---@param player Player хэндл игрока
---@return boolean result результат проверки
---@return Ped ped хэндл персонажа
function getCharPlayerIsTargeting(player) end

---
--- Возвращает сокращенное название модели машины.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNameOfVehicleModel">Open the wiki</a></b><br/>
---
---@param modelId Model модель машины
---@return GxtString name название модели (до 7 символов)
function getNameOfVehicleModel(modelId) end

---
--- Проверяет был ли введён указанный текст на клавиатуре.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/testCheat">Open the wiki</a></b><br/>
---
---@param text string текст
---@return boolean result статус
function testCheat(text) end

---
--- Создаёт транспорт перед игроком.<br/>
--- Нет необходимости загружать модель самостоятельно.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/spawnVehicleByCheating">Open the wiki</a></b><br/>
---
---@param modelId Model модель транспортного средства
---@return boolean result результат выполнения
function spawnVehicleByCheating(modelId) end

---
--- Возвращает хэндл персонажа по указателю на экземляр класса CPed.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharPointerHandle">Open the wiki</a></b><br/>
---
---@param ptr number указатель
---@return Ped handle хэндл персонажа
function getCharPointerHandle(ptr) end

---
--- Возвращает хэндл транспортного средства по указателю на экземляр класса CVehicle.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getVehiclePointerHandle">Open the wiki</a></b><br/>
---
---@param ptr number указатель
---@return Vehicle handle хэндл транспорта
function getVehiclePointerHandle(ptr) end

---
--- Возвращает хэндл объект по указателю на экземляр класса CObject.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectPointerHandle">Open the wiki</a></b><br/>
---
---@param ptr number указатель
---@return Object handle хэндл объекта
function getObjectPointerHandle(ptr) end

---@class CollisionPointData
---@field pos number[] позиция точки соприкосновения XYZ
---@field normal number[] вектор нормали к поверхности соприкосновения
---@field surfaceType number[] типы поверхности
---@field pieceType number[] типы детали
---@field depth number какая-то глубина чего-то
---@field entity number указатель на объект сущности, с которой произошло столкновение
---@field entityType number тип сущности

---
--- Ищет точку соприкосновения в трёхмерном пространстве между двумя координатами, по направлению прямой из позиции `origin` к `target`.<br/>
--- Имеет флаги, определяющие, какие типы объектов нужно проверять на столкновение.<br/>
--- Возвращает таблицу с информацией о точке соприкосновения.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/processLineOfSight">Open the wiki</a></b><br/>
---
---@param originX number начальная позиция X
---@param originY number начальная позиция Y
---@param originZ number начальная позиция Z
---@param targetX number конечная позиция X
---@param targetY number конечная позиция Y
---@param targetZ number конечная позиция Z
---@param checkSolid boolean? статичные объекты (напр. любые постройки). По стандарту = `true`
---@param car boolean? транспорт. По стандарту = `false`
---@param ped boolean? персонажи. По стандарту = `false`
---@param object boolean? динамические объекты. По стандарту = `false`
---@param particle boolean? визуальные эффекты. По стандарту = `false`
---@param seeThrough boolean? учитывать прозрачные объекты. По стандарту = `false`
---@param ignoreSomeObjects boolean? игнорировать некоторые динамические объекты. По стандарту = `false`
---@param shootThrough boolean? учитывать объекты, простреливаемые насквозь. По стандарту = `false`
---@return boolean result результат выполнения
---@return CollisionPointData colPoint информация о точке соприкосновения
function processLineOfSight(
	originX,
	originY,
	originZ,
	targetX,
	targetY,
	targetZ,
	checkSolid,
	car,
	ped,
	object,
	particle,
	seeThrough,
	ignoreSomeObjects,
	shootThrough
)
end

---
--- Записывает текст в буфер обмена Windows.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setClipboardText">Open the wiki</a></b><br/>
---
---@param text string текст
---@return boolean result результат выполнения
function setClipboardText(text) end

---
--- Читает текст из буфера обмена Windows.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClipboardText">Open the wiki</a></b><br/>
---
---@return string text текст
function getClipboardText() end

---
--- Читает значение целого из памяти по адресу и указанному оффсету размером от 1-го до 4-х байт.<br/>
--- Для чтения числа с плавающей точкой используйте `getStructFloatElement` либо `representIntAsFloat`.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getStructElement">Open the wiki</a></b><br/>
---
---@param struct number указатель на начало структуры
---@param offset number оффсет
---@param size number размер
---@param unprotect boolean? снять защиту памяти. По стандарту = `false`
---@return number value значение
function getStructElement(struct, offset, size, unprotect) end

---
--- Записывает значение целого в память по адресу и указанному оффсету размером от 1-го до 4-х байт.<br/>
--- Для записи числа с плавающей точкой используйте `setStructFloatElement` либо `representFloatAsInt`.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setStructElement">Open the wiki</a></b><br/>
---
---@param struct number указатель на структуру
---@param offset number оффсет
---@param size number размер
---@param value number значение
---@param unprotect boolean? снять защиту памяти. По стандарту = `false`
function setStructElement(struct, offset, size, value, unprotect) end

---
--- Создаёт кватернион из матрицы вращения.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertMatrixToQuaternion">Open the wiki</a></b><br/>
---
---@param rightX number pitch
---@param rightY number pitch
---@param rightZ number pitch
---@param frontX number roll
---@param frontY number roll
---@param frontZ number roll
---@param upX number yaw
---@param upY number yaw
---@param upZ number yaw
---@return number w кватернион
---@return number x кватернион
---@return number y кватернион
---@return number z кватернион
function convertMatrixToQuaternion(rightX, rightY, rightZ, frontX, frontY, frontZ, upX, upY, upZ) end

---
--- Создаёт матрицу вращения из кватерниона.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertQuaternionToMatrix">Open the wiki</a></b><br/>
---
---@param w number кватернион
---@param x number кватернион
---@param y number кватернион
---@param z number кватернион
---@return number rightX pitch
---@return number rightY pitch
---@return number rightZ pitch
---@return number frontX roll
---@return number frontY roll
---@return number frontZ roll
---@return number upX yaw
---@return number upY yaw
---@return number upZ yaw
function convertQuaternionToMatrix(w, x, y, z) end

---
--- Конвертирует игровые 3D координаты в экранные.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreen">Open the wiki</a></b><br/>
---
---@param posX number игровые 3D координаты
---@param posY number игровые 3D координаты
---@param posZ number игровые 3D координаты
---@return number wposX экранные координаты
---@return number wposY экранные координаты
function convert3DCoordsToScreen(posX, posY, posZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGameKeyState">Open the wiki</a></b>
---
---@param key number
---@param state number
function setGameKeyState(key, state) end

---
--- Возвращает позицию курсора.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCursorPos">Open the wiki</a></b><br/>
---
---@return number posX координаты
---@return number posY координаты
function getCursorPos() end

---
--- Конвертирует пиксельные координаты в игровые экранные координаты.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertWindowScreenCoordsToGameScreenCoords">Open the wiki</a></b><br/>
---
---@param wposX number пиксельные координаты
---@param wposY number пиксельные координаты
---@return number gposX игровые координаты
---@return number gposY игровые координаты
function convertWindowScreenCoordsToGameScreenCoords(wposX, wposY) end

---
--- Конвертирует игровые экранные координаты в пиксельные.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertGameScreenCoordsToWindowScreenCoords">Open the wiki</a></b><br/>
---
---@param gposX number игровые координаты
---@param gposY number игровые координаты
---@return number wposX пиксельные координаты
---@return number wposY пиксельные координаты
function convertGameScreenCoordsToWindowScreenCoords(gposX, gposY) end

---
--- Создаёт точку в 3D-пространстве игры из экранных координат и указанной глубины.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertScreenCoordsToWorld3D">Open the wiki</a></b><br/>
---
---@param posX number экранные координаты
---@param posY number экранные координаты
---@param depth number глубина
---@return number posX координаты точки в мире
---@return number posY координаты точки в мире
---@return number posZ координаты точки в мире
function convertScreenCoordsToWorld3D(posX, posY, depth) end

---
--- Возвращает адрес DLL-модуля по названию.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getModuleHandle">Open the wiki</a></b><br/>
---
---@param module string название
---@return number handle адрес
function getModuleHandle(module) end

---
--- Получает адрес экспортируемой процедуры по названию модуля и процедуры.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getModuleProcAddress">Open the wiki</a></b><br/>
---
---@param module string название модуля
---@param proc string название процедуры
---@return number address адрес
function getModuleProcAddress(module, proc) end

---
--- Эмулирует нажатие виртуальной клавиши.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVirtualKeyDown">Open the wiki</a></b><br/>
---
---@param vkey number ID клавиши
---@param down boolean статус нажатия: true - нажата, false - отпущена
function setVirtualKeyDown(vkey, down) end

---
--- Эмулирует нажатие символьной клавиши.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharKeyDown">Open the wiki</a></b><br/>
---
---@param ckey number ID символа
---@param down boolean статус нажатия: true - нажата, false - отпущена
function setCharKeyDown(ckey, down) end

---@alias DownloadingCallback fun(id: number, status: number, p1: any, p2: any): boolean

---
--- Загружает файл из интернета по URL по протоколу HTTP.<br/>
--- Процесс загрузки полностью контролируем с помощью обработчика загрузки и может быть отменён.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/downloadUrlToFile">Open the wiki</a></b><br/>
---
---@param url string uRL ресурса
---@param file string путь к файлу
---@param statusCallback DownloadingCallback? функция-обработчик статуса загрузки, является необязательным параметром
---@return number index идентификатор загрузки
function downloadUrlToFile(url, file, statusCallback) end

---
--- Проверяет была ли клавиша нажата.<br/>
--- Псевдоним функции <a class="is-internal-link is-valid-page" href="/moonloader/lua/wasKeyPressed">wasKeyPressed</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isKeyJustPressed">Open the wiki</a></b><br/>
---
---@param key number ID клавиши
---@return boolean state результат проверки
function isKeyJustPressed(key) end

---
--- Конвертирует мировые 3D-координаты в экранные. Расширенный вариант функции `convert3DCoordsToScreen`,
--- имеет дополнительные аргументы и возвращаемые значения.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreenEx">Open the wiki</a></b><br/>
---
---@param posX number мировые координата X
---@param posY number мировые координата Y
---@param posZ number мировые координата Z
---@param checkMin boolean? проверять минимальное расстояние до камеры. По стандарту = `false`
---@param checkMax boolean? проверять максимальное расстояние до камеры. По стандарту = `false`
---@return boolean result результат преобразования
---@return number x экранная координата X в пикселях
---@return number y экранная координата Y в пикселях
---@return number z неизвестно
---@return number w неизвестно
---@return number h неизвестно
function convert3DCoordsToScreenEx(posX, posY, posZ, checkMin, checkMax) end

---
--- Читает число с плавающей точкой из памяти по адресу и указанному оффсету размером в 4 байта.<br/>
--- Для чтения целого используйте функцию `getStructElement`.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getStructFloatElement">Open the wiki</a></b><br/>
---
---@param struct number адрес начала структуры
---@param offset number оффсет
---@param unprotect boolean? снять защиту памяти. По стандарту = `false`
---@return number value прочитанное значение
function getStructFloatElement(struct, offset, unprotect) end

---
--- Записывает число с плавающей точкой в память по адресу и указанному оффсету.<br/>
--- Для записи целого используйте функцию `setStructElement`.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setStructFloatElement">Open the wiki</a></b><br/>
---
---@param struct number адрес начала структуры
---@param offset number оффсет
---@param value number значение
---@param unprotect boolean? снять защиту памяти. По стандарту = `false`
function setStructFloatElement(struct, offset, value, unprotect) end

---
--- Проверяет была ли клавиша нажата.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/wasKeyPressed">Open the wiki</a></b><br/>
---
---@param key number ID клавиши
---@return boolean state результат проверки
function wasKeyPressed(key) end

---
--- Проверяет была ли клавиша отпущена после нажатия.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/wasKeyReleased">Open the wiki</a></b><br/>
---
---@param key number ID клавиши
---@return boolean state результат проверки
function wasKeyReleased(key) end

---
--- Получает значение, на сколько делений было прокручено колесо мыши.<br/>
--- Значение может быть отрицательным и положительным,<br/>
--- а также нулём, если колесо прокручено не было.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMousewheelDelta">Open the wiki</a></b><br/>
---
---@return number delta значение прокрутки
function getMousewheelDelta() end

---
--- Помечает текущее обрабатываемое оконное сообщение для игнорирования.<br/>
--- Игнорирование сообщения может быть отменено вызовом функции с параметрами `false`.<br/>
--- Предназначена для использования только изнутри события `onWindowMessage`.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/consumeWindowMessage">Open the wiki</a></b><br/>
---
---@param game boolean? игнорировать сообщение для игры (оно не будет передано игре, но будет передано Lua скриптам). По стандарту = `true`
---@param scripts boolean? игнорировать сообщение для Lua скриптов. По стандарту = `true`
function consumeWindowMessage(game, scripts) end

---
--- Добавляет обработчик <a href="https://wiki.blast.hk/moonloader/events">события</a> по названию.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addEventHandler">Open the wiki</a></b><br/>
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
---@overload fun(eventName: '"onSystemMessage"', callback: fun(msg: string, type: number, script: LuaScript))
---@overload fun(eventName: '"onReceivePacket"', callback: fun(id: number, bitStream: Bitstream): boolean?, number?, Bitstream?)
---@overload fun(eventName: '"onReceiveRpc"', callback: fun(id: number, bitStream: Bitstream): boolean?, number?, Bitstream?)
---@overload fun(eventName: '"onSendPacket"', callback: fun(id: number, bitStream: Bitstream, priority: number, relability: number, orderingChannel: number): boolean?, number?, Bitstream?, number?, number?, number?)
---@overload fun(eventName: '"onSendRpc"', callback: fun(id: number, bitStream: Bitstream, priority: number, relability: number, orderingChannel: number, shiftTs: boolean): boolean?, number?, Bitstream?, number?, number?, number?, boolean?)
---@overload fun(eventName: '"onWindowMessage"', callback: fun(msg: number, wparam: number, lparam: number))
---@overload fun(eventName: '"onStartNewGame"', callback: fun(mpack: number))
---@overload fun(eventName: '"onLoadGame"', callback: fun(saveData: table))
---@overload fun(eventName: '"onSaveGame"', callback: fun(saveData: table): table?)
function addEventHandler(eventName, callback) end

---
--- Проверяет, находится ли игра на паузе.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGamePaused">Open the wiki</a></b><br/>
---
---@return boolean paused статус
function isGamePaused() end

---
--- Возвращает значение игрового таймера в виде дробного в формате 'секунды.миллисекунды'.<br/>
--- В отличие от системного таймера os.clock() и функции <a class="is-internal-link is-valid-page" href="/moonloader/lua/localClock">localClock</a>, этот таймер работает только если игра не находится на паузе.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/gameClock">Open the wiki</a></b><br/>
---
---@return number time время
function gameClock() end

---@alias ScriptProperty
---| '"work-in-pause"' # Указывает, что скрипт будет продолжать исполнение во время паузы игры (с условием, что игра развёрнута и находится на переднем плане).
---| '"forced-reloading-only"' # апрещает автоматическую перезагрузку скрипта, оставляя возможность только принудительной перезагрузки.

---
--- Функция задаёт различные настройки поведения скрипта.<br/>
--- Каждое свойство задаётся исходя из его названия, переданного в виде строки в качестве аргумента функции.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_properties">Open the wiki</a></b><br/>
---
---@param property string первое свойство
---@param ... ScriptProperty свойства
function script_properties(property, ...) end

---
--- Задаёт Web-адрес для скрипта.<br/>
--- Адрес может быть любым, как и прямой ссылкой на файл, так и на страницей любого сайта.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/script_url">Open the wiki</a></b><br/>
---
---@param url string ссылка
function script_url(url) end

---
--- Импортирует экспортируемые данные другого скрипта по имени файла, функция загружает скрипт самостоятельно, если он ещё не загружен.<br/>
--- Предотвращает повторную загрузку скрипта при стартовой загрузке скриптов из рабочей директории, т.е.<br/>
--- функцию можно вызывать и в глобальной области (вне <a class="is-internal-link is-valid-page" href="/moonloader/lua/main">main</a> и <a class="is-internal-link is-valid-page" href="/moonloader/scripting/threads">потоков</a>), не опасаясь возникновения проблем.<br/>
--- При повторном вызове для того же скрипта будет использоваться ранее полученное значение, если скрипт не был перезагружен или выгружен.<br/>
--- Возвращает <code>nil</code> и текст ошибки, если попытка импорта завершилась неудачей.<br/>
--- Подробнее об экспорте см.<br/>
--- на странице <a class="is-internal-link is-valid-page" href="/moonloader/exports">Экспорт</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/import">Open the wiki</a></b><br/>
---
---@param filename string имя файла Lua-скрипта
---@return any imports импортированные данные из другого скрипта, обычно это таблица
function import(filename) end

---
--- Преобразует таблицу Lua в <a class="is-external-link" href="https://ru.wikipedia.org/wiki/JSON">JSON</a>-строку.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/encodeJson">Open the wiki</a></b><br/>
---
---@param data table таблица с данными
---@return string json строка в формате JSON
function encodeJson(data) end

---
--- Преобразует <a class="is-external-link" href="https://ru.wikipedia.org/wiki/JSON">JSON</a>-строку в таблицу Lua.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/decodeJson">Open the wiki</a></b><br/>
---
---@param json string данные JSON в виде строки
---@return table data результирующая таблица
function decodeJson(json) end

---
--- Показывает или скрывает системный курсор, блокируя вращение камеры и управление игроком (опционально).<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/showCursor">Open the wiki</a></b><br/>
---
---@param show boolean активировать/деактивировать
---@param lockControls boolean? заблокировать управление игроком. По стандарту = `false`
function showCursor(show, lockControls) end

---
--- Блокирует управление игроком.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/lockPlayerControl">Open the wiki</a></b><br/>
---
---@param lock boolean статус блокировки
function lockPlayerControl(lock) end

---
--- Возвращает статус блокировки управления игроком, заданный функцией <a class="is-internal-link is-valid-page" href="/moonloader/lua/lockPlayerControl">lockPlayerControl</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerControlLocked">Open the wiki</a></b><br/>
---
---@return boolean locked статус блокировки
function isPlayerControlLocked() end

---
--- Перемещает маркер карты в заданные координаты.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setBlipCoordinates">Open the wiki</a></b><br/>
---
---@param blip Marker хэндл маркера
---@param x number новые координаты
---@param y number новые координаты
---@param z number новые координаты
---@return boolean result результат выполнения
function setBlipCoordinates(blip, x, y, z) end

---
--- Перемещает маркер пользовательской точки назначения в заданные координаты.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTargetBlipCoordinates">Open the wiki</a></b><br/>
---
---@param x number новые координаты
---@param y number новые координаты
---@param z number новые координаты
---@return boolean result результат выполнения
function setTargetBlipCoordinates(x, y, z) end

---
--- Устанавливает пользовательскую точку назначения на заданные координаты.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/placeWaypoint">Open the wiki</a></b><br/>
---
---@param x number координаты
---@param y number координаты
---@param z number координаты
---@return boolean result результат выполнения
function placeWaypoint(x, y, z) end

---
--- Скрывает иконку пользовательской точки назначения.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeWaypoint">Open the wiki</a></b><br/>
---
---@return boolean result результат выполнения
function removeWaypoint() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getFolderPath">Open the wiki</a></b>
---
---@param csidl number
---@return string path
function getFolderPath(csidl) end

---
--- Возвращает значение разницы во времени между предыдущим и текущим кадром (но это не точно).<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTimeStepValue">Open the wiki</a></b><br/>
---
---@return number value значение
function getTimeStepValue() end

---
--- Возвращает указатель на используемый игрой экземпляр класса IDirect3DDevice9.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getD3DDevicePtr">Open the wiki</a></b><br/>
---
---@return number devicePtr указатель
function getD3DDevicePtr() end

---
--- Возвращает массив со всеми созданными динамическими объектами.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAllObjects">Open the wiki</a></b><br/>
---
---@return table objects таблица с хэндлами объектов
function getAllObjects() end

---
--- Возвращает массив с хэндлами всех созданных персонажей, включая персонажа игрока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAllChars">Open the wiki</a></b><br/>
---
---@return table peds таблица с хэндлами персонажей
function getAllChars() end

---
--- Возвращает массив с хэндлами всех созданных транспортных средств, включая транспорт, в котором находится игрок.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAllVehicles">Open the wiki</a></b><br/>
---
---@return table vehicles таблица с хэндлами транспортных средств
function getAllVehicles() end

---
--- Возвращает значение глобальной скриптовой переменной числа с плавающей точкой<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameGlobalFloat">Open the wiki</a></b><br/>
---
---@param index number индекс переменной
---@return number value значение
function getGameGlobalFloat(index) end

---
--- Задаёт новое значение глобальной скриптовой переменной числа с плавающей точкой<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGameGlobalFloat">Open the wiki</a></b><br/>
---
---@param index number индекс переменной
---@param value number новое значение
function setGameGlobalFloat(index, value) end

---
--- Создаёт эффект «тряски» камеры.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shakeCam">Open the wiki</a></b><br/>
---
---@param shake number значение амплитуды
function shakeCam(shake) end

---
--- Создаёт (спавнит) модель игрока в игровом мире.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createPlayer">Open the wiki</a></b><br/>
---
---@param modelId number ИД модели
---@param atX number X-координата
---@param atY number Y-координата
---@param atZ number Z-координата
---@return Player player хендл игрока
function createPlayer(modelId, atX, atY, atZ) end

---
--- Создает персонажа в заданных координатах с указанной моделью и поведением пешехода.<br/>
--- Хэндл персонажа записывается в указанную переменную.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createChar">Open the wiki</a></b><br/>
---
---@param pedtype number тип пешехода.
---@param modelId Model модель персонажа.
---@param atX number number координаты персонажа X
---@param atY number number координаты персонажа Y
---@param atZ number number координаты персонажа Z
---@return Ped ped хэндл персонажа.
function createChar(pedtype, modelId, atX, atY, atZ) end

---
--- Удаляет персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteChar">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
function deleteChar(ped) end

---
--- Получает координаты актера.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharCoordinates">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@return number positionX координаты персонажа X
---@return number positionY координаты персонажа Y
---@return number positionZ координаты персонажа Z
function getCharCoordinates(ped) end

---
--- Телепортирует определенного персонажа на указанные координаты.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCoordinates">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл актера
---@param posX number координаты X
---@param posY number координаты Y
---@param posZ number координаты Z
function setCharCoordinates(ped, posX, posY, posZ) end

---
--- Проверяет, находится ли персонаж в указанной прямоугольной зоне.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInArea2d">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа игрока
---@param cornerAX number первая X координата
---@param cornerAY number первая Y координата
---@param cornerBX number вторая X координата
---@param cornerBY number вторая Y координата
---@param sphere boolean поиск в сфере
---@return boolean result результат проверки
function isCharInArea2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- Проверяет, находится ли персонаж в указанной кубической зоне.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInArea3d">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа игрока
---@param cornerAX number первая X координата
---@param cornerAY number первая Y координата
---@param cornerAZ number первая Z координата
---@param cornerBX number вторая X координата
---@param cornerBY number вторая Y координата
---@param cornerBZ number вторая Z координата
---@param sphere boolean поиск в сфере
---@return boolean result результат проверки
function isCharInArea3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- Создает транспорт на указанных координатах.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCar">Open the wiki</a></b><br/>
---
---@param modelId Model номер модели машины
---@param atX number X координата
---@param atY number Y координата
---@param atZ number Z координата
---@return Vehicle car хендл транспорта
function createCar(modelId, atX, atY, atZ) end

---
--- Удаляет транспорт.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteCar">Open the wiki</a></b><br/>
---
---@param car Vehicle Хендл транспорта
function deleteCar(car) end

---
--- Ведет машину на заданные координаты.<br/>
--- Процесс выглядит, как если бы за рулем машины сидел NPC.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/carGotoCoordinates">Open the wiki</a></b><br/>
---
---@param car Vehicle Хендл транспорта
---@param driveToX number X координата
---@param driveToY number Y координата
---@param driveToZ number Z координата
function carGotoCoordinates(car, driveToX, driveToY, driveToZ) end

---
--- Устанавливает машине сумасшедшее вождение<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/carWanderRandomly">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл автомобиля
function carWanderRandomly(car) end

---
--- Устанавливает нормальное вождение автомобиля<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/carSetIdle">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл автомобиля
function carSetIdle(car) end

---
--- Получает координаты машины.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarCoordinates">Open the wiki</a></b><br/>
---
---@param car Vehicle Хэндл машины.
---@return number positionX
---@return number positionY
---@return number positionZ Координаты (XYZ)
function getCarCoordinates(car) end

---
--- Задаёт позицию транспортного средства.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCoordinates">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл ТС
---@param atX number координаты
---@param atY number координаты
---@param atZ number координаты
function setCarCoordinates(car, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCruiseSpeed">Open the wiki</a></b>
---
---@param car Vehicle
---@param maxSpeed number
function setCarCruiseSpeed(car, maxSpeed) end

---
--- Устанавливает аккуратность вождения<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarDrivingStyle">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл автомобиля
---@param behaviour number уровень аккуратности вождения
function setCarDrivingStyle(car, behaviour) end

---@alias DriverBehaviour
---| 1 # едет по дороге сам по себе
---| 2 # врезается в машину игрока останавливаясь на светофорах
---| 4 # едет за игроком проезжая светофоры
---| 7 # едет задом
---| 8 # едет по дороге и вне дороги

---
--- Устанавливает автомобилю поведение<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarMission">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл автомобиля
---@param driverBehaviour DriverBehaviour стиль вождения
function setCarMission(car, driverBehaviour) end

---
--- Проверяет, находится ли транспорт в указанной прямоугольной зоне.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarInArea2d">Open the wiki</a></b><br/>
---
---@param car Vehicle хендл транспорта игрока
---@param cornerAX number первая X координата
---@param cornerAY number первая Y координата
---@param cornerBX number вторая X координата
---@param cornerBY number вторая Y координата
---@param sphere boolean поиск в сфере
---@return boolean result результат проверки
function isCarInArea2d(car, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- Проверяет, находится ли транспорт в указанной кубической зоне.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarInArea3d">Open the wiki</a></b><br/>
---
---@param car Vehicle хендл транспорта игрока
---@param cornerAX number первая X координата
---@param cornerAY number первая Y координата
---@param cornerAZ number первая Z координата
---@param cornerBX number вторая X координата
---@param cornerBY number вторая Y координата
---@param cornerBZ number вторая Z координата
---@param sphere boolean поиск в сфере
---@return boolean result результат проверки
function isCarInArea3d(car, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- Выводит стилизованный текст из GXT на определённое время.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printBig">Open the wiki</a></b><br/>
---
---@param gxtString GxtString ключ из GXT
---@param time number время в миллисекундах
---@param style number стиль (1-7)
function printBig(gxtString, time, style) end

---
--- Отображает текстовую строку с низким приоритетом в нижней части экрана, в течение указанного времени.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printText">Open the wiki</a></b><br/>
---
---@param gxtString GxtString ключ из GXT
---@param time number время в миллисекундах
---@param flag number Флаг
function printText(gxtString, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printTextNow">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param time number
---@param flag number
function printTextNow(gxtString, time, flag) end

---
--- Удаляет с экрана все текстовые сообщения игры.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearPrints">Open the wiki</a></b><br/>
---
function clearPrints() end

---
--- Возвращает текущее игровое время.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTimeOfDay">Open the wiki</a></b><br/>
---
---@return number hours количество часов
---@return number mins количество минут
function getTimeOfDay() end

---
--- Меняет текущее время сервера, на указанное в функции.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTimeOfDay">Open the wiki</a></b><br/>
---
---@param hours number количество часов
---@param minutes number количество минут
function setTimeOfDay(hours, minutes) end

---
--- Получает остаток минут до указаного времени<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMinutesToTimeOfDay">Open the wiki</a></b><br/>
---
---@param hours number часы
---@param minutes number минуты
---@return number minutes остаток минут
function getMinutesToTimeOfDay(hours, minutes) end

---
--- Проверяет находится ли точка на экране в заданном радиусе.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPointOnScreen">Open the wiki</a></b><br/>
---
---@param sphereX number координаты точки X
---@param sphereY number координаты точки Y
---@param sphereZ number координаты точки Z
---@param radius number радиус
---@return boolean radius результат проверки
function isPointOnScreen(sphereX, sphereY, sphereZ, radius) end

---
--- Получает хэндл машины в которой сидит персонаж.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/storeCarCharIsIn">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@return Vehicle car хэндл машины
function storeCarCharIsIn(ped) end

---
--- Проверяет находится ли игрок в указанной машине.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInCar">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл актера
---@param car Vehicle хэндл машины
---@return boolean result результат проверки
function isCharInCar(ped, car) end

---
--- Проверяет находиться ли игрок в модели машины(Пример: 494 - Hotring)<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInModel">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персоонажа
---@param carModel Model модель машины
---@return boolean result результат проверки
function isCharInModel(ped, carModel) end

---
--- Проверяет находится ли игрок в любой машине.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyCar">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл актера
---@return boolean result результат проверки
function isCharInAnyCar(ped) end

---
--- Возвращает <em>true</em>, если игрок нажимает указанную клавишу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isButtonPressed">Open the wiki</a></b><br/>
---
---@param player Player хендл игрока
---@param key number идентификатор клавиши
---@return boolean result результат проверки
function isButtonPressed(player, key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPadState">Open the wiki</a></b>
---
---@param player Player
---@param key number
---@return number state
function getPadState(player, key) end

---
--- Проверяет находится ли персонаж в радиусе координат<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeans2d">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл актера
---@param pointX number координата X
---@param pointY number координата Y
---@param radiusX number радиус по X
---@param radiusY number радиус по Y
---@param sphere boolean поиск в сфере
---@return boolean result результат проверки
function locateCharAnyMeans2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFoot2d">Open the wiki</a></b>
---
---@param ped Ped
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharOnFoot2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharInCar2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCharAnyMeans2d">Open the wiki</a></b>
---
---@param ped Ped
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateStoppedCharAnyMeans2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCharOnFoot2d">Open the wiki</a></b>
---
---@param ped Ped
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateStoppedCharOnFoot2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCharInCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateStoppedCharInCar2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansChar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansChar2d(ped, nearPed, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFootChar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param sphere boolean
function locateCharOnFootChar2d(ped, nearPed, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCarChar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharInCarChar2d(ped, nearPed, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeans3d">Open the wiki</a></b>
---
---@param ped Ped
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeans3d(ped, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFoot3d">Open the wiki</a></b>
---
---@param ped Ped
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharOnFoot3d(ped, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharInCar3d(ped, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCharAnyMeans3d">Open the wiki</a></b>
---
---@param ped Ped
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateStoppedCharAnyMeans3d(ped, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCharOnFoot3d">Open the wiki</a></b>
---
---@param ped Ped
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateStoppedCharOnFoot3d(ped, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCharInCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateStoppedCharInCar3d(ped, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansChar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansChar3d(ped, nearPed, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFootChar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharOnFootChar3d(ped, nearPed, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCarChar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharInCarChar3d(ped, nearPed, radiusX, radiusY, radiusZ, sphere) end

---
--- Создает объект.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createObject">Open the wiki</a></b><br/>
---
---@param modelId Model модель объекта
---@param atX number координаты где будет создан объект X
---@param atY number координаты где будет создан объект X
---@param atZ number координаты где будет создан объект X
---@return Object object хэндл объекта
function createObject(modelId, atX, atY, atZ) end

---
--- Удаляет объект.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteObject">Open the wiki</a></b><br/>
---
---@param object Object хэндл объекта
function deleteObject(object) end

---
--- Дать денег персонажу.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/givePlayerMoney">Open the wiki</a></b><br/>
---
---@param player Player хендл игрока
---@param money number деньги
function givePlayerMoney(player, money) end

---
--- Возвращает количество денег игрока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPlayerMoney">Open the wiki</a></b><br/>
---
---@return number money баланс
function getPlayerMoney(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/giveRemoteControlledCarToPlayer">Open the wiki</a></b>
---
---@param player Player
---@param float2 number
---@param float3 number
---@param float4 number
function giveRemoteControlledCarToPlayer(player, float2, float3, float4) end

---
--- Устанавливает уровень розыска игроку<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/alterWantedLevel">Open the wiki</a></b><br/>
---
---@param player Player хэндл игрока
---@param wantedLevel number уровень розыска
function alterWantedLevel(player, wantedLevel) end

---
--- Устанавливает уровень розыска игроку, при этом не сбрасывая его в дальнейшем<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/alterWantedLevelNoDrop">Open the wiki</a></b><br/>
---
---@param player Player хэндл игрока
---@param minimumWantedLevel number минимальный уровень розыска
function alterWantedLevelNoDrop(player, minimumWantedLevel) end

---
--- Сравнивает уровень розыска, возвращает true если уровень розыска больше указаного<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isWantedLevelGreater">Open the wiki</a></b><br/>
---
---@param player Player хэндл
---@param level number уровень розыска для сравнения
---@return boolean result результат
function isWantedLevelGreater(player, level) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearWantedLevel">Open the wiki</a></b>
---
---@param player Player
---@param modelId Model
---@return number quantity
function getNumOfModelsKilledByPlayer(player, modelId) end

---
--- Устанавливает состояние персонажа: убит или арестован<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setDeatharrestState">Open the wiki</a></b><br/>
---
---@param value boolean состояние
function setDeatharrestState(value) end

---
--- Проверяет, умер ли персонаж или арестован<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasDeatharrestBeenExecuted">Open the wiki</a></b><br/>
---
---@return boolean result результат проверки
function hasDeatharrestBeenExecuted() end

---
--- Добавляет патроны персонажу, если у него есть оружие.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addAmmoToChar">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@param weapon number ID оружия
---@param ammo number число патронов
function addAmmoToChar(ped, weapon, ammo) end

---
--- Проверяет мертв ли игрок.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerDead">Open the wiki</a></b><br/>
---
---@param player Player хэндл игрока
---@return boolean result результат проверки
function isPlayerDead(player) end

---
--- Проверяет мертв ли персонаж.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharDead">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@return boolean result результат проверки
function isCharDead(ped) end

---
--- Проверяет взорвана ли машина.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarDead">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@return boolean result результат проверки
function isCarDead(car) end

---
--- Проверяет сигналит ли игрок в машине.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerPressingHorn">Open the wiki</a></b><br/>
---
---@param player Player хэндл игрока
---@return boolean result результат проверки
function isPlayerPressingHorn(player) end

---
--- Создает персонажа сидящем в машине на водительском сиденье.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCharInsideCar">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@param pedtype Model модель персонажа
---@param model number модель
---@return Ped ped хэндл персонажа
function createCharInsideCar(car, pedtype, model) end

---
--- Проверяет указанную машину на модель.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarModel">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@param modelId Model модель машины
---@return boolean result результат проверки(возвращает true, если модель совпадает)
function isCarModel(car, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCarGenerator">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param angle number
---@param modelId Model
---@param color1 number
---@param color2 number
---@param forceSpawn boolean
---@param alarm number
---@param doorLock number
---@param minDelay number
---@param maxDelay number
---@return number carGenerator
function createCarGenerator(
	atX,
	atY,
	atZ,
	angle,
	modelId,
	color1,
	color2,
	forceSpawn,
	alarm,
	doorLock,
	minDelay,
	maxDelay
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchCarGenerator">Open the wiki</a></b>
---
---@param carGenerator number
---@param carsToGenerate number
function switchCarGenerator(carGenerator, carsToGenerate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayOnscreenTimer">Open the wiki</a></b>
---
---@param var VarId
---@param countInDirection boolean
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
---@return boolean result
function isCharInZone(ped, zoneName) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pointCameraAtCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param mode number
---@param switchstyle number
function pointCameraAtCar(car, mode, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pointCameraAtChar">Open the wiki</a></b>
---
---@param ped Ped
---@param mode number
---@param switchstyle number
function pointCameraAtChar(ped, mode, switchstyle) end

---
--- Восстанавливает камеру в обычное положение.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/restoreCamera">Open the wiki</a></b><br/>
---
function restoreCamera() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shakePad">Open the wiki</a></b>
---
---@param player Player
---@param time number
---@param intensity number
function shakePad(player, time, intensity) end

---
--- Устанавливает скорость игры.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTimeScale">Open the wiki</a></b><br/>
---
---@param gamespeed number скорость
function setTimeScale(gamespeed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFixedCameraPosition">Open the wiki</a></b>
---
---@param positionX number
---@param positionY number
---@param positionZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function setFixedCameraPosition(positionX, positionY, positionZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pointCameraAtPoint">Open the wiki</a></b>
---
---@param pointAtX number
---@param pointAtY number
---@param pointAtZ number
---@param switchstyle number
function pointCameraAtPoint(pointAtX, pointAtY, pointAtZ, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForCarOld">Open the wiki</a></b>
---
---@param car Vehicle
---@param unused number
---@param visibility boolean
---@return Marker marker
function addBlipForCarOld(car, unused, visibility) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForCharOld">Open the wiki</a></b>
---
---@param ped Ped
---@param int2 number
---@param int3 number
---@return Marker marker
function addBlipForCharOld(ped, int2, int3) end

---
--- Удаляет маркер.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeBlip">Open the wiki</a></b><br/>
---
---@param marker Marker Хендл маркера.
function removeBlip(marker) end

---
--- Меняет цвет маркера.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeBlipColour">Open the wiki</a></b><br/>
---
---@param marker Marker Хендл маркера.
---@param color number Цвет.
function changeBlipColour(marker, color) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForCoordOld">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param color number
---@param flag number
---@return Marker marker
function addBlipForCoordOld(atX, atY, atZ, color, flag) end

---
--- Меняет размер маркера.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeBlipScale">Open the wiki</a></b><br/>
---
---@param marker Marker Хендл маркера.
---@param size number Размер. (3 - стандартный)
function changeBlipScale(marker, size) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFadingColour">Open the wiki</a></b>
---
---@param r number
---@param g number
---@param b number
function setFadingColour(r, g, b) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doFade">Open the wiki</a></b>
---
---@param _in boolean
---@param time number
function doFade(_in, time) end

---
--- Проверяет, затухает ли прямо сейчас в игре экран.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getFadingStatus">Open the wiki</a></b><br/>
---
---@return boolean result результат проверки
function getFadingStatus() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addHospitalRestart">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param angle number
---@param townNumber number
function addHospitalRestart(atX, atY, atZ, angle, townNumber) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addPoliceRestart">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param angle number
---@param townNumber number
function addPoliceRestart(atX, atY, atZ, angle, townNumber) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/overrideNextRestart">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param angle number
function overrideNextRestart(atX, atY, atZ, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawShadow">Open the wiki</a></b>
---
---@param particle Particle
---@param atX number
---@param atY number
---@param atZ number
---@param rotationFactor number
---@param size number
---@param intensity number
---@param flags1 number
---@param flags2 number
---@param flags3 number
function drawShadow(particle, atX, atY, atZ, rotationFactor, size, intensity, flags1, flags2, flags3) end

---
--- Возвращает Z-угол(поворот) персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharHeading">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@return number angle угол поворота
function getCharHeading(ped) end

---
--- Устанавливает Z-угол(поворот) персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharHeading">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа игрока
---@param angle number угол поворота
function setCharHeading(ped, angle) end

---
--- Возвращает Z-угол(поворот) транспорта.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarHeading">Open the wiki</a></b><br/>
---
---@param car Vehicle хендл транспорта
---@return number angle угол поворота
function getCarHeading(car) end

---
--- Устанавливает Z-угол(поворот) транспорта.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarHeading">Open the wiki</a></b><br/>
---
---@param car Vehicle хендл транспорта
---@param angle number угол поворота
function setCarHeading(car, angle) end

---
--- Получает угол поворота объекта<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectHeading">Open the wiki</a></b><br/>
---
---@param object Object скриптовый хендл объекта
---@return number angle угол поворота объекта
function getObjectHeading(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectHeading">Open the wiki</a></b>
---
---@param object Object
---@param angle number
function setObjectHeading(object, angle) end

---
--- Узнает, касается ли персонаж объекта<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharTouchingObject">Open the wiki</a></b><br/>
---
---@param ped Ped скриптовый хендл персонажа
---@param object Object скриптовый хендл объекта
---@return boolean result результат выполнения функции
function isCharTouchingObject(ped, object) end

---
--- Устанавливает количество патронов в указанное оружие.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharAmmo">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@param weapon number ID оружия
---@param ammo number число патронов
function setCharAmmo(ped, weapon, ammo) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/declareMissionFlag">Open the wiki</a></b>
---
---@param flag VarId
function declareMissionFlag(flag) end

---
--- Создает маркер над автомобилем.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForCar">Open the wiki</a></b><br/>
---
---@param car Vehicle Хендл машины.
---@return Marker marker Хендл маркера.
function addBlipForCar(car) end

---
--- Добавляет маркер над персонажем.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForChar">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@return Marker marker хендл маркера
function addBlipForChar(ped) end

---
--- Создает маркер над объектом.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForObject">Open the wiki</a></b><br/>
---
---@param object Object Хендл объекта.
---@return Marker marker Хендл маркера.
function addBlipForObject(object) end

---
--- Создает маркер на указанных координатах.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForCoord">Open the wiki</a></b><br/>
---
---@param atX number
---@param atY number
---@param atZ number Координаты (XYZ)
---@return Checkpoint checkpoint Хендл маркера.
function addBlipForCoord(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeBlipDisplay">Open the wiki</a></b>
---
---@param marker Marker
---@param mode number
function changeBlipDisplay(marker, mode) end

---
--- Проигрывает короткий звук.<br/>
--- Если указаны координаты - то звук проиграется на указанных координатах.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addOneOffSound">Open the wiki</a></b><br/>
---
---@param atX number координата X
---@param atY number координата Y
---@param atZ number координата Z
---@param sound number идентификатор звука
function addOneOffSound(atX, atY, atZ, sound) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addContinuousSound">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param sound number
---@return number unk
function addContinuousSound(atX, atY, atZ, sound) end

---
--- Удаляет проигрываемый звук<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeSound">Open the wiki</a></b><br/>
---
---@param sound number ID звука
function removeSound(sound) end

---
--- Возвращает <code>true</code> если машина перевёрнута (застряла на крыше), то есть транспорт был добавлен к проверке <a class="is-internal-link is-invalid-page" href="/moonloader/lua/addUpsidedownCarCheck">addUpsidedownCarCheck</a> и его движения в перевернутом состоянии минимальны.<br/>
--- Проверка срабатывает и с взорванным транспортом.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarStuckOnRoof">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл транспорта
---@return boolean result результат
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
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCharInAreaOnFoot2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAreaInCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCharInAreaInCar2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInArea2d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCharStoppedInArea2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaOnFoot2d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCharStoppedInAreaOnFoot2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaInCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCharStoppedInAreaInCar2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAreaOnFoot3d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@param sphere boolean
---@return boolean result
function isCharInAreaOnFoot3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAreaInCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@param sphere boolean
---@return boolean result
function isCharInAreaInCar3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInArea3d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@param sphere boolean
---@return boolean result
function isCharStoppedInArea3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaOnFoot3d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@param sphere boolean
---@return boolean result
function isCharStoppedInAreaOnFoot3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaInCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@param sphere boolean
---@return boolean result
function isCharStoppedInAreaInCar3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarStoppedInArea2d">Open the wiki</a></b>
---
---@param car Vehicle
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCarStoppedInArea2d(car, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarStoppedInArea3d">Open the wiki</a></b>
---
---@param car Vehicle
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@param sphere boolean
---@return boolean result
function isCarStoppedInArea3d(car, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCar2d">Open the wiki</a></b>
---
---@param car Vehicle
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCar2d(car, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCar2d">Open the wiki</a></b>
---
---@param car Vehicle
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateStoppedCar2d(car, pointX, pointY, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCar3d">Open the wiki</a></b>
---
---@param car Vehicle
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCar3d(car, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateStoppedCar3d">Open the wiki</a></b>
---
---@param car Vehicle
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateStoppedCar3d(car, sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ, sphere) end

---
--- Выдает ID оружия и кол-во патронов.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/giveWeaponToChar">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@param weapon number ID оружия
---@param ammo number количество патронов
function giveWeaponToChar(ped, weapon, ammo) end

---
--- Устанавливает возможность передвижения персонажа<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerControl">Open the wiki</a></b><br/>
---
---@param player Player хендл игрока
---@param canMove boolean может ли игрок передвигаться true - может, false - не может.
---@return boolean result результат выполнения
function setPlayerControl(player, canMove) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceWeather">Open the wiki</a></b>
---
---@param weather number
---@return boolean result
function forceWeather(weather) end

---
--- Моментально устанавливает погоду<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceWeatherNow">Open the wiki</a></b><br/>
---
---@param weather number id погоды
function forceWeatherNow(weather) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releaseWeather">Open the wiki</a></b>
---
function releaseWeather() end

---
--- Дает персонажу в руки указанное оружие.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCurrentCharWeapon">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@param weapon number ID оружия
function setCurrentCharWeapon(ped, weapon) end

---
--- Возвращает координаты указанного объекта.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectCoordinates">Open the wiki</a></b><br/>
---
---@param object Object хендл объекта
---@return boolean result результат проверки
---@return number atX x координата
---@return number atY y координата
---@return number atZ z координата
function getObjectCoordinates(object) end

---
--- Устанавливает указанный объект на указанные координаты.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectCoordinates">Open the wiki</a></b><br/>
---
---@param object Object хендл объекта
---@param atX number x координата
---@param atY number y координата
---@param atZ number z координата
---@return boolean result результат проверки
function setObjectCoordinates(object, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGameTimer">Open the wiki</a></b>
---
---@return number timeMs
function getGameTimer() end

---
--- Возвращает текущий уровень розыска персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/storeWantedLevel">Open the wiki</a></b><br/>
---
---@param player Player хендл игрока
---@return boolean result результат проверки
---@return number level уровень розыска
function storeWantedLevel(player) end

---
--- Проверяет стоит ли машина на месте.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarStopped">Open the wiki</a></b><br/>
---
---@param car Vehicle Хендл машины.
---@return boolean result Результат проверки.
function isCarStopped(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markCharAsNoLongerNeeded">Open the wiki</a></b>
---
---@param ped Ped
function markCharAsNoLongerNeeded(ped) end

---
--- Помечает транспорт как более ненужный для скриптового движка и что он может быть удален в любое время игрой<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markCarAsNoLongerNeeded">Open the wiki</a></b><br/>
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
--- Создает персонажа сидящем в машине на пассажирском сидении.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCharAsPassenger">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@return boolean result результат
function createCharAsPassenger(car, pedtype, model, passengerSeat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWithNumberBig">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param number number
---@param time number
---@param style number
---@return boolean result
function printWithNumberBig(gxtString, number, time, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWithNumber">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param number number
---@param time number
---@param flag number
---@return boolean result
function printWithNumber(gxtString, number, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWithNumberNow">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param number number
---@param time number
---@param flag number
---@return boolean result
function printWithNumberNow(gxtString, number, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchRoadsOn">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@return boolean result
function switchRoadsOn(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchRoadsOff">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchRoadsOff(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- Возвращает количество пассажиров в автомобиле<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumberOfPassengers">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл транспорта
---@return boolean result результат проверки
---@return number passengers количество пассажиров
function getNumberOfPassengers(car) end

---
--- Возвращает максимальное количество пассажиров для данного транспортного средства<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMaximumNumberOfPassengers">Open the wiki</a></b><br/>
---
---@param car Vehicle скриптовый хэндл транспортного средства
---@return number maxPassengers количество пассажиров
function getMaximumNumberOfPassengers(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarDensityMultiplier">Open the wiki</a></b>
---
---@param multiplier number
---@return boolean result
function setCarDensityMultiplier(multiplier) end

---
--- <br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarHeavy">Open the wiki</a></b><br/>
---
---@return boolean result утяжелена ли машина
function setCarHeavy(car, heavy) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMaxWantedLevel">Open the wiki</a></b>
---
---@param level number
function setMaxWantedLevel(level) end

---
--- Проверяет, когда машина отрывается от земли.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarInAirProper">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@return boolean result результат проверки
function isCarInAirProper(car) end

---
--- <br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarUpsidedown">Open the wiki</a></b><br/>
---
function isCarUpsidedown(car) end

---
--- Получает хэндл персонажа игрока<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPlayerChar">Open the wiki</a></b><br/>
---
---@param player Player хэндл игрока
---@return boolean result результат
---@return Ped ped хэндл игрока
function getPlayerChar(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cancelOverrideRestart">Open the wiki</a></b>
---
---@return boolean result
function cancelOverrideRestart() end

---
--- Устанавливает, должны ли полицейские игнорировать игрока независимо от уровня.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPoliceIgnorePlayer">Open the wiki</a></b><br/>
---
---@param player Player хендл игрока
---@param ignored boolean true - включить игнорирование, false - выключить игнорирование
---@return boolean result результат
function setPoliceIgnorePlayer(player, ignored) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startKillFrenzy">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param weapon number
---@param timeLimit number
---@param targets number
---@param targetModels1 Model
---@param targetModels2 Model
---@param targetModels3 Model
---@param targetModels4 Model
---@param completedText boolean
---@return boolean result
function startKillFrenzy(
	gxtString,
	weapon,
	timeLimit,
	targets,
	targetModels1,
	targetModels2,
	targetModels3,
	targetModels4,
	completedText
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/readKillFrenzyStatus">Open the wiki</a></b>
---
---@return boolean result
---@return number status
function readKillFrenzyStatus() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansCar2d(ped, car, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFootCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param flag boolean
---@return boolean result
function locateCharOnFootCar2d(ped, car, radiusX, radiusY, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCarCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharInCarCar2d(ped, car, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param flag boolean
---@return boolean result
function locateCharAnyMeansCar3d(ped, car, radiusX, radiusY, radiusZ, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFootCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param flag boolean
---@return boolean result
function locateCharOnFootCar3d(ped, car, radiusX, radiusY, radiusZ, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCarCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param flag boolean
---@return boolean result
function locateCharInCarCar3d(ped, car, radiusX, radiusY, radiusZ, flag) end

---
--- Устанавливает, открыты или закрыты двери т/с<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/lockCarDoors">Open the wiki</a></b><br/>
---
---@param car Vehicle хендл транспортного средства
---@param status number статус
function lockCarDoors(car, status) end

---
--- Взрывает транспортное средство.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/explodeCar">Open the wiki</a></b><br/>
---
---@param car Vehicle скриптовый хендл транспортного средства
---@return boolean result результат выполнения операции
function explodeCar(car) end

---
--- Вызывает эффект взрыва на экране.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addExplosion">Open the wiki</a></b><br/>
---
---@param atX number Координата X взрыва
---@param atY number Координата Y взрыва
---@param atZ number Координата Z взрыва
---@param radius number Радиус взрыва
---@return boolean result Результат
function addExplosion(atX, atY, atZ, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarUpright">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
function isCarUpright(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createPickup">Open the wiki</a></b>
---
---@param modelId Model
---@param type number
---@param atX number
---@param atY number
---@param atZ number
---@return boolean result
---@return Pickup pickup
function createPickup(modelId, type, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasPickupBeenCollected">Open the wiki</a></b>
---
---@param pickup Pickup
---@return boolean result
function hasPickupBeenCollected(pickup) end

---
--- Удаляет пикап.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removePickup">Open the wiki</a></b><br/>
---
---@param pickup Pickup скриптовый хендл пикапа
---@return boolean result результат выполнения операции
function removePickup(pickup) end

---
--- Устанавливает свечение шашки такси<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTaxiLights">Open the wiki</a></b><br/>
---
---@param taxi Vehicle такси
---@param light boolean состояние
function setTaxiLights(taxi, light) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printBigQ">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param time number
---@param style number
---@return boolean result
function printBigQ(gxtString, time, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTargetCarForMissionGarage">Open the wiki</a></b>
---
---@param garage GxtString
---@param car Vehicle
---@return boolean result
function setTargetCarForMissionGarage(garage, car) end

---
--- Установить/Снять тормоза(невозможность двигаться) у авто<br/>
--- Если "тормоза" установить, то как бы игрок не пытался двигаться в авто он будет стоять на месте<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/applyBrakesToPlayersCar">Open the wiki</a></b><br/>
---
---@param player Player хендл игрока
---@param apply boolean статус
---@return boolean result статус
function applyBrakesToPlayersCar(player, apply) end

---
--- Устанавливает персонажу уровень здоровья.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharHealth">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа.
---@param health number Число здоровья.
function setCharHealth(ped, health) end

---
--- Устанавливает уровень здоровья машине.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarHealth">Open the wiki</a></b><br/>
---
---@param car Vehicle Хендл машины.
---@param health number Уровень здоровья.
function setCarHealth(car, health) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharHealth">Open the wiki</a></b>
---
---@param ped Ped
---@return number health
function getCharHealth(ped) end

---
--- Получает состояние машины.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarHealth">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@return number health Состояние машины
function getCarHealth(car) end

---
--- Меняет цвет машины.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeCarColour">Open the wiki</a></b><br/>
---
---@param car Vehicle Хендл автомобиля.
---@param primaryColor number Первичный цвет.
---@param secondaryColor number Вторичный цвет.
---@return boolean result Результат выполнения.
function changeCarColour(car, primaryColor, secondaryColor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchPedRoadsOn">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchPedRoadsOn(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchPedRoadsOff">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchPedRoadsOff(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- Устанавливает указанной банде оружие которое она может использовать.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGangWeapons">Open the wiki</a></b><br/>
---
---@param gang number номер банды
---@param weapons1 number ID первого оружия которое может использовать банда
---@param weapons2 number ID второго оружия которое может использовать банда
---@param weapons3 number ID третьего оружия которое может использовать банда
function setGangWeapons(gang, weapons1, weapons2, weapons3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharTouchingObjectOnFoot">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@return boolean result
function isCharTouchingObjectOnFoot(ped, object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadSpecialCharacter">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param id number
function loadSpecialCharacter(gxtString, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasSpecialCharacterLoaded">Open the wiki</a></b>
---
---@param id number
---@return boolean result
function hasSpecialCharacterLoaded(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerInRemoteMode">Open the wiki</a></b>
---
---@param player Player
---@return boolean result
function isPlayerInRemoteMode(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCutsceneOffset">Open the wiki</a></b>
---
---@param posX number
---@param posY number
---@param posZ number
function setCutsceneOffset(posX, posY, posZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAnimGroupForChar">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function isCharMale(ped) end

---
--- Загружает указанную модель.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/requestModel">Open the wiki</a></b><br/>
---
---@param modelId Model номер модели
---@return boolean result
function requestModel(modelId) end

---
--- Проверяет загружена ли модель.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasModelLoaded">Open the wiki</a></b><br/>
---
---@param modelId Model номер модель
---@return boolean result
function hasModelLoaded(modelId) end

---
--- Помечает загруженную ранее модель как более ненужную для скриптового движка<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markModelAsNoLongerNeeded">Open the wiki</a></b><br/>
---
---@param modelId Model номер модели
function markModelAsNoLongerNeeded(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawCorona">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@param type number
---@param lensflares boolean
---@param r number
---@param g number
---@param b number
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
---@return boolean result
function isPlayerPlaying(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getControllerMode">Open the wiki</a></b>
---
---@return number mode
function getControllerMode() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCanResprayCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param sprayable boolean
function setCanResprayCar(car, sprayable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/unloadSpecialCharacter">Open the wiki</a></b>
---
---@param id number
function unloadSpecialCharacter(id) end

---
--- Сбрасывает количество раз, сколько раз игрок уничтожил определенную модель.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/resetNumOfModelsKilledByPlayer">Open the wiki</a></b><br/>
---
---@param player Player хендл игрока
function resetNumOfModelsKilledByPlayer(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumOfModelsKilledByPlayer">Open the wiki</a></b>
---
---@param player Player
---@param modelId Model
---@return number quantity
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
---@param atX number
---@param atY number
---@param atZ number
---@return Object object
function createObjectNoOffset(modelId, atX, atY, atZ) end

---
--- Проверяет двигается ли игрок.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStopped">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@return boolean result результат проверки
function isCharStopped(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchWidescreen">Open the wiki</a></b>
---
---@param enable boolean
function switchWidescreen(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addSpriteBlipForContactPoint">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param icon number
---@return Marker marker
function addSpriteBlipForContactPoint(atX, atY, atZ, icon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addSpriteBlipForCoord">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param type number
---@return Marker marker
function addSpriteBlipForCoord(atX, atY, atZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharOnlyDamagedByPlayer">Open the wiki</a></b>
---
---@param ped Ped
---@param enabled boolean
function setCharOnlyDamagedByPlayer(ped, enabled) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarOnlyDamagedByPlayer">Open the wiki</a></b>
---
---@param car Vehicle
---@param enabled boolean
function setCarOnlyDamagedByPlayer(car, enabled) end

---
--- Устанавливает иммунитет персонажу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharProofs">Open the wiki</a></b><br/>
---
---@param ped Ped Хэндл персонажа
---@param BP boolean иммунитет от пуль
---@param FP boolean иммунитет от огня
---@param EP boolean иммунитет от взрывов
---@param CP boolean иммунитет от ударений
---@param MP boolean иммунитет от оружия ближнего боя в т.ч. и кулаков
function setCharProofs(ped, BP, FP, EP, CP, MP) end

---
--- Устанавливает иммунитет машине<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarProofs">Open the wiki</a></b><br/>
---
---@param car Vehicle Хэндл транспорта
---@param BP boolean иммунитет от пуль
---@param FP boolean иммунитет от огня
---@param EP boolean иммунитет от взрывов
---@param CP boolean иммунитет от ударений
---@param MP boolean иммунитет от оружия ближнего боя в т.ч. и кулаков
function setCarProofs(car, BP, FP, EP, CP, MP) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deactivateGarage">Open the wiki</a></b>
---
---@param garage GxtString
function deactivateGarage(garage) end

---
--- Проверяет находиться ли машина в воде.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarInWater">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@return boolean result результат проверки
function isCarInWater(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClosestCharNode">Open the wiki</a></b>
---
---@param closestToX number
---@param closestToY number
---@param closestToZ number
---@return number nodeX
---@return number nodeY
---@return number nodeZ
function getClosestCharNode(closestToX, closestToY, closestToZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClosestCarNode">Open the wiki</a></b>
---
---@param closestToX number
---@param closestToY number
---@param closestToZ number
---@return number nodeX
---@return number nodeY
---@return number nodeZ
function getClosestCarNode(closestToX, closestToY, closestToZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesAccurate">Open the wiki</a></b>
---
---@param car Vehicle
---@param toX number
---@param toY number
---@param toZ number
function carGotoCoordinatesAccurate(car, toX, toY, toZ) end

---
--- Проверяет видна ли машина.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarOnScreen">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@return boolean result результат проверки
function isCarOnScreen(car) end

---
--- Проверяет виден ли персонаж.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharOnScreen">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@return boolean result результат проверки
function isCharOnScreen(ped) end

---
--- Проверяет виден ли объект.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectOnScreen">Open the wiki</a></b><br/>
---
---@param object Object хэндл объекта
---@return boolean result результат проверки
function isObjectOnScreen(object) end

---
--- Находит высоту относительно 3д координат.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGroundZFor3dCoord">Open the wiki</a></b><br/>
---
---@param atX number
---@param atY number
---@param atZ number Координаты
---@return number z Результат
function getGroundZFor3dCoord(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startScriptFire">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param propagation number
---@param size number
---@return number fire
function startScriptFire(atX, atY, atZ, propagation, size) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isScriptFireExtinguished">Open the wiki</a></b>
---
---@param fire number
---@return boolean result
function isScriptFireExtinguished(fire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeScriptFire">Open the wiki</a></b>
---
---@param fire number
function removeScriptFire(fire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/boatGotoCoords">Open the wiki</a></b>
---
---@param boat Vehicle
---@param toX number
---@param toY number
---@param toZ number
function boatGotoCoords(boat, toX, toY, toZ) end

---
--- Заглушить мотор т/c<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/boatStop">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл т/c
function boatStop(car) end

---
--- Проверяет выстрелил ли персонаж в заданной зоне.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharShootingInArea">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа.
---@param cornerAX number Координаты зоны.
---@param cornerAY number Координаты зоны.
---@param cornerBX number Координаты зоны.
---@param cornerBY number Координаты зоны.
---@param weapon number ID оружия
---@return boolean result Результат проверки.
function isCharShootingInArea(ped, cornerAX, cornerAY, cornerBX, cornerBY, weapon) end

---
--- Проверяет держит ли игрок в руках указанное оружие.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCurrentCharWeapon">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@param weapon number ид оружия
---@return boolean result Результат проверки
function isCurrentCharWeapon(ped, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setBoatCruiseSpeed">Open the wiki</a></b>
---
---@param boat Vehicle
---@param speed number
function setBoatCruiseSpeed(boat, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCharInZone">Open the wiki</a></b>
---
---@param zone GxtString
---@param pedtype boolean
---@param gang boolean
---@param criminal_prostitute boolean
---@return Ped ped
function getRandomCharInZone(zone, pedtype, gang, criminal_prostitute) end

---
--- Проверяет выстрелил ли персонаж.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharShooting">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа
---@return boolean result Результат проверки
function isCharShooting(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createMoneyPickup">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param cash number
---@param permanenceFlag boolean
---@return Pickup pickup
function createMoneyPickup(atX, atY, atZ, cash, permanenceFlag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharAccuracy">Open the wiki</a></b>
---
---@param ped Ped
---@param accuracy number
function setCharAccuracy(ped, accuracy) end

---
--- Получает скорость машины по ее хендлу.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarSpeed">Open the wiki</a></b><br/>
---
---@param car Vehicle Хендл машины
---@return number speed Скорость машины
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
---@param cutscene number
---@param anim GxtString
function setCutsceneAnim(cutscene, anim) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startCutscene">Open the wiki</a></b>
---
function startCutscene() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCutsceneTime">Open the wiki</a></b>
---
---@return number time
function getCutsceneTime() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCutsceneFinished">Open the wiki</a></b>
---
---@return boolean result
function hasCutsceneFinished() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCutscene">Open the wiki</a></b>
---
function clearCutscene() end

---
--- Восстанавливает камеру в исходное положение<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/restoreCameraJumpcut">Open the wiki</a></b><br/>
---
function restoreCameraJumpcut() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCollectable1Total">Open the wiki</a></b>
---
---@param total number
function setCollectable1Total(total) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isProjectileInArea">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@return boolean result
function isProjectileInArea(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- Сверяет модель персонажа с указанной.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharModel">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа.
---@param modelId Model Номер модели.
---@return boolean result Результат проверки.
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
---@return number forwardX
function getCarForwardX(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarForwardY">Open the wiki</a></b>
---
---@param car Vehicle
---@return number forwardY
function getCarForwardY(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeGarageType">Open the wiki</a></b>
---
---@param garage GxtString
---@param type number
function changeGarageType(garage, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWith2NumbersNow">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param time number
---@param flag number
function printWith2NumbersNow(gxtString, numbers1, numbers2, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWith3Numbers">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param numbers3 number
---@param time number
---@param flag number
function printWith3Numbers(gxtString, numbers1, numbers2, numbers3, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWith4Numbers">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param numbers3 number
---@param numbers4 number
---@param time number
---@param flag number
function printWith4Numbers(gxtString, numbers1, numbers2, numbers3, numbers4, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWith4NumbersNow">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param numbers3 number
---@param numbers4 number
---@param time number
---@param flag number
function printWith4NumbersNow(gxtString, numbers1, numbers2, numbers3, numbers4, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWith6Numbers">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param numbers3 number
---@param numbers4 number
---@param numbers5 number
---@param numbers6 number
---@param time number
---@param flag number
function printWith6Numbers(gxtString, numbers1, numbers2, numbers3, numbers4, numbers5, numbers6, time, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playerMadeProgress">Open the wiki</a></b>
---
---@param progress number
function playerMadeProgress(progress) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setProgressTotal">Open the wiki</a></b>
---
---@param maxProgress number
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
--- Проверяет с указанного оружия было попадание по персонажу.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByWeapon">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@param weapon number ID оружия
---@return boolean result результат проверки
function hasCharBeenDamagedByWeapon(ped, weapon) end

---
--- Проверяет с указанного ли оружия было попадание в машину.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByWeapon">Open the wiki</a></b><br/>
---
---@param car Vehicle хендл машины
---@param weapon number ID оружия
---@return boolean result Результат проверки
function hasCarBeenDamagedByWeapon(car, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/explodeCharHead">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param passengerSeat number
function warpCharIntoCarAsPassenger(ped, car, passengerSeat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/anchorBoat">Open the wiki</a></b>
---
---@param boat Vehicle
---@param anchor boolean
function anchorBoat(boat, anchor) end

---
--- Воспламеняет машину по ее хендлу.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startCarFire">Open the wiki</a></b><br/>
---
---@param car Vehicle хендл транспорта
function startCarFire(car) end

---
--- Воспломиняет персонажа по его хендлу.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startCharFire">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа
function startCharFire(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInArea">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param modelId Model
---@return Vehicle car
function getRandomCarOfTypeInArea(cornerAX, cornerAY, cornerBX, cornerBY, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasResprayHappened">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
function hasResprayHappened(car) end

---
--- Устанавливает режим камеры<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCameraZoom">Open the wiki</a></b><br/>
---
---@param mode number режим камеры 0/1/2
function setCameraZoom(mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createPickupWithAmmo">Open the wiki</a></b>
---
---@param modelId Model
---@param type number
---@param ammo number
---@param atX number
---@param atY number
---@param atZ number
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
---@param infiniteRun boolean
function setPlayerNeverGetsTired(player, infiniteRun) end

---
--- Игроку не нужно будет перезаряжаться.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerFastReload">Open the wiki</a></b><br/>
---
---@param player Player хендл игрока
---@param fastReload boolean true - включить, false - выключить
function setPlayerFastReload(player, fastReload) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharBleeding">Open the wiki</a></b>
---
---@param ped Ped
---@param bleeding boolean
function setCharBleeding(ped, bleeding) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFreeResprays">Open the wiki</a></b>
---
---@param enable boolean
function setFreeResprays(enable) end

---
--- Устанавливает актёру невидимость<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharVisible">Open the wiki</a></b><br/>
---
---@param ped Ped актёр
---@param visible boolean значение невидимости
function setCharVisible(ped, visible) end

---
--- Устанавливает машине невидимость.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarVisible">Open the wiki</a></b><br/>
---
---@param car Vehicle Хендл транспорта
---@param visible boolean Значение невидимости
function setCarVisible(car, visible) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isAreaOccupied">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@param solid boolean
---@param car boolean
---@param actor boolean
---@param object boolean
---@param particle boolean
---@return boolean result
function isAreaOccupied(
	cornerAX,
	cornerAY,
	cornerAZ,
	cornerBX,
	cornerBY,
	cornerBZ,
	solid,
	car,
	actor,
	object,
	particle
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayText">Open the wiki</a></b>
---
---@param posX number
---@param posY number
---@param gxtString GxtString
function displayText(posX, posY, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextScale">Open the wiki</a></b>
---
---@param sizeX number
---@param sizeY number
function setTextScale(sizeX, sizeY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextColour">Open the wiki</a></b>
---
---@param r number
---@param g number
---@param b number
---@param a number
function setTextColour(r, g, b, a) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextJustify">Open the wiki</a></b>
---
---@param alignJustify boolean
function setTextJustify(alignJustify) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextCentre">Open the wiki</a></b>
---
---@param centered boolean
function setTextCentre(centered) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextWrapx">Open the wiki</a></b>
---
---@param linewidth number
function setTextWrapx(linewidth) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextCentreSize">Open the wiki</a></b>
---
---@param linewidth number
function setTextCentreSize(linewidth) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextBackground">Open the wiki</a></b>
---
---@param background boolean
function setTextBackground(background) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextProportional">Open the wiki</a></b>
---
---@param proportional boolean
function setTextProportional(proportional) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextFont">Open the wiki</a></b>
---
---@param font number
function setTextFont(font) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/rotateObject">Open the wiki</a></b>
---
---@param object Object
---@param fromAngle number
---@param toAngle number
---@param flag boolean
---@return boolean result
function rotateObject(object, fromAngle, toAngle, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/slideObject">Open the wiki</a></b>
---
---@param object Object
---@param toX number
---@param toY number
---@param toZ number
---@param speedX number
---@param speedY number
---@param speedZ number
---@param collisionCheck boolean
---@return boolean result
function slideObject(object, toX, toY, toZ, speedX, speedY, speedZ, collisionCheck) end

---
--- Плавно удаляет модель игрока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeCharElegantly">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
function removeCharElegantly(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharStayInSamePlace">Open the wiki</a></b>
---
---@param ped Ped
---@param enabled boolean
function setCharStayInSamePlace(ped, enabled) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isExplosionInArea">Open the wiki</a></b>
---
---@param explosionType number
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@return boolean result
function isExplosionInArea(explosionType, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/placeObjectRelativeToCar">Open the wiki</a></b>
---
---@param object Object
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
function placeObjectRelativeToCar(object, car, offsetX, offsetY, offsetZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/makeObjectTargettable">Open the wiki</a></b>
---
---@param object Object
---@param targetable boolean
function makeObjectTargettable(object, targetable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addArmourToChar">Open the wiki</a></b>
---
---@param ped Ped
---@param points number
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
--- Вытаскивает персонажа из машины на указанные координаты.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/warpCharFromCarToCoord">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@param placeAtX number координата X.
---@param placeAtY number координата Y.
---@param placeAtZ number координата Z.
function warpCharFromCarToCoord(ped, placeAtX, placeAtY, placeAtZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVisibilityOfClosestObjectOfType">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@param modelId Model
---@param visibility boolean
function setVisibilityOfClosestObjectOfType(atX, atY, atZ, radius, modelId, visibility) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharSpottedChar">Open the wiki</a></b>
---
---@param ped Ped
---@param ped2 Ped
---@return boolean result
function hasCharSpottedChar(ped, ped2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasObjectBeenDamaged">Open the wiki</a></b>
---
---@param object Object
---@return boolean result
function hasObjectBeenDamaged(object) end

---
--- Помещает педа в указанный транспорт<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/warpCharIntoCar">Open the wiki</a></b><br/>
---
---@param ped Ped хендл педа/актера
---@param car Vehicle хендл транспорта
function warpCharIntoCar(ped, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printWith2NumbersBig">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param time number
---@param style number
function printWith2NumbersBig(gxtString, numbers1, numbers2, time, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCameraBehindPlayer">Open the wiki</a></b>
---
function setCameraBehindPlayer() end

---
--- Создает персонажа в заданных координатах с рандомной моделью и поведением пешехода.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createRandomChar">Open the wiki</a></b><br/>
---
---@param atX number координата персонажа X.
---@param atY number координата персонажа Y.
---@param atZ number координата персонажа Z.
---@return Ped ped хэндл персонажа.
function createRandomChar(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSniperBulletInArea">Open the wiki</a></b>
---
---@param float1 number
---@param float2 number
---@param float3 number
---@param float4 number
---@param float5 number
---@param float6 number
---@return boolean result
function isSniperBulletInArea(float1, float2, float3, float4, float5, float6) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectVelocity">Open the wiki</a></b>
---
---@param object Object
---@param velocityInDirectionX number
---@param velocityInDirectionY number
---@param velocityInDirectionZ number
function setObjectVelocity(object, velocityInDirectionX, velocityInDirectionY, velocityInDirectionZ) end

---
--- Устанавливает коллизию определенному объекту.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectCollision">Open the wiki</a></b><br/>
---
---@param object Object хэндл объекта
---@param collision boolean состояние
function setObjectCollision(object, collision) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/printStringInStringNow">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param string GxtString
---@param time1 number
---@param time2 number
function printStringInStringNow(gxtString, string, time1, time2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPointObscuredByAMissionEntity">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@return boolean result
function isPointObscuredByAMissionEntity(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- Загрузка ранее запрошенных моделей<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadAllModelsNow">Open the wiki</a></b><br/>
---
function loadAllModelsNow() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addToObjectVelocity">Open the wiki</a></b>
---
---@param object Object
---@param velocityX number
---@param velocityY number
---@param velocityZ number
function addToObjectVelocity(object, velocityX, velocityY, velocityZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawSprite">Open the wiki</a></b>
---
---@param texture number
---@param positionX number
---@param positionY number
---@param width number
---@param height number
---@param r number
---@param g number
---@param b number
---@param a number
function drawSprite(texture, positionX, positionY, width, height, r, g, b, a) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawRect">Open the wiki</a></b>
---
---@param positionX number
---@param positionY number
---@param width number
---@param height number
---@param r number
---@param g number
---@param b number
---@param a number
function drawRect(positionX, positionY, width, height, r, g, b, a) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadSprite">Open the wiki</a></b>
---
---@param name string
---@return number id
function loadSprite(name) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadTextureDictionary">Open the wiki</a></b>
---
---@param txd string
---@return boolean result
function loadTextureDictionary(txd) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeTextureDictionary">Open the wiki</a></b>
---
function removeTextureDictionary() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectDynamic">Open the wiki</a></b>
---
---@param object Object
---@param moveable boolean
function setObjectDynamic(object, moveable) end

---
--- Устанавливает скорость анимации персонажу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharAnimSpeed">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@param animation string название анимации
---@param speed number скорость анимации
function setCharAnimSpeed(ped, animation, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playMissionPassedTune">Open the wiki</a></b>
---
---@param music number
function playMissionPassedTune(music) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearArea">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@param area boolean
function clearArea(atX, atY, atZ, radius, area) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freezeOnscreenTimer">Open the wiki</a></b>
---
---@param timer boolean
function freezeOnscreenTimer(timer) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchCarSiren">Open the wiki</a></b>
---
---@param car Vehicle
---@param siren boolean
function switchCarSiren(car, siren) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarWatertight">Open the wiki</a></b>
---
---@param car Vehicle
---@param watertight boolean
function setCarWatertight(car, watertight) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCantBeDraggedOut">Open the wiki</a></b>
---
---@param ped Ped
---@param locked boolean
function setCharCantBeDraggedOut(ped, locked) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/turnCarToFaceCoord">Open the wiki</a></b>
---
---@param car Vehicle
---@param coordX number
---@param coordY number
function turnCarToFaceCoord(car, coordX, coordY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawSphere">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
function drawSphere(atX, atY, atZ, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarStatus">Open the wiki</a></b>
---
---@param car Vehicle
---@param action number
function setCarStatus(car, action) end

---
--- Проверяет является ли персонаж мужским.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharMale">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа.
---@return boolean result результат проверки.
function isCharMale(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/policeRadioMessage">Open the wiki</a></b>
---
---@param float1 number
---@param float2 number
---@param float3 number
function policeRadioMessage(float1, float2, float3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarStrong">Open the wiki</a></b>
---
---@param car Vehicle
---@param strong boolean
function setCarStrong(car, strong) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchRubbish">Open the wiki</a></b>
---
---@param int1 boolean
function switchRubbish(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchStreaming">Open the wiki</a></b>
---
---@param streaming boolean
function switchStreaming(streaming) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGarageOpen">Open the wiki</a></b>
---
---@param garage GxtString
---@return boolean result
function isGarageOpen(garage) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGarageClosed">Open the wiki</a></b>
---
---@param garage GxtString
---@return boolean result
function isGarageClosed(garage) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/swapNearestBuildingModel">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@param from Model
---@param to Model
function swapNearestBuildingModel(atX, atY, atZ, radius, from, to) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchWorldProcessing">Open the wiki</a></b>
---
---@param cutsceneOnly boolean
function switchWorldProcessing(cutsceneOnly) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearAreaOfCars">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function clearAreaOfCars(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addSphere">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@return number sphere
function addSphere(atX, atY, atZ, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeSphere">Open the wiki</a></b>
---
---@param sphere number
function removeSphere(sphere) end

---
--- Устанавливает игнорирование пешеходов к игроку.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setEveryoneIgnorePlayer">Open the wiki</a></b><br/>
---
---@param player Player хендл
---@param ignored boolean true - включить игнорирование, false - выключить игнорирование
function setEveryoneIgnorePlayer(player, ignored) end

---
--- Возвращает хендл машины, используемый педом.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/storeCarCharIsInNoSave">Open the wiki</a></b><br/>
---
---@param ped Ped хендл педа/актера
---@return Vehicle car хендл машины
function storeCarCharIsInNoSave(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayOnscreenTimerWithString">Open the wiki</a></b>
---
---@param timer VarId
---@param type number
---@param gxtString GxtString
function displayOnscreenTimerWithString(timer, type, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayOnscreenCounterWithString">Open the wiki</a></b>
---
---@param var VarId
---@param type boolean
---@param gxtString GxtString
function displayOnscreenCounterWithString(var, type, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createRandomCarForCarPark">Open the wiki</a></b>
---
---@param coordsX number
---@param coordsY number
---@param coordsZ number
---@param zAngle number
function createRandomCarForCarPark(coordsX, coordsY, coordsZ, zAngle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setWantedMultiplier">Open the wiki</a></b>
---
---@param sensitivity number
function setWantedMultiplier(sensitivity) end

---
--- Помещает камеру перед игроком, указывая на игрока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCameraInFrontOfPlayer">Open the wiki</a></b><br/>
---
function setCameraInFrontOfPlayer() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarVisiblyDamaged">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
function isCarVisiblyDamaged(car) end

---
--- Проверяет, существует ли объект, возвращает true если объект существует<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesObjectExist">Open the wiki</a></b><br/>
---
---@param object Object хэндл объекта
---@return boolean result результат
function doesObjectExist(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadScene">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
function loadScene(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addStuckCarCheck">Open the wiki</a></b>
---
---@param car Vehicle
---@param stuckCheckDistance number
---@param time number
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
---@return boolean result
function isCarStuck(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadMissionAudio">Open the wiki</a></b>
---
---@param asId number
---@param name number
function loadMissionAudio(asId, name) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasMissionAudioLoaded">Open the wiki</a></b>
---
---@param id number
---@return boolean result
function hasMissionAudioLoaded(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playMissionAudio">Open the wiki</a></b>
---
---@param id number
function playMissionAudio(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasMissionAudioFinished">Open the wiki</a></b>
---
---@param id number
---@return boolean result
function hasMissionAudioFinished(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClosestCarNodeWithHeading">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@return number nodeX
---@return number nodeY
---@return number nodeZ
---@return number angle
function getClosestCarNodeWithHeading(X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasImportGarageSlotBeenFilled">Open the wiki</a></b>
---
---@param int1 number
---@param int2 number
---@return boolean result
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
---@param id number
---@param locationX number
---@param locationY number
---@param locationZ number
function setMissionAudioPosition(id, locationX, locationY, locationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/activateSaveMenu">Open the wiki</a></b>
---
function activateSaveMenu() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasSaveGameFinished">Open the wiki</a></b>
---
---@return boolean result
function hasSaveGameFinished() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/noSpecialCameraForThisGarage">Open the wiki</a></b>
---
---@param int1 number
function noSpecialCameraForThisGarage(int1) end

---
--- Создает маркер над пикапом.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlipForPickup">Open the wiki</a></b><br/>
---
---@param pickup Pickup Хендл пикапа.
---@return Marker marker Хендл маркера.
function addBlipForPickup(pickup) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPedDensityMultiplier">Open the wiki</a></b>
---
---@param multiplier number
function setPedDensityMultiplier(multiplier) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextDrawBeforeFade">Open the wiki</a></b>
---
---@param int1 boolean
function setTextDrawBeforeFade(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCollectable1sCollected">Open the wiki</a></b>
---
---@return number collected
function getCollectable1sCollected() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSpritesDrawBeforeFade">Open the wiki</a></b>
---
---@param antialiased boolean
function setSpritesDrawBeforeFade(antialiased) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextRightJustify">Open the wiki</a></b>
---
---@param alignRight boolean
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
---@param hudComponent number
function flashHudObject(hudComponent) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGenerateCarsAroundCamera">Open the wiki</a></b>
---
---@param int1 boolean
function setGenerateCarsAroundCamera(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearSmallPrints">Open the wiki</a></b>
---
function clearSmallPrints() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpsidedownCarNotDamaged">Open the wiki</a></b>
---
---@param car Vehicle
---@param disableFlippedExplosion boolean
function setUpsidedownCarNotDamaged(car, disableFlippedExplosion) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerControllable">Open the wiki</a></b>
---
---@param player Player
---@return boolean result
function isPlayerControllable(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/makePlayerSafe">Open the wiki</a></b>
---
---@param player Player
---@param flag number
---@param time number
function setPlayerMood(player, flag, time) end

---
--- Получает цвета автомобиля.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarColours">Open the wiki</a></b><br/>
---
---@param car Vehicle Хендл машины.
---@return number primaryColor Первичный цвет.
---@return number secondaryColor Вторичный цвет.
function getCarColours(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAllCarsCanBeDamaged">Open the wiki</a></b>
---
---@param enable boolean
function setAllCarsCanBeDamaged(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCanBeDamaged">Open the wiki</a></b>
---
---@param car Vehicle
---@param enable boolean
function setCarCanBeDamaged(car, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setDrunkInputDelay">Open the wiki</a></b>
---
---@param player Player
---@param handlingResponsiveness number
function setDrunkInputDelay(player, handlingResponsiveness) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharMoney">Open the wiki</a></b>
---
---@param ped Ped
---@param money number
function setCharMoney(ped, money) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getOffsetFromObjectInWorldCoords">Open the wiki</a></b>
---
---@param object Object
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@return number X
---@return number Y
---@return number Z
function getOffsetFromObjectInWorldCoords(object, offsetX, offsetY, offsetZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getOffsetFromCarInWorldCoords">Open the wiki</a></b>
---
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@return number X
---@return number Y
---@return number Z
function getOffsetFromCarInWorldCoords(car, offsetX, offsetY, offsetZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearMissionAudio">Open the wiki</a></b>
---
---@param id number
function clearMissionAudio(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFreeHealthCare">Open the wiki</a></b>
---
---@param player Player
---@param free boolean
function setFreeHealthCare(player, free) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadAndLaunchMissionInternal">Open the wiki</a></b>
---
---@param mission number
function loadAndLaunchMissionInternal(mission) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectDrawLast">Open the wiki</a></b>
---
---@param object Object
---@param drawLast boolean
function setObjectDrawLast(object, drawLast) end

---
--- Получает количество патронов у персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAmmoInCharWeapon">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@param number number ID оружия
---@return number ammo количество патронов
function getAmmoInCharWeapon(ped, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setNearClip">Open the wiki</a></b>
---
---@param clip number
function setNearClip(clip) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRadioChannel">Open the wiki</a></b>
---
---@param radioStation number
function setRadioChannel(radioStation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarTraction">Open the wiki</a></b>
---
---@param car Vehicle
---@param traction number
function setCarTraction(car, traction) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/areMeasurementsInMetres">Open the wiki</a></b>
---
---@return boolean result
function areMeasurementsInMetres() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertMetresToFeet">Open the wiki</a></b>
---
---@param meters number
---@return number feet
function convertMetresToFeet(meters) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarAvoidLevelTransitions">Open the wiki</a></b>
---
---@param car Vehicle
---@param avoidLevelTransitions boolean
function setCarAvoidLevelTransitions(car, avoidLevelTransitions) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearAreaOfChars">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function clearAreaOfChars(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTotalNumberOfMissions">Open the wiki</a></b>
---
---@param totalMissions number
function setTotalNumberOfMissions(totalMissions) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/convertMetresToFeetInt">Open the wiki</a></b>
---
---@param metric number
---@return number imperial
function convertMetresToFeetInt(metric) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerFastestTime">Open the wiki</a></b>
---
---@param stat number
---@param to number
function registerFastestTime(stat, to) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerHighestScore">Open the wiki</a></b>
---
---@param int1 number
---@param int2 number
function registerHighestScore(int1, int2) end

---
--- Телепортирует персонажа в автомобиль на выбранное сидение<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/warpCharIntoCarAsPassenger">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@param car Vehicle хэндл машины
---@param passengerSeat number номер сидения
function warpCharIntoCarAsPassenger(ped, car, passengerSeat) end

---
--- Проверяет, доступно ли пассажирское сидение<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarPassengerSeatFree">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл транспорта
---@param seat number номер сидения
---@return boolean result результат проверки
function isCarPassengerSeatFree(car, seat) end

---
--- Получает хэндл игрока, который сидит на сидении транспортного средства<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharInCarPassengerSeat">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@param seat number номер сидения
---@return Ped ped хэндл персонажа
function getCharInCarPassengerSeat(car, seat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharIsChrisCriminal">Open the wiki</a></b>
---
---@param ped Ped
---@param flag boolean
function setCharIsChrisCriminal(ped, flag) end

---
--- Вызывает титры после прохождения игры на экран.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startCredits">Open the wiki</a></b><br/>
---
function startCredits() end

---
--- Убирает титры после прохождения игры с экрана.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/stopCredits">Open the wiki</a></b><br/>
---
function stopCredits() end

---
--- Проверяет, закончились ли титры окончания игры.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/areCreditsFinished">Open the wiki</a></b><br/>
---
---@return boolean result Результат проверки
function areCreditsFinished() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMusicDoesFade">Open the wiki</a></b>
---
---@param enable boolean
function setMusicDoesFade(enable) end

---
--- Возвращает ID транспорта по хендл машины<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarModel">Open the wiki</a></b><br/>
---
---@param veh Vehicle хендл машины
---@return Model modelId ID транспорта
function getCarModel(veh) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/areAnyCarCheatsActivated">Open the wiki</a></b>
---
---@return boolean result
function areAnyCarCheatsActivated() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharSuffersCriticalHits">Open the wiki</a></b>
---
---@param ped Ped
---@param enable boolean
function setCharSuffersCriticalHits(ped, enable) end

---
--- Проверяет, сидит ли хэндл в указанном т/c<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharSittingInCar">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа игрока
---@param car Vehicle хэндл т/с
---@return boolean result результат
function isCharSittingInCar(ped, car) end

---
--- Проверяет находится ли игрок в любой машине<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharSittingInAnyCar">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл
---@return boolean result результат
function isCharSittingInAnyCar(ped) end

---
--- Проверяет не находится ли персонаж в транспорте.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharOnFoot">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@return boolean result результат проверки
function isCharOnFoot(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadSplashScreen">Open the wiki</a></b>
---
---@param gxtString GxtString
function loadSplashScreen(gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setJamesCarOnPathToPlayer">Open the wiki</a></b>
---
---@param int1 number
function setJamesCarOnPathToPlayer(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectRotation">Open the wiki</a></b>
---
---@param object Object
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function setObjectRotation(object, rotationX, rotationY, rotationZ) end

---
--- Возвращает позицию отладочной камеры.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDebugCameraCoordinates">Open the wiki</a></b><br/>
---
---@return number X координаты
---@return number Y координаты
---@return number Z координаты
function getDebugCameraCoordinates() end

---
--- Проверяет, целится ли игрок в конкретного персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerTargettingChar">Open the wiki</a></b><br/>
---
---@param player Player хэндл игрока
---@param ped Ped хэндл персонажа
---@return boolean result результат проверки
function isPlayerTargettingChar(player, ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerTargettingObject">Open the wiki</a></b>
---
---@param player Player
---@param object Object
---@return boolean result
function isPlayerTargettingObject(player, object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayTextWithNumber">Open the wiki</a></b>
---
---@param x number
---@param y number
---@param gxtString GxtString
---@param number number
function displayTextWithNumber(x, y, gxtString, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayTextWith2Numbers">Open the wiki</a></b>
---
---@param x number
---@param y number
---@param gxtString GxtString
---@param numbersX number
---@param numbersY number
function displayTextWith2Numbers(x, y, gxtString, numbersX, numbersY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/failCurrentMission">Open the wiki</a></b>
---
function failCurrentMission() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setInterpolationParameters">Open the wiki</a></b>
---
---@param delay number
---@param time number
function setInterpolationParameters(delay, time) end

---
--- Возвращает координаты на которые указывает отладочная камера.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDebugCameraPointAt">Open the wiki</a></b><br/>
---
---@return number X координаты
---@return number Y координаты
---@return number Z координаты
function getDebugCameraPointAt() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCharToCar">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param position number
---@param shootingAngleLimit number
---@param weapon number
function attachCharToCar(ped, car, offsetX, offsetY, offsetZ, position, shootingAngleLimit, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/detachCharFromCar">Open the wiki</a></b>
---
---@param ped Ped
---@param can boolean
function setCharCanBeShotInVehicle(ped, can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarStayInFastLane">Open the wiki</a></b>
---
---@param car Vehicle
---@param flag boolean
function setCarStayInFastLane(car, flag) end

---
--- Очищает последний урон нанесённый персонажу.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCharLastWeaponDamage">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
function clearCharLastWeaponDamage(ped) end

---
--- Очищает последний нанесенный урон машине.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCarLastWeaponDamage">Open the wiki</a></b><br/>
---
---@param car Vehicle хендл машины
function clearCarLastWeaponDamage(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCopInArea">Open the wiki</a></b>
---
---@param float1 number
---@param float2 number
---@param float3 number
---@param float4 number
---@param int5 boolean
---@param int6 boolean
---@param int7 boolean
---@param int8 boolean
---@param int9 boolean
---@return number int10
function getRandomCopInArea(float1, float2, float3, float4, int5, int6, int7, int8, int9) end

---
--- Возвращает водителя указанного транспортного средства<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDriverOfCar">Open the wiki</a></b><br/>
---
---@param car Vehicle скриптовый хендл транспортного средства
---@return Ped ped скриптовый хендл персонажа
function getDriverOfCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumberOfFollowers">Open the wiki</a></b>
---
---@param ped Ped
---@return number followers
function getNumberOfFollowers(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/giveRemoteControlledModelToPlayer">Open the wiki</a></b>
---
---@param player Player
---@param atX number
---@param atY number
---@param atZ number
---@param angle number
---@param RCModel Model
function giveRemoteControlledModelToPlayer(player, atX, atY, atZ, angle, RCModel) end

---
--- Получает оружие находящееся в руках у персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentCharWeapon">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@return number weapon оружие
function getCurrentCharWeapon(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansObject2d">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansObject2d(ped, object, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFootObject2d">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharOnFootObject2d(ped, object, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCarObject2d">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharInCarObject2d(ped, object, radiusX, radiusY, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansObject3d">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansObject3d(ped, object, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharOnFootObject3d">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharOnFootObject3d(ped, object, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateCharInCarObject3d">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharInCarObject3d(ped, object, radiusX, radiusY, radiusZ, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarTempAction">Open the wiki</a></b>
---
---@param car Vehicle
---@param action number
---@param time number
function setCarTempAction(car, action, time) end

---
--- Возвращает <code>true</code> если пед находится на мотоцикле/велосипеде<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharOnAnyBike">Open the wiki</a></b><br/>
---
---@param ped Ped хендл педа/актера
---@return boolean result
function isCharOnAnyBike(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/canCharSeeDeadChar">Open the wiki</a></b>
---
---@param ped Ped
---@param pedtype number
---@return boolean result
function canCharSeeDeadChar(ped, pedtype) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setEnterCarRangeMultiplier">Open the wiki</a></b>
---
---@param float1 number
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
---@return boolean result
function isPcVersion() end

---
--- Проверяет доступна ли модель для использования.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isModelAvailable">Open the wiki</a></b><br/>
---
---@param modelId Model Номер модели.
---@return boolean result Результат.
function isModelAvailable(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shutCharUp">Open the wiki</a></b>
---
---@param ped Ped
---@param muted boolean
function shutCharUp(ped, muted) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setEnableRcDetonate">Open the wiki</a></b>
---
---@param detonation boolean
function setEnableRcDetonate(detonation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarRandomRouteSeed">Open the wiki</a></b>
---
---@param car Vehicle
---@param routeSeed number
function setCarRandomRouteSeed(car, routeSeed) end

---
--- Проверяет есть ли на указанных координатах любой пикап.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isAnyPickupAtCoords">Open the wiki</a></b><br/>
---
---@param pickupX number
---@param pickupY number
---@param pickupZ number Координаты (XYZ)
---@return boolean result Результат.
function isAnyPickupAtCoords(pickupX, pickupY, pickupZ) end

---
--- Удаляет все оружие у персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeAllCharWeapons">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
function removeAllCharWeapons(ped) end

---
--- Проверяет наличие указанного оружия у персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharGotWeapon">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@param weapon number ID оружия
---@return boolean result результат проверки
function hasCharGotWeapon(ped, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTankDetonateCars">Open the wiki</a></b>
---
---@param tank number
---@param detonate boolean
function setTankDetonateCars(tank, detonate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPositionOfAnalogueSticks">Open the wiki</a></b>
---
---@param joystick number
---@return number offset1
---@return number offset2
---@return number offset3
---@return number offset4
function getPositionOfAnalogueSticks(joystick) end

---
--- Проверяет, горит ли автомобиль.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarOnFire">Open the wiki</a></b><br/>
---
---@param car Vehicle хендл машины
---@return boolean state состояние автомобиля
function isCarOnFire(car) end

---
--- Возвращает <code>true</code> при спущенном колесе автомобиля<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarTireBurst">Open the wiki</a></b><br/>
---
---@param car Vehicle автомобиль
---@param tire number номер колеса
---@return boolean result
function isCarTireBurst(car, tire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/initialiseObjectPath">Open the wiki</a></b>
---
---@param int1 number
---@param float2 number
function initialiseObjectPath(int1, float2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectPathSpeed">Open the wiki</a></b>
---
---@param int1 number
---@param int2 number
function setObjectPathSpeed(int1, int2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectPathPosition">Open the wiki</a></b>
---
---@param int1 number
---@param float2 number
function setObjectPathPosition(int1, float2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearObjectPath">Open the wiki</a></b>
---
---@param int1 number
function clearObjectPath(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/heliGotoCoords">Open the wiki</a></b>
---
---@param heli Vehicle
---@param toX number
---@param toY number
---@param toZ number
---@param altitudeMin number
---@param altitudeMax number
function heliGotoCoords(heli, toX, toY, toZ, altitudeMin, altitudeMax) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDeadCharPickupCoords">Open the wiki</a></b>
---
---@param ped Ped
---@return number coordsX
---@return number coordsY
---@return number coordsZ
function getDeadCharPickupCoords(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createProtectionPickup">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param int4 number
---@param int5 number
---@return Pickup pickup
function createProtectionPickup(atX, atY, atZ, int4, int5) end

---
--- Проверяет педа на нахождение в т/c типа "Лодка"<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyBoat">Open the wiki</a></b><br/>
---
---@param ped Ped
---@return boolean result
function isCharInAnyBoat(ped) end

---
--- Проверяет педа на нахождение в т/с типа "Вертолет"<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyHeli">Open the wiki</a></b><br/>
---
---@param ped Ped
---@return boolean result
function isCharInAnyHeli(ped) end

---
--- Проверяет хэндл на нахождение в т/с типа "Самолёт"<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyPlane">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл
---@return boolean result результат
function isCharInAnyPlane(ped) end

---
--- Проверяет педа на нахождение в воде<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInWater">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл игрока
---@return boolean result
function isCharInWater(ped) end

---
--- Получает данные об оружии в указанном слоте.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharWeaponInSlot">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@param slot number номер слота
---@return number weapon ID оружия
---@return number ammo количество патронов к оружию
---@return Model model модель оружия
function getCharWeaponInSlot(ped, slot) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClosestStraightRoad">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param height number
---@param radius number
---@return number float6
---@return number float7
---@return number float8
---@return number float9
---@return number float10
---@return number float11
---@return number float12
function getClosestStraightRoad(atX, atY, atZ, height, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarForwardSpeed">Open the wiki</a></b>
---
---@param car Vehicle
---@param speed number
function setCarForwardSpeed(car, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setInteriorVisible">Open the wiki</a></b>
---
---@param interior number
function setInteriorVisible(interior) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markCarAsConvoyCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param convoy boolean
function markCarAsConvoyCar(car, convoy) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/resetHavocCausedByPlayer">Open the wiki</a></b>
---
---@param int1 number
function resetHavocCausedByPlayer(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getHavocCausedByPlayer">Open the wiki</a></b>
---
---@param int1 number
---@return number int2
function getHavocCausedByPlayer(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createScriptRoadblock">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@param type number
function createScriptRoadblock(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearAllScriptRoadblocks">Open the wiki</a></b>
---
function clearAllScriptRoadblocks() end

---
--- Возвращает позицию педа с указанным смещением<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getOffsetFromCharInWorldCoords">Open the wiki</a></b><br/>
---
---@param ped Ped хендл педа/актера
---@param offsetX number смещение по оси X
---@param offsetY number смещение по оси Y
---@param offsetZ number смещение по оси Z
---@return number X позиция по оси X
---@return number Y позиция по оси Y
---@return number Z позиция по оси Z
function getOffsetFromCharInWorldCoords(ped, offsetX, offsetY, offsetZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharBeenPhotographed">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function hasCharBeenPhotographed(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchSecurityCamera">Open the wiki</a></b>
---
---@param int1 boolean
function switchSecurityCamera(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInFlyingVehicle">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function isCharInFlyingVehicle(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addShortRangeSpriteBlipForCoord">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param icon number
---@return Marker marker
function addShortRangeSpriteBlipForCoord(atX, atY, atZ, icon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeliOrientation">Open the wiki</a></b>
---
---@param heli Vehicle
---@param angle number
function setHeliOrientation(heli, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearHeliOrientation">Open the wiki</a></b>
---
---@param heli Vehicle
function clearHeliOrientation(heli) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/planeGotoCoords">Open the wiki</a></b>
---
---@param plane number
---@param X number
---@param Y number
---@param Z number
---@param z1 number
---@param z2 number
function planeGotoCoords(plane, X, Y, Z, z1, z2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNthClosestCarNode">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@param type number
---@return number X
---@return number Y
---@return number Z
function getNthClosestCarNode(X, Y, Z, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawWeaponshopCorona">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param type number
---@param flare number
---@param r number
---@param g number
---@param b number
function drawWeaponshopCorona(X, Y, Z, radius, type, flare, r, g, b) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setEnableRcDetonateOnContact">Open the wiki</a></b>
---
---@param enable boolean
function setEnableRcDetonateOnContact(enable) end

---
--- Замораживает координаты персонажа по его хендлу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freezeCharPosition">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа
---@param locked boolean Статус заморозки
function freezeCharPosition(ped, locked) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharDrownsInWater">Open the wiki</a></b>
---
---@param ped Ped
---@param drowns boolean
function setCharDrownsInWater(ped, drowns) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectRecordsCollisions">Open the wiki</a></b>
---
---@param object Object
---@param set boolean
function setObjectRecordsCollisions(object, set) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasObjectCollidedWithAnything">Open the wiki</a></b>
---
---@param object Object
---@return boolean result
function hasObjectCollidedWithAnything(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeRcBuggy">Open the wiki</a></b>
---
function removeRcBuggy() end

---
--- Возвращает количество брони у педа<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharArmour">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@return number armour значение брони
function getCharArmour(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeliStabiliser">Open the wiki</a></b>
---
---@param heli Vehicle
---@param limiter boolean
function setHeliStabiliser(heli, limiter) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarStraightLineDistance">Open the wiki</a></b>
---
---@param car Vehicle
---@param radius number
function setCarStraightLineDistance(car, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/popCarBoot">Open the wiki</a></b>
---
---@param car Vehicle
---@param timeMS number
function taskEnterCarAsDriver(ped, car, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shutPlayerUp">Open the wiki</a></b>
---
---@param player Player
---@param shut boolean
function shutPlayerUp(player, shut) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerMood">Open the wiki</a></b>
---
---@param player Player
---@param flag number
---@param time number
function setPlayerMood(player, flag, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/requestCollision">Open the wiki</a></b>
---
---@param X number
---@param Y number
function requestCollision(X, Y) end

---
--- Проверяет нахождение объекта в указанных координат в определенном радиусе<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateObject2d">Open the wiki</a></b><br/>
---
---@param object Object
---@param X number Позиция по оси X
---@param Y number Позиция по оси Y
---@param radiusX number Дистанция проверки по оси X
---@param radiusY number Дистанция проверки по оси Y
---@param sphere boolean Отображать проверяемую дистанцию в виде сферы
---@return boolean result
function locateObject2d(object, X, Y, radiusX, radiusY, sphere) end

---
--- Проверяет нахождение объекта в указанных координат в определенном радиусе<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/locateObject3d">Open the wiki</a></b><br/>
---
---@param object Object
---@param X number Позиция по оси X
---@param Y number Позиция по оси Y
---@param Z number Позиция по оси Z
---@param radiusX number Дистанция проверки по оси X
---@param radiusY number Дистанция проверки по оси Y
---@param radiusZ number Дистанция проверки по оси Z
---@param sphere boolean Отображать проверяемую дистанцию в виде сферы
---@return boolean result
function locateObject3d(object, X, Y, Z, radiusX, radiusY, radiusZ, sphere) end

---
--- Проверяет нахождение объекта в воде<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectInWater">Open the wiki</a></b><br/>
---
---@param object Object
---@return boolean result
function isObjectInWater(object) end

---
--- Проверяет нахождение объекта в указанном квадрате<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectInArea2d">Open the wiki</a></b><br/>
---
---@param object Object
---@param cornerAX number Начальная координата по оси X
---@param cornerAY number Начальная координата по оси Y
---@param cornerBX number Конечная координата по оси X
---@param cornerBY number Конечная координата по оси Y
---@param sphere boolean Отображать границы квадрата в виде сферы
---@return boolean result
function isObjectInArea2d(object, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- Проверяет нахождение объекта в указанном кубе<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectInArea3d">Open the wiki</a></b><br/>
---
---@param object Object
---@param cornerAX number Начальная координата по оси X
---@param cornerAY number Начальная координата по оси Y
---@param cornerAZ number Начальная координата по оси Z
---@param cornerBX number Конечная координата по оси X
---@param cornerBY number Конечная координата по оси Y
---@param cornerBZ number Конечная координата по оси Z
---@param flag boolean Отображать границы куба в виде сферы
---@return boolean result
function isObjectInArea3d(object, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, flag) end

---
--- Заставляет персонажа присесть (как на кнопку <code>C</code>) или наоборот, встать.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskToggleDuck">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@param crouch boolean если true, персонаж присядет, если false - встанет.
function taskToggleDuck(ped, crouch) end

---
--- Предварительная загрузка файла анимации<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/requestAnimation">Open the wiki</a></b><br/>
---
---@param animation string файл анимаций
function requestAnimation(animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasAnimationLoaded">Open the wiki</a></b>
---
---@param animation string
---@return boolean result
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
---@return boolean result
function isCharWaitingForWorldCollision(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarWaitingForWorldCollision">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
function isCarWaitingForWorldCollision(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCharToObject">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param orientation number
---@param angle number
---@param lockWeapon number
function attachCharToObject(ped, object, offsetX, offsetY, offsetZ, orientation, angle, lockWeapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayNthOnscreenCounterWithString">Open the wiki</a></b>
---
---@param text VarId
---@param type number
---@param line number
---@param gxtString GxtString
function displayNthOnscreenCounterWithString(text, type, line, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addSetPiece">Open the wiki</a></b>
---
---@param type number
---@param rectX1 number
---@param rectY1 number
---@param rectX2 number
---@param rectY2 number
---@param spawnAX number
---@param spawnAY number
---@param headedTowards1X number
---@param headedTowards1Y number
---@param spawnBX number
---@param spawnBY number
---@param headedTowards2X number
---@param headedTowards2Y number
function addSetPiece(
	type,
	rectX1,
	rectY1,
	rectX2,
	rectY2,
	spawnAX,
	spawnAY,
	headedTowards1X,
	headedTowards1Y,
	spawnBX,
	spawnBY,
	headedTowards2X,
	headedTowards2Y
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setExtraColours">Open the wiki</a></b>
---
---@param color number
---@param fade boolean
function setExtraColours(color, fade) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearExtraColours">Open the wiki</a></b>
---
---@param fade boolean
function clearExtraColours(fade) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getWheelieStats">Open the wiki</a></b>
---
---@param player Player
---@return number twowheelstime
---@return number twowheelsdistance
---@return number wheelietime
---@return number wheelieDistance
---@return number stoppieTime
---@return number stoppieDistance
function getWheelieStats(player) end

---
--- Спускает шину у автомобиля.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/burstCarTire">Open the wiki</a></b><br/>
---
---@param car Vehicle скриптовый хендл транспортного средства
---@param tire number шина
function burstCarTire(car, tire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerWearing">Open the wiki</a></b>
---
---@param player Player
---@param bodypart string
---@param skin number
---@return boolean result
function isPlayerWearing(player, bodypart, skin) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerCanDoDriveBy">Open the wiki</a></b>
---
---@param player Player
---@param mode boolean
function setPlayerCanDoDriveBy(player, mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createSwatRope">Open the wiki</a></b>
---
---@param pedtype number
---@param modelId Model
---@param X number
---@param Y number
---@param Z number
---@return number handleAs
function createSwatRope(pedtype, modelId, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarModelComponents">Open the wiki</a></b>
---
---@param car Model
---@param variation1 number
---@param variation2 number
function setCarModelComponents(car, variation1, variation2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/closeAllCarDoors">Open the wiki</a></b>
---
---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarFront(car, followCar) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords2d">Open the wiki</a></b>
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number distance
function getDistanceBetweenCoords2d(x1, y1, x2, y2) end

---
--- Получение дистанции между двумя точками в игровом мире (3D)<br/>
---
--- ### Пример использования<br/>
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
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords3d">Open the wiki</a></b><br/>
---
---@param x1 number координата X первой точки
---@param y1 number координата Y первой точки
---@param z1 number координата Z первой точки
---@param x2 number координата X второй точки
---@param y2 number координата Y второй точки
---@param z2 number координата Z второй точки
---@return number distance дистанция
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
---@return number level
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
---@param number number
function printHelpForeverWithNumber(text, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createLockedPropertyPickup">Open the wiki</a></b>
---
---@param pX number
---@param pY number
---@param pZ number
---@param gxtString GxtString
---@return Pickup pickup
function createLockedPropertyPickup(pX, pY, pZ, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createForsalePropertyPickup">Open the wiki</a></b>
---
---@param pX number
---@param pY number
---@param pZ number
---@param price number
---@param gxtString GxtString
---@return Pickup pickup
function createForsalePropertyPickup(pX, pY, pZ, price, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freezeCarPosition">Open the wiki</a></b>
---
---@param car Vehicle
---@param locked boolean
function freezeCarPosition(car, locked) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByChar">Open the wiki</a></b>
---
---@param ped Ped
---@param byActor Ped
---@return boolean result
function hasCharBeenDamagedByChar(ped, byActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByCar">Open the wiki</a></b>
---
---@param ped Ped
---@param byCar Vehicle
---@return boolean result
function hasCharBeenDamagedByCar(ped, byCar) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByChar">Open the wiki</a></b>
---
---@param car Vehicle
---@param byActor Ped
---@return boolean result
function hasCarBeenDamagedByChar(car, byActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param byCar Vehicle
---@return boolean result
function hasCarBeenDamagedByCar(car, byCar) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRadioChannel">Open the wiki</a></b>
---
---@return number radio
function getRadioChannel() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharStayInCarWhenJacked">Open the wiki</a></b>
---
---@param ped Ped
---@param stay boolean
function setCharStayInCarWhenJacked(ped, stay) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerDrunkenness">Open the wiki</a></b>
---
---@param player Player
---@param drunk number
function setPlayerDrunkenness(player, drunk) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInAreaNoSave">Open the wiki</a></b>
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param modelId Model
---@return Vehicle car
function getRandomCarOfTypeInAreaNoSave(x1, y1, x2, y2, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCanBurstCarTires">Open the wiki</a></b>
---
---@param car Vehicle
---@param vulnerability boolean
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
---@param maker number
function setCharDecisionMaker(ped, maker) end

---@param shadow number
---@param r number
---@param g number
---@param b number
---@param a number
function setTextDropshadow(shadow, r, g, b, a) end

---@param car Vehicle
---@return boolean result
function isCharTouchingVehicle(ped, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCanBeShotInVehicle">Open the wiki</a></b>
---
---@param ped Ped
---@param can boolean
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
---@param animation string
---@return boolean result
function isCharPlayingAnim(ped, animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCarLastDamageEntity">Open the wiki</a></b>
---
---@param car Vehicle
function clearCarLastDamageEntity(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freezeObjectPosition">Open the wiki</a></b>
---
---@param object Object
---@param freeze boolean
function freezeObjectPosition(object, freeze) end

---
--- Удаляет указанное оружие у персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeWeaponFromChar">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@param weapon number ID оружия
function removeWeaponFromChar(ped, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/makePlayerFireProof">Open the wiki</a></b>
---
---@param player Player
---@param fireproof boolean
function makePlayerFireProof(player, fireproof) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/increasePlayerMaxHealth">Open the wiki</a></b>
---
---@param player Player
---@param increase number
function increasePlayerMaxHealth(player, increase) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/increasePlayerMaxArmour">Open the wiki</a></b>
---
---@param player Player
---@param increase number
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
---@param seat number
---@return Ped ped
function createRandomCharAsPassenger(car, seat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/ensurePlayerHasDriveByWeapon">Open the wiki</a></b>
---
---@param player Player
---@param ammo number
function ensurePlayerHasDriveByWeapon(player, ammo) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/makeHeliComeCrashingDown">Open the wiki</a></b>
---
---@param heli Vehicle
function makeHeliComeCrashingDown(heli) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addExplosionNoSound">Open the wiki</a></b>
---
---@param pX number
---@param pY number
---@param pZ number
---@param type number
function addExplosionNoSound(pX, pY, pZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/linkObjectToInterior">Open the wiki</a></b>
---
---@param object Object
---@param interior number
function linkObjectToInterior(object, interior) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharNeverTargetted">Open the wiki</a></b>
---
---@param ped Ped
---@param untargetable boolean
function setCharNeverTargetted(ped, untargetable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/wasCutsceneSkipped">Open the wiki</a></b>
---
---@return boolean result
function wasCutsceneSkipped() end

---
--- Проверяет управляет ли хэндл полицейской машиной<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyPoliceVehicle">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл
---@return boolean result результат
function isCharInAnyPoliceVehicle(ped) end

---
--- Проверяет хэндл на существование<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesCharExist">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл
---@return boolean result результат
function doesCharExist(ped) end

---
--- Проверяет существование транспорта.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesVehicleExist">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл транспорта
---@return boolean result результат проверки
function doesVehicleExist(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addShortRangeSpriteBlipForContactPoint">Open the wiki</a></b>
---
---@param pX number
---@param pY number
---@param pZ number
---@param icon number
---@return Marker blip
function addShortRangeSpriteBlipForContactPoint(pX, pY, pZ, icon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAllTaxisHaveNitro">Open the wiki</a></b>
---
---@param toggle boolean
function setAllTaxisHaveNitro(toggle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freezeCarPositionAndDontLoadCollision">Open the wiki</a></b>
---
---@param car Vehicle
---@param keep boolean
function freezeCarPositionAndDontLoadCollision(car, keep) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/freezeCharPositionAndDontLoadCollision">Open the wiki</a></b>
---
---@param ped Ped
---@param keep boolean
function freezeCharPositionAndDontLoadCollision(ped, keep) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerIsInStadium">Open the wiki</a></b>
---
---@param set boolean
function setPlayerIsInStadium(set) end

---
--- <br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayRadar">Open the wiki</a></b><br/>
---
function displayRadar(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerBestPosition">Open the wiki</a></b>
---
---@param stat number
---@param number number
function registerBestPosition(stat, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerInInfoZone">Open the wiki</a></b>
---
---@param player Player
---@param zone GxtString
---@return boolean result
function isPlayerInInfoZone(player, zone) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setLoadCollisionForCarFlag">Open the wiki</a></b>
---
---@param car Vehicle
---@param enable boolean
function setLoadCollisionForCarFlag(car, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setLoadCollisionForCharFlag">Open the wiki</a></b>
---
---@param ped Ped
---@param enable boolean
function setLoadCollisionForCharFlag(ped, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBigGunFlash">Open the wiki</a></b>
---
---@param fromX number
---@param fromY number
---@param fromZ number
---@param toX number
---@param toY number
---@param toZ number
function addBigGunFlash(fromX, fromY, fromZ, toX, toY, toZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getProgressPercentage">Open the wiki</a></b>
---
---@return number progress
function getProgressPercentage() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleToFadeIn">Open the wiki</a></b>
---
---@param car Vehicle
---@param flag number
function setVehicleToFadeIn(car, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerOddjobMissionPassed">Open the wiki</a></b>
---
function registerOddjobMissionPassed() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerInShortcutTaxi">Open the wiki</a></b>
---
---@param player Player
---@return boolean result
function isPlayerInShortcutTaxi(player) end

---
--- Проверяет сидит ли персонаж<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharDucking">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@return boolean result результат проверки
function isCharDucking(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setOnscreenCounterFlashWhenFirstDisplayed">Open the wiki</a></b>
---
---@param text VarId
---@param flashing boolean
function setOnscreenCounterFlashWhenFirstDisplayed(text, flashing) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shuffleCardDecks">Open the wiki</a></b>
---
---@param shuffle boolean
function shuffleCardDecks(shuffle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fetchNextCard">Open the wiki</a></b>
---
---@return number card
function fetchNextCard() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectVelocity">Open the wiki</a></b>
---
---@param object Object
---@return number vecX
---@return number vecY
---@return number vecZ
function getObjectVelocity(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isDebugCameraOn">Open the wiki</a></b>
---
---@return boolean result
function isDebugCameraOn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addToObjectRotationVelocity">Open the wiki</a></b>
---
---@param object Object
---@param vecX number
---@param vecY number
---@param vecZ number
function addToObjectRotationVelocity(object, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectRotationVelocity">Open the wiki</a></b>
---
---@param object Object
---@param vecX number
---@param vecY number
---@param vecZ number
function setObjectRotationVelocity(object, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectStatic">Open the wiki</a></b>
---
---@param object Object
---@return boolean result
function isObjectStatic(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAngleBetween2dVectors">Open the wiki</a></b>
---
---@param vecX number
---@param vecY number
---@param vecX2 number
---@param vecY2 number
---@return number angle
function getAngleBetween2dVectors(vecX, vecY, vecX2, vecY2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/do2dRectanglesCollide">Open the wiki</a></b>
---
---@param areaX number
---@param areaY number
---@param scaleX number
---@param scaleY number
---@param overlapareaX number
---@param overlapareaY number
---@param overlapscaleX number
---@param overlapscaleY number
---@return boolean result
function do2dRectanglesCollide(
	areaX,
	areaY,
	scaleX,
	scaleY,
	overlapareaX,
	overlapareaY,
	overlapscaleX,
	overlapscaleY
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectRotationVelocity">Open the wiki</a></b>
---
---@param object Object
---@return number axisX
---@return number axisY
---@return number axisZ
function getObjectRotationVelocity(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addVelocityRelativeToObjectVelocity">Open the wiki</a></b>
---
---@param object Object
---@param vecX number
---@param vecY number
---@param vecZ number
function addVelocityRelativeToObjectVelocity(object, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectSpeed">Open the wiki</a></b>
---
---@param object Object
---@return number speed
function getObjectSpeed(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/get2dLinesIntersectPoint">Open the wiki</a></b>
---
---@param l1x1 number
---@param l1y1 number
---@param l1x2 number
---@param l1y2 number
---@param l2x1 number
---@param l2y1 number
---@param l2x2 number
---@param l2y2 number
---@return boolean result
---@return number X
---@return number Y
function get2dLinesIntersectPoint(l1x1, l1y1, l1x2, l1y2, l2x1, l2y1, l2x2, l2y2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPause">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS number
function taskPause(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskStandStill">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS number
function taskStandStill(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFallAndGetUp">Open the wiki</a></b>
---
---@param ped Ped
---@param int2 boolean
---@param time number
function taskFallAndGetUp(ped, int2, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskJump">Open the wiki</a></b>
---
---@param ped Ped
---@param jump boolean
function taskJump(ped, jump) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskTired">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS number
function taskTired(ped, timeMS) end

---
--- Отправляет смерть персонажа по его хендлу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDie">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа
function taskDie(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLookAtChar">Open the wiki</a></b>
---
---@param ped Ped
---@param lookAt number
---@param timeMS number
function taskLookAtChar(ped, lookAt, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLookAtVehicle">Open the wiki</a></b>
---
---@param ped Ped
---@param lookAt number
---@param timeMS number
function taskLookAtVehicle(ped, lookAt, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSay">Open the wiki</a></b>
---
---@param ped Ped
---@param audio number
function taskSay(ped, audio) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskShakeFist">Open the wiki</a></b>
---
---@param ped Ped
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
---@param type number
---@return Particle particle
function createFxSystemOnCharWithDirection(
	particle,
	ped,
	offsetX,
	offsetY,
	offsetZ,
	rotationX,
	rotationY,
	rotationZ,
	type
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCower">Open the wiki</a></b>
---
---@param ped Ped
function taskCower(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskHandsUp">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS number
function taskHandsUp(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDuck">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS number
function taskDuck(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskUseAtm">Open the wiki</a></b>
---
---@param ped Ped
function taskUseAtm(ped) end

---
--- Воспроизводит анимацию где персонаж стоит расслабленно и смотрит по сторонам<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskScratchHead">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа
function taskScratchHead(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLookAbout">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS number
function taskLookAbout(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskEnterCarAsPassenger">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param time number
---@param passengerSeat number
function taskEnterCarAsPassenger(ped, car, time, passengerSeat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskEnterCarAsDriver">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param timeMS number
function taskEnterCarAsDriver(ped, car, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLeaveCar">Open the wiki</a></b>
---
---@param ped Ped
---@param withActor number
---@param flag boolean
---@param unknownFlag number
function taskChatWithChar(ped, withActor, flag, unknownFlag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLeaveCarAndFlee">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param X number
---@param Y number
---@param Z number
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
--- Заставляет актёра ехать на координаты определенным способом<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCarDriveToCoord">Open the wiki</a></b><br/>
---
---@param ped Ped хендл игрока
---@param car Vehicle хендл транспорта
---@param toX number позиция к которой начнет ехать актёр (X)
---@param toY number позиция к которой начнет ехать актёр (Y)
---@param toZ number позиция к которой начнет ехать актёр (Z)
---@param speed number скорость с которой машина будет ехать
---@param rideType RideType Способ езды
---@param model number модель чего-то
---@param driveType DriveType Тип вождения
function taskCarDriveToCoord(ped, car, toX, toY, toZ, speed, rideType, model, driveType) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCarDriveWander">Open the wiki</a></b>
---
---@param ped Ped
---@param hijackCar Vehicle
---@param searchRadius number
---@param trafficBehavior number
function taskCarDriveWander(ped, hijackCar, searchRadius, trafficBehavior) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGoStraightToCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param mode number
---@param time number
function taskGoStraightToCoord(ped, toX, toY, toZ, mode, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskAchieveHeading">Open the wiki</a></b>
---
---@param ped Ped
---@param angle number
function taskAchieveHeading(ped, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/flushRoute">Open the wiki</a></b>
---
function flushRoute() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/extendRoute">Open the wiki</a></b>
---
---@param pointX number
---@param pointY number
---@param pointZ number
function extendRoute(pointX, pointY, pointZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFollowPointRoute">Open the wiki</a></b>
---
---@param ped Ped
---@param flags1 number
---@param flags2 number
function taskFollowPointRoute(ped, flags1, flags2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGotoChar">Open the wiki</a></b>
---
---@param ped Ped
---@param toActor Ped
---@param timelimit number
---@param stopWithinRadius number
function taskGotoChar(ped, toActor, timelimit, stopWithinRadius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFleePoint">Open the wiki</a></b>
---
---@param ped Ped
---@param fromX number
---@param fromY number
---@param fromZ number
---@param awayRadius number
---@param timelimit number
function taskFleePoint(ped, fromX, fromY, fromZ, awayRadius, timelimit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFleeChar">Open the wiki</a></b>
---
---@param ped Ped
---@param fromActor Ped
---@param radius number
---@param timelimit number
function taskFleeChar(ped, fromActor, radius, timelimit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSmartFleePoint">Open the wiki</a></b>
---
---@param ped Ped
---@param fromX number
---@param fromY number
---@param fromZ number
---@param stopAtRadius number
---@param timelimit number
function taskSmartFleePoint(ped, fromX, fromY, fromZ, stopAtRadius, timelimit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSmartFleeChar">Open the wiki</a></b>
---
---@param ped Ped
---@param fromActor Ped
---@param originRadius number
---@param timelimit number
function taskSmartFleeChar(ped, fromActor, originRadius, timelimit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskWanderStandard">Open the wiki</a></b>
---
---@param ped Ped
function clearCharTasks(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskKillCharOnFoot">Open the wiki</a></b>
---
---@param ped Ped
---@param unknownFlag1 boolean
---@param unknownFlag2 boolean
---@param unknownFlag3 boolean
function taskTogglePedThreatScanner(ped, unknownFlag1, unknownFlag2, unknownFlag3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param path number
function startPlaybackRecordedCar(car, path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/stopPlaybackRecordedCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param door number
function fixCarDoor(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pausePlaybackRecordedCar">Open the wiki</a></b>
---
---@param car Vehicle
function taskEveryoneLeaveCar(car) end

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
---@param pathX number
---@param pathY number
---@param pathZ number
---@param mode number
---@param time number
function taskFollowPathNodesToCoord(ped, pathX, pathY, pathZ, mode, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAngledArea2d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isCharInAngledArea2d(ped, x1, y1, x2, y2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaOnFoot2d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isCharInAngledAreaOnFoot2d(ped, x1, y1, x2, y2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaInCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isCharInAngledAreaInCar2d(ped, x1, y1, x2, y2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledArea2d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param height number
---@param flag boolean
---@return boolean result
function isCharStoppedInAngledArea2d(ped, x1, y1, x2, y2, height, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaOnFoot2d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isCharStoppedInAngledAreaOnFoot2d(ped, x1, y1, x2, y2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaInCar2d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param height number
---@param flag boolean
---@return boolean result
function isCharStoppedInAngledAreaInCar2d(ped, x1, y1, x2, y2, height, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAngledArea3d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isCharInAngledArea3d(ped, x1, y1, z1, x2, y2, z2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaOnFoot3d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isCharInAngledAreaOnFoot3d(ped, x1, y1, z1, x2, y2, z2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaInCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param depth number
---@param flag boolean
---@return boolean result
function isCharInAngledAreaInCar3d(ped, x1, y1, z1, x2, y2, z2, depth, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledArea3d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param depth number
---@param flag boolean
---@return boolean result
function isCharStoppedInAngledArea3d(ped, x1, y1, z1, x2, y2, z2, depth, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaOnFoot3d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param depth number
---@param flag boolean
---@return boolean result
function isCharStoppedInAngledAreaOnFoot3d(ped, x1, y1, z1, x2, y2, z2, depth, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaInCar3d">Open the wiki</a></b>
---
---@param ped Ped
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param depth number
---@param flag boolean
---@return boolean result
function isCharStoppedInAngledAreaInCar3d(ped, x1, y1, z1, x2, y2, z2, depth, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInTaxi">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function isCharInTaxi(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGoToCoordAnyMeans">Open the wiki</a></b>
---
---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param mode number
---@param useCar Vehicle
function taskGoToCoordAnyMeans(ped, toX, toY, toZ, mode, useCar) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getHeadingFromVector2d">Open the wiki</a></b>
---
---@param pX number
---@param pY number
---@return number zAngle
function getHeadingFromVector2d(pX, pY) end

---
--- Заставляет актёра воспроизвести / сбить анимацию.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPlayAnim">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@param animation string имя анимации
---@param IFP string файл анимации
---@param framedelta number скорость анимации
---@param loop boolean повторение анимации (`true` - да, `false` - нет)
---@param lockX boolean блокировка позиции по X (`true` - да, `false` - нет)
---@param lockY boolean блокировка позиции по Y (`true` - да, `false` - нет)
---@param lockF boolean возврат в исходное положение (true - возвращать, false - не возвращать)
---@param time number время воспроизведения
function taskPlayAnim(ped, animation, IFP, framedelta, loop, lockX, lockY, lockF, time) end

---
--- Загружает пути NPC из одиночной игры в прямоугольной зоне.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadPathNodesInArea">Open the wiki</a></b><br/>
---
---@param x1 number x-координата одного угла зоны
---@param y1 number y-координата одного угла зоны
---@param x2 number x-координата второго угла зоны
---@param y2 number y-координата второго угла зоны
function loadPathNodesInArea(x1, y1, x2, y2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releasePathNodes">Open the wiki</a></b>
---
function releasePathNodes() end

---
--- Создает маркер поведения актера с заданным типом.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadCharDecisionMaker">Open the wiki</a></b><br/>
---
---@param type number тип поведения
---@return number maker маркер модели поведения
function loadCharDecisionMaker(type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharDecisionMaker">Open the wiki</a></b>
---
---@param ped Ped
---@param maker number
function setCharDecisionMaker(ped, maker) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextDropshadow">Open the wiki</a></b>
---
---@param shadow number
---@param r number
---@param g number
---@param b number
---@param a number
function setTextDropshadow(shadow, r, g, b, a) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlaybackGoingOnForCar">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
function isPlaybackGoingOnForCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSenseRange">Open the wiki</a></b>
---
---@param ped Ped
---@param accuracy number
function setSenseRange(ped, accuracy) end

---
--- проверяет, выполняет ли пед указанную анимацию.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharPlayingAnim">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@param animation string название анимации
---@return boolean result Результат проверки
function isCharPlayingAnim(ped, animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharAnimPlayingFlag">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@param flag boolean
function setCharAnimPlayingFlag(ped, animation, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharAnimCurrentTime">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@return number time
function getCharAnimCurrentTime(ped, animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharAnimCurrentTime">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@param time number
function setCharAnimCurrentTime(ped, animation, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/openSequenceTask">Open the wiki</a></b>
---
---@return number task
function openSequenceTask() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/closeSequenceTask">Open the wiki</a></b>
---
---@param task number
function closeSequenceTask(task) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/performSequenceTask">Open the wiki</a></b>
---
---@param ped Ped
---@param task number
function performSequenceTask(ped, task) end

---
--- Устанавливает коллизию персонажу.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCollision">Open the wiki</a></b><br/>
---
---@param ped Ped Хэндл персонажа
---@param enable boolean Статус (true\false)
function setCharCollision(ped, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharAnimTotalTime">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@return number totalTime
function getCharAnimTotalTime(ped, animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearSequenceTask">Open the wiki</a></b>
---
---@param task number
function clearSequenceTask(task) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addAttractor">Open the wiki</a></b>
---
---@param originX number
---@param originY number
---@param originZ number
---@param zAngle number
---@param unknownAngle number
---@param taskSequence number
---@return number handle
function addAttractor(originX, originY, originZ, zAngle, unknownAngle, taskSequence) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearAttractor">Open the wiki</a></b>
---
---@param handle number
function clearAttractor(handle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCharAtAttractor">Open the wiki</a></b>
---
---@param pedtype number
---@param modelId Model
---@param ASOrigin number
---@param task number
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
---@param stat number
---@param add number
function incrementIntStat(stat, add) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/incrementFloatStat">Open the wiki</a></b>
---
---@param stat number
---@param add number
function incrementFloatStat(stat, add) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/decrementIntStat">Open the wiki</a></b>
---
---@param stat number
---@param number number
function decrementIntStat(stat, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/decrementFloatStat">Open the wiki</a></b>
---
---@param stat number
---@param number number
function decrementFloatStat(stat, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerIntStat">Open the wiki</a></b>
---
---@param stat number
---@param number number
function registerIntStat(stat, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerFloatStat">Open the wiki</a></b>
---
---@param stat number
---@param value number
function registerFloatStat(stat, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setIntStat">Open the wiki</a></b>
---
---@param stat number
---@param number number
function setIntStat(stat, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFloatStat">Open the wiki</a></b>
---
---@param stat number
---@param number number
function setFloatStat(stat, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getScriptTaskStatus">Open the wiki</a></b>
---
---@param ped Ped
---@param task number
---@return number status
function getScriptTaskStatus(ped, task) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createGroup">Open the wiki</a></b>
---
---@param type number
---@return number group
function createGroup(type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupLeader">Open the wiki</a></b>
---
---@param group number
---@param ped Ped
function setGroupLeader(group, ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupMember">Open the wiki</a></b>
---
---@param group number
---@param ped Ped
function setGroupMember(group, ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeGroup">Open the wiki</a></b>
---
---@param group number
function removeGroup(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLeaveAnyCar">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param targetCar number
---@param order number
---@param maxSpeed number
---@param trafficFlag number
function taskCarMission(ped, car, targetCar, order, maxSpeed, trafficFlag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskKillCharOnFootWhileDucking">Open the wiki</a></b>
---
---@param ped Ped
---@param weapon number
---@param flags number
---@param time number
---@param chance number
function taskKillCharOnFootWhileDucking(ped, weapon, flags, time, chance) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskAimGunAtChar">Open the wiki</a></b>
---
---@param ped Ped
---@param aimAt number
---@param timeMS number
function taskAimGunAtChar(ped, aimAt, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGoToCoordWhileShooting">Open the wiki</a></b>
---
---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param mode number
---@param turnRadius number
---@param stopRadius number
---@param lookAtActor number
function taskGoToCoordWhileShooting(ped, toX, toY, toZ, mode, turnRadius, stopRadius, lookAtActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskStayInSamePlace">Open the wiki</a></b>
---
---@param ped Ped
---@param stay boolean
function taskStayInSamePlace(ped, stay) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskTurnCharToFaceChar">Open the wiki</a></b>
---
---@param ped Ped
---@param rotateTo number
function taskTurnCharToFaceChar(ped, rotateTo) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharAtScriptedAttractor">Open the wiki</a></b>
---
---@param ped Ped
---@param origin number
---@return boolean result
function isCharAtScriptedAttractor(ped, origin) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSequenceToRepeat">Open the wiki</a></b>
---
---@param pack number
---@param loop boolean
function setSequenceToRepeat(pack, loop) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getSequenceProgress">Open the wiki</a></b>
---
---@param ped Ped
---@return number progess
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
---@param dist number
function setFollowNodeThresholdDistance(ped, dist) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystem">Open the wiki</a></b>
---
---@param particle string
---@param pX number
---@param pY number
---@param pZ number
---@param type number
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
---@param stat number
---@return number stat
function getIntStat(stat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getFloatStat">Open the wiki</a></b>
---
---@param stat number
---@return number stat
function getFloatStat(stat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectRenderScorched">Open the wiki</a></b>
---
---@param object Object
---@param fireproof boolean
function setObjectRenderScorched(object, fireproof) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLookAtObject">Open the wiki</a></b>
---
---@param ped Ped
---@param lookAt number
---@param timeMS number
function taskLookAtObject(ped, lookAt, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/limitAngle">Open the wiki</a></b>
---
---@param angle number
---@return number number
function limitAngle(angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/openCarDoor">Open the wiki</a></b>
---
---@param car Vehicle
---@param door number
function openCarDoor(car, door) end

---
--- Возвращает координаты пикапа<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPickupCoordinates">Open the wiki</a></b><br/>
---
---@param pickup Pickup хэндл пикапа
---@return number X - X координата
---@return number Y - Y координата
---@return number Z - Z координата
function getPickupCoordinates(pickup) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeDecisionMaker">Open the wiki</a></b>
---
---@param maker number
function removeDecisionMaker(maker) end

---
--- Возвращает ID скина по хэндлу персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharModel">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@return Model modelId ID скина
function getCharModel(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskAimGunAtCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param atX number
---@param atY number
---@param atZ number
---@param timeMS number
function taskAimGunAtCoord(ped, atX, atY, atZ, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskShootAtCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param atX number
---@param atY number
---@param atZ number
---@param timeMS number
function taskShootAtCoord(ped, atX, atY, atZ, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystemOnChar">Open the wiki</a></b>
---
---@param particle string
---@param ped Ped
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param type number
---@return Particle particle
function createFxSystemOnChar(particle, ped, offsetX, offsetY, offsetZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystemOnCharWithDirection">Open the wiki</a></b>
---
---@param particle string
---@param ped Ped
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
---@param type number
---@return Particle particle
function createFxSystemOnCharWithDirection(
	particle,
	ped,
	offsetX,
	offsetY,
	offsetZ,
	rotationX,
	rotationY,
	rotationZ,
	type
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystemOnCar">Open the wiki</a></b>
---
---@param particle string
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param type number
---@return Particle particle
function createFxSystemOnCar(particle, car, offsetX, offsetY, offsetZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystemOnCarWithDirection">Open the wiki</a></b>
---
---@param particle string
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
---@param type number
---@return Particle particle
function createFxSystemOnCarWithDirection(
	particle,
	car,
	offsetX,
	offsetY,
	offsetZ,
	rotationX,
	rotationY,
	rotationZ,
	type
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystemOnObject">Open the wiki</a></b>
---
---@param particle string
---@param object Object
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param type number
---@return Particle particle
function createFxSystemOnObject(particle, object, offsetX, offsetY, offsetZ, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createFxSystemOnObjectWithDirection">Open the wiki</a></b>
---
---@param particle string
---@param object Object
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
---@param flag number
---@return Particle particle
function createFxSystemOnObjectWithDirection(
	particle,
	object,
	offsetX,
	offsetY,
	offsetZ,
	rotationX,
	rotationY,
	rotationZ,
	flag
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDestroyCar">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
function explodeCarInCutscene(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDiveAndGetUp">Open the wiki</a></b>
---
---@param ped Ped
---@param toOffsetX number
---@param toOffsetY number
---@param time number
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
---@param radius number
function planeFollowEntity(plane, ped, car, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskChatWithChar">Open the wiki</a></b>
---
---@param ped Ped
---@param withActor number
---@param flag boolean
---@param unknownFlag number
function taskChatWithChar(ped, withActor, flag, unknownFlag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCameraToVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
---@param tilt number
---@param switchstyle number
function attachCameraToVehicle(car, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ, tilt, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCameraToVehicleLookAtVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param toCar number
---@param tilt number
---@param switchstyle number
function attachCameraToVehicleLookAtVehicle(car, offsetX, offsetY, offsetZ, toCar, tilt, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCameraToVehicleLookAtChar">Open the wiki</a></b>
---
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param ped Ped
---@param tilt number
---@param switchstyle number
function attachCameraToVehicleLookAtChar(car, offsetX, offsetY, offsetZ, ped, tilt, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCameraToChar">Open the wiki</a></b>
---
---@param ped Ped
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
---@param tilt number
---@param switchstyle number
function attachCameraToChar(ped, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ, tilt, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCameraToCharLookAtChar">Open the wiki</a></b>
---
---@param ped Ped
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param targetActor number
---@param tilt number
---@param switchstyle number
function attachCameraToCharLookAtChar(ped, offsetX, offsetY, offsetZ, targetActor, tilt, switchstyle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceCarLights">Open the wiki</a></b>
---
---@param car Vehicle
---@param lights number
function forceCarLights(car, lights) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addPedtypeAsAttractorUser">Open the wiki</a></b>
---
---@param ASOrigin number
---@param pedtype number
function addPedtypeAsAttractorUser(ASOrigin, pedtype) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachObjectToCar">Open the wiki</a></b>
---
---@param object Object
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function attachObjectToCar(object, car, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/detachObject">Open the wiki</a></b>
---
---@param object Object
---@param X number
---@param Y number
---@param Z number
---@param collisionDetection boolean
function detachObject(object, X, Y, Z, collisionDetection) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCarToCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param toCar number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function attachCarToCar(car, toCar, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/detachCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param X number
---@param Y number
---@param Z number
---@param collisionDetection boolean
function detachCar(car, X, Y, Z, collisionDetection) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectAttached">Open the wiki</a></b>
---
---@param object Object
---@return boolean result
function isObjectAttached(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isVehicleAttached">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
function isVehicleAttached(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCharTasks">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param radius number
function heliFollowEntity(heli, ped, car, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskTogglePedThreatScanner">Open the wiki</a></b>
---
---@param ped Ped
---@param unknownFlag1 boolean
---@param unknownFlag2 boolean
---@param unknownFlag3 boolean
function taskTogglePedThreatScanner(ped, unknownFlag1, unknownFlag2, unknownFlag3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/popCarDoor">Open the wiki</a></b>
---
---@param car Vehicle
---@param door number
---@param visible boolean
function popCarDoor(car, door, visible) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fixCarDoor">Open the wiki</a></b>
---
---@param car Vehicle
---@param door number
function fixCarDoor(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskEveryoneLeaveCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param passengerseat number
function taskWarpCharIntoCarAsPassenger(ped, car, passengerseat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerTargettingAnything">Open the wiki</a></b>
---
---@param player Player
---@return boolean result
function isPlayerTargettingAnything(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getActiveCameraCoordinates">Open the wiki</a></b>
---
---@return number X
---@return number Y
---@return number Z
function getActiveCameraCoordinates() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getActiveCameraPointAt">Open the wiki</a></b>
---
---@return number X
---@return number Y
---@return number Z
function getActiveCameraPointAt() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/popCarPanel">Open the wiki</a></b>
---
---@param car Vehicle
---@param component number
---@param effectFlag boolean
function popCarPanel(car, component, effectFlag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fixCarPanel">Open the wiki</a></b>
---
---@param car Vehicle
---@param componentB number
function fixCarPanel(car, componentB) end

---
--- Чинит шину у транспортного средства.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fixCarTire">Open the wiki</a></b><br/>
---
---@param car Vehicle скриптовый хендл транспортного средства
---@param tire number шина
function fixCarTire(car, tire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachObjectToObject">Open the wiki</a></b>
---
---@param object Object
---@param toObject number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function attachObjectToObject(object, toObject, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachObjectToChar">Open the wiki</a></b>
---
---@param object Object
---@param ped Ped
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function attachObjectToChar(object, ped, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---
--- Возвращает скорость машины относительно её направления.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarSpeedVector">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@return number vecX скорость по X
---@return number vecY скорость по Y
---@return number vecZ скорость по Z
function getCarSpeedVector(car) end

---
--- Возвращает массу автомобиля<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarMass">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл автомобиля
---@return number mass масса автомобиля
function getCarMass(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDiveFromAttachmentAndGetUp">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS number
function taskDiveFromAttachmentAndGetUp(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCharToBike">Open the wiki</a></b>
---
---@param ped Ped
---@param liftingObject number
---@return boolean result
function isCharHoldingObject(ped, liftingObject) end

---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param position number
---@param shootingAngle1 number
---@param shootingAngle2 number
---@param weapon number
function attachCharToBike(ped, car, offsetX, offsetY, offsetZ, position, shootingAngle1, shootingAngle2, weapon) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGotoCharOffset">Open the wiki</a></b>
---
---@param ped Ped
---@param toActor number
---@param timelimit number
---@param approachDistance number
---@param approachAngle number
function taskGotoCharOffset(ped, toActor, timelimit, approachDistance, approachAngle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskLookAtCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param timeMS number
function taskLookAtCoord(ped, toX, toY, toZ, timeMS) end

---
--- Скрывает все оружие у персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hideCharWeaponForScriptedCutscene">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@param hide boolean будет ли скрыто оружие(true/false)
function hideCharWeaponForScriptedCutscene(ped, hide) end

---
--- Получает скорость движения персонажа по его хендлу.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharSpeed">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа
---@return number speed Значение скорости
function getCharSpeed(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupDecisionMaker">Open the wiki</a></b>
---
---@param group number
---@param maker number
function setGroupDecisionMaker(group, maker) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadGroupDecisionMaker">Open the wiki</a></b>
---
---@param type number
---@return number maker
function loadGroupDecisionMaker(type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/disablePlayerSprint">Open the wiki</a></b>
---
---@param player Player
---@param mode boolean
function disablePlayerSprint(player, mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSitDown">Open the wiki</a></b>
---
---@param ped Ped
---@param timeMS number
function taskSitDown(ped, timeMS) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createSearchlight">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param targetX number
---@param targetY number
---@param targetZ number
---@param radius1 number
---@param radius2 number
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
---@return boolean result
function doesSearchlightExist(searchlight) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/moveSearchlightBetweenCoords">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param fromX number
---@param fromY number
---@param fromZ number
---@param toX number
---@param toY number
---@param toZ number
---@param speed number
function moveSearchlightBetweenCoords(searchlight, fromX, fromY, fromZ, toX, toY, toZ, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pointSearchlightAtCoord">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param toX number
---@param toY number
---@param toZ number
---@param speed number
function pointSearchlightAtCoord(searchlight, toX, toY, toZ, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pointSearchlightAtChar">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param ped Ped
---@param speed number
function pointSearchlightAtChar(searchlight, ped, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInSearchlight">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param ped Ped
---@return boolean result
function isCharInSearchlight(searchlight, ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCutsceneLoaded">Open the wiki</a></b>
---
---@return boolean result
function hasCutsceneLoaded() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskTurnCharToFaceCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param atX number
---@param atY number
---@param atZ number
function taskTurnCharToFaceCoord(ped, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDrivePointRoute">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param speed number
function taskDrivePointRoute(ped, car, speed) end

---
--- Создает летящую пулю на указанных координатах и в указанном направлении.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fireSingleBullet">Open the wiki</a></b><br/>
---
---@param fromX number точка создания по X
---@param fromY number точка создания по Y
---@param fromZ number точка создания по Z
---@param targetX number направление по X
---@param targetY number направление по Y
---@param targetZ number направление по Z
---@param energy number урон пули
function fireSingleBullet(fromX, fromY, fromZ, targetX, targetY, targetZ, energy) end

---
--- Делает проверку на наличие обьектов определенных типов между точками в трёхмерном пространстве<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isLineOfSightClear">Open the wiki</a></b><br/>
---
---@param fromX number координата X первой точки
---@param fromY number координата Y первой точки
---@param fromZ number координата Z первой точки
---@param toX number координата X второй точки
---@param toY number координата Y второй точки
---@param toZ number координата Z второй точки
---@param checkBuildings boolean учитывать здания
---@param checkVehicles boolean учитывать транспортные средства
---@param checkActors boolean учитывать игроков
---@param checkObjects boolean учитывать объекты
---@param checkParticles boolean учитывать частицы
---@return boolean result результат проверки
function isLineOfSightClear(
	fromX,
	fromY,
	fromZ,
	toX,
	toY,
	toZ,
	checkBuildings,
	checkVehicles,
	checkActors,
	checkObjects,
	checkParticles
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarRoll">Open the wiki</a></b>
---
---@param car Vehicle
---@return number roll
function getCarRoll(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pointSearchlightAtVehicle">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param car Vehicle
---@param speed number
function pointSearchlightAtVehicle(searchlight, car, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isVehicleInSearchlight">Open the wiki</a></b>
---
---@param number number
---@param car Vehicle
---@return boolean result
function isVehicleInSearchlight(number, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createSearchlightOnVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param targetX number
---@param targetY number
---@param targetZ number
---@param radius number
---@param radius2 number
---@return Searchlight searchlight
function createSearchlightOnVehicle(car, offsetX, offsetY, offsetZ, targetX, targetY, targetZ, radius, radius2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGoToCoordWhileAiming">Open the wiki</a></b>
---
---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param mode number
---@param turnRadius number
---@param stopRadius number
---@param ped2 Ped
---@param offsetX number
---@param offsetY number
---@param offsetZ number
function taskGoToCoordWhileAiming(ped, toX, toY, toZ, mode, turnRadius, stopRadius, ped2, offsetX, offsetY, offsetZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumberOfFiresInRange">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@return number num
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
---@param performAction number
---@param timelimit number
function taskCarTempAction(ped, car, performAction, timelimit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setLaRiots">Open the wiki</a></b>
---
---@param enable boolean
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
---@param tower number
---@param housing number
---@param bulb number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
function attachSearchlightToSearchlightObject(searchlight, tower, housing, bulb, offsetX, offsetY, offsetZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchEmergencyServices">Open the wiki</a></b>
---
---@param enable boolean
function switchEmergencyServices(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCheckpoint">Open the wiki</a></b>
---
---@param type number
---@param atX number
---@param atY number
---@param atZ number
---@param pointX number
---@param pointY number
---@param pointZ number
---@param radius number
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
---@param enable boolean
function switchRandomTrains(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createMissionTrain">Open the wiki</a></b>
---
---@param type number
---@param atX number
---@param atY number
---@param atZ number
---@param direction boolean
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
---@param speed number
function setTrainSpeed(train, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTrainCruiseSpeed">Open the wiki</a></b>
---
---@param train Vehicle
---@param speed number
function setTrainCruiseSpeed(train, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTrainCaboose">Open the wiki</a></b>
---
---@param train Vehicle
---@return number caboose
function getTrainCaboose(train) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deletePlayer">Open the wiki</a></b>
---
---@param player Player
function deletePlayer(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTwoPlayerCameraMode">Open the wiki</a></b>
---
---@param mode boolean
function setTwoPlayerCameraMode(mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCarMission">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param targetCar number
---@param order number
---@param maxSpeed number
---@param trafficFlag number
function taskCarMission(ped, car, targetCar, order, maxSpeed, trafficFlag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGoToObject">Open the wiki</a></b>
---
---@param ped Ped
---@param toObject number
---@param timelimit number
---@param stopWithinRadius number
function taskGoToObject(ped, toObject, timelimit, stopWithinRadius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskWeaponRoll">Open the wiki</a></b>
---
---@param ped Ped
---@param roll boolean
function taskWeaponRoll(ped, roll) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCharArrestChar">Open the wiki</a></b>
---
---@param ped Ped
---@param bustActor number
function taskCharArrestChar(ped, bustActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getAvailableVehicleMod">Open the wiki</a></b>
---
---@param car Vehicle
---@param poolIndex number
---@return Model itemID
function getAvailableVehicleMod(car, poolIndex) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getVehicleModType">Open the wiki</a></b>
---
---@param component Model
---@return number type
function getVehicleModType(component) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addVehicleMod">Open the wiki</a></b>
---
---@param car Vehicle
---@param component Model
---@return number componentId
function addVehicleMod(car, component) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeVehicleMod">Open the wiki</a></b>
---
---@param car Vehicle
---@param componentId number
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
---@return boolean result
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
---@return number num
function getNumAvailablePaintjobs(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/giveVehiclePaintjob">Open the wiki</a></b>
---
---@param set number
---@param paintjob number
function giveVehiclePaintjob(set, paintjob) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGroupMember">Open the wiki</a></b>
---
---@param ped Ped
---@param group number
---@return boolean result
function isGroupMember(ped, group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGroupLeader">Open the wiki</a></b>
---
---@param ped Ped
---@param group number
---@return boolean result
function isGroupLeader(ped, group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupSeparationRange">Open the wiki</a></b>
---
---@param group number
---@param range number
function setGroupSeparationRange(group, range) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/limitTwoPlayerDistance">Open the wiki</a></b>
---
---@param distance number
function limitTwoPlayerDistance(distance) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releaseTwoPlayerDistance">Open the wiki</a></b>
---
function releaseTwoPlayerDistance() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerPlayerTargetting">Open the wiki</a></b>
---
---@param can boolean
function setPlayerPlayerTargetting(can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getScriptFireCoords">Open the wiki</a></b>
---
---@param fire number
---@return number X
---@return number Y
---@return number Z
function getScriptFireCoords(fire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNthClosestCarNodeWithHeading">Open the wiki</a></b>
---
---@param forX number
---@param forY number
---@param forZ number
---@param direction number
---@return number X
---@return number Y
---@return number Z
---@return number ZAngle
function getNthClosestCarNodeWithHeading(forX, forY, forZ, direction) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayersCanBeInSeparateCars">Open the wiki</a></b>
---
---@param allow boolean
function setPlayersCanBeInSeparateCars(allow) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesCarHaveStuckCarCheck">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
function doesCarHaveStuckCarCheck(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlaybackSpeed">Open the wiki</a></b>
---
---@param car Vehicle
---@param speed number
function setPlaybackSpeed(car, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/areAnyCharsNearChar">Open the wiki</a></b>
---
---@param ped Ped
---@param range number
---@return boolean result
function areAnyCharsNearChar(ped, range) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/skipCutsceneEnd">Open the wiki</a></b>
---
function skipCutsceneEnd() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPercentageTaggedInArea">Open the wiki</a></b>
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number percentage
function getPercentageTaggedInArea(x1, y1, x2, y2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTagStatusInArea">Open the wiki</a></b>
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param value boolean
function setTagStatusInArea(x1, y1, x2, y2, value) end

---
--- Ведет машину на указанные координаты.<br/>
--- В отличии от <strong>carGotoCoordinates</strong> и <strong>carGotoCoordinatesAccurate</strong>, эта функция игнорирует игровые ПДД.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesRacing">Open the wiki</a></b><br/>
---
---@param car Vehicle хэндл машины
---@param toX number координата по X
---@param toY number координата по Y
---@param toZ number координата по Z
function carGotoCoordinatesRacing(car, toX, toY, toZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCarUsingAi">Open the wiki</a></b>
---
---@param car Vehicle
---@param path number
function startPlaybackRecordedCarUsingAi(car, path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/skipInPlaybackRecordedCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param path number
function skipInPlaybackRecordedCar(car, path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCharDecisionMakerEventResponse">Open the wiki</a></b>
---
---@param maker number
---@param event number
function clearCharDecisionMakerEventResponse(maker, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addCharDecisionMakerEventResponse">Open the wiki</a></b>
---
---@param maker number
---@param event number
---@param taskID number
---@param respect number
---@param hate number
---@param like number
---@param dislike number
---@param inCar boolean
---@param onFoot boolean
function addCharDecisionMakerEventResponse(maker, event, taskID, respect, hate, like, dislike, inCar, onFoot) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPickUpObject">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param boneId1 number
---@param boneId2 number
---@param performAnimation string
---@param IFPFile number
---@param time number
function taskPickUpObject(ped, object, offsetX, offsetY, offsetZ, boneId1, boneId2, performAnimation, IFPFile, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dropObject">Open the wiki</a></b>
---
---@param ped Ped
---@param object boolean
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
---@param hydra number
---@param car Vehicle
---@param radius number
function planeAttackPlayer(hydra, car, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/planeFlyInDirection">Open the wiki</a></b>
---
---@param plane number
---@param direction number
---@param altitudemin number
---@param altitudemax number
function planeFlyInDirection(plane, direction, altitudemin, altitudemax) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/planeFollowEntity">Open the wiki</a></b>
---
---@param plane number
---@param ped Ped
---@param car Vehicle
---@param radius number
function planeFollowEntity(plane, ped, car, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDriveBy">Open the wiki</a></b>
---
---@param ped Ped
---@param drivebyActor number
---@param car Vehicle
---@param pX number
---@param pY number
---@param pZ number
---@param radiusX number
---@param radiusY number
---@param radiusZ boolean
---@param firingRate number
function taskDriveBy(ped, drivebyActor, car, pX, pY, pZ, radiusX, radiusY, radiusZ, firingRate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarStayInSlowLane">Open the wiki</a></b>
---
---@param car Vehicle
---@param stay boolean
function setCarStayInSlowLane(car, stay) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/takeRemoteControlOfCar">Open the wiki</a></b>
---
---@param player Player
---@param enabled boolean
function setPlayerGroupRecruitment(player, enabled) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isClosestObjectOfTypeSmashedOrDamaged">Open the wiki</a></b>
---
---@param object Model
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@param smashed boolean
---@param damaged boolean
---@return boolean result
function isClosestObjectOfTypeSmashedOrDamaged(object, atX, atY, atZ, radius, smashed, damaged) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startSettingUpConversation">Open the wiki</a></b>
---
---@param ped Ped
---@param maker number
function taskSetCharDecisionMaker(ped, maker) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/finishSettingUpConversation">Open the wiki</a></b>
---
function finishSettingUpConversation() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isConversationAtNode">Open the wiki</a></b>
---
---@param ped Ped
---@param gxtString GxtString
---@return boolean result
function isConversationAtNode(ped, gxtString) end

---
--- Получает уровень здоровья объекта.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectHealth">Open the wiki</a></b><br/>
---
---@param object Object Хендл объекта.
---@return number health Уровень здоровья.
function getObjectHealth(object) end

---
--- Устанавливает уровень здоровья объекту.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectHealth">Open the wiki</a></b><br/>
---
---@param object Object Хендл объекта.
---@param health number Уровень здоровья.
function setObjectHealth(object, health) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/breakObject">Open the wiki</a></b>
---
---@param object Object
---@param intensity number
function breakObject(object, intensity) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/heliAttackPlayer">Open the wiki</a></b>
---
---@param heli Vehicle
---@param player Player
---@param radius number
function heliAttackPlayer(heli, player, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/heliFollowEntity">Open the wiki</a></b>
---
---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param radius number
function heliFollowEntity(heli, ped, car, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/policeHeliChaseEntity">Open the wiki</a></b>
---
---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param radius number
function policeHeliChaseEntity(heli, ped, car, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskUseMobilePhone">Open the wiki</a></b>
---
---@param ped Ped
---@param hold boolean
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
---@param passengerseat number
function taskWarpCharIntoCarAsPassenger(ped, car, passengerseat) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchCopsOnBikes">Open the wiki</a></b>
---
---@param generate boolean
function switchCopsOnBikes(generate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isFlameInAngledArea2d">Open the wiki</a></b>
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isFlameInAngledArea2d(x1, y1, x2, y2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isFlameInAngledArea3d">Open the wiki</a></b>
---
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isFlameInAngledArea3d(x1, y1, z1, x2, y2, z2, angle, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addStuckCarCheckWithWarp">Open the wiki</a></b>
---
---@param car Vehicle
---@param checkDistance number
---@param time number
---@param stuck boolean
---@param flipped boolean
---@param warp boolean
---@param path number
function addStuckCarCheckWithWarp(car, checkDistance, time, stuck, flipped, warp, path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/damageCarPanel">Open the wiki</a></b>
---
---@param car Vehicle
---@param door number
function damageCarPanel(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarRoll">Open the wiki</a></b>
---
---@param car Vehicle
---@param roll number
function setCarRoll(car, roll) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/suppressCarModel">Open the wiki</a></b>
---
---@param modelId Model
---@return boolean result
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
---@param key number
---@return boolean result
function isPs2KeyboardKeyPressed(key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPs2KeyboardKeyJustPressed">Open the wiki</a></b>
---
---@param key number
---@return boolean result
function isPs2KeyboardKeyJustPressed(key) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharHoldingObject">Open the wiki</a></b>
---
---@param ped Ped
---@param liftingObject number
---@return boolean result
function isCharHoldingObject(ped, liftingObject) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCanGoAgainstTraffic">Open the wiki</a></b>
---
---@param car Vehicle
---@param can boolean
function setCarCanGoAgainstTraffic(car, can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/damageCarDoor">Open the wiki</a></b>
---
---@param car Vehicle
---@param door number
function damageCarDoor(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCarInSphereNoSave">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param model number
---@return Vehicle car
function getRandomCarInSphereNoSave(X, Y, Z, radius, model) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCharInSphere">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param pedtypeCivilian boolean
---@param gang boolean
---@param prostitute boolean
---@return Ped ped
function getRandomCharInSphere(X, Y, Z, radius, pedtypeCivilian, gang, prostitute) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharBeenArrested">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function hasCharBeenArrested(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlaneThrottle">Open the wiki</a></b>
---
---@param plane number
---@param throttle number
function setPlaneThrottle(plane, throttle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/heliLandAtCoords">Open the wiki</a></b>
---
---@param heli Vehicle
---@param X number
---@param Y number
---@param Z number
---@param minaltitude number
---@param maxaltitude number
function heliLandAtCoords(heli, X, Y, Z, minaltitude, maxaltitude) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/planeStartsInAir">Open the wiki</a></b>
---
---@param hydra number
function planeStartsInAir(hydra) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRelationship">Open the wiki</a></b>
---
---@param acquaintance number
---@param pedtype number
---@param toPedtype number
function setRelationship(acquaintance, pedtype, toPedtype) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearRelationship">Open the wiki</a></b>
---
---@param acquaintance number
---@param pedtype number
---@param toPedtype number
function clearRelationship(acquaintance, pedtype, toPedtype) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearGroupDecisionMakerEventResponse">Open the wiki</a></b>
---
---@param maker number
---@param event number
function clearGroupDecisionMakerEventResponse(maker, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addGroupDecisionMakerEventResponse">Open the wiki</a></b>
---
---@param maker number
---@param event number
---@param taskID number
---@param respect number
---@param hate number
---@param like number
---@param dislike number
---@param inCar boolean
---@param onFoot boolean
function addGroupDecisionMakerEventResponse(maker, event, taskID, respect, hate, like, dislike, inCar, onFoot) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawSpriteWithRotation">Open the wiki</a></b>
---
---@param texture number
---@param x number
---@param y number
---@param scaleX number
---@param scaleY number
---@param angle number
---@param r number
---@param g number
---@param b number
---@param a number
function drawSpriteWithRotation(texture, x, y, scaleX, scaleY, angle, r, g, b, a) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskUseAttractor">Open the wiki</a></b>
---
---@param ped Ped
---@param attractor number
function taskUseAttractor(ped, attractor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskShootAtChar">Open the wiki</a></b>
---
---@param ped Ped
---@param atActor number
---@param timelimit number
function taskShootAtChar(ped, atActor, timelimit) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setInformRespectedFriends">Open the wiki</a></b>
---
---@param flags number
---@param radius number
---@param pedsToScan number
function setInformRespectedFriends(flags, radius, pedsToScan) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharRespondingToEvent">Open the wiki</a></b>
---
---@param ped Ped
---@param event number
---@return boolean result
function isCharRespondingToEvent(ped, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectVisible">Open the wiki</a></b>
---
---@param object Object
---@param visibility boolean
function setObjectVisible(object, visibility) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFleeCharAnyMeans">Open the wiki</a></b>
---
---@param ped Ped
---@param fleeFrom number
---@param runDistance number
---@param time number
---@param changeCourse boolean
---@param unkTime1 number
---@param unkTime2 number
---@param awayRadius number
function taskFleeCharAnyMeans(ped, fleeFrom, runDistance, time, changeCourse, unkTime1, unkTime2, awayRadius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/flushPatrolRoute">Open the wiki</a></b>
---
function flushPatrolRoute() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/extendPatrolRoute">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@param animation string
---@param IFPFile string
function extendPatrolRoute(X, Y, Z, animation, IFPFile) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playObjectAnim">Open the wiki</a></b>
---
---@param object Object
---@param animation string
---@param IFPFile string
---@param framedelta number
---@param lockF boolean
---@param loop boolean
---@return boolean result
function playObjectAnim(object, animation, IFPFile, framedelta, lockF, loop) end

---
--- Устанавливает увеличение у радара<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRadarZoom">Open the wiki</a></b><br/>
---
---@param zoom number значение для увеличения
function setRadarZoom(zoom) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesBlipExist">Open the wiki</a></b>
---
---@param marker Marker
---@return boolean result
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
---@return number num
function getNumberOfItemsInShop() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getItemInShop">Open the wiki</a></b>
---
---@param index number
---@return number item
function getItemInShop(index) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPriceOfItem">Open the wiki</a></b>
---
---@param item number
---@return number price
function getPriceOfItem(item) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDead">Open the wiki</a></b>
---
---@param ped Ped
---@param fightingStyle number
---@param moves number
function giveMeleeAttackToChar(ped, fightingStyle, moves) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarAsMissionCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param hydraulics boolean
function setCarHydraulics(car, hydraulics) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setZonePopulationType">Open the wiki</a></b>
---
---@param zone GxtString
---@param popcycle number
function setZonePopulationType(zone, popcycle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setZoneDealerStrength">Open the wiki</a></b>
---
---@param zone GxtString
---@param density number
function setZoneDealerStrength(zone, density) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getZoneDealerStrength">Open the wiki</a></b>
---
---@param zone GxtString
---@return number strength
function getZoneDealerStrength(zone) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setZoneGangStrength">Open the wiki</a></b>
---
---@param zone GxtString
---@param gang number
---@param density number
function setZoneGangStrength(zone, gang, density) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getZoneGangStrength">Open the wiki</a></b>
---
---@param zone GxtString
---@param gang number
---@return number density
function getZoneGangStrength(zone, gang) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isMessageBeingDisplayed">Open the wiki</a></b>
---
---@return boolean result
function isMessageBeingDisplayed() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharIsTargetPriority">Open the wiki</a></b>
---
---@param ped Ped
---@param targetPriority boolean
function setCharIsTargetPriority(ped, targetPriority) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/customPlateDesignForNextCar">Open the wiki</a></b>
---
---@param modelNumplate Model
---@param townTexture number
function customPlateDesignForNextCar(modelNumplate, townTexture) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGotoCar">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param timeMS number
---@param stopAtDistance number
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
---@param acquaintance number
---@param pedtype number
function setCharRelationship(ped, acquaintance, pedtype) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearCharRelationship">Open the wiki</a></b>
---
---@param ped Ped
---@param acquaintance number
---@param pedtype number
function clearCharRelationship(ped, acquaintance, pedtype) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearAllCharRelationships">Open the wiki</a></b>
---
---@param ped Ped
---@param acquaintance number
function clearAllCharRelationships(ped, acquaintance) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarPitch">Open the wiki</a></b>
---
---@param car Vehicle
---@return number pitch
function getCarPitch(car) end

---
--- Функция получает айди интерьера, в котором находится Ваш персонаж<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getActiveInterior">Open the wiki</a></b><br/>
---
---@return number interior Айди интерьера
function getActiveInterior() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/heliKeepEntityInView">Open the wiki</a></b>
---
---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param minaltitude number
---@param maxaltitude number
function heliKeepEntityInView(heli, ped, car, minaltitude, maxaltitude) end

---
--- Получает модель оружия из его ID.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getWeapontypeModel">Open the wiki</a></b><br/>
---
---@param id number ID оружия
---@return number model номер модели
function getWeapontypeModel(id) end

---
--- Возвращает слот указанного оружия.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getWeapontypeSlot">Open the wiki</a></b><br/>
---
---@param id number ID оружия
---@return number slot номер слота
function getWeapontypeSlot(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getShoppingExtraInfo">Open the wiki</a></b>
---
---@param item number
---@param flag number
---@return number info
function getShoppingExtraInfo(item, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/givePlayerClothes">Open the wiki</a></b>
---
---@param player Player
---@param texture number
---@param model number
---@param bodypart number
function givePlayerClothes(player, texture, model, bodypart) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumberOfFiresInArea">Open the wiki</a></b>
---
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@return number num
function getNumberOfFiresInArea(x1, y1, z1, x2, y2, z2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachWinchToHeli">Open the wiki</a></b>
---
---@param heli Vehicle
---@param magnet boolean
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
---@param handle number
---@return number carriage
function getTrainCarriage(train, handle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/grabEntityOnWinch">Open the wiki</a></b>
---
---@param heli Vehicle
function setHeliBladesFullSpeed(heli) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNameOfItem">Open the wiki</a></b>
---
---@param item number
---@return GxtString name
function getNameOfItem(item) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskClimb">Open the wiki</a></b>
---
---@param ped Ped
---@param climb boolean
function taskClimb(ped, climb) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/buyItem">Open the wiki</a></b>
---
---@param item number
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
---@param magnet number
---@return number length
function getRopeHeightForObject(magnet) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRopeHeightForObject">Open the wiki</a></b>
---
---@param magnet number
---@param length number
function setRopeHeightForObject(magnet, length) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/grabEntityOnRopeForObject">Open the wiki</a></b>
---
---@param magnet number
---@return Vehicle carHandle
---@return Ped pedHandle
---@return Object objectHandle
function grabEntityOnRopeForObject(magnet) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/releaseEntityFromRopeForObject">Open the wiki</a></b>
---
---@param magnet number
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
---@param sequence number
---@param unkProgress1 number
---@param unkProgress2 number
function performSequenceTaskFromProgress(ped, sequence, unkProgress1, unkProgress2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setNextDesiredMoveState">Open the wiki</a></b>
---
---@param speed number
function setNextDesiredMoveState(speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGotoCharAiming">Open the wiki</a></b>
---
---@param ped Ped
---@param followActor number
---@param minradius number
---@param maxradius number
function taskGotoCharAiming(ped, followActor, minradius, maxradius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getSequenceProgressRecursive">Open the wiki</a></b>
---
---@param ped Ped
---@return number unkProgress1
---@return number unkProgress2
function getSequenceProgressRecursive(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskKillCharOnFootTimed">Open the wiki</a></b>
---
---@param ped Ped
---@param attackActor number
---@param time number
function taskKillCharOnFootTimed(ped, attackActor, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNearestTagPosition">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@return number X
---@return number Y
---@return number Z
function getNearestTagPosition(X, Y, Z) end

---
--- Выдает джетпак персонажу по его хендлу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskJetpack">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа
function taskJetpack(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setArea51SamSite">Open the wiki</a></b>
---
---@param enable boolean
function setArea51SamSite(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnySearchlight">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
---@return Searchlight searchlight
function isCharInAnySearchlight(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isTrailerAttachedToCab">Open the wiki</a></b>
---
---@param trailer Vehicle
---@param car Vehicle
---@return boolean result
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
---@return number group
function getPlayerGroup(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getLoadedShop">Open the wiki</a></b>
---
---@return GxtString shop
function getLoadedShop() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getBeatProximity">Open the wiki</a></b>
---
---@param track number
---@return number int2
---@return number int3
---@return number int4
function getBeatProximity(track) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupDefaultTaskAllocator">Open the wiki</a></b>
---
---@param group number
---@param command number
function setGroupDefaultTaskAllocator(group, command) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerGroupRecruitment">Open the wiki</a></b>
---
---@param player Player
---@param enabled boolean
function setPlayerGroupRecruitment(player, enabled) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/activateHeliSpeedCheat">Open the wiki</a></b>
---
---@param heli Vehicle
---@param power number
function activateHeliSpeedCheat(heli, power) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSetCharDecisionMaker">Open the wiki</a></b>
---
---@param ped Ped
---@param maker number
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
---@param displayAlways boolean
function setBlipAlwaysDisplayOnZoomedRadar(marker, displayAlways) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/requestCarRecording">Open the wiki</a></b>
---
---@param path number
function requestCarRecording(path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCarRecordingBeenLoaded">Open the wiki</a></b>
---
---@param path number
---@return boolean result
function hasCarRecordingBeenLoaded(path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMissionTrainCoordinates">Open the wiki</a></b>
---
---@param train Vehicle
---@param X number
---@param Y number
---@param Z number
function setMissionTrainCoordinates(train, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskComplexPickupObject">Open the wiki</a></b>
---
---@param ped Ped
---@param X number
---@param Y number
---@param Z number
---@return number level
function getSoundLevelAtCoords(ped, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/listenToPlayerGroupCommands">Open the wiki</a></b>
---
---@param ped Ped
---@param listen boolean
function listenToPlayerGroupCommands(ped, listen) end

---
--- Устанавливает, может ли игрок входить и выходить из машины.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerEnterCarButton">Open the wiki</a></b><br/>
---
---@param player Player хендл игрока
---@param can boolean true - может, false - не может
function setPlayerEnterCarButton(player, can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCharSlideToCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param angle number
---@param withinRadius number
function taskCharSlideToCoord(ped, toX, toY, toZ, angle, withinRadius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentDayOfWeek">Open the wiki</a></b>
---
---@return number weekday
function getCurrentDayOfWeek() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerScriptBrainForCodeUse">Open the wiki</a></b>
---
---@param id number
---@param gxtString GxtString
function registerScriptBrainForCodeUse(id, gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/applyForceToCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param vecX number
---@param vecY number
---@param vecZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function applyForceToCar(car, vecX, vecY, vecZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addToCarRotationVelocity">Open the wiki</a></b>
---
---@param car Vehicle
---@param vecX number
---@param vecY number
---@param vecZ number
function addToCarRotationVelocity(car, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarRotationVelocity">Open the wiki</a></b>
---
---@param car Vehicle
---@param vecX number
---@param vecY number
---@param vecZ number
function setCarRotationVelocity(car, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharShootRate">Open the wiki</a></b>
---
---@param ped Ped
---@param rate number
function setCharShootRate(ped, rate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isModelInCdimage">Open the wiki</a></b>
---
---@param modelId Model
---@return boolean result
function isModelInCdimage(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeOilPuddlesInArea">Open the wiki</a></b>
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
function removeOilPuddlesInArea(x1, y1, x2, y2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setBlipAsFriendly">Open the wiki</a></b>
---
---@param marker Marker
---@param type boolean
function setBlipAsFriendly(marker, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSwimToCoord">Open the wiki</a></b>
---
---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
function taskSwimToCoord(ped, toX, toY, toZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getModelDimensions">Open the wiki</a></b>
---
---@param modelId Model
---@return number x1
---@return number y1
---@return number z1
---@return number x2
---@return number y2
---@return number z2
function getModelDimensions(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/copyCharDecisionMaker">Open the wiki</a></b>
---
---@param ped Ped
---@return number maker
function copyCharDecisionMaker(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/copyGroupDecisionMaker">Open the wiki</a></b>
---
---@param group number
---@return number maker
function copyGroupDecisionMaker(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDrivePointRouteAdvanced">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
---@param speed number
---@param flag1 number
---@param flag2 number
---@param flag3 number
function taskDrivePointRouteAdvanced(ped, car, speed, flag1, flag2, flag3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isRelationshipSet">Open the wiki</a></b>
---
---@param acquaintance number
---@param ofActors number
---@param toActors number
---@return boolean result
function isRelationshipSet(acquaintance, ofActors, toActors) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarAlwaysCreateSkids">Open the wiki</a></b>
---
---@param car Vehicle
---@param enable boolean
function setCarAlwaysCreateSkids(car, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCityFromCoords">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@return number city
function getCityFromCoords(X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasObjectOfTypeBeenSmashed">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param modelId Model
---@return boolean result
function hasObjectOfTypeBeenSmashed(X, Y, Z, radius, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerPerformingWheelie">Open the wiki</a></b>
---
---@param player Player
---@return boolean result
function isPlayerPerformingWheelie(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerPerformingStoppie">Open the wiki</a></b>
---
---@param player Player
---@return boolean result
function isPlayerPerformingStoppie(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCheckpointCoords">Open the wiki</a></b>
---
---@param checkpoint Checkpoint
---@param X number
---@param Y number
---@param Z number
function setCheckpointCoords(checkpoint, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/controlCarHydraulics">Open the wiki</a></b>
---
---@param car Vehicle
---@param f1 number
---@param f2 number
---@param f3 number
---@param f4 number
function controlCarHydraulics(car, f1, f2, f3, f4) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGroupSize">Open the wiki</a></b>
---
---@param group number
---@return number numberOfLeaders
---@return number numberOfMembers
function getGroupSize(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectCollisionDamageEffect">Open the wiki</a></b>
---
---@param object Object
---@param destructible boolean
function setObjectCollisionDamageEffect(object, destructible) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarFollowCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param followCar number
---@param radius number
function setCarFollowCar(car, followCar, radius) end

---
--- Помещает игрока в кран на карьере недалеко от Лас-Вентурса.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/playerEnteredQuarryCrane">Open the wiki</a></b><br/>
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
---@param access boolean
function switchEntryExit(interior, access) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayTextWithFloat">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param GXT GxtString
---@param value number
---@param flag number
function displayTextWithFloat(X, Y, GXT, value, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesGroupExist">Open the wiki</a></b>
---
---@param group number
---@return boolean result
function doesGroupExist(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/giveMeleeAttackToChar">Open the wiki</a></b>
---
---@param ped Ped
---@param fightingStyle number
---@param moves number
function giveMeleeAttackToChar(ped, fightingStyle, moves) end

---
--- Устанавливает на автомобиль гидравлику<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarHydraulics">Open the wiki</a></b><br/>
---
---@param car Vehicle скриптовый хэндл транспортного средства
---@param hydraulics boolean true - включить, false - выключить.
function setCarHydraulics(car, hydraulics) end

---
--- Проверяет, находиться ли игра в режиме 2 игроков.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/is2playerGameGoingOn">Open the wiki</a></b><br/>
---
---@return boolean result результат
function is2playerGameGoingOn() end

---
--- Возвращает поле зрения.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCameraFov">Open the wiki</a></b><br/>
---
---@return number fov поле зрения
function getCameraFov() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesCarHaveHydraulics">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
function doesCarHaveHydraulics(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskCharSlideToCoordAndPlayAnim">Open the wiki</a></b>
---
---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param angle number
---@param radius number
---@param animation string
---@param ifp1 number
---@param ifp2 number
---@param LA boolean
---@param LX boolean
---@param LY boolean
---@param LF boolean
---@param LT number
function taskCharSlideToCoordAndPlayAnim(
	ped,
	toX,
	toY,
	toZ,
	angle,
	radius,
	animation,
	ifp1,
	ifp2,
	LA,
	LX,
	LY,
	LF,
	LT
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTotalNumberOfPedsKilledByPlayer">Open the wiki</a></b>
---
---@param player Player
---@return number number
function getTotalNumberOfPedsKilledByPlayer(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getLevelDesignCoordsForObject">Open the wiki</a></b>
---
---@param object Object
---@param spoot number
---@return number X
---@return number Y
---@return number Z
function getLevelDesignCoordsForObject(object, spoot) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharHighestPriorityEvent">Open the wiki</a></b>
---
---@param ped Ped
---@return number event
function getCharHighestPriorityEvent(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getParkingNodeInArea">Open the wiki</a></b>
---
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@return number X
---@return number Y
---@return number Z
function getParkingNodeInArea(x1, y1, z1, x2, y2, z2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarCharIsUsing">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function isPlayerInPositionForConversation(ped) end

---
--- Вынуждает актера воссоздать / очистить неприкосновенную анимацию.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPlayAnimNonInterruptable">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@param animation string имя анимации
---@param IFP string файл анимации
---@param framedelta number скорость анимации
---@param loop boolean повторение анимации (true - да, false - нет)
---@param lockX boolean блокировка позиции по X (`true` - да, `false` - нет)
---@param lockY boolean блокировка позиции по Y (`true` - да, `false` - нет)
---@param lockF boolean возврат в исходное положение (true - возвращать, false - не возвращать)
---@param time number время воспроизведения
function taskPlayAnimNonInterruptable(ped, animation, IFP, framedelta, loop, lockX, lockY, lockF, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addStuntJump">Open the wiki</a></b>
---
---@param startX number
---@param startY number
---@param startZ number
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param goalX number
---@param goalY number
---@param goalZ number
---@param radius2X number
---@param radius2Y number
---@param radius2Z number
---@param cameraX number
---@param cameraY number
---@param cameraZ number
---@param reward number
function addStuntJump(
	startX,
	startY,
	startZ,
	radiusX,
	radiusY,
	radiusZ,
	goalX,
	goalY,
	goalZ,
	radius2X,
	radius2Y,
	radius2Z,
	cameraX,
	cameraY,
	cameraZ,
	reward
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectCoordinatesAndVelocity">Open the wiki</a></b>
---
---@param object Object
---@param X number
---@param Y number
---@param Z number
function setObjectCoordinatesAndVelocity(object, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharKindaStayInSamePlace">Open the wiki</a></b>
---
---@param ped Ped
---@param stay boolean
function setCharKindaStayInSamePlace(ped, stay) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFollowPatrolRoute">Open the wiki</a></b>
---
---@param ped Ped
---@param walkMode number
---@param routeMode number
function taskFollowPatrolRoute(ped, walkMode, routeMode) end

---
--- Проверяет находится ли персонаж в воздухе.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAir">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа
---@return boolean result Результат
function isCharInAir(ped) end

---
--- Возвращает точное значение высоты над землёй относительно персонажа<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharHeightAboveGround">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа
---@return number height Результат
function getCharHeightAboveGround(ped) end

---
--- Устанавливает персонажу уровень владения оружием(скилл)<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharWeaponSkill">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@param skill number уровень владения
function setCharWeaponSkill(ped, skill) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTextEdge">Open the wiki</a></b>
---
---@param size number
---@param r number
---@param g number
---@param b number
---@param a number
function setTextEdge(size, r, g, b, a) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarEngineBroken">Open the wiki</a></b>
---
---@param car Vehicle
---@param broken boolean
function setCarEngineBroken(car, broken) end

---
--- Проверяет, является ли указанная модель лодкой.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isThisModelABoat">Open the wiki</a></b><br/>
---
---@param modelId Model идентификатор игровой модели
---@return boolean result true - является, false - не является
function isThisModelABoat(modelId) end

---
--- Проверяет, является ли указанная модель самолётом.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isThisModelAPlane">Open the wiki</a></b><br/>
---
---@param modelId Model идентификатор игровой модели
---@return boolean result true - является, false - не является
function isThisModelAPlane(modelId) end

---
--- Проверяет, является ли указанная модель вертолётом.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isThisModelAHeli">Open the wiki</a></b><br/>
---
---@param modelId Model идентификатор игровой модели
---@return boolean result true - является, false - не является
function isThisModelAHeli(modelId) end

---
--- Включает вид бампера автомобиля для камеры.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFirstPersonInCarCameraMode">Open the wiki</a></b><br/>
---
---@param enable boolean true - включить, false - выключить
function setFirstPersonInCarCameraMode(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskGreetPartner">Open the wiki</a></b>
---
---@param ped Ped
---@param ped2 Ped
---@param unk1 number
---@param unk2 number
function taskGreetPartner(ped, ped2, unk1, unk2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeliBladesFullSpeed">Open the wiki</a></b>
---
---@param heli Vehicle
function setHeliBladesFullSpeed(heli) end

---
--- Устанавливает отображение/скрытие худа.<br/>
--- Оставляя радар.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayHud">Open the wiki</a></b><br/>
---
---@param enable boolean статус худа
function displayHud(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/connectLods">Open the wiki</a></b>
---
---@param object Object
---@param lod number
function connectLods(object, lod) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMaxFireGenerations">Open the wiki</a></b>
---
---@param max number
function setMaxFireGenerations(max) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskDieNamedAnim">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@param ifp1 string
---@param ifp2 number
---@param time number
function taskDieNamedAnim(ped, animation, ifp1, ifp2, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerDuckButton">Open the wiki</a></b>
---
---@param player Player
---@param able boolean
function setPlayerDuckButton(player, able) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPoolTableCoords">Open the wiki</a></b>
---
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
function setPoolTableCoords(x1, y1, z1, x2, y2, z2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasObjectBeenPhotographed">Open the wiki</a></b>
---
---@param object Object
---@return boolean result
function hasObjectBeenPhotographed(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doCameraBump">Open the wiki</a></b>
---
---@param rotationZ number
---@param rotationY number
function doCameraBump(rotationZ, rotationY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentDate">Open the wiki</a></b>
---
---@return number day
---@return number month
function getCurrentDate() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectAnimSpeed">Open the wiki</a></b>
---
---@param object Object
---@param animation string
---@param speed number
function setObjectAnimSpeed(object, animation, speed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectPlayingAnim">Open the wiki</a></b>
---
---@param object Object
---@param anim string
---@return boolean result
function isObjectPlayingAnim(object, anim) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectAnimCurrentTime">Open the wiki</a></b>
---
---@param object Object
---@param animation string
---@return number progress
function getObjectAnimCurrentTime(object, animation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectAnimCurrentTime">Open the wiki</a></b>
---
---@param object Object
---@param animation string
---@param progress number
function setObjectAnimCurrentTime(object, animation, progress) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharVelocity">Open the wiki</a></b>
---
---@param ped Ped
---@param vecX number
---@param vecY number
---@param vecZ number
function setCharVelocity(ped, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharVelocity">Open the wiki</a></b>
---
---@param ped Ped
---@return number vecX
---@return number vecY
---@return number vecZ
function getCharVelocity(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharRotation">Open the wiki</a></b>
---
---@param ped Ped
---@param vecX number
---@param vecY number
---@param vecZ number
function setCharRotation(ped, vecX, vecY, vecZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarUprightValue">Open the wiki</a></b>
---
---@param car Vehicle
---@return number value
function getCarUprightValue(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleInterior">Open the wiki</a></b>
---
---@param car Vehicle
---@param interior number
function setVehicleInterior(car, interior) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/selectWeaponsForVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@param gun boolean
function selectWeaponsForVehicle(car, gun) end

---
--- Получает текущий ID города, возвращает 0 если игрок не в городе.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCityPlayerIsIn">Open the wiki</a></b><br/>
---
---@param player Player хендл игрока
---@return number city ID города
function getCityPlayerIsIn(player) end

---
--- Получение название района/части карты.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNameOfZone">Open the wiki</a></b><br/>
---
---@param X number координаты X
---@param Y number координаты Y
---@param Z number координаты Z
---@return GxtString name название района
function getNameOfZone(X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/activateInteriorPeds">Open the wiki</a></b>
---
---@param activate boolean
function activateInteriorPeds(activate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleCanBeTargetted">Open the wiki</a></b>
---
---@param car Vehicle
---@param unk boolean
function setVehicleCanBeTargetted(car, unk) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFollowFootsteps">Open the wiki</a></b>
---
---@param ped Ped
---@param followActor number
function taskFollowFootsteps(ped, followActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/damageChar">Open the wiki</a></b>
---
---@param ped Ped
---@param health number
---@param affectArmour boolean
function damageChar(ped, health, affectArmour) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCanBeVisiblyDamaged">Open the wiki</a></b>
---
---@param car Vehicle
---@param can boolean
function setCarCanBeVisiblyDamaged(car, can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeliReachedTargetDistance">Open the wiki</a></b>
---
---@param heli Vehicle
---@param dist number
function setHeliReachedTargetDistance(heli, dist) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getSoundLevelAtCoords">Open the wiki</a></b>
---
---@param ped Ped
---@param X number
---@param Y number
---@param Z number
---@return number level
function getSoundLevelAtCoords(ped, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharAllowedToDuck">Open the wiki</a></b>
---
---@param ped Ped
---@param enable boolean
function setCharAllowedToDuck(ped, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeadingForAttachedPlayer">Open the wiki</a></b>
---
---@param player Player
---@param toAngle number
---@param rotationSpeed number
function setHeadingForAttachedPlayer(player, toAngle, rotationSpeed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskWalkAlongsideChar">Open the wiki</a></b>
---
---@param ped Ped
---@param alongisdeActor number
function taskWalkAlongsideChar(ped, alongisdeActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createEmergencyServicesCar">Open the wiki</a></b>
---
---@param car Model
---@param X number
---@param Y number
---@param Z number
function createEmergencyServicesCar(car, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskKindaStayInSamePlace">Open the wiki</a></b>
---
---@param ped Ped
---@param stay boolean
function taskKindaStayInSamePlace(ped, stay) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCarLooped">Open the wiki</a></b>
---
---@param car Vehicle
---@param path number
function startPlaybackRecordedCarLooped(car, path) end

---
--- Устанавливает интерьер актёру.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharInterior">Open the wiki</a></b><br/>
---
---@param ped Ped хендл персонажа
---@param interior number ID интерьера
function setCharInterior(ped, interior) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isAttachedPlayerHeadingAchieved">Open the wiki</a></b>
---
---@param player Player
---@return boolean result
function isAttachedPlayerHeadingAchieved(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableEntryExitPlayerGroupWarping">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param radius number
---@param access boolean
function enableEntryExitPlayerGroupWarping(X, Y, radius, access) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getClosestStealableObject">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@return Object object
function getClosestStealableObject(X, Y, Z, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isProceduralInteriorActive">Open the wiki</a></b>
---
---@param interior number
---@return boolean result
function isProceduralInteriorActive(interior) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeCarRecording">Open the wiki</a></b>
---
---@param path number
function removeCarRecording(path) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setZonePopulationRace">Open the wiki</a></b>
---
---@param zone GxtString
---@param popcycle number
function setZonePopulationRace(zone, popcycle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectOnlyDamagedByPlayer">Open the wiki</a></b>
---
---@param object Object
---@param player boolean
function setObjectOnlyDamagedByPlayer(object, player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createBirds">Open the wiki</a></b>
---
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param flag1 number
---@param flag2 number
function createBirds(x1, y1, z1, x2, y2, z2, flag1, flag2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleDirtLevel">Open the wiki</a></b>
---
---@param car Vehicle
---@param level number
function setVehicleDirtLevel(car, level) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGangWarsActive">Open the wiki</a></b>
---
---@param enable boolean
function setGangWarsActive(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGangWarGoingOn">Open the wiki</a></b>
---
---@return boolean result
function isGangWarGoingOn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/givePlayerClothesOutsideShop">Open the wiki</a></b>
---
---@param player Player
---@param clothes string
---@param model string
---@param bodyPart number
function givePlayerClothesOutsideShop(player, clothes, model, bodyPart) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearLoadedShop">Open the wiki</a></b>
---
function clearLoadedShop() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupSequence">Open the wiki</a></b>
---
---@param group number
---@param Aspack number
function setGroupSequence(group, Aspack) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharDropsWeaponsWhenDead">Open the wiki</a></b>
---
---@param ped Ped
---@param droppable boolean
function setCharDropsWeaponsWhenDead(ped, droppable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharNeverLeavesGroup">Open the wiki</a></b>
---
---@param ped Ped
---@param set boolean
function setCharNeverLeavesGroup(ped, set) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerFireButton">Open the wiki</a></b>
---
---@param player Player
---@param able boolean
function setPlayerFireButton(player, able) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachFxSystemToCharBone">Open the wiki</a></b>
---
---@param particle Particle
---@param ped Ped
---@param mode number
function attachFxSystemToCharBone(particle, ped, mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/registerAttractorScriptBrainForCodeUse">Open the wiki</a></b>
---
---@param handle number
---@param script GxtString
function registerAttractorScriptBrainForCodeUse(handle, script) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeadingLimitForAttachedChar">Open the wiki</a></b>
---
---@param ped Ped
---@param orientation number
---@param limit number
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
---@return number X
---@return number Y
---@return number Z
function getDeadCharCoordinates(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPlayAnimWithFlags">Open the wiki</a></b>
---
---@param ped Ped
---@param animation string
---@param ifp string
---@param framedelta number
---@param loopA boolean
---@param lockX boolean
---@param lockY boolean
---@param lockF boolean
---@param time number
---@param force boolean
---@param lockZ boolean
function taskPlayAnimWithFlags(ped, animation, ifp, framedelta, loopA, lockX, lockY, lockF, time, force, lockZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleAirResistanceMultiplier">Open the wiki</a></b>
---
---@param car Vehicle
---@param multiplier number
function setVehicleAirResistanceMultiplier(car, multiplier) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCoordinatesNoOffset">Open the wiki</a></b>
---
---@param car Vehicle
---@param X number
---@param Y number
---@param Z number
function setCarCoordinatesNoOffset(car, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUsesCollisionOfClosestObjectOfType">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param modelId Model
---@param collisionDetection boolean
function setUsesCollisionOfClosestObjectOfType(X, Y, Z, radius, modelId, collisionDetection) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTimeOneDayForward">Open the wiki</a></b>
---
function setTimeOneDayForward() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTimerBeepCountdownTime">Open the wiki</a></b>
---
---@param timer VarId
---@param reach number
function setTimerBeepCountdownTime(timer, reach) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachTrailerToCab">Open the wiki</a></b>
---
---@param trailer number
---@param cab number
function attachTrailerToCab(trailer, cab) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isVehicleTouchingObject">Open the wiki</a></b>
---
---@param car Vehicle
---@param object Object
---@return boolean result
function isVehicleTouchingObject(car, object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableCraneControls">Open the wiki</a></b>
---
---@param UP boolean
---@param DOWN boolean
---@param RELEASE boolean
function enableCraneControls(UP, DOWN, RELEASE) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerInPositionForConversation">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function isPlayerInPositionForConversation(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableConversation">Open the wiki</a></b>
---
---@param ped Ped
---@param enable boolean
function enableConversation(ped, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCharInSphereOnlyDrugsBuyers">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@return Ped ped
function getRandomCharInSphereOnlyDrugsBuyers(X, Y, Z, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPedType">Open the wiki</a></b>
---
---@param ped Ped
---@return number pedtype
function getPedType(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskUseClosestMapAttractor">Open the wiki</a></b>
---
---@param ped Ped
---@param radius number
---@param nearModel Model
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param scriptNamed string
---@return boolean result
function taskUseClosestMapAttractor(ped, radius, nearModel, offsetX, offsetY, offsetZ, scriptNamed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/planeAttackPlayerUsingDogFight">Open the wiki</a></b>
---
---@param hydra number
---@param player Player
---@param radius number
function planeAttackPlayerUsingDogFight(hydra, player, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/canTriggerGangWarWhenOnAMission">Open the wiki</a></b>
---
---@param can boolean
function canTriggerGangWarWhenOnAMission(can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/controlMovableVehiclePart">Open the wiki</a></b>
---
---@param car Vehicle
---@param angle number
function controlMovableVehiclePart(car, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/winchCanPickVehicleUp">Open the wiki</a></b>
---
---@param car Vehicle
---@param attractive boolean
function winchCanPickVehicleUp(car, attractive) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/openCarDoorABit">Open the wiki</a></b>
---
---@param car Vehicle
---@param door number
---@param rotation number
function openCarDoorABit(car, door, rotation) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarDoorFullyOpen">Open the wiki</a></b>
---
---@param car Vehicle
---@param door number
---@return boolean result
function isCarDoorFullyOpen(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAlwaysDraw3dMarkers">Open the wiki</a></b>
---
---@param set boolean
function setAlwaysDraw3dMarkers(set) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/streamScript">Open the wiki</a></b>
---
---@param script number
function streamScript(script) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasStreamedScriptLoaded">Open the wiki</a></b>
---
---@param script number
---@return boolean result
function hasStreamedScriptLoaded(script) end

---
--- Захват/отображение территорий в игре<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGangWarsTrainingMission">Open the wiki</a></b><br/>
---
---@param set boolean статус отображения (false - да, true - нет)
function setGangWarsTrainingMission(set) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharHasUsedEntryExit">Open the wiki</a></b>
---
---@param ped Ped
---@param X number
---@param Y number
---@param radius number
function setCharHasUsedEntryExit(ped, X, Y, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharMaxHealth">Open the wiki</a></b>
---
---@param ped Ped
---@param health number
function setCharMaxHealth(ped, health) end

---
--- Включает игроку ночное зрение<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setNightVision">Open the wiki</a></b><br/>
---
---@param enable boolean true - включить, false - выключить
function setNightVision(enable) end

---
--- Включает игроку инфракрасное зрение<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setInfraredVision">Open the wiki</a></b><br/>
---
---@param enable boolean true - включить, false - выключить
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
---@param can boolean
function setCharCanBeKnockedOffBike(ped, can) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCoordinatesDontWarpGang">Open the wiki</a></b>
---
---@param ped Ped
---@param X number
---@param Y number
---@param Z number
function setCharCoordinatesDontWarpGang(ped, X, Y, Z) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addPriceModifier">Open the wiki</a></b>
---
---@param item number
---@param price number
function addPriceModifier(item, price) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removePriceModifier">Open the wiki</a></b>
---
---@param item number
function removePriceModifier(item) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/initZonePopulationSettings">Open the wiki</a></b>
---
function initZonePopulationSettings() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/explodeCarInCutsceneShakeAndBits">Open the wiki</a></b>
---
---@param car Vehicle
---@param shake boolean
---@param effect boolean
---@param sound boolean
function explodeCarInCutsceneShakeAndBits(car, shake, effect, sound) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSkipCutsceneButtonPressed">Open the wiki</a></b>
---
---@return boolean result
function isSkipCutsceneButtonPressed() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCutsceneOffset">Open the wiki</a></b>
---
---@return boolean result
---@return number X
---@return number Y
---@return number Z
function getCutsceneOffset() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectScale">Open the wiki</a></b>
---
---@param object Object
---@param scale number
function setObjectScale(object, scale) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentPopulationZoneType">Open the wiki</a></b>
---
---@return number popcycle
function getCurrentPopulationZoneType() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createMenu">Open the wiki</a></b>
---
---@param title GxtString
---@param posX number
---@param posY number
---@param width number
---@param columns number
---@param interactive boolean
---@param background boolean
---@param alignment number
---@return number menu
function createMenu(title, posX, posY, width, columns, interactive, background, alignment) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMenuColumnOrientation">Open the wiki</a></b>
---
---@param menu number
---@param column number
---@param alignment number
function setMenuColumnOrientation(menu, column, alignment) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMenuItemSelected">Open the wiki</a></b>
---
---@param menu number
---@return number item
function getMenuItemSelected(menu) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getMenuItemAccepted">Open the wiki</a></b>
---
---@param menu number
---@return number item
function getMenuItemAccepted(menu) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/activateMenuItem">Open the wiki</a></b>
---
---@param menu number
---@param row number
---@param enable boolean
function activateMenuItem(menu, row, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/deleteMenu">Open the wiki</a></b>
---
---@param menu number
function deleteMenu(menu) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMenuColumn">Open the wiki</a></b>
---
---@param menu number
---@param column number
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
function setMenuColumn(
	menu,
	column,
	header,
	data1,
	data2,
	data3,
	data4,
	data5,
	data6,
	data7,
	data8,
	data9,
	data10,
	data11,
	data12
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setBlipEntryExit">Open the wiki</a></b>
---
---@param marker Marker
---@param X number
---@param Y number
---@param radius number
function setBlipEntryExit(marker, X, Y, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchDeathPenalties">Open the wiki</a></b>
---
---@param lose boolean
function switchDeathPenalties(lose) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchArrestPenalties">Open the wiki</a></b>
---
---@param lose boolean
function switchArrestPenalties(lose) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setExtraHospitalRestartPoint">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param angle number
function setExtraHospitalRestartPoint(X, Y, Z, radius, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setExtraPoliceStationRestartPoint">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param angle number
function setExtraPoliceStationRestartPoint(X, Y, Z, radius, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findNumberTagsTagged">Open the wiki</a></b>
---
---@return number num
function findNumberTagsTagged() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getTerritoryUnderControlPercentage">Open the wiki</a></b>
---
---@return number percentage
function getTerritoryUnderControlPercentage() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectInAngledArea2d">Open the wiki</a></b>
---
---@param object Object
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param radius number
---@param sphere boolean
---@return boolean result
function isObjectInAngledArea2d(object, x1, y1, x2, y2, radius, sphere) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectInAngledArea3d">Open the wiki</a></b>
---
---@param object Object
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param depth number
---@param flag boolean
---@return boolean result
function isObjectInAngledArea3d(object, x1, y1, z1, x2, y2, z2, depth, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCharInSphereNoBrain">Open the wiki</a></b>
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@return Ped ped
function getRandomCharInSphereNoBrain(X, Y, Z, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlaneUndercarriageUp">Open the wiki</a></b>
---
---@param plane number
---@param set boolean
function setPlaneUndercarriageUp(plane, set) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/disableAllEntryExits">Open the wiki</a></b>
---
---@param disable boolean
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
---@param liftable boolean
function setObjectAsStealable(object, liftable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCreateRandomGangMembers">Open the wiki</a></b>
---
---@param enable boolean
function setCreateRandomGangMembers(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addSparks">Open the wiki</a></b>
---
---@param posX number
---@param posY number
---@param posZ number
---@param vecX number
---@param vecY number
---@param vecZ number
---@param density number
function addSparks(posX, posY, posZ, vecX, vecY, vecZ, density) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getVehicleClass">Open the wiki</a></b>
---
---@param car Vehicle
---@return number class
function getVehicleClass(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearConversationForChar">Open the wiki</a></b>
---
---@param ped Ped
function clearConversationForChar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMenuItemWithNumber">Open the wiki</a></b>
---
---@param panel number
---@param column number
---@param row number
---@param gxtString GxtString
---@param number number
function setMenuItemWithNumber(panel, column, row, gxtString, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMenuItemWith2Numbers">Open the wiki</a></b>
---
---@param panel number
---@param column number
---@param row number
---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
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
---@param atX number
---@param atY number
---@param atZ number
---@return GxtString nameB
function getNameOfInfoZone(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/vehicleCanBeTargettedByHsMissile">Open the wiki</a></b>
---
---@param car Vehicle
---@param targetable boolean
function vehicleCanBeTargettedByHsMissile(car, targetable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setFreebiesInVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@param containsGoodies boolean
function setFreebiesInVehicle(car, containsGoodies) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setScriptLimitToGangSize">Open the wiki</a></b>
---
---@param max boolean
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
---@param bodypart number
---@return number textureCRC
---@return number modelCRC
function getClothesItem(player, bodypart) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/showUpdateStats">Open the wiki</a></b>
---
---@param display boolean
function showUpdateStats(display) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCoordBlipAppearance">Open the wiki</a></b>
---
---@param checkpoint Checkpoint
---@param type number
function setCoordBlipAppearance(checkpoint, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHeathazeEffect">Open the wiki</a></b>
---
---@param enable boolean
function setHeathazeEffect(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isHelpMessageBeingDisplayed">Open the wiki</a></b>
---
---@return boolean result
function isHelpMessageBeingDisplayed() end

---
--- Проверяет с указанного ли оружия было попадание по объекту.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasObjectBeenDamagedByWeapon">Open the wiki</a></b><br/>
---
---@param object Object хендл объекта
---@param type number ID оружия
---@return boolean result результат проверки
function hasObjectBeenDamagedByWeapon(object, type) end

---
--- Очищает объект от последнего нанесенного урона.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearObjectLastWeaponDamage">Open the wiki</a></b><br/>
---
---@param object Object хендл объекта
function clearObjectLastWeaponDamage(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerJumpButton">Open the wiki</a></b>
---
---@param player Player
---@param enable boolean
function setPlayerJumpButton(player, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getHudColour">Open the wiki</a></b>
---
---@param interface number
---@return number r
---@return number g
---@return number b
---@return number a
function getHudColour(interface) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/lockDoor">Open the wiki</a></b>
---
---@param door number
---@param lock boolean
function lockDoor(door, lock) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectMass">Open the wiki</a></b>
---
---@param object Object
---@param mass number
function setObjectMass(object, mass) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectMass">Open the wiki</a></b>
---
---@param number number
---@return number mass
function getObjectMass(number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectTurnMass">Open the wiki</a></b>
---
---@param object Object
---@param turnMass number
function setObjectTurnMass(object, turnMass) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectTurnMass">Open the wiki</a></b>
---
---@param object Object
---@return number turnMass
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
---@param panel number
---@param activeRow number
function setActiveMenuItem(panel, activeRow) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markStreamedScriptAsNoLongerNeeded">Open the wiki</a></b>
---
---@param externalScript number
function markStreamedScriptAsNoLongerNeeded(externalScript) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeStreamedScript">Open the wiki</a></b>
---
---@param externalScript number
function removeStreamedScript(externalScript) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMessageFormatting">Open the wiki</a></b>
---
---@param priority boolean
---@param leftmargin number
---@param maxwidth number
function setMessageFormatting(priority, leftmargin, maxwidth) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startNewStreamedScript">Open the wiki</a></b>
---
---@param externalScript number
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
---@param enable boolean
function winchCanPickObjectUp(object, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchAudioZone">Open the wiki</a></b>
---
---@param zone GxtString
---@param enableSound boolean
function switchAudioZone(zone, enableSound) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarEngineOn">Open the wiki</a></b>
---
---@param car Vehicle
---@param on boolean
function setCarEngineOn(car, on) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarLightsOn">Open the wiki</a></b>
---
---@param car Vehicle
---@param lights boolean
function setCarLightsOn(car, lights) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getUserOfClosestMapAttractor">Open the wiki</a></b>
---
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radius number
---@param modelId Model
---@param externalScriptNamed string
---@return Ped ped
function getUserOfClosestMapAttractor(sphereX, sphereY, sphereZ, radius, modelId, externalScriptNamed) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchRoadsBackToOriginal">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchRoadsBackToOriginal(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchPedRoadsBackToOriginal">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchPedRoadsBackToOriginal(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPlaneUndercarriagePosition">Open the wiki</a></b>
---
---@param plane number
---@return number landingGearStatus
function getPlaneUndercarriagePosition(plane) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraSetVectorTrack">Open the wiki</a></b>
---
---@param pointX number
---@param pointY number
---@param pointZ number
---@param transverseX number
---@param transverseY number
---@param transverseZ number
---@param time number
---@param smooth boolean
function cameraSetVectorTrack(pointX, pointY, pointZ, transverseX, transverseY, transverseZ, time, smooth) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraSetLerpFov">Open the wiki</a></b>
---
---@param from number
---@param to number
---@param timelimit number
---@param smoothTransition boolean
function cameraSetLerpFov(from, to, timelimit, smoothTransition) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchAmbientPlanes">Open the wiki</a></b>
---
---@param enable boolean
function switchAmbientPlanes(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setDarknessEffect">Open the wiki</a></b>
---
---@param enable boolean
---@param value number
function setDarknessEffect(enable, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraResetNewScriptables">Open the wiki</a></b>
---
function cameraResetNewScriptables() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumberOfInstancesOfStreamedScript">Open the wiki</a></b>
---
---@param externalScript number
---@return number value
function getNumberOfInstancesOfStreamedScript(externalScript) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/allocateStreamedScriptToRandomPed">Open the wiki</a></b>
---
---@param externalScript number
---@param actorModel Model
---@param priority number
function allocateStreamedScriptToRandomPed(externalScript, actorModel, priority) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/allocateStreamedScriptToObject">Open the wiki</a></b>
---
---@param externalScript number
---@param objectModel Model
---@param priority number
---@param radius number
---@param type number
function allocateStreamedScriptToObject(externalScript, objectModel, priority, radius, type) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getGroupMember">Open the wiki</a></b>
---
---@param group number
---@param member number
---@return number handle
function getGroupMember(group, member) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getWaterHeightAtCoords">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param ignoreWaves boolean
---@return number height
function getWaterHeightAtCoords(atX, atY, ignoreWaves) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraPersistTrack">Open the wiki</a></b>
---
---@param lock boolean
function cameraPersistTrack(lock) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraPersistPos">Open the wiki</a></b>
---
---@param lock boolean
function cameraPersistPos(lock) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraPersistFov">Open the wiki</a></b>
---
---@param lock boolean
function cameraPersistFov(lock) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraIsVectorMoveRunning">Open the wiki</a></b>
---
---@return boolean result
function cameraIsVectorMoveRunning() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraIsVectorTrackRunning">Open the wiki</a></b>
---
---@return boolean result
function cameraIsVectorTrackRunning() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraSetVectorMove">Open the wiki</a></b>
---
---@param cameraX number
---@param cameraY number
---@param cameraZ number
---@param positionX number
---@param positionY number
---@param positionZ number
---@param time number
---@param smoothTransition boolean
function cameraSetVectorMove(cameraX, cameraY, cameraZ, positionX, positionY, positionZ, time, smoothTransition) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawWindow">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param gxtString GxtString
---@param style number
function drawWindow(cornerAX, cornerAY, cornerBX, cornerBY, gxtString, style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachCarToObject">Open the wiki</a></b>
---
---@param car Vehicle
---@param object Object
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function attachCarToObject(car, object, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGarageResprayFree">Open the wiki</a></b>
---
---@param garage GxtString
---@param free boolean
function setGarageResprayFree(garage, free) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharBulletproofVest">Open the wiki</a></b>
---
---@param ped Ped
---@param enable boolean
function setCharBulletproofVest(ped, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCinemaCamera">Open the wiki</a></b>
---
---@param lock boolean
function setCinemaCamera(lock) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharFireDamageMultiplier">Open the wiki</a></b>
---
---@param ped Ped
---@param multiplier number
function setCharFireDamageMultiplier(ped, multiplier) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGroupFollowStatus">Open the wiki</a></b>
---
---@param group number
---@param status boolean
function setGroupFollowStatus(group, status) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSearchlightClipIfColliding">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param flag boolean
function setSearchlightClipIfColliding(searchlight, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasPlayerBoughtItem">Open the wiki</a></b>
---
---@param item number
---@return boolean result
function hasPlayerBoughtItem(item) end

---
--- Помещает камеру перед указанным игроком.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCameraInFrontOfChar">Open the wiki</a></b><br/>
---
---@param ped Ped хендл игрока
function setCameraInFrontOfChar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPlayerMaxArmour">Open the wiki</a></b>
---
---@param player Player
---@return number maxArmour
function getPlayerMaxArmour(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharUsesUpperbodyDamageAnimsOnly">Open the wiki</a></b>
---
---@param ped Ped
---@param uninterupted boolean
function setCharUsesUpperbodyDamageAnimsOnly(ped, uninterupted) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharSayContext">Open the wiki</a></b>
---
---@param ped Ped
---@param speech number
---@return number spokenPhrase
function setCharSayContext(ped, speech) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addExplosionVariableShake">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param type number
---@param cameraShake number
function addExplosionVariableShake(atX, atY, atZ, type, cameraShake) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachMissionAudioToChar">Open the wiki</a></b>
---
---@param id number
---@param ped Ped
function attachMissionAudioToChar(id, ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/updatePickupMoneyPerDay">Open the wiki</a></b>
---
---@param pickup Pickup
---@param cash number
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
---@return number coordX
---@return number coordY
---@return number coordZ
---@return number number
function getPositionOfEntryExitCharUsed(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharTalking">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function isCharTalking(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/disableCharSpeech">Open the wiki</a></b>
---
---@param ped Ped
---@param disable boolean
function disableCharSpeech(ped, disable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableCharSpeech">Open the wiki</a></b>
---
---@param ped Ped
function enableCharSpeech(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpSkip">Open the wiki</a></b>
---
---@param posX number
---@param posY number
---@param posZ number
---@param angle number
function setUpSkip(posX, posY, posZ, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearSkip">Open the wiki</a></b>
---
function clearSkip() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/preloadBeatTrack">Open the wiki</a></b>
---
---@param soundtrack number
function preloadBeatTrack(soundtrack) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getBeatTrackStatus">Open the wiki</a></b>
---
---@return number status
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
---@return number max
function findMaxNumberOfGroupMembers() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/vehicleDoesProvideCover">Open the wiki</a></b>
---
---@param car Vehicle
---@param providesCover boolean
function vehicleDoesProvideCover(car, providesCover) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createSnapshotPickup">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@return Pickup pickup
function createSnapshotPickup(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createHorseshoePickup">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@return Pickup pickup
function createHorseshoePickup(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createOysterPickup">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@return Pickup pickup
function createOysterPickup(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasObjectBeenUprooted">Open the wiki</a></b>
---
---@param object Object
---@return boolean result
function hasObjectBeenUprooted(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addSmokeParticle">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param velocityX number
---@param velocityY number
---@param velocityZ number
---@param r number
---@param g number
---@param b number
---@param a number
---@param size number
---@param factor number
function addSmokeParticle(atX, atY, atZ, velocityX, velocityY, velocityZ, r, g, b, a, size, factor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharStuckUnderCar">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function isCharStuckUnderCar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/controlCarDoor">Open the wiki</a></b>
---
---@param car Vehicle
---@param door number
---@param unlatch number
---@param angle number
function controlCarDoor(car, door, unlatch, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getDoorAngleRatio">Open the wiki</a></b>
---
---@param car Vehicle
---@param door number
---@return number angle
function getDoorAngleRatio(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerDisplayVitalStatsButton">Open the wiki</a></b>
---
---@param player Player
---@param display boolean
function setPlayerDisplayVitalStatsButton(player, display) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharKeepTask">Open the wiki</a></b>
---
---@param ped Ped
---@param keepTasks boolean
function setCharKeepTask(ped, keepTasks) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createMenuGrid">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param positionX number
---@param positionY number
---@param width number
---@param columns number
---@param interactive boolean
---@param background boolean
---@param alignment number
---@return number id
function createMenuGrid(gxtString, positionX, positionY, width, columns, interactive, background, alignment) end

---
--- Проверяет плавает ли пед<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharSwimming">Open the wiki</a></b><br/>
---
---@param ped Ped хендл педа
---@return boolean result результат
function isCharSwimming(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharSwimState">Open the wiki</a></b>
---
---@param ped Ped
---@return number status
function getCharSwimState(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startCharFacialTalk">Open the wiki</a></b>
---
---@param ped Ped
---@param time number
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
---@return boolean result
function isBigVehicle(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchPoliceHelis">Open the wiki</a></b>
---
---@param enable boolean
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
---@param slot number
---@return Model modelId
function getCurrentCarMod(car, slot) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarLowRider">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
function isCarLowRider(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarStreetRacer">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
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
---@param atX number
---@param atY number
---@param atZ number
function setCharCoordinatesNoOffset(ped, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesScriptFireExist">Open the wiki</a></b>
---
---@param fire number
---@return boolean result
function doesScriptFireExist(fire) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/resetStuffUponResurrection">Open the wiki</a></b>
---
function resetStuffUponResurrection() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isEmergencyServicesVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
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
---@return boolean result
function isObjectWithinBrainActivationRange(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/copySharedCharDecisionMaker">Open the wiki</a></b>
---
---@param from number
---@return number to
function copySharedCharDecisionMaker(from) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtPosition">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param event number
function reportMissionAudioEventAtPosition(atX, atY, atZ, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtObject">Open the wiki</a></b>
---
---@param at number
---@param event number
function reportMissionAudioEventAtObject(at, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachMissionAudioToObject">Open the wiki</a></b>
---
---@param id number
---@param object Object
function attachMissionAudioToObject(id, object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getNumCarColours">Open the wiki</a></b>
---
---@param car Vehicle
---@return number colours
function getNumCarColours(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/extinguishFireAtPoint">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
function extinguishFireAtPoint(atX, atY, atZ, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasTrainDerailed">Open the wiki</a></b>
---
---@param train Vehicle
---@return boolean result
function hasTrainDerailed(train) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharForceDieInCar">Open the wiki</a></b>
---
---@param ped Ped
---@param stayInCarWhenDead boolean
function setCharForceDieInCar(ped, stayInCarWhenDead) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setOnlyCreateGangMembers">Open the wiki</a></b>
---
---@param enable boolean
function setOnlyCreateGangMembers(enable) end

---
--- Возвращает ид объекта по его хендлу.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getObjectModel">Open the wiki</a></b><br/>
---
---@param object Object хендл объекта
---@return number id ID объекта
function getObjectModel(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharUsesCollisionClosestObjectOfType">Open the wiki</a></b>
---
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radius number
---@param modelId Model
---@param solid boolean
---@param forActor number
function setCharUsesCollisionClosestObjectOfType(sphereX, sphereY, sphereZ, radius, modelId, solid, forActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearAllScriptFireFlags">Open the wiki</a></b>
---
function clearAllScriptFireFlags() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarBlockingCar">Open the wiki</a></b>
---
---@param car Vehicle
---@return number blockingCar
function getCarBlockingCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentVehiclePaintjob">Open the wiki</a></b>
---
---@param car Vehicle
---@return number paintjob
function getCurrentVehiclePaintjob(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHelpMessageBoxSize">Open the wiki</a></b>
---
---@param width number
function setHelpMessageBoxSize(width) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setGunshotSenseRangeForRiot2">Open the wiki</a></b>
---
---@param range number
function setGunshotSenseRangeForRiot2(range) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarMovingComponentOffset">Open the wiki</a></b>
---
---@param car Vehicle
---@return number angle
function getCarMovingComponentOffset(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setNamedEntryExitFlag">Open the wiki</a></b>
---
---@param interior GxtString
---@param bitmask number
---@param flag boolean
function setNamedEntryExitFlag(interior, bitmask, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pauseCurrentBeatTrack">Open the wiki</a></b>
---
---@param paused boolean
function pauseCurrentBeatTrack(paused) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerWeaponsScrollable">Open the wiki</a></b>
---
---@param player Player
---@param scrollable boolean
function setPlayerWeaponsScrollable(player, scrollable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/markRoadNodeAsDontWander">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
function markRoadNodeAsDontWander(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/unmarkAllRoadNodesAsDontWander">Open the wiki</a></b>
---
function unmarkAllRoadNodesAsDontWander() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCheckpointHeading">Open the wiki</a></b>
---
---@param checkpoint Checkpoint
---@param angle number
function setCheckpointHeading(checkpoint, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMissionRespectTotal">Open the wiki</a></b>
---
---@param respect number
function setMissionRespectTotal(respect) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/awardPlayerMissionRespect">Open the wiki</a></b>
---
---@param respect number
function awardPlayerMissionRespect(respect) end

---
--- Устанавливает / отключает коллизию транспортному средству.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCarCollision">Open the wiki</a></b><br/>
---
---@param car Vehicle хендл транспортного средства
---@param collision boolean статус коллизии
function setCarCollision(car, collision) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changePlaybackToUseAi">Open the wiki</a></b>
---
---@param car Vehicle
function changePlaybackToUseAi(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/cameraSetShakeSimulationSimple">Open the wiki</a></b>
---
---@param type number
---@param timelimit number
---@param intensity number
function cameraSetShakeSimulationSimple(type, timelimit, intensity) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isNightVisionActive">Open the wiki</a></b>
---
---@return boolean result
function isNightVisionActive() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCreateRandomCops">Open the wiki</a></b>
---
---@param enable boolean
function setCreateRandomCops(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskSetIgnoreWeaponRangeFlag">Open the wiki</a></b>
---
---@param ped Ped
---@param ignore boolean
function taskSetIgnoreWeaponRangeFlag(ped, ignore) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskPickUpSecondObject">Open the wiki</a></b>
---
---@param ped Ped
---@param object Object
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param bone number
---@param int7 number
---@param animation string
---@param file string
---@param time number
function taskPickUpSecondObject(ped, object, offsetX, offsetY, offsetZ, bone, int7, animation, file, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dropSecondObject">Open the wiki</a></b>
---
---@param ped Ped
---@param to boolean
function dropSecondObject(ped, to) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeObjectElegantly">Open the wiki</a></b>
---
---@param object Object
function removeObjectElegantly(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawCrosshair">Open the wiki</a></b>
---
---@param draw boolean
function drawCrosshair(draw) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpConversationNodeWithSpeech">Open the wiki</a></b>
---
---@param question GxtString
---@param answerY GxtString
---@param answerN GxtString
---@param questionWav number
---@param answerYWav number
---@param answerNWav number
function setUpConversationNodeWithSpeech(question, answerY, answerN, questionWav, answerYWav, answerNWav) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/showBlipsOnAllLevels">Open the wiki</a></b>
---
---@param enable boolean
function showBlipsOnAllLevels(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharDruggedUp">Open the wiki</a></b>
---
---@param ped Ped
---@param druggedUp boolean
function setCharDruggedUp(ped, druggedUp) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharHeadMissing">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function isCharHeadMissing(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getHashKey">Open the wiki</a></b>
---
---@param string string
---@return number CRC32
function getHashKey(string) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpConversationEndNodeWithSpeech">Open the wiki</a></b>
---
---@param gxtString GxtString
---@param speech number
function setUpConversationEndNodeWithSpeech(gxtString, speech) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/randomPassengerSay">Open the wiki</a></b>
---
---@param passengers number
---@param audioTable number
function randomPassengerSay(passengers, audioTable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hideAllFrontendBlips">Open the wiki</a></b>
---
---@param hide boolean
function hideAllFrontendBlips(hide) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerInCarCameraMode">Open the wiki</a></b>
---
---@param mode number
function setPlayerInCarCameraMode(mode) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharInAnyTrain">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function isCharInAnyTrain(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpSkipAfterMission">Open the wiki</a></b>
---
---@param posX number
---@param posY number
---@param posZ number
---@param angle number
function setUpSkipAfterMission(posX, posY, posZ, angle) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleIsConsideredByPlayer">Open the wiki</a></b>
---
---@param car Vehicle
---@param accessible boolean
function setVehicleIsConsideredByPlayer(car, accessible) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCarModelInMemory">Open the wiki</a></b>
---
---@param unk boolean
---@return Model modelId
---@return number class
function getRandomCarModelInMemory(unk) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarDoorLockStatus">Open the wiki</a></b>
---
---@param car Vehicle
---@return number doorStatus
function getCarDoorLockStatus(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setClosestEntryExitFlag">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param radius number
---@param bitmask number
---@param flag boolean
function setClosestEntryExitFlag(atX, atY, radius, bitmask, flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharSignalAfterKill">Open the wiki</a></b>
---
---@param ped Ped
---@param signal boolean
function setCharSignalAfterKill(ped, signal) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharWantedByPolice">Open the wiki</a></b>
---
---@param ped Ped
---@param wanted boolean
function setCharWantedByPolice(ped, wanted) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setZoneNoCops">Open the wiki</a></b>
---
---@param zone GxtString
---@param disableCops boolean
function setZoneNoCops(zone, disableCops) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addBlood">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param density number
---@param onActor number
function addBlood(atX, atY, atZ, offsetX, offsetY, offsetZ, density, onActor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayCarNames">Open the wiki</a></b>
---
---@param show boolean
function displayCarNames(show) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayZoneNames">Open the wiki</a></b>
---
---@param show boolean
function displayZoneNames(show) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarDoorDamaged">Open the wiki</a></b>
---
---@param car Vehicle
---@param door number
---@return boolean result
function isCarDoorDamaged(car, door) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharCoordinatesDontWarpGangNoOffset">Open the wiki</a></b>
---
---@param ped Ped
---@param atX number
---@param atY number
---@param atZ number
function setCharCoordinatesDontWarpGangNoOffset(ped, atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMinigameInProgress">Open the wiki</a></b>
---
---@param enable boolean
function setMinigameInProgress(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isMinigameInProgress">Open the wiki</a></b>
---
---@return boolean result
function isMinigameInProgress() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setForceRandomCarModel">Open the wiki</a></b>
---
---@param modelId Model
function setForceRandomCarModel(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInAngledAreaNoSave">Open the wiki</a></b>
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param angle number
---@param int6 number
---@return Vehicle car
function getRandomCarOfTypeInAngledAreaNoSave(x1, y1, x2, y2, angle, int6) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/addNextMessageToPreviousBriefs">Open the wiki</a></b>
---
---@param int1 boolean
function addNextMessageToPreviousBriefs(int1) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/failKillFrenzy">Open the wiki</a></b>
---
function failKillFrenzy() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCopVehicleInArea3dNoSave">Open the wiki</a></b>
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@return boolean result
function isCopVehicleInArea3dNoSave(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPetrolTankWeakpoint">Open the wiki</a></b>
---
---@param car Vehicle
---@param enabled boolean
function setPetrolTankWeakpoint(car, enabled) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharUsingMapAttractor">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function isCharUsingMapAttractor(ped) end

---
--- Меняет скин игрока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerModel">Open the wiki</a></b><br/>
---
---@param player Player хендл игрока
---@param modelId Model ID скина
function setPlayerModel(player, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/areSubtitlesSwitchedOn">Open the wiki</a></b>
---
---@return boolean result
function areSubtitlesSwitchedOn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeCharFromCarMaintainPosition">Open the wiki</a></b>
---
---@param ped Ped
---@param car Vehicle
function removeCharFromCarMaintainPosition(ped, car) end

---
--- Задает иммунитет объекту<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setObjectProofs">Open the wiki</a></b><br/>
---
---@param object Object хендл объекта
---@param BP boolean иммунитет от пуль
---@param FP boolean иммунитет от огня
---@param EP boolean иммунитет от взрывов
---@param CP boolean иммунитет от ударений
---@param MP boolean иммунитет от оружия ближнего боя в т.ч. и кулаков
function setObjectProofs(object, BP, FP, EP, CP, MP) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCarTouchingCar">Open the wiki</a></b>
---
---@param car1 Vehicle
---@param car2 Vehicle
---@return boolean result
function isCarTouchingCar(car1, car2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesObjectHaveThisModel">Open the wiki</a></b>
---
---@param object Object
---@param modelId Model
---@return boolean result
function doesObjectHaveThisModel(object, modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setTrainForcedToSlowDown">Open the wiki</a></b>
---
---@param train Vehicle
---@param forced boolean
function setTrainForcedToSlowDown(train, forced) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isVehicleOnAllWheels">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
function isVehicleOnAllWheels(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesPickupExist">Open the wiki</a></b>
---
---@param pickup Pickup
---@return boolean result
function doesPickupExist(pickup) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableAmbientCrime">Open the wiki</a></b>
---
---@param enable boolean
function enableAmbientCrime(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearWantedLevelInGarage">Open the wiki</a></b>
---
function clearWantedLevelInGarage() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharSayContextImportant">Open the wiki</a></b>
---
---@param ped Ped
---@param soundslot number
---@param flags1 boolean
---@param flags2 boolean
---@param flags3 boolean
---@return number unk
function setCharSayContextImportant(ped, soundslot, flags1, flags2, flags3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharSayScript">Open the wiki</a></b>
---
---@param ped Ped
---@param sound number
---@param flags1 boolean
---@param flags2 boolean
---@param flags3 boolean
function setCharSayScript(ped, sound, flags1, flags2, flags3) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceInteriorLightingForPlayer">Open the wiki</a></b>
---
---@param player Player
---@param force boolean
function forceInteriorLightingForPlayer(player, force) end

---
--- Использует детонатор<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/useDetonator">Open the wiki</a></b><br/>
---
function useDetonator() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isMoneyPickupAtCoords">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@return boolean result
function isMoneyPickupAtCoords(atX, atY, atZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setMenuColumnWidth">Open the wiki</a></b>
---
---@param panel number
---@param column number
---@param width number
function setMenuColumnWidth(panel, column, width) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/makeRoomInPlayerGangForMissionPeds">Open the wiki</a></b>
---
---@param group number
function makeRoomInPlayerGangForMissionPeds(group) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharGettingInToACar">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
function isCharGettingInToACar(ped) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpSkipForSpecificVehicle">Open the wiki</a></b>
---
---@param posX number
---@param posY number
---@param posZ number
---@param angle number
---@param car Vehicle
function setUpSkipForSpecificVehicle(posX, posY, posZ, angle, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCarModelValue">Open the wiki</a></b>
---
---@param modelId Model
---@return number price
function getCarModelValue(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createCarGeneratorWithPlate">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param angle number
---@param modelId Model
---@param color1 number
---@param color2 number
---@param forceSpawn boolean
---@param alarm number
---@param doorLock number
---@param minDelay number
---@param maxDelay number
---@param plate string
---@return number generator
function createCarGeneratorWithPlate(
	atX,
	atY,
	atZ,
	angle,
	modelId,
	color1,
	color2,
	forceSpawn,
	alarm,
	doorLock,
	minDelay,
	maxDelay,
	plate
)
end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/findTrainDirection">Open the wiki</a></b>
---
---@param train Vehicle
---@return boolean result
function findTrainDirection(train) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setAircraftCarrierSamSite">Open the wiki</a></b>
---
---@param enable boolean
function setAircraftCarrierSamSite(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawLightWithRange">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param r number
---@param g number
---@param b number
---@param radius number
function drawLightWithRange(atX, atY, atZ, r, g, b, radius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableBurglaryHouses">Open the wiki</a></b>
---
---@param enable boolean
function enableBurglaryHouses(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerControlOn">Open the wiki</a></b>
---
---@param player Player
---@return boolean result
function isPlayerControlOn(player) end

---
--- Функция возвращает айди интерьера, в котором находится персонаж по его хендлу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCharActiveInterior">Open the wiki</a></b><br/>
---
---@param ped Ped Хендл персонажа
---@return number interior Айди интерьера
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
---@param useAnim boolean
function playerTakeOffGoggles(player, useAnim) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/allowFixedCameraCollision">Open the wiki</a></b>
---
---@param allow boolean
function allowFixedCameraCollision(allow) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCharSpottedCharInFront">Open the wiki</a></b>
---
---@param ped Ped
---@param ped2 Ped
---@return boolean result
function hasCharSpottedCharInFront(ped, ped2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceBigMessageAndCounter">Open the wiki</a></b>
---
---@param stayOnScreen boolean
function forceBigMessageAndCounter(stayOnScreen) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setVehicleCameraTweak">Open the wiki</a></b>
---
---@param carModel Model
---@param distance number
---@param altitudeMultiplier number
---@param angleX number
function setVehicleCameraTweak(carModel, distance, altitudeMultiplier, angleX) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/resetVehicleCameraTweak">Open the wiki</a></b>
---
function resetVehicleCameraTweak() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtChar">Open the wiki</a></b>
---
---@param ped Ped
---@param event number
function reportMissionAudioEventAtChar(ped, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doesDecisionMakerExist">Open the wiki</a></b>
---
---@param maker number
---@return boolean result
function doesDecisionMakerExist(maker) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/ignoreHeightDifferenceFollowingNodes">Open the wiki</a></b>
---
---@param ped Ped
---@param ignore boolean
function ignoreHeightDifferenceFollowingNodes(ped, ignore) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shutAllCharsUp">Open the wiki</a></b>
---
---@param enable boolean
function shutAllCharsUp(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharGetOutUpsideDownCar">Open the wiki</a></b>
---
---@param ped Ped
---@param canGetOut boolean
function setCharGetOutUpsideDownCar(ped, canGetOut) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtCar">Open the wiki</a></b>
---
---@param car Vehicle
---@param event number
function reportMissionAudioEventAtCar(car, event) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/doWeaponStuffAtStartOf2pGame">Open the wiki</a></b>
---
function doWeaponStuffAtStartOf2pGame() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasGameJustReturnedFromFrontend">Open the wiki</a></b>
---
---@return boolean result
function hasGameJustReturnedFromFrontend() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCurrentLanguage">Open the wiki</a></b>
---
---@return number language
function getCurrentLanguage() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isObjectIntersectingWorld">Open the wiki</a></b>
---
---@param object Object
---@return boolean result
function isObjectIntersectingWorld(object) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getStringWidth">Open the wiki</a></b>
---
---@param gxtString GxtString
---@return number width
function getStringWidth(gxtString) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/resetVehicleHydraulics">Open the wiki</a></b>
---
---@param car Vehicle
function resetVehicleHydraulics(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRespawnPointForDurationOfMission">Open the wiki</a></b>
---
---@param posX number
---@param posY number
---@param posZ number
function setRespawnPointForDurationOfMission(posX, posY, posZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isThisModelACar">Open the wiki</a></b>
---
---@param modelId Model
---@return boolean result
function isThisModelACar(modelId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchOnGroundSearchlight">Open the wiki</a></b>
---
---@param searchlight Searchlight
---@param lightsThroughObstacles boolean
function switchOnGroundSearchlight(searchlight, lightsThroughObstacles) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isGangWarFightingGoingOn">Open the wiki</a></b>
---
---@return boolean result
function isGangWarFightingGoingOn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isNextStationAllowed">Open the wiki</a></b>
---
---@param train Vehicle
---@return boolean result
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
---@param number number
---@return number width
function getStringWidthWithNumber(gxtString, number) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/shutCharUpForScriptedSpeech">Open the wiki</a></b>
---
---@param ped Ped
---@param muted boolean
function shutCharUpForScriptedSpeech(ped, muted) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/enableDisabledAttractorsOnObject">Open the wiki</a></b>
---
---@param object Object
---@param enable boolean
function enableDisabledAttractorsOnObject(object, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/loadSceneInDirection">Open the wiki</a></b>
---
---@param coordX number
---@param coordY number
---@param coordZ number
---@param angle number
function loadSceneInDirection(coordX, coordY, coordZ, angle) end

---
--- Проверяет, использует ли игрок джетпак<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerUsingJetpack">Open the wiki</a></b><br/>
---
---@param player Player скриптовый хэндл игрока
---@return boolean result результат выполнения операции
function isPlayerUsingJetpack(player) end

---
--- Удаляет стилизованный текст, который был воспроизведен через <a class="is-internal-link is-valid-page" href="/moonloader/lua/printBig">printBig</a><br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/clearThisPrintBigNow">Open the wiki</a></b><br/>
---
---@param style number тип стиля
function clearThisPrintBigNow(style) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasLanguageChanged">Open the wiki</a></b>
---
---@return boolean result
function hasLanguageChanged() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/incrementIntStatNoMessage">Open the wiki</a></b>
---
---@param stat number
---@param value number
function incrementIntStatNoMessage(stat, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setExtraCarColours">Open the wiki</a></b>
---
---@param car Vehicle
---@param tertiaryColor number
---@param quaternaryColor number
function setExtraCarColours(car, tertiaryColor, quaternaryColor) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getExtraCarColours">Open the wiki</a></b>
---
---@param car Vehicle
---@return number tertiaryColor
---@return number quaternaryColor
function getExtraCarColours(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/manageAllPopulation">Open the wiki</a></b>
---
function manageAllPopulation() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setNoResprays">Open the wiki</a></b>
---
---@param enable boolean
function setNoResprays(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/hasCarBeenResprayed">Open the wiki</a></b>
---
---@param car Vehicle
---@return boolean result
function hasCarBeenResprayed(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/attachMissionAudioToCar">Open the wiki</a></b>
---
---@param audioId number
---@param car Vehicle
function attachMissionAudioToCar(audioId, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setHasBeenOwnedForCarGenerator">Open the wiki</a></b>
---
---@param generator number
---@param owned boolean
function setHasBeenOwnedForCarGenerator(generator, owned) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setUpConversationNodeWithScriptedSpeech">Open the wiki</a></b>
---
---@param questionGXT GxtString
---@param answerYesGXT GxtString
---@param answerNoGXT GxtString
---@param questionWAV number
---@param answerYesWAV number
---@param answerNoWAV number
function setUpConversationNodeWithScriptedSpeech(
	questionGXT,
	answerYesGXT,
	answerNoGXT,
	questionWAV,
	answerYesWAV,
	answerNoWAV
)
end

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
---@param framedelta number
---@param loopA boolean
---@param lockX boolean
---@param lockY boolean
---@param lockF boolean
---@param time number
function taskPlayAnimSecondary(ped, animation, IFP, framedelta, loopA, lockX, lockY, lockF, time) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharTouchingChar">Open the wiki</a></b>
---
---@param ped Ped
---@param ped2 Ped
---@return boolean result
function isCharTouchingChar(ped, ped2) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/disableHeliAudio">Open the wiki</a></b>
---
---@param helicopter Vehicle
---@param disable boolean
function disableHeliAudio(helicopter, disable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskHandGesture">Open the wiki</a></b>
---
---@param ped Ped
---@param ped2 Ped
function taskHandGesture(ped, ped2) end

---
--- Сделать снимок экрана, снимок будет сохранён в <code>Мои Документы\GTA San Andreas User Files\Gallery</code><br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/takePhoto">Open the wiki</a></b><br/>
---
---@param unk boolean результат выполнения
function takePhoto(unk) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/incrementFloatStatNoMessage">Open the wiki</a></b>
---
---@param stat number
---@param value number
function incrementFloatStatNoMessage(stat, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerGroupToFollowAlways">Open the wiki</a></b>
---
---@param player Player
---@param followAlways boolean
function setPlayerGroupToFollowAlways(player, followAlways) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/improveCarByCheating">Open the wiki</a></b>
---
---@param car Vehicle
---@param affectedByCheats boolean
function improveCarByCheating(car, affectedByCheats) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/changeCarColourFromMenu">Open the wiki</a></b>
---
---@param panelID number
---@param car Vehicle
---@param colorslot number
---@param activeRow number
function changeCarColourFromMenu(panelID, car, colorslot, activeRow) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/highlightMenuItem">Open the wiki</a></b>
---
---@param panel number
---@param row number
---@param highlight boolean
function highlightMenuItem(panel, row, highlight) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setDisableMilitaryZones">Open the wiki</a></b>
---
---@param disable boolean
function setDisableMilitaryZones(disable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCameraPositionUnfixed">Open the wiki</a></b>
---
---@param xAngle number
---@param zAngle number
function setCameraPositionUnfixed(xAngle, zAngle) end

---
--- Устанавливает радиостанцию ​​транспортного средства, на котором игрок находится в настоящее время, на любимую станцию, полученную из статистики.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRadioToPlayersFavouriteStation">Open the wiki</a></b><br/>
---
function setRadioToPlayersFavouriteStation() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setDeathWeaponsPersist">Open the wiki</a></b>
---
---@param ped Ped
---@param persist boolean
function setDeathWeaponsPersist(ped, persist) end

---
--- Устанавливает скорость плавания игроку<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCharSwimSpeed">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@param speed number скорость
function setCharSwimSpeed(ped, speed) end

---
--- Возвращает true, если игрок перелазит/лезет на что-то (стена, забор, любое препятствие).<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPlayerClimbing">Open the wiki</a></b><br/>
---
---@param player Player хендл игрока
---@return boolean result результат
function isPlayerClimbing(player) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isThisHelpMessageBeingDisplayed">Open the wiki</a></b>
---
---@param gxtString GxtString
---@return boolean result
function isThisHelpMessageBeingDisplayed(gxtString) end

---
--- <br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isWidescreenOnInOptions">Open the wiki</a></b><br/>
---
function isWidescreenOnInOptions() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawSubtitlesBeforeFade">Open the wiki</a></b>
---
---@param flag boolean
function drawSubtitlesBeforeFade(flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/drawOddjobTitleBeforeFade">Open the wiki</a></b>
---
---@param flag boolean
function drawOddjobTitleBeforeFade(flag) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/taskFollowPathNodesToCoordWithRadius">Open the wiki</a></b>
---
---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param mode number
---@param time number
---@param stopRadius number
function taskFollowPathNodesToCoordWithRadius(ped, toX, toY, toZ, mode, time, stopRadius) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPhotoCameraEffect">Open the wiki</a></b>
---
---@param firstPersonView boolean
function setPhotoCameraEffect(firstPersonView) end

---
--- Чинит транспортное средство.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/fixCar">Open the wiki</a></b><br/>
---
---@param car Vehicle скриптовый хендл транспортного средства
function fixCar(car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setPlayerGroupToFollowNever">Open the wiki</a></b>
---
---@param player Player
---@param neverFollow boolean
function setPlayerGroupToFollowNever(player, neverFollow) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isCharAttachedToAnyCar">Open the wiki</a></b>
---
---@param ped Ped
---@return boolean result
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
---@param posX number
---@param posY number
---@param posZ number
---@param angle number
---@param car Vehicle
function setUpSkipForVehicleFinishedByScript(posX, posY, posZ, angle, car) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSkipWaitingForScriptToFadeIn">Open the wiki</a></b>
---
---@return boolean result
function isSkipWaitingForScriptToFadeIn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/forceAllVehicleLightsOff">Open the wiki</a></b>
---
---@param off boolean
function forceAllVehicleLightsOff(off) end

---
--- Возвращает выбранный режим камеры текущего автомобиля.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPlayerInCarCameraMode">Open the wiki</a></b><br/>
---
---@return number mode ID режима камеры.
function getPlayerInCarCameraMode() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isLastBuildingModelShotByPlayer">Open the wiki</a></b>
---
---@param player Player
---@param modelId Model
---@return boolean result
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
---@param wav number
function setUpConversationEndNodeWithScriptedSpeech(dialogueGxt, wav) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/activatePimpCheat">Open the wiki</a></b>
---
---@param enable boolean
function activatePimpCheat(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRandomCharInAreaOffsetNoSave">Open the wiki</a></b>
---
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@return Ped ped
function getRandomCharInAreaOffsetNoSave(sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setScriptCoopGame">Open the wiki</a></b>
---
---@param enable boolean
function setScriptCoopGame(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createUser3dMarker">Open the wiki</a></b>
---
---@param atX number
---@param atY number
---@param atZ number
---@param color number
---@return Marker marker
function createUser3dMarker(atX, atY, atZ, color) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/removeUser3dMarker">Open the wiki</a></b>
---
---@param marker Marker
function removeUser3dMarker(marker) end

---
--- Отменяет любые приглашения проститутки, полученные в игре, и заставляет всех текущих проституток уйти.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getRidOfPlayerProstitute">Open the wiki</a></b><br/>
---
function getRidOfPlayerProstitute() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/displayNonMinigameHelpMessages">Open the wiki</a></b>
---
---@param display boolean
function displayNonMinigameHelpMessages(display) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setRailtrackResistanceMult">Open the wiki</a></b>
---
---@param tracksFriction number
function setRailtrackResistanceMult(tracksFriction) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/switchObjectBrains">Open the wiki</a></b>
---
---@param externalScript number
---@param canBeStreamedIn boolean
function switchObjectBrains(externalScript, canBeStreamedIn) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/finishSettingUpConversationNoSubtitles">Open the wiki</a></b>
---
function finishSettingUpConversationNoSubtitles() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/allowPauseInWidescreen">Open the wiki</a></b>
---
---@param enable boolean
function allowPauseInWidescreen(enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getPcMouseMovement">Open the wiki</a></b>
---
---@return number x
---@return number y
function getPcMouseMovement() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isPcUsingJoypad">Open the wiki</a></b>
---
---@return boolean result
function isPcUsingJoypad() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isMouseUsingVerticalInversion">Open the wiki</a></b>
---
---@return boolean result
function isMouseUsingVerticalInversion() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/startNewCustomScript">Open the wiki</a></b>
---
---@param filepath string
---@param args table
---@return boolean result
function startNewCustomScript(filepath, args) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/launchCustomMission">Open the wiki</a></b>
---
---@param filepath string
---@param args table
function launchCustomMission(filepath, args) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getScmThreadStructNamed">Open the wiki</a></b>
---
---@param thread GxtString
---@return number handle
function getScmThreadStructNamed(thread) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setCleoSharedVar">Open the wiki</a></b>
---
---@param var number
---@param value number
function setCleoSharedVar(var, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCleoSharedVar">Open the wiki</a></b>
---
---@param var number
---@return number value
function getCleoSharedVar(var) end

---
--- Отправляет локального игрока на спавн.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSpawnPlayer">Open the wiki</a></b><br/>
---
function sampSpawnPlayer() end

---
--- Возвращает адрес samp.dll<br/>
--- То же самое, что и `getModuleHandle("samp.dll")`<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetBase">Open the wiki</a></b><br/>
---
---@return number handle адрес
function sampGetBase() end

---
--- Добавляет в окно чата SA:MP сообщение заданного цвета<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampAddChatMessage">Open the wiki</a></b><br/>
---
---@param text string текст сообщения
---@param color number цвет
function sampAddChatMessage(text, color) end

---
--- Отправляет на сервер текстовое сообщение или команду, если сообщение начинается с символа '/'<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendChat">Open the wiki</a></b><br/>
---
---@param text string текст сообщения
function sampSendChat(text) end

---
--- Проверяет инициализацию структур SA:MP<br/>
--- Если функция вернула `false`, то использование любых функций, начинающихся на `samp` вызовет ошибку<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampAvailable">Open the wiki</a></b><br/>
---
---@return boolean result статус
function isSampAvailable() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampRequestClass">Open the wiki</a></b>
---
---@param class number
function sampRequestClass(class) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendScmEvent">Open the wiki</a></b>
---
---@param event number
---@param id number
---@param param1 number
---@param param2 number
function sampSendScmEvent(event, id, param1, param2) end

---
--- Устанавливает специальное действие локальному игроку<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetSpecialAction">Open the wiki</a></b><br/>
---
---@param action number Специальное действие. Подробнее см. <a href="здесь">https://sampwiki.blast.hk/wiki/SpecialActions</a>
function sampSetSpecialAction(action) end

---
--- Убивает игрока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendDeathByPlayer">Open the wiki</a></b><br/>
---
---@param playerId number ID игрока
---@param reason number причина смерти
function sampSendDeathByPlayer(playerId, reason) end

---
--- Получает хендл т/с по его иду. Если автомобиля нет в зоне стрима, то возвращает false.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCarHandleBySampVehicleId">Open the wiki</a></b><br/>
---
---@param id number ID т/c
---@return boolean result результат
---@return Vehicle car хендл т/c
function sampGetCarHandleBySampVehicleId(id) end

---
--- Получает хендл игрока по его иду.
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCharHandleBySampPlayerId">Open the wiki</a></b><br/>
---
---@param id number ID игрока
---@return boolean result результат
---@return Ped ped хендл игрока
function sampGetCharHandleBySampPlayerId(id) end

---
--- Проверяет открыт ли инпут чата.
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsChatInputActive">Open the wiki</a></b><br/>
---
---@return boolean result результат проверки
function sampIsChatInputActive() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetSendrate">Open the wiki</a></b>
---
---@param type number
---@param rate number
function sampSetSendrate(type, rate) end

---
--- Проверяет подключен ли игрок к серверу.
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsPlayerConnected">Open the wiki</a></b><br/>
---
---@param id number ID игрока
---@return boolean result результат выполнения
function sampIsPlayerConnected(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerStructPtr">Open the wiki</a></b>
---
---@param id number
---@return number structPtr
function sampGetPlayerStructPtr(id) end

---
--- Получает уровень здоровья игрока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerHealth">Open the wiki</a></b><br/>
---
---@param id number ИД игрока.
---@return number health Уровень здоровья.
function sampGetPlayerHealth(id) end

---
--- Получает уровень здоровья игрока.
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerArmor">Open the wiki</a></b><br/>
---
---@param id number ИД игрока.
---@return number armor Уровень здоровья.
function sampGetPlayerArmor(id) end

---@alias GameState
---| 0 # GAMESTATE_NONE (ничего)
---| 1 # GAMESTATE_WAIT_CONNECT (установка соедения с сервером)
---| 2 # GAMESTATE_AWAIT_JOIN (соеденение установление, подключение)
---| 3 # GAMESTATE_CONNECTED (подключёно к серверу)
---| 4 # GAMESTATE_RESTARTING (сервер перезагружается)
---| 5 # GAMESTATE_DISCONNECTED (сервер закрыл соеденение)

---
--- Устанавливает статус подключения к серверу.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetGamestate">Open the wiki</a></b><br/>
---
---@param gamestate GameState статус
function sampSetGamestate(gamestate) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampDisconnectWithReason">Open the wiki</a></b>
---
---@param timeout boolean
function sampDisconnectWithReason(timeout) end

---
--- Устанавливает локальному игроку новый ник.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetLocalPlayerName">Open the wiki</a></b><br/>
---
---@param name string новый ник
function sampSetLocalPlayerName(name) end

---
--- Получает пинг игрока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerPing">Open the wiki</a></b><br/>
---
---@param id number ИД игрока.
---@return number ping Пинг.
function sampGetPlayerPing(id) end

---
--- Получает SAMP ID игрока по хэндлу персонажа.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerIdByCharHandle">Open the wiki</a></b><br/>
---
---@param ped Ped хэндл персонажа
---@return boolean result результат выполнения
---@return number id ID игрока
function sampGetPlayerIdByCharHandle(ped) end

---
--- Получает ID транспортного средства по его хендлу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetVehicleIdByCarHandle">Open the wiki</a></b><br/>
---
---@param car Vehicle скриптовый хендл транспортного средства
---@return boolean result результат выполнения операции
---@return number id ID транспортного средства
function sampGetVehicleIdByCarHandle(car) end

---
--- Получает позицию игрока, который находится вне зоны стрима, если сервер даёт на это разрешение.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetStreamedOutPlayerPos">Open the wiki</a></b><br/>
---
---@param id number ID игрока
---@return boolean result результат
---@return number posX координаты
---@return number posY координаты
---@return number posZ координаты
function sampGetStreamedOutPlayerPos(id) end

---
--- Отправляет пакет о посадке в транспортное средство.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendEnterVehicle">Open the wiki</a></b><br/>
---
---@param id number ID транспортного средства
---@param passenger boolean true - на пассажирское место, false - на водительское.
function sampSendEnterVehicle(id, passenger) end

---
--- Отправляет RPC - `RPC_EXITVEHICLE`<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendExitVehicle">Open the wiki</a></b><br/>
---
---@param id number ид транспорта
function sampSendExitVehicle(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendSpawn">Open the wiki</a></b>
---
function sampSendSpawn() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendDamageVehicle">Open the wiki</a></b>
---
---@param car Vehicle
---@param panel number
---@param doors number
---@param lights number
---@param tires number
function sampSendDamageVehicle(car, panel, doors, lights, tires) end

---
--- Регистрирует новую команду чата SA:MP с возможностью задать ей произвольное поведение.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampRegisterChatCommand">Open the wiki</a></b><br/>
---
---@param cmd string команда без символа '/'
---@param func fun(argument: string) функция-обработчик
---@return boolean result результат выполнения
function sampRegisterChatCommand(cmd, func) end

---
--- Получает ник игрока по его ID.
---
--- ### Пример использования<br/>
---
--- ```lua
---   script_name("Example script")
--- <br/>
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
--- ```<br/>
---
--- Получает ник игрока по его ID.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerNickname">Open the wiki</a></b><br/>
---
function sampGetPlayerNickname(id) end

---
--- Получает цвет игрока из scoreboard'a<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerColor">Open the wiki</a></b><br/>
---
---@param id number ИД игрока.
---@return number color Цвет(ARGB).
function sampGetPlayerColor(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampConnectToServer">Open the wiki</a></b>
---
---@param ip string
---@param port number
function sampConnectToServer(ip, port) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentServerAddress">Open the wiki</a></b>
---
---@return string ip
---@return number port
function sampGetCurrentServerAddress() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentServerName">Open the wiki</a></b>
---
---@return string name
function sampGetCurrentServerName() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampShowDialog">Open the wiki</a></b>
---
---@param id number
---@param caption string
---@param text string
---@param button1 string
---@param button2 string
---@param style number
function sampShowDialog(id, caption, text, button1, button2, style) end

---
--- Получает информацию с локального диалога (нужно использовать в цикле)<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampHasDialogRespond">Open the wiki</a></b><br/>
---
---@param id number id локального диалога
---@return boolean result результат, возвращает true если диалог открыт
---@return number button номер кнопки
---@return number list выбранная строка в списке
---@return string input текст
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
---@param offset number
function raknetBitStreamSetWriteOffset(bs, offset) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetResetBitStream">Open the wiki</a></b>
---
---@param bs Bitstream
---@param offset number
function raknetBitStreamSetReadOffset(bs, offset) end

---
--- Записывает значение типа boolean в BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBool">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@param value boolean значение
function raknetBitStreamWriteBool(bs, value) end

---
--- Записывает значение типа byte в BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt8">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@param value number значение
function raknetBitStreamWriteInt8(bs, value) end

---
--- Записывает значение типа short (2 байта) в BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt16">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@param value number значение
function raknetBitStreamWriteInt16(bs, value) end

---
--- Записывает значение типа integer (4 байта) в BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteInt32">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@param value number значение
function raknetBitStreamWriteInt32(bs, value) end

---
--- Записывает значение типа number (4 байта) в BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteFloat">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@param value number значение
function raknetBitStreamWriteFloat(bs, value) end

---
--- Записывает буффер указанного размера в BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBuffer">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@param dest number буффер
---@param size number размер
function raknetBitStreamWriteBuffer(bs, dest, size) end

---
--- Записывает BitStream в BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteBitStream">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@param other Bitstream bitStream (который записываем)
function raknetBitStreamWriteBitStream(bs, other) end

---
--- Записывает строку в BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamWriteString">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@param str string строка
function raknetBitStreamWriteString(bs, str) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetSendRpcEx">Open the wiki</a></b>
---
---@param rpc number
---@param bs Bitstream
---@param priority number
---@param reliability number
---@param channel number
---@param timestamp boolean
function raknetSendRpcEx(rpc, bs, priority, reliability, channel, timestamp) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetSendBitStreamEx">Open the wiki</a></b>
---
---@param bs Bitstream
---@param priority number
---@param reliability number
---@param channel number
function raknetSendBitStreamEx(bs, priority, reliability, channel) end

---
--- Создает SAMP объект --- 3D-текст<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampCreate3dText">Open the wiki</a></b><br/>
---
---@param text string Содержимое
---@param color number Цвет (ARGB)
---@param posX number Позиция/смещение относительно крепления по оси X
---@param posY number Позиция/смещение относительно крепления по оси Y
---@param posZ number Позиция/смещение относительно крепления по оси Z
---@param distance number Дистанция при которой будет виден 3D-текст
---@param ignoreWalls boolean Виден за объектами/стенами
---@param playerId number Крепление к игроку по ид (-1 --- отключить)
---@param vehicleId number Крепление к т/с по ид (-1 --- отключить)
---@return number textlabel ид созданного 3D-текста
function sampCreate3dText(text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId) end

---
--- Удаляет 3D текст.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampDestroy3dText">Open the wiki</a></b><br/>
---
---@param textlabel number указатель на 3D текст
function sampDestroy3dText(textlabel) end

---
--- Проверяет 3D текст на существование.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIs3dTextDefined">Open the wiki</a></b><br/>
---
---@param _3dText number ID 3D текста
---@return boolean result результат проверки
function sampIs3dTextDefined(_3dText) end

---
--- Закрывает открытый диалог с указанием нажатой кнопки.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampCloseCurrentDialogWithButton">Open the wiki</a></b><br/>
---
---@param button number номер кнопки
function sampCloseCurrentDialogWithButton(button) end

---
--- Возвращает номер элемента из списка (диалога), который в данный момент активен<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogListItem">Open the wiki</a></b><br/>
---
---@return number list номер элемента из списка (диалога)
function sampGetCurrentDialogListItem() end

---
--- Выбирает элемент из списка (диалога)<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogListItem">Open the wiki</a></b><br/>
---
---@param list number номер элемента
function sampSetCurrentDialogListItem(list) end

---
--- Возвращает текст из полей диалога 1 стиля<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogEditboxText">Open the wiki</a></b><br/>
---
---@return string text текст
function sampGetCurrentDialogEditboxText() end

---
--- Вставляет текст в поле для ввода диалога 1 стиля<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogEditboxText">Open the wiki</a></b><br/>
---
---@param text string текст
function sampSetCurrentDialogEditboxText(text) end

---
--- Проверяет, активен ли любой SA:MP-диалог.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsDialogActive">Open the wiki</a></b><br/>
---
---@return boolean result статус
function sampIsDialogActive() end

---
--- Возвращает стиль активного диалога<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogType">Open the wiki</a></b><br/>
---
---@return number type стиль
function sampGetCurrentDialogType() end

---
--- Возвращает ID последнего(открытого) диалогового окна<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogId">Open the wiki</a></b><br/>
---
---@return number id ID диалогового окна
function sampGetCurrentDialogId() end

---
--- Возвращает текущий gamestate.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetGamestate">Open the wiki</a></b><br/>
---
---@return GameState gamestate ID gamestate
function sampGetGamestate() end

---
--- Возвращает хендл объекта по его иду.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetObjectHandleBySampId">Open the wiki</a></b><br/>
---
---@param id number ID объекта
---@return Object object хендл объекта
function sampGetObjectHandleBySampId(id) end

---
--- Получает хэндл пикапа по его id<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPickupHandleBySampId">Open the wiki</a></b><br/>
---
---@param id number id пикапа
function sampGetPickupHandleBySampId(id) end

---
--- Получает ID объекта по его хендлу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetObjectSampIdByHandle">Open the wiki</a></b><br/>
---
---@param object Object handle объекта
---@return number objectId ID объекта
function sampGetObjectSampIdByHandle(object) end

---
--- Получает id пикапа через его handle<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPickupSampIdByHandle">Open the wiki</a></b><br/>
---
---@param pickup Pickup handle пикапа
function sampGetPickupSampIdByHandle(pickup) end

---
--- Возвращает общее кол-во элементов в списке (последнего)открытого диалога.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetListboxItemsCount">Open the wiki</a></b><br/>
---
---@return number count кол-во элементов
function sampGetListboxItemsCount() end

---
--- Получает ид текущей анимации игрока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerAnimationId">Open the wiki</a></b><br/>
---
---@param playerId number ИД игрока.
---@return number animid ИД анимации.
function sampGetPlayerAnimationId(playerId) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetAnimationNameAndFile">Open the wiki</a></b>
---
---@param animid number
---@return string file
---@return string name
function sampGetAnimationNameAndFile(animid) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampFindAnimationIdByNameAndFile">Open the wiki</a></b>
---
---@param name string
---@param file string
---@return number id
function sampFindAnimationIdByNameAndFile(name, file) end

---
--- Получает текущее разрешение экрана в пикселях<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getScreenResolution">Open the wiki</a></b><br/>
---
---@return number resX ширина экрана
---@return number resY высота экрана
function getScreenResolution() end

---
--- Получает текст из листбокса по его номеру<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetListboxItemText">Open the wiki</a></b><br/>
---
---@param item number номер элемента
---@return string text текст
function sampGetListboxItemText(item) end

---
--- Проверяет, находится ли указанный игрок на паузе<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsPlayerPaused">Open the wiki</a></b><br/>
---
---@param id number id игрока
---@return boolean result результат
function sampIsPlayerPaused(id) end

---
--- Переключает видимость курсора SAMP<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampToggleCursor">Open the wiki</a></b><br/>
---
---@param show boolean статус
function sampToggleCursor(show) end

---
--- Проверяет, заспавнился ли игрок.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsLocalPlayerSpawned">Open the wiki</a></b><br/>
---
---@return boolean result статус
function sampIsLocalPlayerSpawned() end

---
--- Возвращает ид специального действия игрока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerSpecialAction">Open the wiki</a></b><br/>
---
---@param id number ID игрока
---@return number action ID специального действия
function sampGetPlayerSpecialAction(id) end

---
--- Отменяет регистрацию команды, созданной с помощью функции <a class="is-internal-link is-valid-page" href="/moonloader/lua/sampRegisterChatCommand">sampRegisterChatCommand</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampUnregisterChatCommand">Open the wiki</a></b><br/>
---
---@param cmd string команда
---@return boolean result результат выполнения
function sampUnregisterChatCommand(cmd) end

---
--- Проверяет, является ли указанный игрок NPC<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsPlayerNpc">Open the wiki</a></b><br/>
---
---@param id number id игрока
---@return boolean result результат
function sampIsPlayerNpc(id) end

---
--- Получает очки игрока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerScore">Open the wiki</a></b><br/>
---
---@param id number ИД игрока.
---@return number score Очки.
function sampGetPlayerScore(id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetChatString">Open the wiki</a></b>
---
---@param id number
---@param text string
---@param prefix string
---@param color number
---@param pcolor number
function sampSetChatString(id, text, prefix, color, pcolor) end

---
--- Получает данные о сообщении в окне чата.<br/>
--- А именно: string text, string prefix, number color, number pcolor<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetChatString">Open the wiki</a></b><br/>
---
---@param id number Номер строки чата
---@return string text Текст сообщения
---@return string prefix Префикс
---@return number color Цвет сообщения
---@return number pcolor number pcolor
function sampGetChatString(id) end

---
--- Вставляет в поле чата текст.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetChatInputText">Open the wiki</a></b><br/>
---
---@param text string Строка
function sampSetChatInputText(text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetChatInputText">Open the wiki</a></b>
---
---@return string text
function sampGetChatInputText() end

---
--- Добавляет в консоль и лог-файл SAMPFUNCS текстовое сообщение.<br/>
--- Отличается от опкода тем, что не принимает динамическое количество аргументов для форматирования.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampfuncsLog">Open the wiki</a></b><br/>
---
---@param msg string текст
function sampfuncsLog(msg) end

---
--- Открывает/Закрывает чат<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetChatInputEnabled">Open the wiki</a></b><br/>
---
function sampSetChatInputEnabled(enabled) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetRakclientInterface">Open the wiki</a></b>
---
---@return number rakclientPtr
function sampGetRakclientInterface() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetRakpeer">Open the wiki</a></b>
---
---@return number rakpeer
function sampGetRakpeer() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetRakclientFuncAddressByIndex">Open the wiki</a></b>
---
---@param index number
---@return number address
function sampGetRakclientFuncAddressByIndex(index) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetRpcCallbackByRpcId">Open the wiki</a></b>
---
---@param index number
---@return number callbackAddress
function sampGetRpcCallbackByRpcId(index) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetRpcNodeByRpcId">Open the wiki</a></b>
---
---@param index number
---@return number node
function sampGetRpcNodeByRpcId(index) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetSampInfoPtr">Open the wiki</a></b>
---
---@return number sampPtr
function sampGetSampInfoPtr() end

---
--- Создаёт dxut диалог<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutCreateDialog">Open the wiki</a></b><br/>
---
---@param name string заголовок
---@return DxutDialog dialog указатель на объект диалога
function dxutCreateDialog(name) end

---
--- Возвращает последнее id события и компонента которое произошло с указанным диалогом<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutPopEvent">Open the wiki</a></b><br/>
---
---@param dialog DxutDialog указатель на объект диалога
---@return boolean result результат
---@return number events id события
---@return number id id компонента
function dxutPopEvent(dialog) end

---
--- Создаёт кнопку на Dxut диалоге<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutAddButton">Open the wiki</a></b><br/>
---
---@param dialog DxutDialog указатель на объект диалога
---@param id number уникальный id кнопки
---@param text string надпись на кнопке
---@param posX number позиция кнопки
---@param posY number позиция кнопки
---@param sizeX number размер кнопки
---@param sizeY number размер кнопки
function dxutAddButton(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- Создаёт чекбокс в Dxut диалоге<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutAddCheckbox">Open the wiki</a></b><br/>
---
---@param dialog DxutDialog указатель на объект диалога
---@param id number уникальный id чекбокса
---@param text string название чекбокса
---@param posX number позиция чекбокса
---@param posY number позиция чекбокса
---@param sizeX number размер чекбокса
---@param sizeY number размер чекбокса
function dxutAddCheckbox(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- Устанавливает позицию и размер Dxut диалогу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetDialogPos">Open the wiki</a></b><br/>
---
---@param dialog DxutDialog указатель на объект диалога
---@param posX number позиция диалога
---@param posY number позиция диалога
---@param sizeX number размер диалога
---@param sizeY number размер диалога
function dxutSetDialogPos(dialog, posX, posY, sizeX, sizeY) end

---
--- Получает позицию и размер Dxut диалога<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetDialogPosAndSize">Open the wiki</a></b><br/>
---
---@param dialog DxutDialog указатель на объект диалога
---@return number posX позиция диалога
---@return number posY позиция диалога
---@return number sizeX размер диалога
---@return number sizeY размер диалога
function dxutGetDialogPosAndSize(dialog) end

---
--- Устанавливает видимость диалогу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetDialogVisible">Open the wiki</a></b><br/>
---
---@param dialog DxutDialog указатель на объект диалога
---@param visible boolean видимость диалога (если true-виден, если false-не виден)
function dxutSetDialogVisible(dialog, visible) end

---
--- Проверяет, виден ли Dxut диалог, возвращает true если диалог виден и наоборот<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutIsDialogVisible">Open the wiki</a></b><br/>
---
---@param dialog DxutDialog указатель на объект диалога
---@return boolean result результат
function dxutIsDialogVisible(dialog) end

---
--- Добавляет поле для ввода текста в Dxut диалоге<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutAddEditbox">Open the wiki</a></b><br/>
---
---@param dialog DxutDialog указатель на объект Dxut диалога
---@param id number уникальный id
---@param text string название
---@param posX number позиция
---@param posY number позиция
---@param sizeX number размер
---@param sizeY number размер
function dxutAddEditbox(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- Возвращает текст компонента по id<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetControlText">Open the wiki</a></b><br/>
---
---@param dialog DxutDialog указатель на объект диалога
---@param id number id компонента
---@return string text текст
function dxutGetControlText(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetSendRpc">Open the wiki</a></b>
---
---@param rpc number
---@param bs Bitstream
function raknetSendRpc(rpc, bs) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetSendBitStream">Open the wiki</a></b>
---
---@param bs Bitstream
function raknetSendBitStream(bs) end

---
--- Проверяет, виден ли курсор<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsCursorActive">Open the wiki</a></b><br/>
---
---@return boolean result результат
function sampIsCursorActive() end

---@alias CursorMode
---| 0 # Отключен.
---| 1 # Управление клавиатурой заблокировано, курсор отключен.
---| 2 # Управление клавиатурой и мышкой заблокировано, курсор включен.
---| 3 # Управление мышкой заблокировано, курсор включен.
---| 4 # Управление мышкой заблокировано, курсор отключен.

---
--- Устанавливает режим курсора SAMP.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetCursorMode">Open the wiki</a></b><br/>
---
---@param mode CursorMode Режим
function sampSetCursorMode(mode) end

---
--- Возвращает текущий режим курсора<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetCursorMode">Open the wiki</a></b><br/>
---
---@return CursorMode mode ID режима
function sampGetCursorMode() end

---
--- Устанавливает видимость компонента Dxut диалога<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetControlVisible">Open the wiki</a></b><br/>
---
---@param dialog DxutDialog указатель на объект диалога
---@param id number id компонента диалога
---@param visible boolean видимость компонента
function dxutSetControlVisible(dialog, id, visible) end

---
--- Создаёт статистический текст на Dxut диалоге<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutAddStatic">Open the wiki</a></b><br/>
---
---@param dialog DxutDialog указатель на объект диалога
---@param id number уникальный id текста
---@param text string текст
---@param posX number позиция
---@param posY number позиция
---@param sizeX number размер
---@param sizeY number размер
function dxutAddStatic(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutIsCheckboxChecked">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@return boolean result
function dxutIsCheckboxChecked(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetDialogBackgroundColor">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param color number
function dxutSetDialogBackgroundColor(dialog, color) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetControlText">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@param text string
function dxutSetControlText(dialog, id, text) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutControlIsVisible">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@return boolean result
function dxutControlIsVisible(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutAddSlider">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
---@param max number
function dxutAddSlider(dialog, id, posX, posY, sizeX, sizeY, max) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetSliderValue">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@return number value
function dxutGetSliderValue(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetSliderValue">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@param value number
function dxutSetSliderValue(dialog, id, value) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutAddListbox">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutAddListbox(dialog, id, posX, posY, sizeX, sizeY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutListboxInsertItem">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@param element string
---@param data number
---@param after number
function dxutListboxInsertItem(dialog, id, element, data, after) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetListboxSelectedItemAndCount">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@return number element
---@return number count
function dxutGetListboxSelectedItemAndCount(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutListboxDeleteItem">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@param element number
function dxutListboxDeleteItem(dialog, id, element) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetListboxItemTextAndData">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@param element number
---@return string text
---@return number data
function dxutGetListboxItemTextAndData(dialog, id, element) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutCheckboxSetChecked">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@param checked boolean
function dxutCheckboxSetChecked(dialog, id, checked) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutEnableDialogCaption">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param enable boolean
function dxutEnableDialogCaption(dialog, enable) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutIsDialogCaptionEnabled">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@return boolean result
function dxutIsDialogCaptionEnabled(dialog) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetDialogMinimized">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param minimized boolean
function dxutSetDialogMinimized(dialog, minimized) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutIsDialogMinimized">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@return boolean result
function dxutIsDialogMinimized(dialog) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutDeleteControl">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
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
---@param id number
function dxutSetFocusOnControl(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetControlSize">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@param sizeX number
---@param sizeY number
function dxutSetControlSize(dialog, id, sizeX, sizeY) end

---
--- Получает размеры компонента<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetControlSize">Open the wiki</a></b><br/>
---
---@param dialog DxutDialog Диалог
---@param id number ID компонента
---@return number sizeX ширина
---@return number sizeY высота
function dxutGetControlSize(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetControlPos">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@param posX number
---@param posY number
function dxutSetControlPos(dialog, id, posX, posY) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutGetControlPos">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@return number posX
---@return number posY
function dxutGetControlPos(dialog, id) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutSetCheckboxColor">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@param id number
---@param color number
function dxutSetCheckboxColor(dialog, id, color) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/dxutIsDialogExists">Open the wiki</a></b>
---
---@param dialog DxutDialog
---@return boolean result
function dxutIsDialogExists(dialog) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetServerSettingsPtr">Open the wiki</a></b>
---
---@return number settingsPtr
function sampGetServerSettingsPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetSampPoolsPtr">Open the wiki</a></b>
---
---@return number poolsPtr
function sampGetSampPoolsPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetChatInfoPtr">Open the wiki</a></b>
---
---@return number chatPtr
function sampGetChatInfoPtr() end

---
--- Возвращает указатель на структуру поля ввода в чате<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetInputInfoPtr">Open the wiki</a></b><br/>
---
---@return number inputPtr указатель
function sampGetInputInfoPtr() end

---
--- Возвращает указатель на структуру диалогов<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetDialogInfoPtr">Open the wiki</a></b><br/>
---
---@return number dialogPtr указатель
function sampGetDialogInfoPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetKillInfoPtr">Open the wiki</a></b>
---
---@return number kill
function sampGetKillInfoPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetMiscInfoPtr">Open the wiki</a></b>
---
---@return number miscPtr
function sampGetMiscInfoPtr() end

---
--- Получает указатель на структуру текстдравов.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetTextdrawPoolPtr">Open the wiki</a></b><br/>
---
---@return number tdpool структура
function sampGetTextdrawPoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetObjectPoolPtr">Open the wiki</a></b>
---
---@return number objpoolPtr
function sampGetObjectPoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetGangzonePoolPtr">Open the wiki</a></b>
---
---@return number gzpoolPtr
function sampGetGangzonePoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetTextlabelPoolPtr">Open the wiki</a></b>
---
---@return number tlabelpoolPtr
function sampGetTextlabelPoolPtr() end

---
--- Возвращает указатель на пул игроков<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerPoolPtr">Open the wiki</a></b><br/>
---
---@return number playerpoolPtr указатель
function sampGetPlayerPoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetVehiclePoolPtr">Open the wiki</a></b>
---
---@return number vehpoolPtr
function sampGetVehiclePoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPickupPoolPtr">Open the wiki</a></b>
---
---@return number pickuppoolPtr
function sampGetPickupPoolPtr() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampStorePlayerOnfootData">Open the wiki</a></b>
---
---@param id number
---@param dstBuffer number
function sampStorePlayerOnfootData(id, dstBuffer) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampStorePlayerIncarData">Open the wiki</a></b>
---
---@param id number
---@param dstBuffer number
function sampStorePlayerIncarData(id, dstBuffer) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampStorePlayerPassengerData">Open the wiki</a></b>
---
---@param id number
---@param dstBuffer number
function sampStorePlayerPassengerData(id, dstBuffer) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampStorePlayerTrailerData">Open the wiki</a></b>
---
---@param id number
---@param dstBuffer number
function sampStorePlayerTrailerData(id, dstBuffer) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampStorePlayerAimData">Open the wiki</a></b>
---
---@param id number
---@param dstBuffer number
function sampStorePlayerAimData(id, dstBuffer) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendRconCommand">Open the wiki</a></b>
---
---@param cmd string
function sampSendRconCommand(cmd) end

---
--- Отправляет onFootData серверу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendOnfootData">Open the wiki</a></b><br/>
---
---@param dataPtr number заполненная структура
function sampSendOnfootData(dataPtr) end

---
--- Отправляет IncarData серверу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendIncarData">Open the wiki</a></b><br/>
---
---@param dataPtr number заполненная структура
function sampSendIncarData(dataPtr) end

---
--- Отправляет PassengerData серверу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendPassengerData">Open the wiki</a></b><br/>
---
---@param dataPtr number заполненная структура
function sampSendPassengerData(dataPtr) end

---
--- Отправляет AimData серверу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendAimData">Open the wiki</a></b><br/>
---
---@param dataPtr number заполненная структура
function sampSendAimData(dataPtr) end

---
--- Отправляет BulletData серверу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendBulletData">Open the wiki</a></b><br/>
---
---@param dataPtr number заполненная структура
function sampSendBulletData(dataPtr) end

---
--- Отправляет TrailerData серверу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendTrailerData">Open the wiki</a></b><br/>
---
---@param dataPtr number заполненная структура
function sampSendTrailerData(dataPtr) end

---
--- Отправляет UnoccupiedData серверу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendUnoccupiedData">Open the wiki</a></b><br/>
---
---@param dataPtr number заполненная структура
function sampSendUnoccupiedData(dataPtr) end

---
--- Отправляет SpectatorData серверу<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendSpectatorData">Open the wiki</a></b><br/>
---
---@param dataPtr number заполненная структура
function sampSendSpectatorData(dataPtr) end

---@alias ClickSource
---| 0 # Нажатие в Scoreboard

---
--- Отправляет RPC - RPC_CLICKPLAYER<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendClickPlayer">Open the wiki</a></b><br/>
---
---@param id number ид игрока
---@param source ClickSource источник вызова
function sampSendClickPlayer(id, source) end

---
--- Отправляет RPC - RPC_DIALOGRESPONSE<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendDialogResponse">Open the wiki</a></b><br/>
---
---@param id number ид диалога
---@param button number ид кнопки (0 / 1)
---@param listitem number номер элемента списка (от 0)
---@param input string текст введенный в поле
function sampSendDialogResponse(id, button, listitem, input) end

---
--- Отправляет RPC ClickTextdraw на сервер.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendClickTextdraw">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
function sampSendClickTextdraw(id) end

---
--- Отправляет RPC о нанесении урона другому игроку.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendGiveDamage">Open the wiki</a></b><br/>
---
---@param id number ID игрока
---@param damage number количество урона
---@param weapon number ID оружия
---@param bodypart number часть тела
function sampSendGiveDamage(id, damage, weapon, bodypart) end

---
--- Отправляет RPC о получении урона от другого игрока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendTakeDamage">Open the wiki</a></b><br/>
---
---@param id number ID игрока
---@param damage number количество урона
---@param weapon number ID оружия
---@param bodypart number часть тела
function sampSendTakeDamage(id, damage, weapon, bodypart) end

---
--- Отправляет RPC о изменении структуры объекта в режиме его редактирования.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendEditObject">Open the wiki</a></b><br/>
---
---@param playerObject boolean `false` --- глобальный объект / `true` --- объект для одного игрока
---@param objectId number ID объекта
---@param response number Тип ответа (от 0 до 2)
---@param posX number Позиция объекта X
---@param posY number Позиция объекта Y
---@param posZ number Позиция объекта Z
---@param rotX number Поворот объекта X
---@param rotY number Поворот объекта Y
---@param rotZ number Поворот объекта Z
function sampSendEditObject(playerObject, objectId, response, posX, posY, posZ, rotX, rotY, rotZ) end

---
--- Отправляет RPC о изменении прикрепленного объекта в режиме редактирования объекта.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendEditAttachedObject">Open the wiki</a></b><br/>
---
---@param response number Cтатус ответа(0 --- нажата отмена(ESC) / 1 --- сохранено)
---@param index number Индекс/слот объекта
---@param model number Модель объекта
---@param bone number ID кости к которой присоединен объект
---@param offsetX number Смещение объекта X
---@param offsetY number Смещение объекта Y
---@param offsetZ number Смещение объекта Z
---@param rotX number Поворот объекта X
---@param rotY number Поворот объекта Y
---@param rotZ number Поворот объекта Z
---@param scaleX number Масштаб объекта X
---@param scaleY number Масштаб объекта Y
---@param scaleZ number Масштаб объекта Z
function sampSendEditAttachedObject(
	response,
	index,
	model,
	bone,
	offsetX,
	offsetY,
	offsetZ,
	rotX,
	rotY,
	rotZ,
	scaleX,
	scaleY,
	scaleZ
)
end

---
--- Отправляет RPC - RPC_SETINTERIORID<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendInteriorChange">Open the wiki</a></b><br/>
---
---@param id number
function sampSendInteriorChange(id) end

---
--- Отправляет RPC - RPC_REQUESTSPAWN<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendRequestSpawn">Open the wiki</a></b><br/>
---
function sampSendRequestSpawn() end

---
--- Отправляет RPC - RPC_PICKEDUPPICKUP<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendPickedUpPickup">Open the wiki</a></b><br/>
---
---@param id number
function sampSendPickedUpPickup(id) end

---
--- Отправляет RPC - RPC_MENUSELECT<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendMenuSelectRow">Open the wiki</a></b><br/>
---
---@param id number номер строки меню
function sampSendMenuSelectRow(id) end

---
--- Отправляет RPC - RPC_MENUQUIT<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendMenuQuit">Open the wiki</a></b><br/>
---
function sampSendMenuQuit() end

---
--- Отправляет RPC - RPC_VEHICLEDESTROYED<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSendVehicleDestroyed">Open the wiki</a></b><br/>
---
---@param id number ид т/с
function sampSendVehicleDestroyed(id) end

---
--- Проверяет видимость списка игроков (TAB)<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsScoreboardOpen">Open the wiki</a></b><br/>
---
---@return boolean result
function sampIsScoreboardOpen() end

---
--- Переключает видимость списка игроков (TAB)<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampToggleScoreboard">Open the wiki</a></b><br/>
---
---@param show boolean статус
function sampToggleScoreboard(show) end

---
--- Возвращает основной текст последнего или активного диалогового окна.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetDialogText">Open the wiki</a></b><br/>
---
---@return string text текст
function sampGetDialogText() end

---
--- Возвращает заголовок последнего открытого диалога<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetDialogCaption">Open the wiki</a></b><br/>
---
---@return string caption
function sampGetDialogCaption() end

---
--- Устанавливает сторону (клиентская/серверная) диалога.<br/>
--- Если указана клиентская, то информация после закрытия диалога (Dialog Response) не будет отправлена на сервер<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetDialogClientside">Open the wiki</a></b><br/>
---
---@param clientside boolean
function sampSetDialogClientside(clientside) end

---
--- Проверяет диалог на то, что тот принадлежит клиентской стороне<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsDialogClientside">Open the wiki</a></b><br/>
---
---@return boolean result
function sampIsDialogClientside() end

---
--- Проверяет видимость чата<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsChatVisible">Open the wiki</a></b><br/>
---
---@return boolean result
function sampIsChatVisible() end

---@alias ChatDisplayMode
---| 2 # обычный
---| 1 # без тени у текста
---| 0 # не виден

---
--- Возвращает режим отображения чата<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetChatDisplayMode">Open the wiki</a></b><br/>
---
---@return ChatDisplayMode mode
function sampGetChatDisplayMode() end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetChatDisplayMode">Open the wiki</a></b>
---
---@param mode ChatDisplayMode
function sampSetChatDisplayMode(mode) end

---
--- Останавливает scm поток<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/pauseScmThread">Open the wiki</a></b><br/>
---
---@param thread number номер потока
function pauseScmThread(thread) end

---
--- Возобновляет исполнение SCM-потока.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/resumeScmThread">Open the wiki</a></b><br/>
---
---@param thread number указатель на поток
function resumeScmThread(thread) end

---
--- Читает значение типа boolean из BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBool">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@return boolean value результирующее значение
function raknetBitStreamReadBool(bs) end

---
--- Читает значение типа byte из BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt8">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@return number value результирующее значение
function raknetBitStreamReadInt8(bs) end

---
--- Читает значение типа short (2 байта) из BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt16">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@return number value результирующее значение
function raknetBitStreamReadInt16(bs) end

---
--- Читает значение типа integer (4 байта) из BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt32">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@return number value результирующее значение
function raknetBitStreamReadInt32(bs) end

---
--- Читает значение типа number из BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadFloat">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@return number value результирующее значение
function raknetBitStreamReadFloat(bs) end

---
--- Читает буффер указанного размера из BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBuffer">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@param dest number буффер
---@param size number размер
function raknetBitStreamReadBuffer(bs, dest, size) end

---
--- Читает строку указанной длины (переменный размер) из BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadString">Open the wiki</a></b><br/>
---
---@param bs Bitstream bitStream
---@param size number длина строки
---@return string value результирующее значение
function raknetBitStreamReadString(bs, size) end

---
--- Сбрасывает указатель чтения битстрима<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamResetReadPointer">Open the wiki</a></b><br/>
---
---@param bs Bitstream
function raknetBitStreamResetReadPointer(bs) end

---
--- Сбрасывает указатель записи битстрима<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamResetWritePointer">Open the wiki</a></b><br/>
---
---@param bs Bitstream
function raknetBitStreamResetWritePointer(bs) end

---
--- Осуществляет пропуск битов в указателе чтения/записи битстрима<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamIgnoreBits">Open the wiki</a></b><br/>
---
---@param bs Bitstream
---@param amount number количество битов
function raknetBitStreamIgnoreBits(bs, amount) end

---
--- Устанавливает смещение для последующей записи в битстрим<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetWriteOffset">Open the wiki</a></b><br/>
---
---@param bs Bitstream
---@param offset number смещение (в битах)
function raknetBitStreamSetWriteOffset(bs, offset) end

---
--- Устанавливает смещение для последующего чтения битстрима<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetReadOffset">Open the wiki</a></b><br/>
---
---@param bs Bitstream
---@param offset number смещение (в битах)
function raknetBitStreamSetReadOffset(bs, offset) end

---
--- Возвращает количество записанных битов в битстриме<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBitsUsed">Open the wiki</a></b><br/>
---
---@param bs Bitstream
---@return number value
function raknetBitStreamGetNumberOfBitsUsed(bs) end

---
--- Возвращает количество записанных байтов в битстриме<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBytesUsed">Open the wiki</a></b><br/>
---
---@param bs Bitstream
---@return number value
function raknetBitStreamGetNumberOfBytesUsed(bs) end

---
--- Возвращает количество непрочитанных битов в битстриме<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfUnreadBits">Open the wiki</a></b><br/>
---
---@param bs Bitstream
---@return number value
function raknetBitStreamGetNumberOfUnreadBits(bs) end

---
--- Возвращает текущий оффсет записи в BitStream.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetWriteOffset">Open the wiki</a></b><br/>
---
---@param bs Bitstream Указатель на BitStream
---@return number value Оффсет
function raknetBitStreamGetWriteOffset(bs) end

---
--- Возвращает текущий оффсет чтения из BitStream'а.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetReadOffset">Open the wiki</a></b><br/>
---
---@param bs Bitstream Указатель на BitStream
---@return number value Оффсет
function raknetBitStreamGetReadOffset(bs) end

---
--- Возвращает указатель на данные BitStream'а.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetDataPtr">Open the wiki</a></b><br/>
---
---@param bs Bitstream BitStream
---@return number value указатель на структуру данных
function raknetBitStreamGetDataPtr(bs) end

---
--- Декриптует строку из BitStream`a и записывает её в буфер<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamDecodeString">Open the wiki</a></b><br/>
---
---@param bs Bitstream Указатель на BitStream
---@param size number Размер буфера
---@return string string Буфер
function raknetBitStreamDecodeString(bs, size) end

---
--- Криптует строку и записывает в BitStream<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetBitStreamEncodeString">Open the wiki</a></b><br/>
---
---@param bs Bitstream Указатель на BitStream
---@param string string Буфер
function raknetBitStreamEncodeString(bs, string) end

---
--- Эмулирует входящий RPC с помощью данных BitStream'а.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetEmulRpcReceiveBitStream">Open the wiki</a></b><br/>
---
---@param rpc number ID RPC
---@param bs Bitstream Указатель на BitStream
function raknetEmulRpcReceiveBitStream(rpc, bs) end

---
--- Эмулирует входящий пакет с помощью даннных BitStream'а.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetEmulPacketReceiveBitStream">Open the wiki</a></b><br/>
---
---@param packet number ID пакета
---@param bs number Указатель на BitStream
function raknetEmulPacketReceiveBitStream(packet, bs) end

---
--- Возвращает наименование RPC по его ид<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetGetRpcName">Open the wiki</a></b><br/>
---
---@param rpc number ид RPC
---@return string name
function raknetGetRpcName(rpc) end

---
--- Возвращает наименование пакета по его ид<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/raknetGetPacketName">Open the wiki</a></b><br/>
---
---@param packet number ид пакета
---@return string name
function raknetGetPacketName(packet) end

---
--- Устанавливает новое значение (регистрирует) для глобальной переменной SAMPFUNCS<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSampfuncsGlobalVar">Open the wiki</a></b><br/>
---
---@param var string наименование переменной
---@param value number значение переменной
---@return boolean result
function setSampfuncsGlobalVar(var, value) end

---
--- Возвращает значение глобальной переменной, зарегистрированной с помощью SAMPFUNCS<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVar">Open the wiki</a></b><br/>
---
---@param var string наименование переменной
---@return boolean result переменная найдена
---@return number value значение переменной
function getSampfuncsGlobalVar(var) end

---
--- Создает (перезаписывает) SAMP объект --- 3D-текст.<br/>
--- В отличии от <a class="is-internal-link is-valid-page" href="/moonloader/lua/sampCreate3dText">sampCreate3dText</a> данная функция взаимодействует с SAMP пулом напрямую.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampCreate3dTextEx">Open the wiki</a></b><br/>
---
---@param id number Ид создаваемого/перезаписываемого 3D-текста
---@param text string Содержимое
---@param color number Цвет (ARGB)
---@param posX number Позиция/смещение относительно крепления по оси X
---@param posY number Позиция/смещение относительно крепления по оси Y
---@param posZ number Позиция/смещение относительно крепления по оси Z
---@param distance number Дистанция при которой будет виден 3D-текст
---@param ignoreWalls boolean Виден за объектами/стенами
---@param playerId number Крепление к игроку по ид (-1 --- отключить)
---@param vehicleId number Крепление к т/с по ид (-1 --- отключить)
function sampCreate3dTextEx(id, text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId) end

---
--- Получает параметры 3D текста.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGet3dTextInfoById">Open the wiki</a></b><br/>
---
---@param id number ID 3D Текста
---@return string string текст.
---@return number color цвет.
---@return number posX
---@return number posY
---@return number posZ координаты 3D текста(XYZ)
---@return number distance дистанция.
---@return boolean ignoreWalls виден ли через стены.
---@return number playerId если прикреплен к игроку, то возвращает его ид.
---@return number vehicleId если прикреплен к т/с, то возвращает его ид
function sampGet3dTextInfoById(id) end

---
--- Устанавливает 3D тексту новый текст.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSet3dTextString">Open the wiki</a></b><br/>
---
---@param id number ID 3D текста.
---@param text string текст
function sampSet3dTextString(id, text) end

---
--- Создает текстдрав c заданными параметрами.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawCreate">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@param text string текст текстдрава
---@param posX number координата X текстдрава
---@param posY number координата Y текстдрава
function sampTextdrawCreate(id, text, posX, posY) end

---
--- Устанавливает параметры прямоугольника текстдраву.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetBoxColorAndSize">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@param box number статус
---@param color number цвет
---@param sizeX number
---@param sizeY number размеры
function sampTextdrawSetBoxColorAndSize(id, box, color, sizeX, sizeY) end

---
--- Задает выравнивание текста текстдраву.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetAlign">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@param align number тип выравнивания
function sampTextdrawSetAlign(id, align) end

---
--- Устанавливает масштабирование текста текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetProportional">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@param proportional number статус
function sampTextdrawSetProportional(id, proportional) end

---
--- Устанавливает стиль текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetStyle">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@param style number стиль
function sampTextdrawSetStyle(id, style) end

---
--- Устанавливает тень текстдраву.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetShadow">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@param shadow number размер тени
---@param color number цвет
function sampTextdrawSetShadow(id, shadow, color) end

---
--- Устанавливает текстдраву обводку<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetOutlineColor">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@param outline number толщина обводки
---@param color number цвет
function sampTextdrawSetOutlineColor(id, outline, color) end

---
--- Устанавливает модель объекта/машины текстдраву со стилем 5.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetModelRotationZoomVehColor">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@param model number номер модели
---@param rotX number вращение модели по осям (XYZ)
---@param rotY number вращение модели по осям (XYZ)
---@param rotZ number вращение модели по осям (XYZ)
---@param zoom number дальность камеры
---@param clr1 number первичный цвет
---@param clr2 number вторичный цвет
function sampTextdrawSetModelRotationZoomVehColor(id, model, rotX, rotY, rotZ, zoom, clr1, clr2) end

---
--- Устанавливает текст текстдраву.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetString">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@param text string текст
function sampTextdrawSetString(id, text) end

---
--- Устанавливает позицию текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetPos">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@param posX number
---@param posY number позиция текстдрава (XY)
function sampTextdrawSetPos(id, posX, posY) end

---
--- Устанавливает параметры символов текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawSetLetterSizeAndColor">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@param letSizeX number
---@param letSizeY number Размер
---@param color number цвет
function sampTextdrawSetLetterSizeAndColor(id, letSizeX, letSizeY, color) end

---
--- Получает параметры прямоугольника текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetBoxEnabledColorAndSize">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@return number box статус.
---@return number color цвет.
---@return number sizeX
---@return number sizeY размер
function sampTextdrawGetBoxEnabledColorAndSize(id) end

---
--- Получает тип выравнивания текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetAlign">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@return number align тип
function sampTextdrawGetAlign(id) end

---
--- Получает статус масштабирования текста в пропорциональном соотношении указанного текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetProportional">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@return number prop пропорция
function sampTextdrawGetProportional(id) end

---
--- Получает стиль текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetStyle">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@return number style стиль
function sampTextdrawGetStyle(id) end

---
--- Получает параметры тени текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetShadowColor">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@return number shadow размер.
---@return number color цвет
function sampTextdrawGetShadowColor(id) end

---
--- Получает параметры обводки текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetOutlineColor">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@return number outline толщина.
---@return number color цвет
function sampTextdrawGetOutlineColor(id) end

---
--- Получает параметры модели текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetModelRotationZoomVehColor">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@return number model модель
---@return number rotX
---@return number rotY
---@return number rotZ поворот по осям(XYZ)
---@return number zoom отдаление камеры
---@return number clr1
---@return number clr2 первичный и вторичный цвета
function sampTextdrawGetModelRotationZoomVehColor(id) end

---
--- Получает текст текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetString">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@return string text текст
function sampTextdrawGetString(id) end

---
--- Получает позицию текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetPos">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@return number posX
---@return number posY позиция по X и Y
function sampTextdrawGetPos(id) end

---
--- Получает длину, ширину и цвет текстдрава.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawGetLetterSizeAndColor">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@return number letSizeX
---@return number letSizeY размер.
---@return number color цвет
function sampTextdrawGetLetterSizeAndColor(id) end

---
--- Проверяет текстдрав на существование.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawIsExists">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
---@return boolean result результат проверки
function sampTextdrawIsExists(id) end

---
--- Удаляет текстдрав.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampTextdrawDelete">Open the wiki</a></b><br/>
---
---@param id number ID текстдрава
function sampTextdrawDelete(id) end

---
--- Проверяет существование глобальной переменной, зарегистрированной с помощью SAMPFUNCS<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampfuncsGlobalVarDefined">Open the wiki</a></b><br/>
---
---@param var string наименование переменной
---@return boolean result
function isSampfuncsGlobalVarDefined(var) end

---
--- Возвращает разрешения записи/чтения глобальной переменной, зарегистрированной с помощью SAMPFUNCS, для указанного SCM-потока<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVarAccessForThread">Open the wiki</a></b><br/>
---
---@param var string наименование переменной
---@param thread number указатель на поток
---@return number read чтение (boolean?)
---@return number write запись (boolean?)
function getSampfuncsGlobalVarAccessForThread(var, thread) end

---
--- Выполняет указанную консольную SAMPFUNCS команду<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/runSampfuncsConsoleCommand">Open the wiki</a></b><br/>
---
---@param cmd string
function runSampfuncsConsoleCommand(cmd) end

---
--- Добавляет новую команду в консоль SAMPFUNCS.<br/>
--- От оригинального опкода отличается дополнительн<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampfuncsRegisterConsoleCommand">Open the wiki</a></b><br/>
---
---@param cmd string команда
---@param func function функция-обработчик
---@return boolean result результат выполнения
function sampfuncsRegisterConsoleCommand(cmd, func) end

---
--- Отменяет регистрацию консольной команды, созданной с помощью функции <a class="is-internal-link is-valid-page" href="/moonloader/lua/sampfuncsRegisterConsoleCommand">sampfuncsRegisterConsoleCommand</a>.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampfuncsUnregisterConsoleCommand">Open the wiki</a></b><br/>
---
---@param cmd string команда
---@return boolean result результат выполнения
function sampfuncsUnregisterConsoleCommand(cmd) end

---
--- Создает SCM-поток, содержимое которого будет определено из участка памяти<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/createScmThreadAtPointer">Open the wiki</a></b><br/>
---
---@param pointer number Указатель на участок памяти
---@param args table Передаваемые значения/аргументы
---@return number thread Указатель на поток
function createScmThreadAtPointer(pointer, args) end

---
--- Устанавливает новое значение переменной в SCM-потоке<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setScmThreadLocalVar">Open the wiki</a></b><br/>
---
---@param thread number Указатель на поток
---@param var number Номер переменной
---@param value number Значение
function setScmThreadLocalVar(thread, var, value) end

---
--- Возвращает значение переменной в SCM-потоке<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getScmThreadLocalVar">Open the wiki</a></b><br/>
---
---@param thread number Указатель на поток
---@param var number Номер переменной
---@return number value
function getScmThreadLocalVar(thread, var) end

---
--- Уничтожает ранее созданный SCM-поток<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/destroyScmThread">Open the wiki</a></b><br/>
---
---@param thread number Указатель на поток
function destroyScmThread(thread) end

---
--- Перезагружает ранее созданный SCM-поток<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/restartScmThread">Open the wiki</a></b><br/>
---
---@param thread number Указатель на поток
---@param args table Передаваемые значения/аргументы в поток
function restartScmThread(thread, args) end

---
--- Проверяет видимость/активность консоли SAMPFUNCS<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleActive">Open the wiki</a></b><br/>
---
---@return boolean result
function isSampfuncsConsoleActive() end

---
--- Устанавливает описание для клиентской команды<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampSetClientCommandDescription">Open the wiki</a></b><br/>
---
---@param cmd string Команда
---@param text string Описание
function sampSetClientCommandDescription(cmd, text) end

---
--- Устанавливает описание для консольной команды<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/setSampfuncsConsoleCommandDescription">Open the wiki</a></b><br/>
---
---@param cmd string Команда
---@param text string Описание
function setSampfuncsConsoleCommandDescription(cmd, text) end

---
--- Принудительная отправка пакета синхронизации - PACKET_VEHICLE_SYNC<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceVehicleSync">Open the wiki</a></b><br/>
---
---@param id number SAMP ид т/с
function sampForceVehicleSync(id) end

---
--- Принудительная отправка пакета синхронизации - PACKET_UNOCCUPIED_SYNC<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceUnoccupiedSyncSeatId">Open the wiki</a></b><br/>
---
---@param id number SAMP ид т/с
---@param seatId number Номер сиденья
function sampForceUnoccupiedSyncSeatId(id, seatId) end

---
--- Принудительная отправка пакета синхронизации - PACKET_PLAYER_SYNC<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceOnfootSync">Open the wiki</a></b><br/>
---
function sampForceOnfootSync() end

---
--- Принудительная отправка пакета синхронизации - PACKET_AIM_SYNC<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceAimSync">Open the wiki</a></b><br/>
---
function sampForceAimSync() end

---
--- Принудительная отправка пакета синхронизации - PACKET_TRAILER_SYNC<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceTrailerSync">Open the wiki</a></b><br/>
---
---@param id number SAMP ид трейлера
function sampForceTrailerSync(id) end

---
--- Принудительная отправка пакета синхронизации - PACKET_PASSENGER_SYNC<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForcePassengerSyncSeatId">Open the wiki</a></b><br/>
---
---@param id number SAMP ид т/с
---@param seatId number Номер сиденья
function sampForcePassengerSyncSeatId(id, seatId) end

---
--- Принудительная отправка пакета синхронизации - PACKET_STATS_UPDATE<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceStatsSync">Open the wiki</a></b><br/>
---
function sampForceStatsSync() end

---
--- Принудительная отправка пакета синхронизации - PACKET_WEAPONS_UPDATE<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampForceWeaponsSync">Open the wiki</a></b><br/>
---
function sampForceWeaponsSync() end

---
--- Возвращает максимальный SAMP ид игрока на сервере/в зоне прорисовки (стриме)<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetMaxPlayerId">Open the wiki</a></b><br/>
---
---@param streamed boolean Поиск в стриме
---@return number id ID игрока
function sampGetMaxPlayerId(streamed) end

---
--- Возвращает количество игроков.<br/>
--- При <strong>streamed = <em>false</em></strong> возвращает количество игроков на сервере, при противоположном значении - количество игроков в зоне прорисовки (стриме)<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampGetPlayerCount">Open the wiki</a></b><br/>
---
---@param streamed boolean Поиск в стриме
---@return number count
function sampGetPlayerCount(streamed) end

---
--- Передает строку на обработку к ChatInput (поле для ввода в чате)<br/>
--- FIXME Запрещен вызов внутри тела любой зарегистрированной команды (с помощью опкода <a class="is-internal-link is-invalid-page" href="/gta-sa/opcodes/0b34">0B34</a> или функции <a class="is-internal-link is-valid-page" href="/moonloader/lua/sampRegisterChatCommand">sampRegisterChatCommand</a>)<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampProcessChatInput">Open the wiki</a></b><br/>
---
---@param text string Команда/строка
function sampProcessChatInput(text) end

---
--- Проверяет существование клиентской команды, зарегистрированной SAMPFUNCS<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/sampIsChatCommandDefined">Open the wiki</a></b><br/>
---
---@param cmd string
---@return boolean result
function sampIsChatCommandDefined(cmd) end

---
--- Проверяет существование консольной команды SAMPFUNCS<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleCommandDefined">Open the wiki</a></b><br/>
---
---@param cmd string
---@return boolean result
function isSampfuncsConsoleCommandDefined(cmd) end

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/getCleoLibraryVersion">Open the wiki</a></b>
---
---@return number version
function getCleoLibraryVersion() end

---
--- Основная функция, вызывается единожды за запуск скрипта.<br/>
--- В ней можно использовать задержки `wait` и бесконечные циклы, при этом не нарушая работу игры.<br/>
--- Вдействительности событие `main` является не событием, а сопрограммой, выполняющейся в отдельном Lua-потоке.<br/>
--- Это и даёт возможность прерывать её выполнение на какой-то промежуток времени и затем продолжать работу с того же места без каких-либо негативных последствий.<br/>
---
--- ### Пример<br/>
---
--- ```lua
---   function main()
---     -- загрузим что-нибудь перед тем, как запустить бесконечный цикл
---     loadStuff()
---     key1_timesPressed = 0
--- <br/>
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
--- ```<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/main">Open the wiki</a></b><br/>
---
function main() end

---
--- Хэндл персонажа игрока.<br/>
--- Применим во многих функциях, принимающих значение типа `Char` в качестве параметра.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/PLAYER_PED">Open the wiki</a></b><br/>
---
---@type Ped
PLAYER_PED = {}

---
--- Идентификатор активного игрока.<br/>
--- Применим во многих функциях, принимающих значение типа `Player` в качестве параметра.<br/>
---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/PLAYER_HANDLE">Open the wiki</a></b><br/>
---
---@type Player
PLAYER_HANDLE = {}

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/PLAYER_PED">Open the wiki</a></b><br/>
---
---@type Ped
---@deprecated Use PLAYER_PED
playerPed = {}

---
--- <b><a href="https://wiki.blast.hk/moonloader/lua/PLAYER_HANDLE">Open the wiki</a></b><br/>
---
---@type Player
---@deprecated Use PLAYER_HANDLE
playerHandle = {}
