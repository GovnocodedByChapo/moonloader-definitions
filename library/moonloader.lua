---@meta
---@diagnostic disable: lowercase-global, missing-return

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
--- Создаёт новый поток и сразу же запускает его с указанными параметрами.
--- Для создания потока приостановленным нужно использовать функцию `lua_thread.create_suspended`.
--- За примерами и всеми подробностями о потоках обратитесь к статье [Скриптовые потоки](https://wiki.blast.hk/moonloader/scripting/threads).
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/lua_thread/create)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/lua_thread/create_suspended)**
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
--- Возвращает `LuaScript` скрипта, из которого была вызвана функция.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/thisScript)**
---
---@return LuaScript script скрипт
function thisScript() end

---@class script
script = {}

---
--- Статическое свойство. Возвращает объект `LuaScript` текущего скрипта. Является аналогом функции `thisScript`.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/script/this)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/script/load)**
---
---@param file string путь к файлу
---@return LuaScript script скрипт
function script.load(file) end

---
--- Ищет загруженный скрипт по имени. Возвращает объект `LuaScript`, если скрипт найден, в противном случае возвращает `nil`.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/script/find)**
---
---@param name string название скрипта
---@return LuaScript script скрипт
function script.find(name) end

---
--- Возвращает массив загруженных скриптов.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/script/list)**
---
---@return LuaScript[] list массив `LuaScript` загруженных скриптов
function script.list() end

---
--- Получает загруженный скрипт по его уникальному идентификатору и возвращает объект `LuaScript`.
--- Возвращает `nil`, если скрипта с таким идентификатором нет.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/script/get)**
---
---@param scriptId number идентификатор скрипта
---@return LuaScript script скрипт
function script.get(scriptId) end

---
--- Проверяет, активен ли курсор
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCursorActive)**
---
---@return boolean result результат
function isCursorActive() end

---
--- Возвращает массив со всеми пикапами
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getAllPickups)**
---
---@return Pickup[] pickups пикапы
function getAllPickups() end

---
--- Возвращает хэндл пикапа по указателю на экземляр класса `CPickup`.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPickupPointerHandle)**
---
---@param handle number указатель
---@return Pickup pickup хэндл пикапа
function getPickupPointerHandle(handle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPickupPointer)**
---
---@param pickup Pickup
---@return number pointer
function getPickupPointer(pickup) end

---
--- Возвращает указатель на структуру пикапа
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPickupType)**
---
---@param pickup Pickup хэндл
---@return number type указатель
function getPickupType(pickup) end

---
--- Возвращает модель пикапа
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPickupModel)**
---
---@param pickup Pickup хэндл пикапа
---@return number model модель
function getPickupModel(pickup) end

---
--- Возвращает кватернион вращения объекта
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectQuaternion)**
---
---@param object Object объект
---@return number x
---@return number y
---@return number z
---@return number w
function getObjectQuaternion(object) end

---
--- Задаёт кватернион вращения объекта
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectQuaternion)**
---
---@param object Object объект
---@param x number
---@param y number
---@param z number
---@param w number
function setObjectQuaternion(object, x, y, z, w) end

---
--- Возвращает кватернион вращения транспортного средства
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getVehicleQuaternion)**
---
---@param car Vehicle транспорт
---@return number x
---@return number y
---@return number z
---@return number w
function getVehicleQuaternion(car) end

---
--- Задаёт кватернион вращения транспортного средства
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleQuaternion)**
---
---@param car Vehicle транспорт
---@param x number
---@param y number
---@param z number
---@param w number
function setVehicleQuaternion(car, x, y, z, w) end

---
--- Возвращает кватернион вращения персонажа
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharQuaternion)**
---
---@param ped Ped персонаж
---@return number x
---@return number y
---@return number z
---@return number w
function getCharQuaternion(ped) end

---
--- Задаёт кватернион вращения персонажа
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharQuaternion)**
---
---@param ped Ped персонаж
---@param x number
---@param y number
---@param z number
---@param w number
function setCharQuaternion(ped, x, y, z, w) end

---
--- Загружает аудио из файла или по веб-адресу
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadAudioStream)**
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
--- Задаёт новый статус аудиопотоку
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setAudioStreamState)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/releaseAudioStream)**
---
---@param handle AudioStream аудиопоток
---@deprecated
function releaseAudioStream(handle) end

---
--- Возвращает длительность аудиопотока в секундах
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getAudioStreamLength)**
---
---@param handle AudioStream аудиопоток
---@return number length длительность
function getAudioStreamLength(handle) end

---
--- Возвращает статус аудиопотока
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getAudioStreamState)**
---
---@param handle AudioStream аудиопоток
---@return AudioStreamState state статус
function getAudioStreamState(handle) end

---
--- Возвращает громкость аудиопотока
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getAudioStreamVolume)**
---
---@param audio AudioStream аудиопоток
---@return number volume громкость (1.0 - 100%, 0.0 - 0%)
function getAudioStreamVolume(audio) end

---
--- Устанавливает громкость аудиопотока
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setAudioStreamVolume)**
---
---@param audio AudioStream аудиопоток
---@param volume number громкость (1.0 - 100%, 0.0 - 0%)
function setAudioStreamVolume(audio, volume) end

---
--- Переключает статус зацикленности аудиопотока
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setAudioStreamLooped)**
---
---@param audio AudioStream аудиопоток
---@param loop boolean зациклить
function setAudioStreamLooped(audio, loop) end

---
--- Загружает аудиопоток с поддержкой объёмного (3D) звука
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/load3dAudioStream)**
---
---@param audio string путь к файлу или веб-адрес
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCoordinates)**
---
---@param handle AudioStream аудиопоток
---@param posX number
---@param posY number
---@param posZ number
function setPlay3dAudioStreamAtCoordinates(handle, posX, posY, posZ) end

---
--- Прикрепляет 3D-звук к объекту
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtObject)**
---
---@param audio AudioStream аудиопоток
---@param object Object объект
function setPlay3dAudioStreamAtObject(audio, object) end

---
--- Прикрепляет 3D-звук к персонажу
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtChar)**
---
---@param audio AudioStream аудиопоток
---@param ped Ped персонаж
function setPlay3dAudioStreamAtChar(audio, ped) end

---
--- Прикрепляет 3D-звук к транспортному средству
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlay3dAudioStreamAtCar)**
---
---@param audio AudioStream аудиопоток
---@param car Vehicle транспорт
function setPlay3dAudioStreamAtCar(audio, car) end

---
--- Загружает аудиопоток из файла в памяти процесса
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadAudioStreamFromMemory)**
---
---@param address number адрес памяти
---@param size number размер файла
---@return AudioStream handle загруженный аудиопоток
function loadAudioStreamFromMemory(address, size) end

---
--- Загружает аудиопоток с объёмным звучанием из файла в памяти процесса
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/load3dAudioStreamFromMemory)**
---
---@param address number адрес памяти
---@param size number размер
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderDrawLine)**
---
---@param pos1X number координата X первой точки
---@param pos1Y number координата Y первой точки
---@param pos2X number координата X второй точки
---@param pos2Y number координата Y второй точки
---@param width number ширина линии
---@param color number цвет линии в формате ARGB
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderDrawBox)**
---
---@param posX number координата X
---@param posY number координата Y
---@param sizeX number ширина
---@param sizeY number высота
---@param color number цвет в ARGB
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderDrawBoxWithBorder)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetFontDrawTextLength)**
---
---@param font DxFont шрифт
---@param text string текст
---@param ignoreColorTags boolean? пропуск цветовых тегов (по умолчанию = `false`)
---@return number length ширина в пикселях
function renderGetFontDrawTextLength(font, text, ignoreColorTags) end

---
--- Возвращает высоту загруженного шрифта в пикселях
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetFontDrawHeight)**
---
---@param font DxFont шрифт
---@return number height высота
function renderGetFontDrawHeight(font) end

---
--- Возвращает индекс символа в тексте по позиции в пикселях
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetFontCharIndexAt)**
---
---@param font DxFont шрифт
---@param text string текст
---@param x number смещение в пикселях
---@param ignoreColorTags boolean? пропуск цветовых тегов (по умолчанию = `false`)
---@return number index индекс символа
function renderGetFontCharIndexAt(font, text, x, ignoreColorTags) end

---
--- Получает ширину определённого символа и возвращает результат в пикселях
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetFontCharWidth)**
---
---@param font DxFont шрифт
---@param char string|number символ
---@return number width ширина символа
function renderGetFontCharWidth(font, char) end

---
--- Загружает установленный в системе шрифт по названию. Можно задать стиль шрифта и требуемую кодировку.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderCreateFont)**
---
---@param font string название
---@param height number высота
---@param flags number флаги
---@param charset number? кодировка
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderReleaseFont)**
---
---@param font DxFont шрифт
---@deprecated
function renderReleaseFont(font) end

---
--- Отображает текст на экране, используя загруженный шрифт.
--- Поддерживает цветовые теги в формате `{RRGGBB}` и `{AARRGGBB}`, и символ переноса строки `\n`.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderFontDrawText)**
---
---@param font DxFont шрифт
---@param text string текст
---@param posX number координата X
---@param posY number координата Y
---@param color number цвет в ARGB
---@param ignoreColorTags boolean? если задано `true`, цветовые теги не станут обрабатываться (по умолчанию = `false`)
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderDrawPolygon)**
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
--- Загружает текстуру из файла
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderLoadTextureFromFile)**
---
---@param file string путь к файлу
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderReleaseTexture)**
---
---@param texture DxTexture текстура
function renderReleaseTexture(texture) end

---
--- Отображает загруженную текстуру по заданным координатам, с указанным размером и вращением
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderDrawTexture)**
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
--- Начало рисования фигуры определённым методом.
--- Подробнее о каждом методе построения примитивов: [MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/bb147291(v=vs.85).aspx)
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderBegin)**
---
---@param type RenderType метод
function renderBegin(type) end

---
--- Завершение рисования фигуры.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderEnd)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderColor)**
---
---@param color number цвет в ARGB
function renderColor(color) end

---
--- Добавляет вершину в фигуру по абсолютным координатам
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderVertex)**
---
---@param vX number координата X
---@param vY number координата Y
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderSetTexCoord)**
---
---@param posX number относительные координата X текстуры
---@param posY number относительные координата Y текстуры
function renderSetTexCoord(posX, posY) end

---
--- Задаёт фигуре текстуру. Каждой фигуре может быть задана только одна текстура.
--- Значение `nil` сбросит заданную текстуру.
--- Эта функция должна быть использована совместно с `renderSetTexCoord`
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderBindTexture)**
---
---@param texture DxTexture текстура
function renderBindTexture(texture) end

---
--- Возвращает указатель на объект `IDirect3DTexture9`, принадлежащий текстуре
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetTextureStruct)**
---
---@param texture DxTexture текстура
---@return number struct указатель
function renderGetTextureStruct(texture) end

---
--- Возвращает указатель на объект ID3DXSprite, принадлежащий текстуре
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetTextureSprite)**
---
---@param texture DxTexture текстура
---@return number sprite указатель
function renderGetTextureSprite(texture) end

---
--- Возвращает размеры изображения
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderGetTextureSize)**
---
---@param texture DxTexture текстура
---@return number sizeX ширина
---@return number sizeY высота
function renderGetTextureSize(texture) end

---
--- Устанавливает значение рендерстейта.
--- Подробнее о рендерстейтах: [MSDN](https://msdn.microsoft.com/en-us/library/windows/desktop/bb172599(v=vs.85).aspx)
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderSetRenderState)**
---
---@param state number тип
---@param value number новое значение
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/renderLoadTextureFromFileInMemory)**
---
---@param pointer number адрес памяти
---@param size number размер файла
---@return DxTexture texture текстура
function renderLoadTextureFromFileInMemory(pointer, size) end

---
--- Задаёт числовую версию скрипта. Предназначена преимущественно для системы проверки обновлений.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/script_version_number)**
---
---@param version number версия
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/script_version)**
---
---@param version string версия
function script_version(version) end

---
--- Задаёт название скрипта.
--- Если название не задать, то в качестве названия будет выступать имя файла скрипта.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/script_name)**
---
---@param name string название
function script_name(name) end

---
--- Задаёт описание скрипта.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/script_description)**
---
---@param description string текст описания
function script_description(description) end

---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansChar3d(ped, nearPed, radiusX, radiusY, radiusZ, sphere) end

---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharOnFootChar3d(ped, nearPed, radiusX, radiusY, radiusZ, sphere) end

---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharInCarChar3d(ped, nearPed, radiusX, radiusY, radiusZ, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/script_moonloader)**
---
---@param version number
function script_moonloader(version) end

---
--- Приостанавливает выполнение сопрограммы `main` на заданное время в миллисекундах.
--- Может быть вызвана только изнутри `main` и скриптовых потоков.
--- Если функция вызвана изнутри `main` и значение `time` равно `-1`, то скрипт будет приостановлен на бесконечный период времени, это может быть использовано для прекращения активного исполнения скрипта, но чтобы он продолжал работать и обрабатывать события.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/wait)**
---
---@param time number время в миллисекундах
function wait(time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getGameGlobal)**
---
---@param index number
---@return number value
function getGameGlobal(index) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGameGlobal)**
---
---@param index number
---@param value number
function setGameGlobal(index, value) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getGameGlobalPtr)**
---
---@param index number
---@return number ptr
function getGameGlobalPtr(index) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isSampfuncsLoaded)**
---
---@return boolean loaded
function isSampfuncsLoaded() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCleoLoaded)**
---
---@return boolean loaded
function isCleoLoaded() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isSampLoaded)**
---
---@return boolean loaded
function isSampLoaded() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isKeyDown)**
---
---@param keyId number
---@return boolean state
function isKeyDown(keyId) end

---@param value boolean
function setDeatharrestState(value) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isOpcodesAvailable)**
---
---@return boolean status
function isOpcodesAvailable() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/representFloatAsInt)**
---
---@param f number
---@return number i
function representFloatAsInt(f) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/representIntAsFloat)**
---
---@param i number
---@return number i
function representIntAsFloat(i) end

---@param ped Ped
---@return boolean result
function isCharDead(ped) end

---@param car Vehicle
---@return boolean result
function isCarDead(car) end

---@param player Player
---@return boolean result
function isPlayerPressingHorn(player) end

---@param car Vehicle
---@param pedtype Model
---@param model number
---@return Ped ped
function createCharInsideCar(car, pedtype, model) end

---@param car Vehicle
---@param modelId Model
---@return boolean result
function isCarModel(car, modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPauseMenuActive)**
---
---@return boolean active
function isPauseMenuActive() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isGameWindowForeground)**
---
---@return boolean foreground
function isGameWindowForeground() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getGameVersion)**
---
---@return number major
---@return number minor
---@return number majorRev
---@return number minorRev
---@return number game
---@return number region
---@return boolean steam
---@return boolean cracked
function getGameVersion() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getMoonloaderVersion)**
---
---@return number version
function getMoonloaderVersion() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/localClock)**
---
---@return number time
function localClock() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/freeTextures)**
---
function freeTextures() end

---@param car Vehicle
---@param mode number
---@param switchstyle number
function pointCameraAtCar(car, mode, switchstyle) end

---@param ped Ped
---@param mode number
---@param switchstyle number
function pointCameraAtChar(ped, mode, switchstyle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/useRenderCommands)**
---
---@param enable boolean
function useRenderCommands(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/writeMemory)**
---
---@param address number
---@param size number
---@param value number
---@param virtualProtect boolean
function writeMemory(address, size, value, virtualProtect) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/readMemory)**
---
---@param address number
---@param size number
---@param virtualProtect boolean
---@return number value
function readMemory(address, size, virtualProtect) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadDynamicLibrary)**
---
---@param library string
---@return boolean result
---@return number handle
function loadDynamicLibrary(library) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/freeDynamicLibrary)**
---
---@param handle number
function freeDynamicLibrary(handle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getDynamicLibraryProcedure)**
---
---@param proc string
---@param handle number
---@return boolean result
---@return number proc
function getDynamicLibraryProcedure(proc, handle) end

---
--- Проверяет файл на существование.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doesFileExist)**
---
---@param file string путь
---@return boolean result результат выполнения
function doesFileExist(file) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doesDirectoryExist)**
---
---@param directory string
---@return boolean result
function doesDirectoryExist(directory) end

---
--- Создаёт иерархию директорий для указанного пути.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createDirectory)**
---
---@param directory string путь
---@return boolean result результат выполнения
function createDirectory(directory) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/popFloat)**
---
---@return number val
function popFloat() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isGameVersionOriginal)**
---
---@return boolean result
function isGameVersionOriginal() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/allocateMemory)**
---
---@param size number
---@return number memory
function allocateMemory(size) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/freeMemory)**
---
---@param memory number
function freeMemory(memory) end

---@return boolean result
function getFadingStatus() end

---@param atX number
---@param atY number
---@param atZ number
---@param angle number
---@param townNumber number
function addHospitalRestart(atX, atY, atZ, angle, townNumber) end

---@param atX number
---@param atY number
---@param atZ number
---@param angle number
---@param townNumber number
function addPoliceRestart(atX, atY, atZ, angle, townNumber) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/findAllRandomCharsInSphere)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/findAllRandomVehiclesInSphere)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/findAllRandomObjectsInSphere)**
---
---@param posX number
---@param posY number
---@param posZ number
---@param radius number
---@param findNext boolean
---@return boolean result
---@return Object object
function findAllRandomObjectsInSphere(posX, posY, posZ, radius, findNext) end

---@param ped Ped
---@return number ptr
function getCharPointer(ped) end

---@param car Vehicle
---@return number ptr
function getCarPointer(car) end

---@param object Object
---@return number struct
function getObjectPointer(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/callFunction)**
---
---@param address number
---@param params number
---@param pop number
---@param ... any
---@return number returnValue
function callFunction(address, params, pop, ...) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/callMethod)**
---
---@param address number
---@param struct number
---@param params number
---@param pop number
---@param ... any
---@return number returnValue
function callMethod(address, struct, params, pop, ...) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/storeClosestEntities)**
---
---@param ped Ped
---@param object Object
---@return boolean result
function isCharTouchingObject(ped, object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchCarEngine)**
---
---@param car Vehicle
---@param state boolean
function switchCarEngine(car, state) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getTargetBlipCoordinates)**
---
---@return boolean result
---@return number posX
---@return number posY
---@return number posZ
function getTargetBlipCoordinates() end

---@param car Vehicle
---@return number gears
function getCarNumberOfGears(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarCurrentGear)**
---
---@param car Vehicle
---@return number gear
function getCarCurrentGear(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarSirenOn)**
---
---@param car Vehicle
---@return boolean state
function isCarSirenOn(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarEngineOn)**
---
---@param car Vehicle
---@return boolean state
function isCarEngineOn(car) end

---@param marker Marker
---@param mode number
function changeBlipDisplay(marker, mode) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printStyledString)**
---
---@param text string
---@param time number
---@param style number
function printStyledString(text, time, style) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printString)**
---
---@param text string
---@param time number
function printString(text, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printStringNow)**
---
---@param text string
---@param time number
function printStringNow(text, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharPlayerIsTargeting)**
---
---@param player Player
---@return boolean result
---@return Ped ped
function getCharPlayerIsTargeting(player) end

---@param car Vehicle
function addUpsidedownCarCheck(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/testCheat)**
---
---@param text string
---@return boolean result
function testCheat(text) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/spawnVehicleByCheating)**
---
---@param modelId Model
---@return boolean result
function spawnVehicleByCheating(modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharPointerHandle)**
---
---@param ptr number
---@return Ped handle
function getCharPointerHandle(ptr) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getVehiclePointerHandle)**
---
---@param ptr number
---@return Vehicle handle
function getVehiclePointerHandle(ptr) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectPointerHandle)**
---
---@param ptr number
---@return Object handle
function getObjectPointerHandle(ptr) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/processLineOfSight)**
---
---@param originX number
---@param originY number
---@param originZ number
---@param targetX number
---@param targetY number
---@param targetZ number
---@param checkSolid boolean? Default value is true
---@param car boolean? Default value is false
---@param ped boolean? Default value is false
---@param object boolean? Default value is false
---@param particle boolean? Default value is false
---@param seeThrough boolean? Default value is false
---@param ignoreSomeObjects boolean? Default value is false
---@param shootThrough boolean? Default value is false
---@return boolean result
---@return table colPoint
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setClipboardText)**
---
---@param text string
---@return boolean result
function setClipboardText(text) end

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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getStructElement)**
---
---@param struct number
---@param offset number
---@param size number
---@param unprotect boolean? Default value is false
---@return number value
function getStructElement(struct, offset, size, unprotect) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setStructElement)**
---
---@param struct number
---@param offset number
---@param size number
---@param value number
---@param unprotect boolean? Default value is false
function setStructElement(struct, offset, size, value, unprotect) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/convertMatrixToQuaternion)**
---
---@param rightX number
---@param rightY number
---@param rightZ number
---@param frontX number
---@param frontY number
---@param frontZ number
---@param upX number
---@param upY number
---@param upZ number
---@return number w
---@return number x
---@return number y
---@return number z
function convertMatrixToQuaternion(rightX, rightY, rightZ, frontX, frontY, frontZ, upX, upY, upZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/convertQuaternionToMatrix)**
---
---@param w number
---@param x number
---@param y number
---@param z number
---@return number rightX
---@return number rightY
---@return number rightZ
---@return number frontX
---@return number frontY
---@return number frontZ
---@return number upX
---@return number upY
---@return number upZ
function convertQuaternionToMatrix(w, x, y, z) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreen)**
---
---@param posX number
---@param posY number
---@param posZ number
---@return number wposX
---@return number wposY
function convert3DCoordsToScreen(posX, posY, posZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGameKeyState)**
---
---@param key number
---@param state number
function setGameKeyState(key, state) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCursorPos)**
---
---@return number posX
---@return number posY
function getCursorPos() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/convertWindowScreenCoordsToGameScreenCoords)**
---
---@param wposX number
---@param wposY number
---@return number gposX
---@return number gposY
function convertWindowScreenCoordsToGameScreenCoords(wposX, wposY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/convertGameScreenCoordsToWindowScreenCoords)**
---
---@param gposX number
---@param gposY number
---@return number wposX
---@return number wposY
function convertGameScreenCoordsToWindowScreenCoords(gposX, gposY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/convertScreenCoordsToWorld3D)**
---
---@param posX number
---@param posY number
---@param depth number
---@return number posX
---@return number posY
---@return number posZ
function convertScreenCoordsToWorld3D(posX, posY, depth) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getModuleHandle)**
---
---@param module string
---@return number handle
function getModuleHandle(module) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getModuleProcAddress)**
---
---@param module string
---@param proc string
---@return number address
function getModuleProcAddress(module, proc) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setVirtualKeyDown)**
---
---@param vkey number
---@param down boolean
function setVirtualKeyDown(vkey, down) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharKeyDown)**
---
---@param ckey number
---@param down boolean
function setCharKeyDown(ckey, down) end

---@alias DownloadingCallback fun(id: number, status: number, p1: any, p2: any): boolean

---
--- Загружает файл из интернета по URL по протоколу HTTP.
--- Процесс загрузки полностью контролируем с помощью обработчика загрузки и может быть отменён.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/downloadUrlToFile)**
---
---@param url string uRL ресурса
---@param file string путь к файлу
---@param statusCallback DownloadingCallback? функция-обработчик статуса загрузки, является необязательным параметром
---@return number index идентификатор загрузки
function downloadUrlToFile(url, file, statusCallback) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isKeyJustPressed)**
---
---@param key number
---@return boolean state
function isKeyJustPressed(key) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/convert3DCoordsToScreenEx)**
---
---@param posX number
---@param posY number
---@param posZ number
---@param checkMin boolean? Default value is false
---@param checkMax boolean? Default value is false
---@return boolean result
---@return number x
---@return number y
---@return number z
---@return number w
---@return number h
function convert3DCoordsToScreenEx(posX, posY, posZ, checkMin, checkMax) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getStructFloatElement)**
---
---@param struct number
---@param offset number
---@param unprotect boolean? Default value is false
---@return number value
function getStructFloatElement(struct, offset, unprotect) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setStructFloatElement)**
---
---@param struct number
---@param offset number
---@param value number
---@param unprotect boolean? Default value is false
function setStructFloatElement(struct, offset, value, unprotect) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/wasKeyPressed)**
---
---@param key number
---@return boolean state
function wasKeyPressed(key) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/wasKeyReleased)**
---
---@param key number
---@return boolean state
function wasKeyReleased(key) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getMousewheelDelta)**
---
---@return number delta
function getMousewheelDelta() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/consumeWindowMessage)**
---
---@param game boolean? Default value is true
---@param scripts boolean? Default value is true
function consumeWindowMessage(game, scripts) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addEventHandler)**
---
---@param ... any
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
function addEventHandler(...) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isGamePaused)**
---
---@return boolean paused
function isGamePaused() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/gameClock)**
---
---@return number time
function gameClock() end

---@alias ScriptProperty
---| '"work-in-pause"' # Указывает, что скрипт будет продолжать исполнение во время паузы игры (с условием, что игра развёрнута и находится на переднем плане).
---| '"forced-reloading-only"' # апрещает автоматическую перезагрузку скрипта, оставляя возможность только принудительной перезагрузки.

---@param gxtString GxtString
---@param number number
---@param time number
---@param style number
---@return boolean result
function printWithNumberBig(gxtString, number, time, style) end

---@param gxtString GxtString
---@param number number
---@param time number
---@param flag number
---@return boolean result
function printWithNumber(gxtString, number, time, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/import)**
---
---@param filename string
---@return any imports
function import(filename) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/encodeJson)**
---
---@param data table
---@return string json
function encodeJson(data) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/decodeJson)**
---
---@param json string
---@return table data
function decodeJson(json) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/showCursor)**
---
---@param show boolean
---@param lockControls boolean? Default value is nil
function showCursor(show, lockControls) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/lockPlayerControl)**
---
---@param lock boolean
function lockPlayerControl(lock) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerControlLocked)**
---
---@return boolean locked
function isPlayerControlLocked() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setBlipCoordinates)**
---
---@param blip Marker
---@param x number
---@param y number
---@param z number
---@return boolean result
function setBlipCoordinates(blip, x, y, z) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTargetBlipCoordinates)**
---
---@param x number
---@param y number
---@param z number
---@return boolean result
function setTargetBlipCoordinates(x, y, z) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/placeWaypoint)**
---
---@param x number
---@param y number
---@param z number
---@return boolean result
function placeWaypoint(x, y, z) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeWaypoint)**
---
---@return boolean result
function removeWaypoint() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getFolderPath)**
---
---@param csidl number
---@return string path
function getFolderPath(csidl) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getTimeStepValue)**
---
---@return number value
function getTimeStepValue() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getD3DDevicePtr)**
---
---@return number devicePtr
function getD3DDevicePtr() end

---@param car Vehicle
---@return boolean result
---@return number passengers
function getNumberOfPassengers(car) end

---@param car Vehicle
---@return number maxPassengers
function getMaximumNumberOfPassengers(car) end

---@param multiplier number
---@return boolean result
function setCarDensityMultiplier(multiplier) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getGameGlobalFloat)**
---
---@param index number
---@return number value
function getGameGlobalFloat(index) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGameGlobalFloat)**
---
---@param index number
---@param value number
function setGameGlobalFloat(index, value) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/shakeCam)**
---
---@param shake number
function shakeCam(shake) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createPlayer)**
---
---@param modelId Model
---@param atX number
---@param atY number
---@param atZ number
---@return Player player
function createPlayer(modelId, atX, atY, atZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createChar)**
---
---@param pedtype number
---@param modelId Model
---@param atX number
---@param atY number
---@param atZ number
---@return Ped ped
function getPlayerChar(player) end

---@return boolean result
function cancelOverrideRestart() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharCoordinates)**
---
---@param ped Ped
---@return number positionX
---@return number positionY
---@return number positionZ
function getCharCoordinates(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharCoordinates)**
---
---@param ped Ped
---@param posX number
---@param posY number
---@param posZ number
function setCharCoordinates(ped, posX, posY, posZ) end

---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCharInArea2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInArea3d)**
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
function isCharInArea3d(ped, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createCar)**
---
---@param modelId Model
---@param atX number
---@param atY number
---@param atZ number
---@return Vehicle car
function createCar(modelId, atX, atY, atZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/deleteCar)**
---
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansCar2d(ped, car, radiusX, radiusY, sphere) end

---@param ped Ped
---@param car Vehicle
---@param driveToX number
---@param driveToY number
---@param driveToZ number
function carGotoCoordinates(car, driveToX, driveToY, driveToZ) end

---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharInCarCar2d(ped, car, radiusX, radiusY, sphere) end

---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param flag boolean
---@return boolean result
function locateCharAnyMeansCar3d(ped, car, radiusX, radiusY, radiusZ, flag) end

---@param ped Ped
---@param car Vehicle
---@return number positionX
---@return number positionY
---@return number positionZ
function getCarCoordinates(car) end

---@param ped Ped
---@param car Vehicle
---@param atX number
---@param atY number
---@param atZ number
function setCarCoordinates(car, atX, atY, atZ) end

---@param car Vehicle
---@param maxSpeed number
function setCarCruiseSpeed(car, maxSpeed) end

---@param car Vehicle
---@param behaviour number
function setCarDrivingStyle(car, behaviour) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarMission)**
---
---@param car Vehicle
---@param driverBehaviour number
function setCarMission(car, driverBehaviour) end

---@param car Vehicle
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCarInArea2d(car, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarInArea3d)**
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
function isCarInArea3d(car, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printBig)**
---
---@param gxtString GxtString
---@param time number
---@param style number
function printBig(gxtString, time, style) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printText)**
---
---@param gxtString GxtString
---@param time number
---@param flag number
function printText(gxtString, time, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printTextNow)**
---
---@param gxtString GxtString
---@param time number
---@param flag number
function printTextNow(gxtString, time, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearPrints)**
---
function clearPrints() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getTimeOfDay)**
---
---@return number hours
---@return number mins
function getTimeOfDay() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTimeOfDay)**
---
---@param hours number
---@param minutes number
function setTimeOfDay(hours, minutes) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getMinutesToTimeOfDay)**
---
---@param hours number
---@param minutes number
---@return number minutes
function getMinutesToTimeOfDay(hours, minutes) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPointOnScreen)**
---
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radius number
---@return boolean result
function isPointOnScreen(sphereX, sphereY, sphereZ, radius) end

---@param gxtString GxtString
---@param time number
---@param style number
---@return boolean result
function printBigQ(gxtString, time, style) end

---@param garage GxtString
---@param car Vehicle
---@return boolean result
function isCharInCar(ped, car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInModel)**
---
---@param ped Ped
---@param carModel Model
---@return boolean result
function isCharInModel(ped, carModel) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnyCar)**
---
---@param ped Ped
---@return boolean result
function isCharInAnyCar(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isButtonPressed)**
---
---@param player Player
---@param key number
---@return boolean result
function isButtonPressed(player, key) end

---@param player Player
---@param key number
---@return number state
function getPadState(player, key) end

---@param ped Ped
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeans2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFoot2d)**
---
---@param ped Ped
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharOnFoot2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---@param ped Ped
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharInCar2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCharAnyMeans2d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCharOnFoot2d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCharInCar2d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansChar2d)**
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansChar2d(ped, nearPed, radiusX, radiusY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFootChar2d)**
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param sphere boolean
function locateCharOnFootChar2d(ped, nearPed, radiusX, radiusY, sphere) end

---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharInCarChar2d(ped, nearPed, radiusX, radiusY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeans3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFoot3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharInCar3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCharAnyMeans3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCharOnFoot3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCharInCar3d)**
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

---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansChar3d(ped, nearPed, radiusX, radiusY, radiusZ, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFootChar3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharInCarChar3d)**
---
---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharInCarChar3d(ped, nearPed, radiusX, radiusY, radiusZ, sphere) end

---@param modelId Model
---@param atX number
---@param atY number
---@param atZ number
---@return Object object
function createObject(modelId, atX, atY, atZ) end

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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/givePlayerMoney)**
---
---@param player Player
---@param money number
function givePlayerMoney(player, money) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPlayerMoney)**
---
---@param player Player
---@return number money
function getPlayerMoney(player) end

---@param player Player
---@param float2 number
---@param float3 number
---@param float4 number
function giveRemoteControlledCarToPlayer(player, float2, float3, float4) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/alterWantedLevel)**
---
---@param player Player
---@param wantedLevel number
function alterWantedLevel(player, wantedLevel) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/alterWantedLevelNoDrop)**
---
---@param player Player
---@param minimumWantedLevel number
function alterWantedLevelNoDrop(player, minimumWantedLevel) end

---@param player Player
---@param level number
---@return boolean result
function isWantedLevelGreater(player, level) end

---@param player Player
---@param modelId Model
---@return number quantity
function getNumOfModelsKilledByPlayer(player, modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setDeatharrestState)**
---
---@param value boolean
function setDeatharrestState(value) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasDeatharrestBeenExecuted)**
---
---@return boolean result
function hasDeatharrestBeenExecuted() end

---@param ped Ped
---@param weapon number
---@param ammo number
function addAmmoToChar(ped, weapon, ammo) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerDead)**
---
---@param player Player
---@return boolean result
function isPlayerDead(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharDead)**
---
---@param ped Ped
---@return boolean result
function isCharDead(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarDead)**
---
---@param car Vehicle
---@return boolean result
function isCarDead(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerPressingHorn)**
---
---@param player Player
---@return boolean result
function isPlayerPressingHorn(player) end

---@param car Vehicle
---@param pedtype Model
---@param model number
---@return Ped ped
function createCharInsideCar(car, pedtype, model) end

---@param car Vehicle
---@param modelId Model
---@return boolean result
function isCarModel(car, modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createCarGenerator)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchCarGenerator)**
---
---@param carGenerator number
---@param carsToGenerate number
function switchCarGenerator(carGenerator, carsToGenerate) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayOnscreenTimer)**
---
---@param var VarId
---@param countInDirection boolean
function displayOnscreenTimer(var, countInDirection) end

---@param closestToX number
---@param closestToY number
---@param closestToZ number
---@return number nodeX
---@return number nodeY
---@return number nodeZ
function getClosestCharNode(closestToX, closestToY, closestToZ) end

---@param closestToX number
---@param closestToY number
---@param closestToZ number
---@return number nodeX
---@return number nodeY
---@return number nodeZ
function getClosestCarNode(closestToX, closestToY, closestToZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInZone)**
---
---@param ped Ped
---@param zoneName GxtString
---@return boolean result
function isCharInZone(ped, zoneName) end

---@param car Vehicle
---@param mode number
---@param switchstyle number
function pointCameraAtCar(car, mode, switchstyle) end

---@param ped Ped
---@param mode number
---@param switchstyle number
function pointCameraAtChar(ped, mode, switchstyle) end

---@param object Object
---@return boolean result
function isObjectOnScreen(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/shakePad)**
---
---@param player Player
---@param time number
---@param intensity number
function shakePad(player, time, intensity) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTimeScale)**
---
---@param gamespeed number
function setTimeScale(gamespeed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setFixedCameraPosition)**
---
---@param positionX number
---@param positionY number
---@param positionZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function setFixedCameraPosition(positionX, positionY, positionZ, rotationX, rotationY, rotationZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/pointCameraAtPoint)**
---
---@param pointAtX number
---@param pointAtY number
---@param pointAtZ number
---@param switchstyle number
function pointCameraAtPoint(pointAtX, pointAtY, pointAtZ, switchstyle) end

---@param car Vehicle
---@param unused number
---@param visibility boolean
---@return Marker marker
function addBlipForCarOld(car, unused, visibility) end

---@param ped Ped
---@param int2 number
---@param int3 number
---@return Marker marker
function addBlipForCharOld(ped, int2, int3) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeBlip)**
---
---@param marker Marker
function removeBlip(marker) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/changeBlipColour)**
---
---@param marker Marker
---@param color number
function changeBlipColour(marker, color) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForCoordOld)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param color number
---@param flag number
---@return Marker marker
function addBlipForCoordOld(atX, atY, atZ, color, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/changeBlipScale)**
---
---@param marker Marker
---@param size number
function changeBlipScale(marker, size) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setFadingColour)**
---
---@param r number
---@param g number
---@param b number
function setFadingColour(r, g, b) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doFade)**
---
---@param _in boolean
---@param time number
function doFade(_in, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getFadingStatus)**
---
---@return boolean result
function getFadingStatus() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addHospitalRestart)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param angle number
---@param townNumber number
function addHospitalRestart(atX, atY, atZ, angle, townNumber) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addPoliceRestart)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param angle number
---@param townNumber number
function addPoliceRestart(atX, atY, atZ, angle, townNumber) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/overrideNextRestart)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param angle number
function overrideNextRestart(atX, atY, atZ, angle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/drawShadow)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharHeading)**
---
---@param ped Ped
---@return number angle
function getCharHeading(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharHeading)**
---
---@param ped Ped
---@param angle number
function setCharHeading(ped, angle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarHeading)**
---
---@param car Vehicle
---@return number angle
function getCarHeading(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarHeading)**
---
---@param car Vehicle
---@param angle number
function setCarHeading(car, angle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectHeading)**
---
---@param object Object
---@return number angle
function getObjectHeading(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectHeading)**
---
---@param object Object
---@param angle number
function setObjectHeading(object, angle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharTouchingObject)**
---
---@param ped Ped
---@param object Object
---@return boolean result
function isCharTouchingObject(ped, object) end

---@param ped Ped
---@param weapon number
---@param ammo number
function setCharAmmo(ped, weapon, ammo) end

---@param modelId Model
---@param gxtString GxtString
function loadSpecialModel(modelId, gxtString) end

---@param car Vehicle
---@return number forwardX
function getCarForwardX(car) end

---@param car Vehicle
---@return number forwardY
function getCarForwardY(car) end

---@param garage GxtString
---@param type number
function changeGarageType(garage, type) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForCoord)**
---
---@param atX number
---@param atY number
---@param atZ number
---@return Checkpoint checkpoint
function addBlipForCoord(atX, atY, atZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/changeBlipDisplay)**
---
---@param marker Marker
---@param mode number
function changeBlipDisplay(marker, mode) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addOneOffSound)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param sound number
function addOneOffSound(atX, atY, atZ, sound) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addContinuousSound)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param sound number
---@return number unk
function addContinuousSound(atX, atY, atZ, sound) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeSound)**
---
---@param sound number
function removeSound(sound) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarStuckOnRoof)**
---
---@param car Vehicle
---@return boolean result
function isCarStuckOnRoof(car) end

---@param maxProgress number
function setProgressTotal(maxProgress) end

function registerMissionGiven() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAreaOnFoot2d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAreaInCar2d)**
---
---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCharInAreaInCar2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCharStoppedInArea2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaOnFoot2d)**
---
---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCharStoppedInAreaOnFoot2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCharStoppedInAreaInCar2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAreaOnFoot3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAreaInCar3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInArea3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaOnFoot3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAreaInCar3d)**
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

---@param car Vehicle
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCarStoppedInArea2d(car, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarStoppedInArea3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCar2d)**
---
---@param car Vehicle
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCar2d(car, pointX, pointY, radiusX, radiusY, sphere) end

---@param car Vehicle
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateStoppedCar2d(car, pointX, pointY, radiusX, radiusY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCar3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateStoppedCar3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/giveWeaponToChar)**
---
---@param ped Ped
---@param weapon number
---@param ammo number
function giveWeaponToChar(ped, weapon, ammo) end

---@param player Player
---@param canMove boolean
---@return boolean result
function setPlayerControl(player, canMove) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/forceWeather)**
---
---@param weather number
---@return boolean result
function forceWeather(weather) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/forceWeatherNow)**
---
---@param weather number
---@return boolean result
function forceWeatherNow(weather) end

---@param enable boolean
function setFreeResprays(enable) end

---@param ped Ped
---@param weapon number
function setCurrentCharWeapon(ped, weapon) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectCoordinates)**
---
---@param object Object
---@return boolean result
---@return number positionX
---@return number positionY
---@return number positionZ
function getObjectCoordinates(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectCoordinates)**
---
---@param object Object
---@param atX number
---@param atY number
---@param atZ number
---@return boolean result
function setObjectCoordinates(object, atX, atY, atZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getGameTimer)**
---
---@return number timeMs
function getGameTimer() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/storeWantedLevel)**
---
---@param player Player
---@return boolean result
---@return number level
function storeWantedLevel(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarStopped)**
---
---@param car Vehicle
---@return boolean result
function isCarStopped(car) end

---@param centered boolean
function setTextCentre(centered) end

---@param linewidth number
function setTextWrapx(linewidth) end

---@param linewidth number
function setTextCentreSize(linewidth) end

---@param background boolean
function setTextBackground(background) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createCharAsPassenger)**
---
---@param car Vehicle
---@param pedtype Model
---@param model number
---@param passengerSeat number
---@return boolean result
---@return Ped ped
function createCharAsPassenger(car, pedtype, model, passengerSeat) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printWithNumberBig)**
---
---@param gxtString GxtString
---@param number number
---@param time number
---@param style number
---@return boolean result
function printWithNumberBig(gxtString, number, time, style) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printWithNumber)**
---
---@param gxtString GxtString
---@param number number
---@param time number
---@param flag number
---@return boolean result
function printWithNumber(gxtString, number, time, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printWithNumberNow)**
---
---@param gxtString GxtString
---@param number number
---@param time number
---@param flag number
---@return boolean result
function printWithNumberNow(gxtString, number, time, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchRoadsOn)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchRoadsOff)**
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchRoadsOff(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumberOfPassengers)**
---
---@param car Vehicle
---@return boolean result
---@return number passengers
function getNumberOfPassengers(car) end

---@param object Object
---@param car Vehicle
---@return number maxPassengers
function getMaximumNumberOfPassengers(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarDensityMultiplier)**
---
---@param multiplier number
---@return boolean result
function setCarDensityMultiplier(multiplier) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarHeavy)**
---
---@param car Vehicle
---@param heavy boolean
---@return boolean result
function setCarHeavy(car, heavy) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMaxWantedLevel)**
---
---@param level number
function setMaxWantedLevel(level) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarInAirProper)**
---
---@param car Vehicle
---@return boolean result
function isCarInAirProper(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarUpsidedown)**
---
---@param car Vehicle
---@return boolean result
function isCarUpsidedown(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPlayerChar)**
---
---@param player Player
---@return boolean result
---@return Ped ped
function getPlayerChar(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/cancelOverrideRestart)**
---
---@return boolean result
function cancelOverrideRestart() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPoliceIgnorePlayer)**
---
---@param player Player
---@param ignored boolean
---@return boolean result
function setPoliceIgnorePlayer(player, ignored) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/startKillFrenzy)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/readKillFrenzyStatus)**
---
---@return boolean result
---@return number status
function readKillFrenzyStatus() end

---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansCar2d(ped, car, radiusX, radiusY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFootCar2d)**
---
---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param flag boolean
---@return boolean result
function locateCharOnFootCar2d(ped, car, radiusX, radiusY, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharInCarCar2d)**
---
---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharInCarCar2d(ped, car, radiusX, radiusY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansCar3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharOnFootCar3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharInCarCar3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/lockCarDoors)**
---
---@param car Vehicle
---@param status number
function lockCarDoors(car, status) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/explodeCar)**
---
---@param car Vehicle
---@return boolean result
function explodeCar(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addExplosion)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@return boolean result
function addExplosion(atX, atY, atZ, radius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarUpright)**
---
---@param car Vehicle
---@return boolean result
function isCarUpright(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createPickup)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasPickupBeenCollected)**
---
---@param pickup Pickup
---@return boolean result
function hasPickupBeenCollected(pickup) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removePickup)**
---
---@param pickup Pickup
---@return boolean result
function removePickup(pickup) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTaxiLights)**
---
---@param taxi Vehicle
---@param light boolean
---@return boolean result
function setTaxiLights(taxi, light) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printBigQ)**
---
---@param gxtString GxtString
---@param time number
---@param style number
---@return boolean result
function printBigQ(gxtString, time, style) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTargetCarForMissionGarage)**
---
---@param garage GxtString
---@param car Vehicle
---@return boolean result
function setTargetCarForMissionGarage(garage, car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/applyBrakesToPlayersCar)**
---
---@param player Player
---@param apply boolean
---@return boolean result
function applyBrakesToPlayersCar(player, apply) end

---@param ped Ped
---@param health number
function setCharHealth(ped, health) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarHealth)**
---
---@param car Vehicle
---@param health number
function setCarHealth(car, health) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharHealth)**
---
---@param ped Ped
---@return number health
function getCharHealth(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarHealth)**
---
---@param car Vehicle
---@return number health
function getCarHealth(car) end

---@param car Vehicle
---@param primaryColor number
---@param secondaryColor number
---@return boolean result
function changeCarColour(car, primaryColor, secondaryColor) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchPedRoadsOn)**
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchPedRoadsOn(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchPedRoadsOff)**
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchPedRoadsOff(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGangWeapons)**
---
---@param gang number
---@param weapons1 number
---@param weapons2 number
---@param weapons3 number
function setGangWeapons(gang, weapons1, weapons2, weapons3) end

---@param ped Ped
---@param object Object
---@return boolean result
function isCharTouchingObjectOnFoot(ped, object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadSpecialCharacter)**
---
---@param gxtString GxtString
---@param id number
function loadSpecialCharacter(gxtString, id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasSpecialCharacterLoaded)**
---
---@param id number
---@return boolean result
function hasSpecialCharacterLoaded(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerInRemoteMode)**
---
---@param player Player
---@return boolean result
function isPlayerInRemoteMode(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCutsceneOffset)**
---
---@param posX number
---@param posY number
---@param posZ number
function setCutsceneOffset(posX, posY, posZ) end

---@param ped Ped
---@return boolean result
function isCharMale(ped) end

---@param float1 number
---@param float2 number
---@param float3 number
function policeRadioMessage(float1, float2, float3) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasModelLoaded)**
---
---@param modelId Model
---@return boolean result
function hasModelLoaded(modelId) end

---@param int1 boolean
function switchRubbish(int1) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/drawCorona)**
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

---@param garage GxtString
---@return boolean result
function isGarageOpen(garage) end

---@param garage GxtString
---@return boolean result
function isGarageClosed(garage) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerPlaying)**
---
---@param player Player
---@return boolean result
function isPlayerPlaying(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getControllerMode)**
---
---@return number mode
function getControllerMode() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCanResprayCar)**
---
---@param car Vehicle
---@param sprayable boolean
function setCanResprayCar(car, sprayable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/unloadSpecialCharacter)**
---
---@param id number
function unloadSpecialCharacter(id) end

---@param sphere number
function removeSphere(sphere) end

---@param player Player
---@param modelId Model
---@return number quantity
function getNumOfModelsKilledByPlayer(player, modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/activateGarage)**
---
---@param garage GxtString
function activateGarage(garage) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createObjectNoOffset)**
---
---@param modelId Model
---@param atX number
---@param atY number
---@param atZ number
---@return Object object
function createObjectNoOffset(modelId, atX, atY, atZ) end

---@param ped Ped
---@return boolean result
function isCharStopped(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchWidescreen)**
---
---@param enable boolean
function switchWidescreen(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addSpriteBlipForContactPoint)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param icon number
---@return Marker marker
function addSpriteBlipForContactPoint(atX, atY, atZ, icon) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addSpriteBlipForCoord)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param type number
---@return Marker marker
function addSpriteBlipForCoord(atX, atY, atZ, type) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharOnlyDamagedByPlayer)**
---
---@param ped Ped
---@param enabled boolean
function setCharOnlyDamagedByPlayer(ped, enabled) end

---@param car Vehicle
---@param enabled boolean
function setCarOnlyDamagedByPlayer(car, enabled) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharProofs)**
---
---@param ped Ped
---@param BP boolean
---@param FP boolean
---@param EP boolean
---@param CP boolean
---@param MP boolean
function setCharProofs(ped, BP, FP, EP, CP, MP) end

---@param car Vehicle
---@param BP boolean
---@param FP boolean
---@param EP boolean
---@param CP boolean
---@param MP boolean
function setCarProofs(car, BP, FP, EP, CP, MP) end

---@param car Vehicle
function removeStuckCarCheck(car) end

---@param car Vehicle
---@return boolean result
function isCarInWater(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getClosestCharNode)**
---
---@param closestToX number
---@param closestToY number
---@param closestToZ number
---@return number nodeX
---@return number nodeY
---@return number nodeZ
function getClosestCharNode(closestToX, closestToY, closestToZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getClosestCarNode)**
---
---@param closestToX number
---@param closestToY number
---@param closestToZ number
---@return number nodeX
---@return number nodeY
---@return number nodeZ
function getClosestCarNode(closestToX, closestToY, closestToZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesAccurate)**
---
---@param car Vehicle
---@param toX number
---@param toY number
---@param toZ number
function carGotoCoordinatesAccurate(car, toX, toY, toZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarOnScreen)**
---
---@param car Vehicle
---@return boolean result
function isCarOnScreen(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharOnScreen)**
---
---@param ped Ped
---@return boolean result
function isCharOnScreen(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectOnScreen)**
---
---@param object Object
---@return boolean result
function isObjectOnScreen(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getGroundZFor3dCoord)**
---
---@param atX number
---@param atY number
---@param atZ number
---@return number z
function getGroundZFor3dCoord(atX, atY, atZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/startScriptFire)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param propagation number
---@param size number
---@return number fire
function startScriptFire(atX, atY, atZ, propagation, size) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isScriptFireExtinguished)**
---
---@param fire number
---@return boolean result
function isScriptFireExtinguished(fire) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeScriptFire)**
---
---@param fire number
function removeScriptFire(fire) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/boatGotoCoords)**
---
---@param boat Vehicle
---@param toX number
---@param toY number
---@param toZ number
function boatGotoCoords(boat, toX, toY, toZ) end

---@param int1 number
function noSpecialCameraForThisGarage(int1) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharShootingInArea)**
---
---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param weapon number
---@return boolean result
function isCharShootingInArea(ped, cornerAX, cornerAY, cornerBX, cornerBY, weapon) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCurrentCharWeapon)**
---
---@param ped Ped
---@param weapon number
---@return boolean result
function isCurrentCharWeapon(ped, weapon) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setBoatCruiseSpeed)**
---
---@param boat Vehicle
---@param speed number
function setBoatCruiseSpeed(boat, speed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCharInZone)**
---
---@param zone GxtString
---@param pedtype boolean
---@param gang boolean
---@param criminal_prostitute boolean
---@return Ped ped
function getRandomCharInZone(zone, pedtype, gang, criminal_prostitute) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharShooting)**
---
---@param ped Ped
---@return boolean result
function isCharShooting(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createMoneyPickup)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param cash number
---@param permanenceFlag boolean
---@return Pickup pickup
function createMoneyPickup(atX, atY, atZ, cash, permanenceFlag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharAccuracy)**
---
---@param ped Ped
---@param accuracy number
function setCharAccuracy(ped, accuracy) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarSpeed)**
---
---@param car Vehicle
---@return number speed
function getCarSpeed(car) end

---@param hudComponent number
function flashHudObject(hudComponent) end

---@param int1 boolean
function setGenerateCarsAroundCamera(int1) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCutsceneAnim)**
---
---@param cutscene number
---@param anim GxtString
function setCutsceneAnim(cutscene, anim) end

---@param car Vehicle
---@param disableFlippedExplosion boolean
function setUpsidedownCarNotDamaged(car, disableFlippedExplosion) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCutsceneTime)**
---
---@return number time
function getCutsceneTime() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCutsceneFinished)**
---
---@return boolean result
function hasCutsceneFinished() end

---@param car Vehicle
---@return number primaryColor
---@return number secondaryColor
function getCarColours(car) end

---@param enable boolean
function setAllCarsCanBeDamaged(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCollectable1Total)**
---
---@param total number
function setCollectable1Total(total) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isProjectileInArea)**
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@return boolean result
function isProjectileInArea(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---@param ped Ped
---@param modelId Model
---@return boolean result
function isCharModel(ped, modelId) end

---@param object Object
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@return number X
---@return number Y
---@return number Z
function getOffsetFromObjectInWorldCoords(object, offsetX, offsetY, offsetZ) end

---@param car Vehicle
---@return number forwardX
function getCarForwardX(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarForwardY)**
---
---@param car Vehicle
---@return number forwardY
function getCarForwardY(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/changeGarageType)**
---
---@param garage GxtString
---@param type number
function changeGarageType(garage, type) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printWith2NumbersNow)**
---
---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param time number
---@param flag number
function printWith2NumbersNow(gxtString, numbers1, numbers2, time, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printWith3Numbers)**
---
---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param numbers3 number
---@param time number
---@param flag number
function printWith3Numbers(gxtString, numbers1, numbers2, numbers3, time, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printWith4Numbers)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printWith4NumbersNow)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printWith6Numbers)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/playerMadeProgress)**
---
---@param progress number
function playerMadeProgress(progress) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setProgressTotal)**
---
---@param maxProgress number
function setProgressTotal(maxProgress) end

---@param meters number
---@return number feet
function convertMetresToFeet(meters) end

---@param car Vehicle
---@param avoidLevelTransitions boolean
function setCarAvoidLevelTransitions(car, avoidLevelTransitions) end

---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function clearAreaOfChars(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCharBeenDamagedByWeapon)**
---
---@param ped Ped
---@param weapon number
---@return boolean result
function hasCharBeenDamagedByWeapon(ped, weapon) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByWeapon)**
---
---@param car Vehicle
---@param weapon number
---@return boolean result
function hasCarBeenDamagedByWeapon(car, weapon) end

---@param ped Ped
---@param car Vehicle
---@param passengerSeat number
function warpCharIntoCarAsPassenger(ped, car, passengerSeat) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/anchorBoat)**
---
---@param boat Vehicle
---@param anchor boolean
function anchorBoat(boat, anchor) end

---@param car Vehicle
---@return number fire
function startCarFire(car) end

---@param ped Ped
---@return number fire
function startCharFire(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInArea)**
---
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param modelId Model
---@return Vehicle car
function getRandomCarOfTypeInArea(cornerAX, cornerAY, cornerBX, cornerBY, modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasResprayHappened)**
---
---@param car Vehicle
---@return boolean result
function hasResprayHappened(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCameraZoom)**
---
---@param mode number
function setCameraZoom(mode) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createPickupWithAmmo)**
---
---@param modelId Model
---@param type number
---@param ammo number
---@param atX number
---@param atY number
---@param atZ number
---@return Pickup pickup
function createPickupWithAmmo(modelId, type, ammo, atX, atY, atZ) end

---@param enable boolean
function setMusicDoesFade(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerNeverGetsTired)**
---
---@param player Player
---@param infiniteRun boolean
function setPlayerNeverGetsTired(player, infiniteRun) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerFastReload)**
---
---@param player Player
---@param fastReload boolean
function setPlayerFastReload(player, fastReload) end

---@param ped Ped
---@param bleeding boolean
function setCharBleeding(ped, bleeding) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setFreeResprays)**
---
---@param enable boolean
function setFreeResprays(enable) end

---@param ped Ped
---@param visible boolean
function setCharVisible(ped, visible) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarVisible)**
---
---@param car Vehicle
---@param visible boolean
function setCarVisible(car, visible) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isAreaOccupied)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayText)**
---
---@param posX number
---@param posY number
---@param gxtString GxtString
function displayText(posX, posY, gxtString) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextScale)**
---
---@param sizeX number
---@param sizeY number
function setTextScale(sizeX, sizeY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextColour)**
---
---@param r number
---@param g number
---@param b number
---@param a number
function setTextColour(r, g, b, a) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextJustify)**
---
---@param alignJustify boolean
function setTextJustify(alignJustify) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextCentre)**
---
---@param centered boolean
function setTextCentre(centered) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextWrapx)**
---
---@param linewidth number
function setTextWrapx(linewidth) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextCentreSize)**
---
---@param linewidth number
function setTextCentreSize(linewidth) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextBackground)**
---
---@param background boolean
function setTextBackground(background) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextProportional)**
---
---@param proportional boolean
function setTextProportional(proportional) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextFont)**
---
---@param font number
function setTextFont(font) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/rotateObject)**
---
---@param object Object
---@param fromAngle number
---@param toAngle number
---@param flag boolean
---@return boolean result
function rotateObject(object, fromAngle, toAngle, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/slideObject)**
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

---@param ped Ped
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param position number
---@param shootingAngleLimit number
---@param weapon number
function attachCharToCar(ped, car, offsetX, offsetY, offsetZ, position, shootingAngleLimit, weapon) end

---@param ped Ped
---@param enabled boolean
function setCharStayInSamePlace(ped, enabled) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isExplosionInArea)**
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

---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
function placeObjectRelativeToCar(object, car, offsetX, offsetY, offsetZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/makeObjectTargettable)**
---
---@param object Object
---@param targetable boolean
function makeObjectTargettable(object, targetable) end

---@param ped Ped
---@param points number
function addArmourToChar(ped, points) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/openGarage)**
---
---@param garage GxtString
function openGarage(garage) end

---@param car Vehicle
function clearCarLastWeaponDamage(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/warpCharFromCarToCoord)**
---
---@param ped Ped
---@param placeAtX number
---@param placeAtY number
---@param placeAtZ number
function warpCharFromCarToCoord(ped, placeAtX, placeAtY, placeAtZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setVisibilityOfClosestObjectOfType)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@param modelId Model
---@param visibility boolean
function setVisibilityOfClosestObjectOfType(atX, atY, atZ, radius, modelId, visibility) end

---@param ped Ped
---@param ped2 Ped
---@return boolean result
function hasCharSpottedChar(ped, ped2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasObjectBeenDamaged)**
---
---@param object Object
---@return boolean result
function hasObjectBeenDamaged(object) end

---@param ped Ped
---@param car Vehicle
function warpCharIntoCar(ped, car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printWith2NumbersBig)**
---
---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param time number
---@param style number
function printWith2NumbersBig(gxtString, numbers1, numbers2, time, style) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCameraBehindPlayer)**
---
function setCameraBehindPlayer() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createRandomChar)**
---
---@param atX number
---@param atY number
---@param atZ number
---@return Ped ped
function createRandomChar(atX, atY, atZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isSniperBulletInArea)**
---
---@param float1 number
---@param float2 number
---@param float3 number
---@param float4 number
---@param float5 number
---@param float6 number
---@return boolean result
function isSniperBulletInArea(float1, float2, float3, float4, float5, float6) end

---@param ped Ped
---@param object Object
---@param velocityInDirectionX number
---@param velocityInDirectionY number
---@param velocityInDirectionZ number
function setObjectVelocity(object, velocityInDirectionX, velocityInDirectionY, velocityInDirectionZ) end

---@param ped Ped
---@param object Object
---@param collision boolean
function setObjectCollision(object, collision) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printStringInStringNow)**
---
---@param gxtString GxtString
---@param string GxtString
---@param time1 number
---@param time2 number
function printStringInStringNow(gxtString, string, time1, time2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPointObscuredByAMissionEntity)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadAllModelsNow)**
---
function loadAllModelsNow() end

---@param ped Ped
---@param object Object
---@param velocityX number
---@param velocityY number
---@param velocityZ number
function addToObjectVelocity(object, velocityX, velocityY, velocityZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/drawSprite)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/drawRect)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadSprite)**
---
---@param name string
---@return number id
function loadSprite(name) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadTextureDictionary)**
---
---@param txd string
---@return boolean result
function loadTextureDictionary(txd) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeTextureDictionary)**
---
function removeTextureDictionary() end

---@param ped Ped
---@param object Object
---@param moveable boolean
function setObjectDynamic(object, moveable) end

---@param ped Ped
---@param animation string
---@param speed number
function setCharAnimSpeed(ped, animation, speed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/playMissionPassedTune)**
---
---@param music number
function playMissionPassedTune(music) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearArea)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@param area boolean
function clearArea(atX, atY, atZ, radius, area) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/freezeOnscreenTimer)**
---
---@param timer boolean
function freezeOnscreenTimer(timer) end

---@param car Vehicle
---@param siren boolean
function switchCarSiren(car, siren) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarWatertight)**
---
---@param car Vehicle
---@param watertight boolean
function setCarWatertight(car, watertight) end

---@param ped Ped
---@param locked boolean
function setCharCantBeDraggedOut(ped, locked) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/turnCarToFaceCoord)**
---
---@param car Vehicle
---@param coordX number
---@param coordY number
function turnCarToFaceCoord(car, coordX, coordY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/drawSphere)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
function drawSphere(atX, atY, atZ, radius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarStatus)**
---
---@param car Vehicle
---@param action number
function setCarStatus(car, action) end

---@param ped Ped
---@return boolean result
function isCharMale(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/policeRadioMessage)**
---
---@param float1 number
---@param float2 number
---@param float3 number
function policeRadioMessage(float1, float2, float3) end

---@param car Vehicle
---@param strong boolean
function setCarStrong(car, strong) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchRubbish)**
---
---@param int1 boolean
function switchRubbish(int1) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchStreaming)**
---
---@param streaming boolean
function switchStreaming(streaming) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isGarageOpen)**
---
---@param garage GxtString
---@return boolean result
function isGarageOpen(garage) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isGarageClosed)**
---
---@param garage GxtString
---@return boolean result
function isGarageClosed(garage) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/swapNearestBuildingModel)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@param from Model
---@param to Model
function swapNearestBuildingModel(atX, atY, atZ, radius, from, to) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchWorldProcessing)**
---
---@param cutsceneOnly boolean
function switchWorldProcessing(cutsceneOnly) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearAreaOfCars)**
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function clearAreaOfCars(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addSphere)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@return number sphere
function addSphere(atX, atY, atZ, radius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeSphere)**
---
---@param sphere number
function removeSphere(sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setEveryoneIgnorePlayer)**
---
---@param player Player
---@param ignored boolean
function setEveryoneIgnorePlayer(player, ignored) end

---@param int1 number
function clearObjectPath(int1) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayOnscreenTimerWithString)**
---
---@param timer VarId
---@param type number
---@param gxtString GxtString
function displayOnscreenTimerWithString(timer, type, gxtString) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayOnscreenCounterWithString)**
---
---@param var VarId
---@param type boolean
---@param gxtString GxtString
function displayOnscreenCounterWithString(var, type, gxtString) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createRandomCarForCarPark)**
---
---@param coordsX number
---@param coordsY number
---@param coordsZ number
---@param zAngle number
function createRandomCarForCarPark(coordsX, coordsY, coordsZ, zAngle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setWantedMultiplier)**
---
---@param sensitivity number
function setWantedMultiplier(sensitivity) end

---@param ped Ped
---@return boolean result
function isCharInAnyHeli(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarVisiblyDamaged)**
---
---@param car Vehicle
---@return boolean result
function isCarVisiblyDamaged(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doesObjectExist)**
---
---@param object Object
---@return boolean result
function doesObjectExist(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadScene)**
---
---@param atX number
---@param atY number
---@param atZ number
function loadScene(atX, atY, atZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addStuckCarCheck)**
---
---@param car Vehicle
---@param stuckCheckDistance number
---@param time number
function addStuckCarCheck(car, stuckCheckDistance, time) end

---@param car Vehicle
---@param speed number
function setCarForwardSpeed(car, speed) end

---@param interior number
function setInteriorVisible(interior) end

---@param car Vehicle
---@return boolean result
function isCarStuck(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadMissionAudio)**
---
---@param asId number
---@param name number
function loadMissionAudio(asId, name) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasMissionAudioLoaded)**
---
---@param id number
---@return boolean result
function hasMissionAudioLoaded(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/playMissionAudio)**
---
---@param id number
function playMissionAudio(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasMissionAudioFinished)**
---
---@param id number
---@return boolean result
function hasMissionAudioFinished(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getClosestCarNodeWithHeading)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasImportGarageSlotBeenFilled)**
---
---@param int1 number
---@param int2 number
---@return boolean result
function hasImportGarageSlotBeenFilled(int1, int2) end

---@param int1 boolean
function switchSecurityCamera(int1) end

---@param ped Ped
---@return boolean result
function isCharInFlyingVehicle(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMissionAudioPosition)**
---
---@param id number
---@param locationX number
---@param locationY number
---@param locationZ number
function setMissionAudioPosition(id, locationX, locationY, locationZ) end

---@param heli Vehicle
---@param angle number
function setHeliOrientation(heli, angle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasSaveGameFinished)**
---
---@return boolean result
function hasSaveGameFinished() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/noSpecialCameraForThisGarage)**
---
---@param int1 number
function noSpecialCameraForThisGarage(int1) end

---@param X number
---@param Y number
---@param Z number
---@param type number
---@return number X
---@return number Y
---@return number Z
function getNthClosestCarNode(X, Y, Z, type) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPedDensityMultiplier)**
---
---@param multiplier number
function setPedDensityMultiplier(multiplier) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextDrawBeforeFade)**
---
---@param int1 boolean
function setTextDrawBeforeFade(int1) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCollectable1sCollected)**
---
---@return number collected
function getCollectable1sCollected() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setSpritesDrawBeforeFade)**
---
---@param antialiased boolean
function setSpritesDrawBeforeFade(antialiased) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextRightJustify)**
---
---@param alignRight boolean
function setTextRightJustify(alignRight) end

---@param object Object
---@return boolean result
function hasObjectCollidedWithAnything(object) end

function removeRcBuggy() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/flashHudObject)**
---
---@param hudComponent number
function flashHudObject(hudComponent) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGenerateCarsAroundCamera)**
---
---@param int1 boolean
function setGenerateCarsAroundCamera(int1) end

---@param car Vehicle
---@param radius number
function setCarStraightLineDistance(car, radius) end

---@param car Vehicle
---@param disableFlippedExplosion boolean
function setUpsidedownCarNotDamaged(car, disableFlippedExplosion) end

---@param player Player
---@return boolean result
function isPlayerControllable(player) end

---@param player Player
---@param flag number
---@param time number
function setPlayerMood(player, flag, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarColours)**
---
---@param car Vehicle
---@return number primaryColor
---@return number secondaryColor
function getCarColours(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setAllCarsCanBeDamaged)**
---
---@param enable boolean
function setAllCarsCanBeDamaged(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarCanBeDamaged)**
---
---@param car Vehicle
---@param enable boolean
function setCarCanBeDamaged(car, enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setDrunkInputDelay)**
---
---@param player Player
---@param handlingResponsiveness number
function setDrunkInputDelay(player, handlingResponsiveness) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharMoney)**
---
---@param ped Ped
---@param money number
function setCharMoney(ped, money) end

---@param object Object
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@return number X
---@return number Y
---@return number Z
function getOffsetFromObjectInWorldCoords(object, offsetX, offsetY, offsetZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getOffsetFromCarInWorldCoords)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearMissionAudio)**
---
---@param id number
function clearMissionAudio(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setFreeHealthCare)**
---
---@param player Player
---@param free boolean
function setFreeHealthCare(player, free) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadAndLaunchMissionInternal)**
---
---@param mission number
function loadAndLaunchMissionInternal(mission) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectDrawLast)**
---
---@param object Object
---@param drawLast boolean
function setObjectDrawLast(object, drawLast) end

---@param ped Ped
---@param number number
---@return number ammo
function getAmmoInCharWeapon(ped, number) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setNearClip)**
---
---@param clip number
function setNearClip(clip) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setRadioChannel)**
---
---@param radioStation number
function setRadioChannel(radioStation) end

---@param car Vehicle
---@param traction number
function setCarTraction(car, traction) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/areMeasurementsInMetres)**
---
---@return boolean result
function areMeasurementsInMetres() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/convertMetresToFeet)**
---
---@param meters number
---@return number feet
function convertMetresToFeet(meters) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarAvoidLevelTransitions)**
---
---@param car Vehicle
---@param avoidLevelTransitions boolean
function setCarAvoidLevelTransitions(car, avoidLevelTransitions) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearAreaOfChars)**
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function clearAreaOfChars(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTotalNumberOfMissions)**
---
---@param totalMissions number
function setTotalNumberOfMissions(totalMissions) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/convertMetresToFeetInt)**
---
---@param metric number
---@return number imperial
function convertMetresToFeetInt(metric) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/registerFastestTime)**
---
---@param stat number
---@param to number
function registerFastestTime(stat, to) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/registerHighestScore)**
---
---@param int1 number
---@param int2 number
function registerHighestScore(int1, int2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/warpCharIntoCarAsPassenger)**
---
---@param ped Ped
---@param car Vehicle
---@param passengerSeat number
function warpCharIntoCarAsPassenger(ped, car, passengerSeat) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarPassengerSeatFree)**
---
---@param car Vehicle
---@param seat number
---@return boolean result
function isCarPassengerSeatFree(car, seat) end

---@param car Vehicle
---@param seat number
---@return Ped ped
function getCharInCarPassengerSeat(car, seat) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharIsChrisCriminal)**
---
---@param ped Ped
---@param flag boolean
function setCharIsChrisCriminal(ped, flag) end

---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@return number distance
function getDistanceBetweenCoords3d(x1, y1, z1, x2, y2, z2) end

---@param object Object
---@param car Vehicle
function sortOutObjectCollisionWithCar(object, car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/areCreditsFinished)**
---
---@return boolean result
function areCreditsFinished() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMusicDoesFade)**
---
---@param enable boolean
function setMusicDoesFade(enable) end

---@param text GxtString
---@param number number
function printHelpForeverWithNumber(text, number) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/areAnyCarCheatsActivated)**
---
---@return boolean result
function areAnyCarCheatsActivated() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharSuffersCriticalHits)**
---
---@param ped Ped
---@param enable boolean
function setCharSuffersCriticalHits(ped, enable) end

---@param car Vehicle
---@return boolean result
function isCharSittingInCar(ped, car) end

---@param ped Ped
---@return boolean result
function isCharSittingInAnyCar(ped) end

---@param ped Ped
---@return boolean result
function isCharOnFoot(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadSplashScreen)**
---
---@param gxtString GxtString
function loadSplashScreen(gxtString) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setJamesCarOnPathToPlayer)**
---
---@param int1 number
function setJamesCarOnPathToPlayer(int1) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectRotation)**
---
---@param object Object
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function setObjectRotation(object, rotationX, rotationY, rotationZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getDebugCameraCoordinates)**
---
---@return number X
---@return number Y
---@return number Z
function getDebugCameraCoordinates() end

---@param ped Ped
---@return boolean result
function isPlayerTargettingChar(player, ped) end

---@param player Player
---@param object Object
---@return boolean result
function isPlayerTargettingObject(player, object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayTextWithNumber)**
---
---@param x number
---@param y number
---@param gxtString GxtString
---@param number number
function displayTextWithNumber(x, y, gxtString, number) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayTextWith2Numbers)**
---
---@param x number
---@param y number
---@param gxtString GxtString
---@param numbersX number
---@param numbersY number
function displayTextWith2Numbers(x, y, gxtString, numbersX, numbersY) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param modelId Model
---@return Vehicle car
function getRandomCarOfTypeInAreaNoSave(x1, y1, x2, y2, modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setInterpolationParameters)**
---
---@param delay number
---@param time number
function setInterpolationParameters(delay, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getDebugCameraPointAt)**
---
---@return number X
---@return number Y
---@return number Z
function getDebugCameraPointAt() end

---@param ped Ped
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param position number
---@param shootingAngleLimit number
---@param weapon number
function attachCharToCar(ped, car, offsetX, offsetY, offsetZ, position, shootingAngleLimit, weapon) end

---@param ped Ped
---@param can boolean
function setCharCanBeShotInVehicle(ped, can) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarStayInFastLane)**
---
---@param car Vehicle
---@param flag boolean
function setCarStayInFastLane(car, flag) end

---@param ped Ped
function clearCharLastDamageEntity(ped) end

---@param car Vehicle
function clearCarLastDamageEntity(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCopInArea)**
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

---@param car Vehicle
---@return Ped ped
function createRandomCharAsDriver(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumberOfFollowers)**
---
---@param ped Ped
---@return number followers
function getNumberOfFollowers(ped) end

---@param player Player
---@param atX number
---@param atY number
---@param atZ number
---@param angle number
---@param RCModel Model
function giveRemoteControlledModelToPlayer(player, atX, atY, atZ, angle, RCModel) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCurrentCharWeapon)**
---
---@param ped Ped
---@return number weapon
function getCurrentCharWeapon(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansObject2d)**
---
---@param ped Ped
---@param object Object
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansObject2d(ped, object, radiusX, radiusY, sphere) end

---@param object Object
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharOnFootObject2d(ped, object, radiusX, radiusY, sphere) end

---@param ped Ped
---@param object Object
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharInCarObject2d(ped, object, radiusX, radiusY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateCharAnyMeansObject3d)**
---
---@param ped Ped
---@param object Object
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansObject3d(ped, object, radiusX, radiusY, radiusZ, sphere) end

---@param ped Ped
---@param object Object
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharOnFootObject3d(ped, object, radiusX, radiusY, radiusZ, sphere) end

---@param ped Ped
---@param object Object
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param sphere boolean
---@return boolean result
function locateCharInCarObject3d(ped, object, radiusX, radiusY, radiusZ, sphere) end

---@param car Vehicle
---@param action number
---@param time number
function setCarTempAction(car, action, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharOnAnyBike)**
---
---@param ped Ped
---@return boolean result
function isCharOnAnyBike(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/canCharSeeDeadChar)**
---
---@param ped Ped
---@param pedtype number
---@return boolean result
function canCharSeeDeadChar(ped, pedtype) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setEnterCarRangeMultiplier)**
---
---@param float1 number
function setEnterCarRangeMultiplier(float1) end

---@param ped Ped
---@param keep boolean
function freezeCharPositionAndDontLoadCollision(ped, keep) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPcVersion)**
---
---@return boolean result
function isPcVersion() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isModelAvailable)**
---
---@param modelId Model
---@return boolean result
function isModelAvailable(modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/shutCharUp)**
---
---@param ped Ped
---@param muted boolean
function shutCharUp(ped, muted) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setEnableRcDetonate)**
---
---@param detonation boolean
function setEnableRcDetonate(detonation) end

---@param car Vehicle
---@param routeSeed number
function setCarRandomRouteSeed(car, routeSeed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isAnyPickupAtCoords)**
---
---@param pickupX number
---@param pickupY number
---@param pickupZ number
---@return boolean result
function isAnyPickupAtCoords(pickupX, pickupY, pickupZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeAllCharWeapons)**
---
---@param ped Ped
function removeAllCharWeapons(ped) end

---@param ped Ped
---@param weapon number
---@return boolean result
function hasCharGotWeapon(ped, weapon) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTankDetonateCars)**
---
---@param tank number
---@param detonate boolean
function setTankDetonateCars(tank, detonate) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPositionOfAnalogueSticks)**
---
---@param joystick number
---@return number offset1
---@return number offset2
---@return number offset3
---@return number offset4
function getPositionOfAnalogueSticks(joystick) end

---@param car Vehicle
---@return boolean result
function isCarOnFire(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarTireBurst)**
---
---@param car Vehicle
---@param tire number
---@return boolean result
function isCarTireBurst(car, tire) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/initialiseObjectPath)**
---
---@param int1 number
---@param float2 number
function initialiseObjectPath(int1, float2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectPathSpeed)**
---
---@param int1 number
---@param int2 number
function setObjectPathSpeed(int1, int2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectPathPosition)**
---
---@param int1 number
---@param float2 number
function setObjectPathPosition(int1, float2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearObjectPath)**
---
---@param int1 number
function clearObjectPath(int1) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/heliGotoCoords)**
---
---@param heli Vehicle
---@param toX number
---@param toY number
---@param toZ number
---@param altitudeMin number
---@param altitudeMax number
function heliGotoCoords(heli, toX, toY, toZ, altitudeMin, altitudeMax) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getDeadCharPickupCoords)**
---
---@param ped Ped
---@return number coordsX
---@return number coordsY
---@return number coordsZ
function getDeadCharPickupCoords(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createProtectionPickup)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param int4 number
---@param int5 number
---@return Pickup pickup
function createProtectionPickup(atX, atY, atZ, int4, int5) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnyBoat)**
---
---@param ped Ped
---@return boolean result
function isCharInAnyBoat(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnyHeli)**
---
---@param ped Ped
---@return boolean result
function isCharInAnyHeli(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnyPlane)**
---
---@param ped Ped
---@return boolean result
function isCharInAnyPlane(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInWater)**
---
---@param ped Ped
---@return boolean result
function isCharInWater(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharWeaponInSlot)**
---
---@param ped Ped
---@param slot number
---@return number weapon
---@return number ammo
---@return Model modelId
function getCharWeaponInSlot(ped, slot) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getClosestStraightRoad)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarForwardSpeed)**
---
---@param car Vehicle
---@param speed number
function setCarForwardSpeed(car, speed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setInteriorVisible)**
---
---@param interior number
function setInteriorVisible(interior) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/markCarAsConvoyCar)**
---
---@param car Vehicle
---@param convoy boolean
function markCarAsConvoyCar(car, convoy) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/resetHavocCausedByPlayer)**
---
---@param int1 number
function resetHavocCausedByPlayer(int1) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getHavocCausedByPlayer)**
---
---@param int1 number
---@return number int2
function getHavocCausedByPlayer(int1) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createScriptRoadblock)**
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@param type number
function createScriptRoadblock(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, type) end

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

---@param ped Ped
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@return number X
---@return number Y
---@return number Z
function getOffsetFromCharInWorldCoords(ped, offsetX, offsetY, offsetZ) end

---@param ped Ped
---@return boolean result
function hasCharBeenPhotographed(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchSecurityCamera)**
---
---@param int1 boolean
function switchSecurityCamera(int1) end

---@param ped Ped
---@return boolean result
function isCharInFlyingVehicle(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addShortRangeSpriteBlipForCoord)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param icon number
---@return Marker marker
function addShortRangeSpriteBlipForCoord(atX, atY, atZ, icon) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeliOrientation)**
---
---@param heli Vehicle
---@param angle number
function setHeliOrientation(heli, angle) end

---@param ped Ped
---@param timeMS number
function taskTired(ped, timeMS) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/planeGotoCoords)**
---
---@param plane number
---@param X number
---@param Y number
---@param Z number
---@param z1 number
---@param z2 number
function planeGotoCoords(plane, X, Y, Z, z1, z2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNthClosestCarNode)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/drawWeaponshopCorona)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setEnableRcDetonateOnContact)**
---
---@param enable boolean
function setEnableRcDetonateOnContact(enable) end

---@param ped Ped
---@param locked boolean
function freezeCharPosition(ped, locked) end

---@param ped Ped
---@param drowns boolean
function setCharDrownsInWater(ped, drowns) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectRecordsCollisions)**
---
---@param object Object
---@param set boolean
function setObjectRecordsCollisions(object, set) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasObjectCollidedWithAnything)**
---
---@param object Object
---@return boolean result
function hasObjectCollidedWithAnything(object) end

---@param ped Ped
function taskUseAtm(ped) end

---@param ped Ped
---@return number armour
function getCharArmour(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeliStabiliser)**
---
---@param heli Vehicle
---@param limiter boolean
function setHeliStabiliser(heli, limiter) end

---@param ped Ped
---@param car Vehicle
---@param radius number
function setCarStraightLineDistance(car, radius) end

---@param ped Ped
---@param car Vehicle
---@param timeMS number
function taskEnterCarAsDriver(ped, car, timeMS) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/shutPlayerUp)**
---
---@param player Player
---@param shut boolean
function shutPlayerUp(player, shut) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerMood)**
---
---@param player Player
---@param flag number
---@param time number
function setPlayerMood(player, flag, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/requestCollision)**
---
---@param X number
---@param Y number
function requestCollision(X, Y) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateObject2d)**
---
---@param object Object
---@param X number
---@param Y number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateObject2d(object, X, Y, radiusX, radiusY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/locateObject3d)**
---
---@param object Object
---@param X number
---@param Y number
---@param Z number
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param flag boolean
---@return boolean result
function locateObject3d(object, X, Y, Z, radiusX, radiusY, radiusZ, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectInWater)**
---
---@param object Object
---@return boolean result
function isObjectInWater(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectInArea2d)**
---
---@param object Object
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isObjectInArea2d(object, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectInArea3d)**
---
---@param object Object
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@param flag boolean
---@return boolean result
function isObjectInArea3d(object, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, flag) end

---@param ped Ped
---@param crouch boolean
function taskToggleDuck(ped, crouch) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/requestAnimation)**
---
---@param animation string
function requestAnimation(animation) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasAnimationLoaded)**
---
---@param animation string
---@return boolean result
function hasAnimationLoaded(animation) end

---@param ped Ped
---@param fromX number
---@param fromY number
---@param fromZ number
---@param awayRadius number
---@param timelimit number
function taskFleePoint(ped, fromX, fromY, fromZ, awayRadius, timelimit) end

---@param ped Ped
---@return boolean result
function isCharWaitingForWorldCollision(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarWaitingForWorldCollision)**
---
---@param car Vehicle
---@return boolean result
function isCarWaitingForWorldCollision(car) end

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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayNthOnscreenCounterWithString)**
---
---@param text VarId
---@param type number
---@param line number
---@param gxtString GxtString
function displayNthOnscreenCounterWithString(text, type, line, gxtString) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addSetPiece)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setExtraColours)**
---
---@param color number
---@param fade boolean
function setExtraColours(color, fade) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearExtraColours)**
---
---@param fade boolean
function clearExtraColours(fade) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getWheelieStats)**
---
---@param player Player
---@return number twowheelstime
---@return number twowheelsdistance
---@return number wheelietime
---@return number wheelieDistance
---@return number stoppieTime
---@return number stoppieDistance
function getWheelieStats(player) end

---@param car Vehicle
---@param tire number
function burstCarTire(car, tire) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerWearing)**
---
---@param player Player
---@param bodypart string
---@param skin number
---@return boolean result
function isPlayerWearing(player, bodypart, skin) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerCanDoDriveBy)**
---
---@param player Player
---@param mode boolean
function setPlayerCanDoDriveBy(player, mode) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createSwatRope)**
---
---@param pedtype number
---@param modelId Model
---@param X number
---@param Y number
---@param Z number
---@return number handleAs
function createSwatRope(pedtype, modelId, X, Y, Z) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarModelComponents)**
---
---@param car Model
---@param variation1 number
---@param variation2 number
function setCarModelComponents(car, variation1, variation2) end

---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarFront(car, followCar) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords2d)**
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number distance
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getDistanceBetweenCoords3d)**
---
---@param x1 number координата X первой точки
---@param y1 number координата Y первой точки
---@param z1 number координата Z первой точки
---@param x2 number координата X второй точки
---@param y2 number координата Y второй точки
---@param z2 number координата Z второй точки
---@return number distance дистанция
function getDistanceBetweenCoords3d(x1, y1, z1, x2, y2, z2) end

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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getMaxWantedLevel)**
---
---@return number level
function getMaxWantedLevel() end

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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/printHelpForeverWithNumber)**
---
---@param text GxtString
---@param number number
function printHelpForeverWithNumber(text, number) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createLockedPropertyPickup)**
---
---@param pX number
---@param pY number
---@param pZ number
---@param gxtString GxtString
---@return Pickup pickup
function createLockedPropertyPickup(pX, pY, pZ, gxtString) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createForsalePropertyPickup)**
---
---@param pX number
---@param pY number
---@param pZ number
---@param price number
---@param gxtString GxtString
---@return Pickup pickup
function createForsalePropertyPickup(pX, pY, pZ, price, gxtString) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/freezeCarPosition)**
---
---@param car Vehicle
---@param locked boolean
function freezeCarPosition(car, locked) end

---@param ped Ped
---@param byActor Ped
---@return boolean result
function hasCharBeenDamagedByChar(ped, byActor) end

---@param ped Ped
---@param byCar Vehicle
---@return boolean result
function hasCharBeenDamagedByCar(ped, byCar) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByChar)**
---
---@param car Vehicle
---@param byActor Ped
---@return boolean result
function hasCarBeenDamagedByChar(car, byActor) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCarBeenDamagedByCar)**
---
---@param car Vehicle
---@param byCar Vehicle
---@return boolean result
function hasCarBeenDamagedByCar(car, byCar) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRadioChannel)**
---
---@return number radio
function getRadioChannel() end

---@param ped Ped
---@param stay boolean
function setCharStayInCarWhenJacked(ped, stay) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerDrunkenness)**
---
---@param player Player
---@param drunk number
function setPlayerDrunkenness(player, drunk) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInAreaNoSave)**
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param modelId Model
---@return Vehicle car
function getRandomCarOfTypeInAreaNoSave(x1, y1, x2, y2, modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCanBurstCarTires)**
---
---@param car Vehicle
---@param vulnerability boolean
function setCanBurstCarTires(car, vulnerability) end

function releasePathNodes() end

---@param type number
---@return number maker
function loadCharDecisionMaker(type) end

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

---@param ped Ped
---@param can boolean
function setCharCanBeShotInVehicle(ped, can) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadMissionText)**
---
---@param table GxtString
function loadMissionText(table) end

---@param ped Ped
---@param animation string
---@return boolean result
function isCharPlayingAnim(ped, animation) end

---@param ped Ped
---@param animation string
---@param flag boolean
function setCharAnimPlayingFlag(ped, animation, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/freezeObjectPosition)**
---
---@param object Object
---@param freeze boolean
function freezeObjectPosition(object, freeze) end

---@param ped Ped
---@param weapon number
function removeWeaponFromChar(ped, weapon) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/makePlayerFireProof)**
---
---@param player Player
---@param fireproof boolean
function makePlayerFireProof(player, fireproof) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/increasePlayerMaxHealth)**
---
---@param player Player
---@param increase number
function increasePlayerMaxHealth(player, increase) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/increasePlayerMaxArmour)**
---
---@param player Player
---@param increase number
function increasePlayerMaxArmour(player, increase) end

---@param ped Ped
---@param enable boolean
function setCharCollision(ped, enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createRandomCharAsPassenger)**
---
---@param car Vehicle
---@param seat number
---@return Ped ped
function createRandomCharAsPassenger(car, seat) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/ensurePlayerHasDriveByWeapon)**
---
---@param player Player
---@param ammo number
function ensurePlayerHasDriveByWeapon(player, ammo) end

---@param originX number
---@param originY number
---@param originZ number
---@param zAngle number
---@param unknownAngle number
---@param taskSequence number
---@return number handle
function addAttractor(originX, originY, originZ, zAngle, unknownAngle, taskSequence) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addExplosionNoSound)**
---
---@param pX number
---@param pY number
---@param pZ number
---@param type number
function addExplosionNoSound(pX, pY, pZ, type) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/linkObjectToInterior)**
---
---@param object Object
---@param interior number
function linkObjectToInterior(object, interior) end

---@param ped Ped
---@param untargetable boolean
function setCharNeverTargetted(ped, untargetable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/wasCutsceneSkipped)**
---
---@return boolean result
function wasCutsceneSkipped() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnyPoliceVehicle)**
---
---@param ped Ped
---@return boolean result
function isCharInAnyPoliceVehicle(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doesCharExist)**
---
---@param ped Ped
---@return boolean result
function doesCharExist(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doesVehicleExist)**
---
---@param car Vehicle
---@return boolean result
function doesVehicleExist(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addShortRangeSpriteBlipForContactPoint)**
---
---@param pX number
---@param pY number
---@param pZ number
---@param icon number
---@return Marker blip
function addShortRangeSpriteBlipForContactPoint(pX, pY, pZ, icon) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setAllTaxisHaveNitro)**
---
---@param toggle boolean
function setAllTaxisHaveNitro(toggle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/freezeCarPositionAndDontLoadCollision)**
---
---@param car Vehicle
---@param keep boolean
function freezeCarPositionAndDontLoadCollision(car, keep) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/freezeCharPositionAndDontLoadCollision)**
---
---@param ped Ped
---@param keep boolean
function freezeCharPositionAndDontLoadCollision(ped, keep) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerIsInStadium)**
---
---@param set boolean
function setPlayerIsInStadium(set) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayRadar)**
---
---@param enable boolean
function displayRadar(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/registerBestPosition)**
---
---@param stat number
---@param number number
function registerBestPosition(stat, number) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerInInfoZone)**
---
---@param player Player
---@param zone GxtString
---@return boolean result
function isPlayerInInfoZone(player, zone) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setLoadCollisionForCarFlag)**
---
---@param car Vehicle
---@param enable boolean
function setLoadCollisionForCarFlag(car, enable) end

---@param ped Ped
---@param enable boolean
function setLoadCollisionForCharFlag(ped, enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addBigGunFlash)**
---
---@param fromX number
---@param fromY number
---@param fromZ number
---@param toX number
---@param toY number
---@param toZ number
function addBigGunFlash(fromX, fromY, fromZ, toX, toY, toZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getProgressPercentage)**
---
---@return number progress
function getProgressPercentage() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleToFadeIn)**
---
---@param car Vehicle
---@param flag number
function setVehicleToFadeIn(car, flag) end

---@param ped Ped
---@param stay boolean
function taskStayInSamePlace(ped, stay) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerInShortcutTaxi)**
---
---@param player Player
---@return boolean result
function isPlayerInShortcutTaxi(player) end

---@param ped Ped
---@return boolean result
function isCharDucking(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setOnscreenCounterFlashWhenFirstDisplayed)**
---
---@param text VarId
---@param flashing boolean
function setOnscreenCounterFlashWhenFirstDisplayed(text, flashing) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/shuffleCardDecks)**
---
---@param shuffle boolean
function shuffleCardDecks(shuffle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/fetchNextCard)**
---
---@return number card
function fetchNextCard() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectVelocity)**
---
---@param object Object
---@return number vecX
---@return number vecY
---@return number vecZ
function getObjectVelocity(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isDebugCameraOn)**
---
---@return boolean result
function isDebugCameraOn() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addToObjectRotationVelocity)**
---
---@param object Object
---@param vecX number
---@param vecY number
---@param vecZ number
function addToObjectRotationVelocity(object, vecX, vecY, vecZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectRotationVelocity)**
---
---@param object Object
---@param vecX number
---@param vecY number
---@param vecZ number
function setObjectRotationVelocity(object, vecX, vecY, vecZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectStatic)**
---
---@param object Object
---@return boolean result
function isObjectStatic(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getAngleBetween2dVectors)**
---
---@param vecX number
---@param vecY number
---@param vecX2 number
---@param vecY2 number
---@return number angle
function getAngleBetween2dVectors(vecX, vecY, vecX2, vecY2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/do2dRectanglesCollide)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectRotationVelocity)**
---
---@param object Object
---@return number axisX
---@return number axisY
---@return number axisZ
function getObjectRotationVelocity(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addVelocityRelativeToObjectVelocity)**
---
---@param object Object
---@param vecX number
---@param vecY number
---@param vecZ number
function addVelocityRelativeToObjectVelocity(object, vecX, vecY, vecZ) end

---@param object Object
---@return number speed
function getObjectSpeed(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/get2dLinesIntersectPoint)**
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

---@param ped Ped
---@param timeMS number
function taskPause(ped, timeMS) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskStandStill)**
---
---@param ped Ped
---@param timeMS number
function taskStandStill(ped, timeMS) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFallAndGetUp)**
---
---@param ped Ped
---@param int2 boolean
---@param time number
function taskFallAndGetUp(ped, int2, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskJump)**
---
---@param ped Ped
---@param jump boolean
function taskJump(ped, jump) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskTired)**
---
---@param ped Ped
---@param timeMS number
function taskTired(ped, timeMS) end

---@param ped Ped
---@return Model modelId
function getCharModel(ped) end

---@param ped Ped
---@param lookAt number
---@param timeMS number
function taskLookAtChar(ped, lookAt, timeMS) end

---@param ped Ped
---@param lookAt number
---@param timeMS number
function taskLookAtVehicle(ped, lookAt, timeMS) end

---@param particle string
---@param ped Ped
---@param audio number
function taskSay(ped, audio) end

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

---@param particle string
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param type number
---@return Particle particle
function createFxSystemOnCar(particle, car, offsetX, offsetY, offsetZ, type) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskHandsUp)**
---
---@param ped Ped
---@param timeMS number
function taskHandsUp(ped, timeMS) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDuck)**
---
---@param ped Ped
---@param timeMS number
function taskDuck(ped, timeMS) end

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

---@param ped Ped
---@param car Vehicle
function taskDestroyCar(ped, car) end

---@param ped Ped
---@param timeMS number
function taskLookAbout(ped, timeMS) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskEnterCarAsPassenger)**
---
---@param ped Ped
---@param car Vehicle
---@param time number
---@param passengerSeat number
function taskEnterCarAsPassenger(ped, car, time, passengerSeat) end

---@param ped Ped
---@param car Vehicle
---@param timeMS number
function taskEnterCarAsDriver(ped, car, timeMS) end

---@param ped Ped
---@param withActor number
---@param flag boolean
---@param unknownFlag number
function taskChatWithChar(ped, withActor, flag, unknownFlag) end

---@param car Vehicle
---@param X number
---@param Y number
---@param Z number
function taskLeaveCarAndFlee(ped, car, X, Y, Z) end

---@param car Vehicle
---@param toX number
---@param toY number
---@param toZ number
---@param speed number
---@param int7 number
---@param model number
---@param int9 number
function taskCarDriveToCoord(ped, car, toX, toY, toZ, speed, int7, model, int9) end

---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param ped Ped
---@param hijackCar Vehicle
---@param searchRadius number
---@param trafficBehavior number
function taskCarDriveWander(ped, hijackCar, searchRadius, trafficBehavior) end

---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param mode number
---@param time number
function taskGoStraightToCoord(ped, toX, toY, toZ, mode, time) end

---@param ped Ped
---@param angle number
function taskAchieveHeading(ped, angle) end

---@param car Vehicle
---@param lights number
function forceCarLights(car, lights) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/extendRoute)**
---
---@param pointX number
---@param pointY number
---@param pointZ number
function extendRoute(pointX, pointY, pointZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFollowPointRoute)**
---
---@param ped Ped
---@param flags1 number
---@param flags2 number
function taskFollowPointRoute(ped, flags1, flags2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGotoChar)**
---
---@param ped Ped
---@param toActor Ped
---@param timelimit number
---@param stopWithinRadius number
function taskGotoChar(ped, toActor, timelimit, stopWithinRadius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFleePoint)**
---
---@param ped Ped
---@param fromX number
---@param fromY number
---@param fromZ number
---@param awayRadius number
---@param timelimit number
function taskFleePoint(ped, fromX, fromY, fromZ, awayRadius, timelimit) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFleeChar)**
---
---@param ped Ped
---@param fromActor Ped
---@param radius number
---@param timelimit number
function taskFleeChar(ped, fromActor, radius, timelimit) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskSmartFleePoint)**
---
---@param ped Ped
---@param fromX number
---@param fromY number
---@param fromZ number
---@param stopAtRadius number
---@param timelimit number
function taskSmartFleePoint(ped, fromX, fromY, fromZ, stopAtRadius, timelimit) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskSmartFleeChar)**
---
---@param ped Ped
---@param fromActor Ped
---@param originRadius number
---@param timelimit number
function taskSmartFleeChar(ped, fromActor, originRadius, timelimit) end

---@param ped Ped
function clearCharTasks(ped) end

---@param ped Ped
---@param unknownFlag1 boolean
---@param unknownFlag2 boolean
---@param unknownFlag3 boolean
function taskTogglePedThreatScanner(ped, unknownFlag1, unknownFlag2, unknownFlag3) end

---@param car Vehicle
---@param path number
function startPlaybackRecordedCar(car, path) end

---@param car Vehicle
---@param door number
function fixCarDoor(car, door) end

---@param car Vehicle
function taskEveryoneLeaveCar(car) end

---@param player Player
---@return boolean result
function isPlayerTargettingAnything(player) end

---@return number X
---@return number Y
---@return number Z
function getActiveCameraCoordinates() end

---@return number X
---@return number Y
---@return number Z
function getActiveCameraPointAt() end

---@param car Vehicle
---@param component number
---@param effectFlag boolean
function popCarPanel(car, component, effectFlag) end

---@param car Vehicle
---@param componentB number
function fixCarPanel(car, componentB) end

---@param car Vehicle
---@param tire number
function fixCarTire(car, tire) end

---@param object Object
---@param toObject number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function attachObjectToObject(object, toObject, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---@param object Object
---@param ped Ped
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function attachObjectToChar(object, ped, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---@param car Vehicle
---@return number vecX
---@return number vecY
---@return number vecZ
function getCarSpeedVector(car) end

---@param car Vehicle
---@return number mass
function getCarMass(car) end

---@param ped Ped
---@param pathX number
---@param pathY number
---@param pathZ number
---@param mode number
---@param time number
function taskFollowPathNodesToCoord(ped, pathX, pathY, pathZ, mode, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAngledArea2d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaOnFoot2d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaInCar2d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledArea2d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaOnFoot2d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaInCar2d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAngledArea3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaOnFoot3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAngledAreaInCar3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledArea3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaOnFoot3d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharStoppedInAngledAreaInCar3d)**
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

---@param searchlight Searchlight
---@param ped Ped
---@return boolean result
function isCharInTaxi(ped) end

---@param searchlight Searchlight
---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param mode number
---@param useCar Vehicle
function taskGoToCoordAnyMeans(ped, toX, toY, toZ, mode, useCar) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getHeadingFromVector2d)**
---
---@param pX number
---@param pY number
---@return number zAngle
function getHeadingFromVector2d(pX, pY) end

---@param ped Ped
---@param animation string
---@param IFP string
---@param framedelta number
---@param loop boolean
---@param lockX boolean
---@param lockY boolean
---@param lockF boolean
---@param time number
function taskPlayAnim(ped, animation, IFP, framedelta, loop, lockX, lockY, lockF, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadPathNodesInArea)**
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
function loadPathNodesInArea(x1, y1, x2, y2) end

---@param fromX number
---@param fromY number
---@param fromZ number
---@param targetX number
---@param targetY number
---@param targetZ number
---@param energy number
function fireSingleBullet(fromX, fromY, fromZ, targetX, targetY, targetZ, energy) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadCharDecisionMaker)**
---
---@param type number
---@return number maker
function loadCharDecisionMaker(type) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharDecisionMaker)**
---
---@param ped Ped
---@param maker number
function setCharDecisionMaker(ped, maker) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextDropshadow)**
---
---@param shadow number
---@param r number
---@param g number
---@param b number
---@param a number
function setTextDropshadow(shadow, r, g, b, a) end

---@param car Vehicle
---@return boolean result
function isPlaybackGoingOnForCar(car) end

---@param ped Ped
---@param accuracy number
function setSenseRange(ped, accuracy) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharPlayingAnim)**
---
---@param ped Ped
---@param animation string
---@return boolean result
function isCharPlayingAnim(ped, animation) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharAnimPlayingFlag)**
---
---@param ped Ped
---@param animation string
---@param flag boolean
function setCharAnimPlayingFlag(ped, animation, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharAnimCurrentTime)**
---
---@param ped Ped
---@param animation string
---@return number time
function getCharAnimCurrentTime(ped, animation) end

---@param ped Ped
---@param animation string
---@param time number
function setCharAnimCurrentTime(ped, animation, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/openSequenceTask)**
---
---@return number task
function openSequenceTask() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/closeSequenceTask)**
---
---@param task number
function closeSequenceTask(task) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/performSequenceTask)**
---
---@param ped Ped
---@param task number
function performSequenceTask(ped, task) end

---@param ped Ped
---@param enable boolean
function setCharCollision(ped, enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharAnimTotalTime)**
---
---@param ped Ped
---@param animation string
---@return number totalTime
function getCharAnimTotalTime(ped, animation) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearSequenceTask)**
---
---@param task number
function clearSequenceTask(task) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addAttractor)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearAttractor)**
---
---@param handle number
function clearAttractor(handle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createCharAtAttractor)**
---
---@param pedtype number
---@param modelId Model
---@param ASOrigin number
---@param task number
---@return Ped ped
function createCharAtAttractor(pedtype, modelId, ASOrigin, task) end

---@param type number
---@param atX number
---@param atY number
---@param atZ number
---@param direction boolean
---@return Vehicle train
function createMissionTrain(type, atX, atY, atZ, direction) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/incrementIntStat)**
---
---@param stat number
---@param add number
function incrementIntStat(stat, add) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/incrementFloatStat)**
---
---@param stat number
---@param add number
function incrementFloatStat(stat, add) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/decrementIntStat)**
---
---@param stat number
---@param number number
function decrementIntStat(stat, number) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/decrementFloatStat)**
---
---@param stat number
---@param number number
function decrementFloatStat(stat, number) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/registerIntStat)**
---
---@param stat number
---@param number number
function registerIntStat(stat, number) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/registerFloatStat)**
---
---@param stat number
---@param value number
function registerFloatStat(stat, value) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setIntStat)**
---
---@param stat number
---@param number number
function setIntStat(stat, number) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setFloatStat)**
---
---@param stat number
---@param number number
function setFloatStat(stat, number) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getScriptTaskStatus)**
---
---@param ped Ped
---@param task number
---@return number status
function getScriptTaskStatus(ped, task) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createGroup)**
---
---@param type number
---@return number group
function createGroup(type) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupLeader)**
---
---@param group number
---@param ped Ped
function setGroupLeader(group, ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupMember)**
---
---@param group number
---@param ped Ped
function setGroupMember(group, ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeGroup)**
---
---@param group number
function removeGroup(group) end

---@param ped Ped
---@param car Vehicle
---@param targetCar number
---@param order number
---@param maxSpeed number
---@param trafficFlag number
function taskCarMission(ped, car, targetCar, order, maxSpeed, trafficFlag) end

---@param ped Ped
---@param weapon number
---@param flags number
---@param time number
---@param chance number
function taskKillCharOnFootWhileDucking(ped, weapon, flags, time, chance) end

---@param ped Ped
---@param aimAt number
---@param timeMS number
function taskAimGunAtChar(ped, aimAt, timeMS) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGoToCoordWhileShooting)**
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

---@param ped Ped
---@param stay boolean
function taskStayInSamePlace(ped, stay) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskTurnCharToFaceChar)**
---
---@param ped Ped
---@param rotateTo number
function taskTurnCharToFaceChar(ped, rotateTo) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharAtScriptedAttractor)**
---
---@param ped Ped
---@param origin number
---@return boolean result
function isCharAtScriptedAttractor(ped, origin) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setSequenceToRepeat)**
---
---@param pack number
---@param loop boolean
function setSequenceToRepeat(pack, loop) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getSequenceProgress)**
---
---@param ped Ped
---@return number progess
function getSequenceProgress(ped) end

---@param component Model
function requestVehicleMod(component) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setFollowNodeThresholdDistance)**
---
---@param ped Ped
---@param dist number
function setFollowNodeThresholdDistance(ped, dist) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createFxSystem)**
---
---@param particle string
---@param pX number
---@param pY number
---@param pZ number
---@param type number
---@return Particle particle
function createFxSystem(particle, pX, pY, pZ, type) end

---@param car Vehicle
---@return number num
function getNumAvailablePaintjobs(car) end

---@param set number
---@param paintjob number
function giveVehiclePaintjob(set, paintjob) end

---@param ped Ped
---@param group number
---@return boolean result
function isGroupMember(ped, group) end

---@param ped Ped
---@param group number
---@return boolean result
function isGroupLeader(ped, group) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getIntStat)**
---
---@param stat number
---@return number stat
function getIntStat(stat) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getFloatStat)**
---
---@param stat number
---@return number stat
function getFloatStat(stat) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectRenderScorched)**
---
---@param object Object
---@param fireproof boolean
function setObjectRenderScorched(object, fireproof) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskLookAtObject)**
---
---@param ped Ped
---@param lookAt number
---@param timeMS number
function taskLookAtObject(ped, lookAt, timeMS) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/limitAngle)**
---
---@param angle number
---@return number number
function limitAngle(angle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/openCarDoor)**
---
---@param car Vehicle
---@param door number
function openCarDoor(car, door) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPickupCoordinates)**
---
---@param pickup Pickup
---@return number X
---@return number Y
---@return number Z
function getPickupCoordinates(pickup) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeDecisionMaker)**
---
---@param maker number
function removeDecisionMaker(maker) end

---
--- Возвращает ID скина по хэндлу персонажа.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharModel)**
---
---@param ped Ped хэндл персонажа
---@return Model modelId ID скина
function getCharModel(ped) end

---@param ped Ped
---@param atX number
---@param atY number
---@param atZ number
---@param timeMS number
function taskAimGunAtCoord(ped, atX, atY, atZ, timeMS) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskShootAtCoord)**
---
---@param ped Ped
---@param atX number
---@param atY number
---@param atZ number
---@param timeMS number
function taskShootAtCoord(ped, atX, atY, atZ, timeMS) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createFxSystemOnChar)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createFxSystemOnCharWithDirection)**
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

---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param type number
---@return Particle particle
function createFxSystemOnCar(particle, car, offsetX, offsetY, offsetZ, type) end

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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createFxSystemOnObject)**
---
---@param particle string
---@param object Object
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param type number
---@return Particle particle
function createFxSystemOnObject(particle, object, offsetX, offsetY, offsetZ, type) end

---@param maker number
---@param event number
function clearCharDecisionMakerEventResponse(maker, event) end

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

---@param ped Ped
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

---@param ped Ped
---@param object boolean
function dropObject(ped, object) end

---@param car Vehicle
function explodeCarInCutscene(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDiveAndGetUp)**
---
---@param ped Ped
---@param toOffsetX number
---@param toOffsetY number
---@param time number
function taskDiveAndGetUp(ped, toOffsetX, toOffsetY, time) end

---@param hydra number
---@param car Vehicle
---@param radius number
function planeAttackPlayer(hydra, car, radius) end

---@param plane number
---@param direction number
---@param altitudemin number
---@param altitudemax number
function planeFlyInDirection(plane, direction, altitudemin, altitudemax) end

---@param plane number
---@param ped Ped
---@param car Vehicle
---@param radius number
function planeFollowEntity(plane, ped, car, radius) end

---@param ped Ped
---@param withActor number
---@param flag boolean
---@param unknownFlag number
function taskChatWithChar(ped, withActor, flag, unknownFlag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCameraToVehicle)**
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

---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param toCar number
---@param tilt number
---@param switchstyle number
function attachCameraToVehicleLookAtVehicle(car, offsetX, offsetY, offsetZ, toCar, tilt, switchstyle) end

---@param player Player
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param ped Ped
---@param tilt number
---@param switchstyle number
function attachCameraToVehicleLookAtChar(car, offsetX, offsetY, offsetZ, ped, tilt, switchstyle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCameraToChar)**
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

---@param ped Ped
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param targetActor number
---@param tilt number
---@param switchstyle number
function attachCameraToCharLookAtChar(ped, offsetX, offsetY, offsetZ, targetActor, tilt, switchstyle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/forceCarLights)**
---
---@param car Vehicle
---@param lights number
function forceCarLights(car, lights) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addPedtypeAsAttractorUser)**
---
---@param ASOrigin number
---@param pedtype number
function addPedtypeAsAttractorUser(ASOrigin, pedtype) end

---@param object Object
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function attachObjectToCar(object, car, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---@param object Object
---@param X number
---@param Y number
---@param Z number
---@param collisionDetection boolean
function detachObject(object, X, Y, Z, collisionDetection) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/attachCarToCar)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/detachCar)**
---
---@param car Vehicle
---@param X number
---@param Y number
---@param Z number
---@param collisionDetection boolean
function detachCar(car, X, Y, Z, collisionDetection) end

---@param object Object
---@return boolean result
function isObjectAttached(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isVehicleAttached)**
---
---@param car Vehicle
---@return boolean result
function isVehicleAttached(car) end

---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param radius number
function heliFollowEntity(heli, ped, car, radius) end

---@param heli Vehicle
---@param ped Ped
---@param unknownFlag1 boolean
---@param unknownFlag2 boolean
---@param unknownFlag3 boolean
function taskTogglePedThreatScanner(ped, unknownFlag1, unknownFlag2, unknownFlag3) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/popCarDoor)**
---
---@param car Vehicle
---@param door number
---@param visible boolean
function popCarDoor(car, door, visible) end

---@param ped Ped
---@param hold boolean
function taskUseMobilePhone(ped, hold) end

---@param ped Ped
---@param car Vehicle
---@param door number
function fixCarDoor(car, door) end

---@param ped Ped
---@param car Vehicle
---@param passengerseat number
function taskWarpCharIntoCarAsPassenger(ped, car, passengerseat) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerTargettingAnything)**
---
---@param player Player
---@return boolean result
function isPlayerTargettingAnything(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getActiveCameraCoordinates)**
---
---@return number X
---@return number Y
---@return number Z
function getActiveCameraCoordinates() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getActiveCameraPointAt)**
---
---@return number X
---@return number Y
---@return number Z
function getActiveCameraPointAt() end

---@param car Vehicle
---@param component number
---@param effectFlag boolean
function popCarPanel(car, component, effectFlag) end

---@param car Vehicle
---@param componentB number
function fixCarPanel(car, componentB) end

---@param car Vehicle
---@param tire number
function fixCarTire(car, tire) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/attachObjectToObject)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/attachObjectToChar)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarSpeedVector)**
---
---@param car Vehicle
---@return number vecX
---@return number vecY
---@return number vecZ
function getCarSpeedVector(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarMass)**
---
---@param car Vehicle
---@return number mass
function getCarMass(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDiveFromAttachmentAndGetUp)**
---
---@param ped Ped
---@param timeMS number
function taskDiveFromAttachmentAndGetUp(ped, timeMS) end

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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGotoCharOffset)**
---
---@param ped Ped
---@param toActor number
---@param timelimit number
---@param approachDistance number
---@param approachAngle number
function taskGotoCharOffset(ped, toActor, timelimit, approachDistance, approachAngle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskLookAtCoord)**
---
---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param timeMS number
function taskLookAtCoord(ped, toX, toY, toZ, timeMS) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hideCharWeaponForScriptedCutscene)**
---
---@param ped Ped
---@param hide boolean
function hideCharWeaponForScriptedCutscene(ped, hide) end

---@param ped Ped
---@return number speed
function getCharSpeed(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupDecisionMaker)**
---
---@param group number
---@param maker number
function setGroupDecisionMaker(group, maker) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadGroupDecisionMaker)**
---
---@param type number
---@return number maker
function loadGroupDecisionMaker(type) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/disablePlayerSprint)**
---
---@param player Player
---@param mode boolean
function disablePlayerSprint(player, mode) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskSitDown)**
---
---@param ped Ped
---@param timeMS number
function taskSitDown(ped, timeMS) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createSearchlight)**
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

---@param acquaintance number
---@param pedtype number
---@param toPedtype number
function clearRelationship(acquaintance, pedtype, toPedtype) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doesSearchlightExist)**
---
---@param searchlight Searchlight
---@return boolean result
function doesSearchlightExist(searchlight) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/moveSearchlightBetweenCoords)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/pointSearchlightAtCoord)**
---
---@param searchlight Searchlight
---@param toX number
---@param toY number
---@param toZ number
---@param speed number
function pointSearchlightAtCoord(searchlight, toX, toY, toZ, speed) end

---@param ped Ped
---@param speed number
function pointSearchlightAtChar(searchlight, ped, speed) end

---@param ped Ped
---@return boolean result
function isCharInSearchlight(searchlight, ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCutsceneLoaded)**
---
---@return boolean result
function hasCutsceneLoaded() end

---@param ped Ped
---@param atX number
---@param atY number
---@param atZ number
function taskTurnCharToFaceCoord(ped, atX, atY, atZ) end

---@param ped Ped
---@param car Vehicle
---@param speed number
function taskDrivePointRoute(ped, car, speed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/fireSingleBullet)**
---
---@param fromX number
---@param fromY number
---@param fromZ number
---@param targetX number
---@param targetY number
---@param targetZ number
---@param energy number
function fireSingleBullet(fromX, fromY, fromZ, targetX, targetY, targetZ, energy) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isLineOfSightClear)**
---
---@param fromX number
---@param fromY number
---@param fromZ number
---@param toX number
---@param toY number
---@param toZ number
---@param checkBuildings boolean
---@param checkVehicles boolean
---@param checkActors boolean
---@param checkObjects boolean
---@param checkParticles boolean
---@return boolean result
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarRoll)**
---
---@param car Vehicle
---@return number roll
function getCarRoll(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/pointSearchlightAtVehicle)**
---
---@param searchlight Searchlight
---@param car Vehicle
---@param speed number
function pointSearchlightAtVehicle(searchlight, car, speed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isVehicleInSearchlight)**
---
---@param number number
---@param car Vehicle
---@return boolean result
function isVehicleInSearchlight(number, car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createSearchlightOnVehicle)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGoToCoordWhileAiming)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumberOfFiresInRange)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@return number num
function getNumberOfFiresInRange(atX, atY, atZ, radius) end

---@param shopping GxtString
function loadShop(shopping) end

---@return number num
function getNumberOfItemsInShop() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskCarTempAction)**
---
---@param ped Ped
---@param car Vehicle
---@param performAction number
---@param timelimit number
function taskCarTempAction(ped, car, performAction, timelimit) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setLaRiots)**
---
---@param enable boolean
function setLaRiots(enable) end

---@param ped Ped
function removeCharFromGroup(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/attachSearchlightToSearchlightObject)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchEmergencyServices)**
---
---@param enable boolean
function switchEmergencyServices(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createCheckpoint)**
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

---@param zone GxtString
---@param popcycle number
function setZonePopulationType(zone, popcycle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchRandomTrains)**
---
---@param enable boolean
function switchRandomTrains(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createMissionTrain)**
---
---@param type number
---@param atX number
---@param atY number
---@param atZ number
---@param direction boolean
---@return Vehicle train
function createMissionTrain(type, atX, atY, atZ, direction) end

---@param zone GxtString
---@param gang number
---@param density number
function setZoneGangStrength(zone, gang, density) end

---@param zone GxtString
---@param gang number
---@return number density
function getZoneGangStrength(zone, gang) end

---@return boolean result
function isMessageBeingDisplayed() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTrainSpeed)**
---
---@param train Vehicle
---@param speed number
function setTrainSpeed(train, speed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTrainCruiseSpeed)**
---
---@param train Vehicle
---@param speed number
function setTrainCruiseSpeed(train, speed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getTrainCaboose)**
---
---@param train Vehicle
---@return number caboose
function getTrainCaboose(train) end

---@param group string
function requestIpl(group) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTwoPlayerCameraMode)**
---
---@param mode boolean
function setTwoPlayerCameraMode(mode) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskCarMission)**
---
---@param ped Ped
---@param car Vehicle
---@param targetCar number
---@param order number
---@param maxSpeed number
---@param trafficFlag number
function taskCarMission(ped, car, targetCar, order, maxSpeed, trafficFlag) end

---@param ped Ped
---@param toObject number
---@param timelimit number
---@param stopWithinRadius number
function taskGoToObject(ped, toObject, timelimit, stopWithinRadius) end

---@param ped Ped
---@param roll boolean
function taskWeaponRoll(ped, roll) end

---@param ped Ped
---@param bustActor number
function taskCharArrestChar(ped, bustActor) end

---@param car Vehicle
---@param poolIndex number
---@return Model itemID
function getAvailableVehicleMod(car, poolIndex) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getVehicleModType)**
---
---@param component Model
---@return number type
function getVehicleModType(component) end

---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param component Model
---@return number componentId
function addVehicleMod(car, component) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeVehicleMod)**
---
---@param car Vehicle
---@param componentId number
function removeVehicleMod(car, componentId) end

---@param id number
---@return number slot
function getWeapontypeSlot(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasVehicleModLoaded)**
---
---@param component Model
---@return boolean result
function hasVehicleModLoaded(component) end

---@param player Player
---@param texture number
---@param model number
---@param bodypart number
function givePlayerClothes(player, texture, model, bodypart) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumAvailablePaintjobs)**
---
---@param car Vehicle
---@return number num
function getNumAvailablePaintjobs(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/giveVehiclePaintjob)**
---
---@param set number
---@param paintjob number
function giveVehiclePaintjob(set, paintjob) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isGroupMember)**
---
---@param ped Ped
---@param group number
---@return boolean result
function isGroupMember(ped, group) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isGroupLeader)**
---
---@param ped Ped
---@param group number
---@return boolean result
function isGroupLeader(ped, group) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupSeparationRange)**
---
---@param group number
---@param range number
function setGroupSeparationRange(group, range) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/limitTwoPlayerDistance)**
---
---@param distance number
function limitTwoPlayerDistance(distance) end

---@param ped Ped
---@param climb boolean
function taskClimb(ped, climb) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerPlayerTargetting)**
---
---@param can boolean
function setPlayerPlayerTargetting(can) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getScriptFireCoords)**
---
---@param fire number
---@return number X
---@return number Y
---@return number Z
function getScriptFireCoords(fire) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNthClosestCarNodeWithHeading)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayersCanBeInSeparateCars)**
---
---@param allow boolean
function setPlayersCanBeInSeparateCars(allow) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doesCarHaveStuckCarCheck)**
---
---@param car Vehicle
---@return boolean result
function doesCarHaveStuckCarCheck(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlaybackSpeed)**
---
---@param car Vehicle
---@param speed number
function setPlaybackSpeed(car, speed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/areAnyCharsNearChar)**
---
---@param ped Ped
---@param range number
---@return boolean result
function areAnyCharsNearChar(ped, range) end

---@param magnet number
function releaseEntityFromRopeForObject(magnet) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPercentageTaggedInArea)**
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number percentage
function getPercentageTaggedInArea(x1, y1, x2, y2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTagStatusInArea)**
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param value boolean
function setTagStatusInArea(x1, y1, x2, y2, value) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/carGotoCoordinatesRacing)**
---
---@param car Vehicle
---@param toX number
---@param toY number
---@param toZ number
function carGotoCoordinatesRacing(car, toX, toY, toZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCarUsingAi)**
---
---@param car Vehicle
---@param path number
function startPlaybackRecordedCarUsingAi(car, path) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/skipInPlaybackRecordedCar)**
---
---@param car Vehicle
---@param path number
function skipInPlaybackRecordedCar(car, path) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearCharDecisionMakerEventResponse)**
---
---@param maker number
---@param event number
function clearCharDecisionMakerEventResponse(maker, event) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addCharDecisionMakerEventResponse)**
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

---@param ped Ped
---@param object boolean
function dropObject(ped, object) end

---@param enable boolean
function setArea51SamSite(enable) end

---@param ped Ped
---@return boolean result
---@return Searchlight searchlight
function isCharInAnySearchlight(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/planeAttackPlayer)**
---
---@param hydra number
---@param car Vehicle
---@param radius number
function planeAttackPlayer(hydra, car, radius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/planeFlyInDirection)**
---
---@param plane number
---@param direction number
---@param altitudemin number
---@param altitudemax number
function planeFlyInDirection(plane, direction, altitudemin, altitudemax) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/planeFollowEntity)**
---
---@param plane number
---@param ped Ped
---@param car Vehicle
---@param radius number
function planeFollowEntity(plane, ped, car, radius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDriveBy)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarStayInSlowLane)**
---
---@param car Vehicle
---@param stay boolean
function setCarStayInSlowLane(car, stay) end

---@param player Player
---@param enabled boolean
function setPlayerGroupRecruitment(player, enabled) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isClosestObjectOfTypeSmashedOrDamaged)**
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

---@param ped Ped
---@param maker number
function taskSetCharDecisionMaker(ped, maker) end

---@param train Vehicle
function deleteMissionTrain(train) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isConversationAtNode)**
---
---@param ped Ped
---@param gxtString GxtString
---@return boolean result
function isConversationAtNode(ped, gxtString) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectHealth)**
---
---@param object Object
---@return number health
function getObjectHealth(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectHealth)**
---
---@param object Object
---@param health number
function setObjectHealth(object, health) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/breakObject)**
---
---@param object Object
---@param intensity number
function breakObject(object, intensity) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/heliAttackPlayer)**
---
---@param heli Vehicle
---@param player Player
---@param radius number
function heliAttackPlayer(heli, player, radius) end

---@param ped Ped
---@param car Vehicle
---@param radius number
function heliFollowEntity(heli, ped, car, radius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/policeHeliChaseEntity)**
---
---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param radius number
function policeHeliChaseEntity(heli, ped, car, radius) end

---@param ped Ped
---@param hold boolean
function taskUseMobilePhone(ped, hold) end

---@param player Player
---@param can boolean
function setPlayerEnterCarButton(player, can) end

---@param ped Ped
---@param car Vehicle
---@param passengerseat number
function taskWarpCharIntoCarAsPassenger(ped, car, passengerseat) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchCopsOnBikes)**
---
---@param generate boolean
function switchCopsOnBikes(generate) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isFlameInAngledArea2d)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isFlameInAngledArea3d)**
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

---@param car Vehicle
---@param checkDistance number
---@param time number
---@param stuck boolean
---@param flipped boolean
---@param warp boolean
---@param path number
function addStuckCarCheckWithWarp(car, checkDistance, time, stuck, flipped, warp, path) end

---@param car Vehicle
---@param door number
function damageCarPanel(car, door) end

---@param car Vehicle
---@param roll number
function setCarRoll(car, roll) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/suppressCarModel)**
---
---@param modelId Model
---@return boolean result
function suppressCarModel(modelId) end

---@param modelId Model
---@return boolean result
function isModelInCdimage(modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPs2KeyboardKeyPressed)**
---
---@param key number
---@return boolean result
function isPs2KeyboardKeyPressed(key) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPs2KeyboardKeyJustPressed)**
---
---@param key number
---@return boolean result
function isPs2KeyboardKeyJustPressed(key) end

---@param ped Ped
---@param liftingObject number
---@return boolean result
function isCharHoldingObject(ped, liftingObject) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarCanGoAgainstTraffic)**
---
---@param car Vehicle
---@param can boolean
function setCarCanGoAgainstTraffic(car, can) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/damageCarDoor)**
---
---@param car Vehicle
---@param door number
function damageCarDoor(car, door) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCarInSphereNoSave)**
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param model number
---@return Vehicle car
function getRandomCarInSphereNoSave(X, Y, Z, radius, model) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCharInSphere)**
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

---@param ped Ped
---@return boolean result
function hasCharBeenArrested(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlaneThrottle)**
---
---@param plane number
---@param throttle number
function setPlaneThrottle(plane, throttle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/heliLandAtCoords)**
---
---@param heli Vehicle
---@param X number
---@param Y number
---@param Z number
---@param minaltitude number
---@param maxaltitude number
function heliLandAtCoords(heli, X, Y, Z, minaltitude, maxaltitude) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/planeStartsInAir)**
---
---@param hydra number
function planeStartsInAir(hydra) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setRelationship)**
---
---@param acquaintance number
---@param pedtype number
---@param toPedtype number
function setRelationship(acquaintance, pedtype, toPedtype) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearRelationship)**
---
---@param acquaintance number
---@param pedtype number
---@param toPedtype number
function clearRelationship(acquaintance, pedtype, toPedtype) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearGroupDecisionMakerEventResponse)**
---
---@param maker number
---@param event number
function clearGroupDecisionMakerEventResponse(maker, event) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addGroupDecisionMakerEventResponse)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/drawSpriteWithRotation)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskUseAttractor)**
---
---@param ped Ped
---@param attractor number
function taskUseAttractor(ped, attractor) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskShootAtChar)**
---
---@param ped Ped
---@param atActor number
---@param timelimit number
function taskShootAtChar(ped, atActor, timelimit) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setInformRespectedFriends)**
---
---@param flags number
---@param radius number
---@param pedsToScan number
function setInformRespectedFriends(flags, radius, pedsToScan) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharRespondingToEvent)**
---
---@param ped Ped
---@param event number
---@return boolean result
function isCharRespondingToEvent(ped, event) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectVisible)**
---
---@param object Object
---@param visibility boolean
function setObjectVisible(object, visibility) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFleeCharAnyMeans)**
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

---@param car Vehicle
---@param f1 number
---@param f2 number
---@param f3 number
---@param f4 number
function controlCarHydraulics(car, f1, f2, f3, f4) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/extendPatrolRoute)**
---
---@param X number
---@param Y number
---@param Z number
---@param animation string
---@param IFPFile string
function extendPatrolRoute(X, Y, Z, animation, IFPFile) end

---@param object Object
---@param animation string
---@param IFPFile string
---@param framedelta number
---@param lockF boolean
---@param loop boolean
---@return boolean result
function playObjectAnim(object, animation, IFPFile, framedelta, lockF, loop) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setRadarZoom)**
---
---@param zoom number
function setRadarZoom(zoom) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doesBlipExist)**
---
---@param marker Marker
---@return boolean result
function doesBlipExist(marker) end

function playerEnteredQuarryCrane() end

function playerEnteredLasVegasCrane() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumberOfItemsInShop)**
---
---@return number num
function getNumberOfItemsInShop() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getItemInShop)**
---
---@param index number
---@return number item
function getItemInShop(index) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPriceOfItem)**
---
---@param item number
---@return number price
function getPriceOfItem(item) end

---@param ped Ped
---@param fightingStyle number
---@param moves number
function giveMeleeAttackToChar(ped, fightingStyle, moves) end

---@param car Vehicle
---@param hydraulics boolean
function setCarHydraulics(car, hydraulics) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setZonePopulationType)**
---
---@param zone GxtString
---@param popcycle number
function setZonePopulationType(zone, popcycle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setZoneDealerStrength)**
---
---@param zone GxtString
---@param density number
function setZoneDealerStrength(zone, density) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getZoneDealerStrength)**
---
---@param zone GxtString
---@return number strength
function getZoneDealerStrength(zone) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setZoneGangStrength)**
---
---@param zone GxtString
---@param gang number
---@param density number
function setZoneGangStrength(zone, gang, density) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getZoneGangStrength)**
---
---@param zone GxtString
---@param gang number
---@return number density
function getZoneGangStrength(zone, gang) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isMessageBeingDisplayed)**
---
---@return boolean result
function isMessageBeingDisplayed() end

---@param ped Ped
---@param targetPriority boolean
function setCharIsTargetPriority(ped, targetPriority) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/customPlateDesignForNextCar)**
---
---@param modelNumplate Model
---@param townTexture number
function customPlateDesignForNextCar(modelNumplate, townTexture) end

---@param ped Ped
---@param car Vehicle
---@param timeMS number
---@param stopAtDistance number
function taskGotoCar(ped, car, timeMS, stopAtDistance) end

---@param ped Ped
---@param animation string
---@param IFP string
---@param framedelta number
---@param loopA boolean
---@param lockX boolean
---@param lockY boolean
---@param lockF boolean
---@param time number
function taskPlayAnimNonInterruptable(ped, animation, IFP, framedelta, loopA, lockX, lockY, lockF, time) end

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

---@param object Object
---@param X number
---@param Y number
---@param Z number
function setObjectCoordinatesAndVelocity(object, X, Y, Z) end

---@param ped Ped
---@param acquaintance number
---@param pedtype number
function setCharRelationship(ped, acquaintance, pedtype) end

---@param ped Ped
---@param acquaintance number
---@param pedtype number
function clearCharRelationship(ped, acquaintance, pedtype) end

---@param ped Ped
---@param acquaintance number
function clearAllCharRelationships(ped, acquaintance) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarPitch)**
---
---@param car Vehicle
---@return number pitch
function getCarPitch(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getActiveInterior)**
---
---@return number interior
function getActiveInterior() end

---@param ped Ped
---@param car Vehicle
---@param minaltitude number
---@param maxaltitude number
function heliKeepEntityInView(heli, ped, car, minaltitude, maxaltitude) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getWeapontypeModel)**
---
---@param id number
---@return number model
function getWeapontypeModel(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getWeapontypeSlot)**
---
---@param id number
---@return number slot
function getWeapontypeSlot(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getShoppingExtraInfo)**
---
---@param item number
---@param flag number
---@return number info
function getShoppingExtraInfo(item, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/givePlayerClothes)**
---
---@param player Player
---@param texture number
---@param model number
---@param bodypart number
function givePlayerClothes(player, texture, model, bodypart) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumberOfFiresInArea)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/attachWinchToHeli)**
---
---@param heli Vehicle
---@param magnet boolean
function attachWinchToHeli(heli, magnet) end

---@param enable boolean
function setFirstPersonInCarCameraMode(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getTrainCarriage)**
---
---@param train Vehicle
---@param handle number
---@return number carriage
function getTrainCarriage(train, handle) end

---@param heli Vehicle
function setHeliBladesFullSpeed(heli) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNameOfItem)**
---
---@param item number
---@return GxtString name
function getNameOfItem(item) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskClimb)**
---
---@param ped Ped
---@param climb boolean
function taskClimb(ped, climb) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/buyItem)**
---
---@param item number
function buyItem(item) end

---@param ped Ped
---@param animation string
---@param ifp1 string
---@param ifp2 number
---@param time number
function taskDieNamedAnim(ped, animation, ifp1, ifp2, time) end

---@param player Player
---@param able boolean
function setPlayerDuckButton(player, able) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRopeHeightForObject)**
---
---@param magnet number
---@return number length
function getRopeHeightForObject(magnet) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setRopeHeightForObject)**
---
---@param magnet number
---@param length number
function setRopeHeightForObject(magnet, length) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/grabEntityOnRopeForObject)**
---
---@param magnet number
---@return Vehicle carHandle
---@return Ped pedHandle
---@return Object objectHandle
function grabEntityOnRopeForObject(magnet) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/releaseEntityFromRopeForObject)**
---
---@param magnet number
function releaseEntityFromRopeForObject(magnet) end

---@param object Object
---@param animation string
---@param speed number
function setObjectAnimSpeed(object, animation, speed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/performSequenceTaskFromProgress)**
---
---@param ped Ped
---@param sequence number
---@param unkProgress1 number
---@param unkProgress2 number
function performSequenceTaskFromProgress(ped, sequence, unkProgress1, unkProgress2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setNextDesiredMoveState)**
---
---@param speed number
function setNextDesiredMoveState(speed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGotoCharAiming)**
---
---@param ped Ped
---@param followActor number
---@param minradius number
---@param maxradius number
function taskGotoCharAiming(ped, followActor, minradius, maxradius) end

---@param ped Ped
---@return number unkProgress1
---@return number unkProgress2
function getSequenceProgressRecursive(ped) end

---@param ped Ped
---@param attackActor number
---@param time number
function taskKillCharOnFootTimed(ped, attackActor, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNearestTagPosition)**
---
---@param X number
---@param Y number
---@param Z number
---@return number X
---@return number Y
---@return number Z
function getNearestTagPosition(X, Y, Z) end

---@param ped Ped
function taskJetpack(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setArea51SamSite)**
---
---@param enable boolean
function setArea51SamSite(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAnySearchlight)**
---
---@param ped Ped
---@return boolean result
---@return Searchlight searchlight
function isCharInAnySearchlight(ped) end

---@param car Vehicle
---@return boolean result
function isTrailerAttachedToCab(trailer, car) end

---@param car Vehicle
---@param gun boolean
function selectWeaponsForVehicle(car, gun) end

---@param player Player
---@return number group
function getPlayerGroup(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getLoadedShop)**
---
---@return GxtString shop
function getLoadedShop() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getBeatProximity)**
---
---@param track number
---@return number int2
---@return number int3
---@return number int4
function getBeatProximity(track) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupDefaultTaskAllocator)**
---
---@param group number
---@param command number
function setGroupDefaultTaskAllocator(group, command) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerGroupRecruitment)**
---
---@param player Player
---@param enabled boolean
function setPlayerGroupRecruitment(player, enabled) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/activateHeliSpeedCheat)**
---
---@param heli Vehicle
---@param power number
function activateHeliSpeedCheat(heli, power) end

---@param ped Ped
---@param maker number
function taskSetCharDecisionMaker(ped, maker) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/deleteMissionTrain)**
---
---@param train Vehicle
function deleteMissionTrain(train) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/markMissionTrainAsNoLongerNeeded)**
---
---@param train Vehicle
function markMissionTrainAsNoLongerNeeded(train) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setBlipAlwaysDisplayOnZoomedRadar)**
---
---@param marker Marker
---@param displayAlways boolean
function setBlipAlwaysDisplayOnZoomedRadar(marker, displayAlways) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/requestCarRecording)**
---
---@param path number
function requestCarRecording(path) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasCarRecordingBeenLoaded)**
---
---@param path number
---@return boolean result
function hasCarRecordingBeenLoaded(path) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMissionTrainCoordinates)**
---
---@param train Vehicle
---@param X number
---@param Y number
---@param Z number
function setMissionTrainCoordinates(train, X, Y, Z) end

---@param ped Ped
---@param X number
---@param Y number
---@param Z number
---@return number level
function getSoundLevelAtCoords(ped, X, Y, Z) end

---@param ped Ped
---@param listen boolean
function listenToPlayerGroupCommands(ped, listen) end

---@param player Player
---@param can boolean
function setPlayerEnterCarButton(player, can) end

---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param angle number
---@param withinRadius number
function taskCharSlideToCoord(ped, toX, toY, toZ, angle, withinRadius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCurrentDayOfWeek)**
---
---@return number weekday
function getCurrentDayOfWeek() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/registerScriptBrainForCodeUse)**
---
---@param id number
---@param gxtString GxtString
function registerScriptBrainForCodeUse(id, gxtString) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/applyForceToCar)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addToCarRotationVelocity)**
---
---@param car Vehicle
---@param vecX number
---@param vecY number
---@param vecZ number
function addToCarRotationVelocity(car, vecX, vecY, vecZ) end

---@param car Vehicle
---@param vecX number
---@param vecY number
---@param vecZ number
function setCarRotationVelocity(car, vecX, vecY, vecZ) end

---@param ped Ped
---@param rate number
function setCharShootRate(ped, rate) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isModelInCdimage)**
---
---@param modelId Model
---@return boolean result
function isModelInCdimage(modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeOilPuddlesInArea)**
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
function removeOilPuddlesInArea(x1, y1, x2, y2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setBlipAsFriendly)**
---
---@param marker Marker
---@param type boolean
function setBlipAsFriendly(marker, type) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskSwimToCoord)**
---
---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
function taskSwimToCoord(ped, toX, toY, toZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getModelDimensions)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/copyCharDecisionMaker)**
---
---@param ped Ped
---@return number maker
function copyCharDecisionMaker(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/copyGroupDecisionMaker)**
---
---@param group number
---@return number maker
function copyGroupDecisionMaker(group) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDrivePointRouteAdvanced)**
---
---@param ped Ped
---@param car Vehicle
---@param speed number
---@param flag1 number
---@param flag2 number
---@param flag3 number
function taskDrivePointRouteAdvanced(ped, car, speed, flag1, flag2, flag3) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isRelationshipSet)**
---
---@param acquaintance number
---@param ofActors number
---@param toActors number
---@return boolean result
function isRelationshipSet(acquaintance, ofActors, toActors) end

---@param car Vehicle
---@param enable boolean
function setCarAlwaysCreateSkids(car, enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCityFromCoords)**
---
---@param X number
---@param Y number
---@param Z number
---@return number city
function getCityFromCoords(X, Y, Z) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasObjectOfTypeBeenSmashed)**
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param modelId Model
---@return boolean result
function hasObjectOfTypeBeenSmashed(X, Y, Z, radius, modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerPerformingWheelie)**
---
---@param player Player
---@return boolean result
function isPlayerPerformingWheelie(player) end

---@param player Player
---@return boolean result
function isPlayerPerformingStoppie(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCheckpointCoords)**
---
---@param checkpoint Checkpoint
---@param X number
---@param Y number
---@param Z number
function setCheckpointCoords(checkpoint, X, Y, Z) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/controlCarHydraulics)**
---
---@param car Vehicle
---@param f1 number
---@param f2 number
---@param f3 number
---@param f4 number
function controlCarHydraulics(car, f1, f2, f3, f4) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getGroupSize)**
---
---@param group number
---@return number numberOfLeaders
---@return number numberOfMembers
function getGroupSize(group) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectCollisionDamageEffect)**
---
---@param object Object
---@param destructible boolean
function setObjectCollisionDamageEffect(object, destructible) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarFollowCar)**
---
---@param car Vehicle
---@param followCar number
---@param radius number
function setCarFollowCar(car, followCar, radius) end

---@param particle Particle
---@param ped Ped
---@param mode number
function attachFxSystemToCharBone(particle, ped, mode) end

---@param handle number
---@param script GxtString
function registerAttractorScriptBrainForCodeUse(handle, script) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchEntryExit)**
---
---@param interior GxtString
---@param access boolean
function switchEntryExit(interior, access) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayTextWithFloat)**
---
---@param X number
---@param Y number
---@param GXT GxtString
---@param value number
---@param flag number
function displayTextWithFloat(X, Y, GXT, value, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doesGroupExist)**
---
---@param group number
---@return boolean result
function doesGroupExist(group) end

---@param ped Ped
---@param fightingStyle number
---@param moves number
function giveMeleeAttackToChar(ped, fightingStyle, moves) end

---@param car Vehicle
---@param hydraulics boolean
function setCarHydraulics(car, hydraulics) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/is2playerGameGoingOn)**
---
---@return boolean result
function is2playerGameGoingOn() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCameraFov)**
---
---@return number fov
function getCameraFov() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doesCarHaveHydraulics)**
---
---@param car Vehicle
---@return boolean result
function doesCarHaveHydraulics(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskCharSlideToCoordAndPlayAnim)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getTotalNumberOfPedsKilledByPlayer)**
---
---@param player Player
---@return number number
function getTotalNumberOfPedsKilledByPlayer(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getLevelDesignCoordsForObject)**
---
---@param object Object
---@param spoot number
---@return number X
---@return number Y
---@return number Z
function getLevelDesignCoordsForObject(object, spoot) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharHighestPriorityEvent)**
---
---@param ped Ped
---@return number event
function getCharHighestPriorityEvent(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getParkingNodeInArea)**
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

---@param ped Ped
---@return boolean result
function isPlayerInPositionForConversation(ped) end

---@param ped Ped
---@param animation string
---@param IFP string
---@param framedelta number
---@param loopA boolean
---@param lockX boolean
---@param lockY boolean
---@param lockF boolean
---@param time number
function taskPlayAnimNonInterruptable(ped, animation, IFP, framedelta, loopA, lockX, lockY, lockF, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addStuntJump)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectCoordinatesAndVelocity)**
---
---@param object Object
---@param X number
---@param Y number
---@param Z number
function setObjectCoordinatesAndVelocity(object, X, Y, Z) end

---@param ped Ped
---@param stay boolean
function setCharKindaStayInSamePlace(ped, stay) end

---@param ped Ped
---@param walkMode number
---@param routeMode number
function taskFollowPatrolRoute(ped, walkMode, routeMode) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCharInAir)**
---
---@param ped Ped
---@return boolean result
function isCharInAir(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharHeightAboveGround)**
---
---@param ped Ped
---@return number height
function getCharHeightAboveGround(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharWeaponSkill)**
---
---@param ped Ped
---@param skill number
function setCharWeaponSkill(ped, skill) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTextEdge)**
---
---@param size number
---@param r number
---@param g number
---@param b number
---@param a number
function setTextEdge(size, r, g, b, a) end

---@param car Vehicle
---@param broken boolean
function setCarEngineBroken(car, broken) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isThisModelABoat)**
---
---@param modelId Model
---@return boolean result
function isThisModelABoat(modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isThisModelAPlane)**
---
---@param modelId Model
---@return boolean result
function isThisModelAPlane(modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isThisModelAHeli)**
---
---@param modelId Model
---@return boolean result
function isThisModelAHeli(modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setFirstPersonInCarCameraMode)**
---
---@param enable boolean
function setFirstPersonInCarCameraMode(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskGreetPartner)**
---
---@param ped Ped
---@param ped2 Ped
---@param unk1 number
---@param unk2 number
function taskGreetPartner(ped, ped2, unk1, unk2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeliBladesFullSpeed)**
---
---@param heli Vehicle
function setHeliBladesFullSpeed(heli) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayHud)**
---
---@param enable boolean
function displayHud(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/connectLods)**
---
---@param object Object
---@param lod number
function connectLods(object, lod) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMaxFireGenerations)**
---
---@param max number
function setMaxFireGenerations(max) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskDieNamedAnim)**
---
---@param ped Ped
---@param animation string
---@param ifp1 string
---@param ifp2 number
---@param time number
function taskDieNamedAnim(ped, animation, ifp1, ifp2, time) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerDuckButton)**
---
---@param player Player
---@param able boolean
function setPlayerDuckButton(player, able) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPoolTableCoords)**
---
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
function setPoolTableCoords(x1, y1, z1, x2, y2, z2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasObjectBeenPhotographed)**
---
---@param object Object
---@return boolean result
function hasObjectBeenPhotographed(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doCameraBump)**
---
---@param rotationZ number
---@param rotationY number
function doCameraBump(rotationZ, rotationY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCurrentDate)**
---
---@return number day
---@return number month
function getCurrentDate() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectAnimSpeed)**
---
---@param object Object
---@param animation string
---@param speed number
function setObjectAnimSpeed(object, animation, speed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isObjectPlayingAnim)**
---
---@param object Object
---@param anim string
---@return boolean result
function isObjectPlayingAnim(object, anim) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectAnimCurrentTime)**
---
---@param object Object
---@param animation string
---@return number progress
function getObjectAnimCurrentTime(object, animation) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectAnimCurrentTime)**
---
---@param object Object
---@param animation string
---@param progress number
function setObjectAnimCurrentTime(object, animation, progress) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharVelocity)**
---
---@param ped Ped
---@param vecX number
---@param vecY number
---@param vecZ number
function setCharVelocity(ped, vecX, vecY, vecZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCharVelocity)**
---
---@param ped Ped
---@return number vecX
---@return number vecY
---@return number vecZ
function getCharVelocity(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharRotation)**
---
---@param ped Ped
---@param vecX number
---@param vecY number
---@param vecZ number
function setCharRotation(ped, vecX, vecY, vecZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCarUprightValue)**
---
---@param car Vehicle
---@return number value
function getCarUprightValue(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleInterior)**
---
---@param car Vehicle
---@param interior number
function setVehicleInterior(car, interior) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/selectWeaponsForVehicle)**
---
---@param car Vehicle
---@param gun boolean
function selectWeaponsForVehicle(car, gun) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCityPlayerIsIn)**
---
---@param player Player
---@return number city
function getCityPlayerIsIn(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNameOfZone)**
---
---@param X number
---@param Y number
---@param Z number
---@return GxtString name
function getNameOfZone(X, Y, Z) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/activateInteriorPeds)**
---
---@param activate boolean
function activateInteriorPeds(activate) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleCanBeTargetted)**
---
---@param car Vehicle
---@param unk boolean
function setVehicleCanBeTargetted(car, unk) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskFollowFootsteps)**
---
---@param ped Ped
---@param followActor number
function taskFollowFootsteps(ped, followActor) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/damageChar)**
---
---@param ped Ped
---@param health number
---@param affectArmour boolean
function damageChar(ped, health, affectArmour) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarCanBeVisiblyDamaged)**
---
---@param car Vehicle
---@param can boolean
function setCarCanBeVisiblyDamaged(car, can) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeliReachedTargetDistance)**
---
---@param heli Vehicle
---@param dist number
function setHeliReachedTargetDistance(heli, dist) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getSoundLevelAtCoords)**
---
---@param ped Ped
---@param X number
---@param Y number
---@param Z number
---@return number level
function getSoundLevelAtCoords(ped, X, Y, Z) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharAllowedToDuck)**
---
---@param ped Ped
---@param enable boolean
function setCharAllowedToDuck(ped, enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeadingForAttachedPlayer)**
---
---@param player Player
---@param toAngle number
---@param rotationSpeed number
function setHeadingForAttachedPlayer(player, toAngle, rotationSpeed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskWalkAlongsideChar)**
---
---@param ped Ped
---@param alongisdeActor number
function taskWalkAlongsideChar(ped, alongisdeActor) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createEmergencyServicesCar)**
---
---@param car Model
---@param X number
---@param Y number
---@param Z number
function createEmergencyServicesCar(car, X, Y, Z) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskKindaStayInSamePlace)**
---
---@param ped Ped
---@param stay boolean
function taskKindaStayInSamePlace(ped, stay) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/startPlaybackRecordedCarLooped)**
---
---@param car Vehicle
---@param path number
function startPlaybackRecordedCarLooped(car, path) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharInterior)**
---
---@param ped Ped
---@param interior number
function setCharInterior(ped, interior) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isAttachedPlayerHeadingAchieved)**
---
---@param player Player
---@return boolean result
function isAttachedPlayerHeadingAchieved(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/enableEntryExitPlayerGroupWarping)**
---
---@param X number
---@param Y number
---@param radius number
---@param access boolean
function enableEntryExitPlayerGroupWarping(X, Y, radius, access) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getClosestStealableObject)**
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@return Object object
function getClosestStealableObject(X, Y, Z, radius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isProceduralInteriorActive)**
---
---@param interior number
---@return boolean result
function isProceduralInteriorActive(interior) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeCarRecording)**
---
---@param path number
function removeCarRecording(path) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setZonePopulationRace)**
---
---@param zone GxtString
---@param popcycle number
function setZonePopulationRace(zone, popcycle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setObjectOnlyDamagedByPlayer)**
---
---@param object Object
---@param player boolean
function setObjectOnlyDamagedByPlayer(object, player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createBirds)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleDirtLevel)**
---
---@param car Vehicle
---@param level number
function setVehicleDirtLevel(car, level) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGangWarsActive)**
---
---@param enable boolean
function setGangWarsActive(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isGangWarGoingOn)**
---
---@return boolean result
function isGangWarGoingOn() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/givePlayerClothesOutsideShop)**
---
---@param player Player
---@param clothes string
---@param model string
---@param bodyPart number
function givePlayerClothesOutsideShop(player, clothes, model, bodyPart) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearLoadedShop)**
---
function clearLoadedShop() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupSequence)**
---
---@param group number
---@param Aspack number
function setGroupSequence(group, Aspack) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharDropsWeaponsWhenDead)**
---
---@param ped Ped
---@param droppable boolean
function setCharDropsWeaponsWhenDead(ped, droppable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharNeverLeavesGroup)**
---
---@param ped Ped
---@param set boolean
function setCharNeverLeavesGroup(ped, set) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerFireButton)**
---
---@param player Player
---@param able boolean
function setPlayerFireButton(player, able) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/attachFxSystemToCharBone)**
---
---@param particle Particle
---@param ped Ped
---@param mode number
function attachFxSystemToCharBone(particle, ped, mode) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/registerAttractorScriptBrainForCodeUse)**
---
---@param handle number
---@param script GxtString
function registerAttractorScriptBrainForCodeUse(handle, script) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeadingLimitForAttachedChar)**
---
---@param ped Ped
---@param orientation number
---@param limit number
function setHeadingLimitForAttachedChar(ped, orientation, limit) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlipForDeadChar)**
---
---@param ped Ped
---@return Marker blip
function addBlipForDeadChar(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getDeadCharCoordinates)**
---
---@param ped Ped
---@return number X
---@return number Y
---@return number Z
function getDeadCharCoordinates(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskPlayAnimWithFlags)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setVehicleAirResistanceMultiplier)**
---
---@param car Vehicle
---@param multiplier number
function setVehicleAirResistanceMultiplier(car, multiplier) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCarCoordinatesNoOffset)**
---
---@param car Vehicle
---@param X number
---@param Y number
---@param Z number
function setCarCoordinatesNoOffset(car, X, Y, Z) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setUsesCollisionOfClosestObjectOfType)**
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param modelId Model
---@param collisionDetection boolean
function setUsesCollisionOfClosestObjectOfType(X, Y, Z, radius, modelId, collisionDetection) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTimeOneDayForward)**
---
function setTimeOneDayForward() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setTimerBeepCountdownTime)**
---
---@param timer VarId
---@param reach number
function setTimerBeepCountdownTime(timer, reach) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/attachTrailerToCab)**
---
---@param trailer number
---@param cab number
function attachTrailerToCab(trailer, cab) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isVehicleTouchingObject)**
---
---@param car Vehicle
---@param object Object
---@return boolean result
function isVehicleTouchingObject(car, object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/enableCraneControls)**
---
---@param UP boolean
---@param DOWN boolean
---@param RELEASE boolean
function enableCraneControls(UP, DOWN, RELEASE) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPlayerInPositionForConversation)**
---
---@param ped Ped
---@return boolean result
function isPlayerInPositionForConversation(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/enableConversation)**
---
---@param ped Ped
---@param enable boolean
function enableConversation(ped, enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCharInSphereOnlyDrugsBuyers)**
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@return Ped ped
function getRandomCharInSphereOnlyDrugsBuyers(X, Y, Z, radius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPedType)**
---
---@param ped Ped
---@return number pedtype
function getPedType(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/taskUseClosestMapAttractor)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/planeAttackPlayerUsingDogFight)**
---
---@param hydra number
---@param player Player
---@param radius number
function planeAttackPlayerUsingDogFight(hydra, player, radius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/canTriggerGangWarWhenOnAMission)**
---
---@param can boolean
function canTriggerGangWarWhenOnAMission(can) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/controlMovableVehiclePart)**
---
---@param car Vehicle
---@param angle number
function controlMovableVehiclePart(car, angle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/winchCanPickVehicleUp)**
---
---@param car Vehicle
---@param attractive boolean
function winchCanPickVehicleUp(car, attractive) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/openCarDoorABit)**
---
---@param car Vehicle
---@param door number
---@param rotation number
function openCarDoorABit(car, door, rotation) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCarDoorFullyOpen)**
---
---@param car Vehicle
---@param door number
---@return boolean result
function isCarDoorFullyOpen(car, door) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setAlwaysDraw3dMarkers)**
---
---@param set boolean
function setAlwaysDraw3dMarkers(set) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/streamScript)**
---
---@param script number
function streamScript(script) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasStreamedScriptLoaded)**
---
---@param script number
---@return boolean result
function hasStreamedScriptLoaded(script) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGangWarsTrainingMission)**
---
---@param set boolean
function setGangWarsTrainingMission(set) end

---@param ped Ped
---@param X number
---@param Y number
---@param radius number
function setCharHasUsedEntryExit(ped, X, Y, radius) end

---@param ped Ped
---@param health number
function setCharMaxHealth(ped, health) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setNightVision)**
---
---@param enable boolean
function setNightVision(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setInfraredVision)**
---
---@param enable boolean
function setInfraredVision(enable) end

---@param zone GxtString
function setZoneForGangWarsTraining(zone) end

---@param ped Ped
---@param can boolean
function setCharCanBeKnockedOffBike(ped, can) end

---@param ped Ped
---@param X number
---@param Y number
---@param Z number
function setCharCoordinatesDontWarpGang(ped, X, Y, Z) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addPriceModifier)**
---
---@param item number
---@param price number
function addPriceModifier(item, price) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removePriceModifier)**
---
---@param item number
function removePriceModifier(item) end

function initZonePopulationSettings() end

---@param car Vehicle
---@param shake boolean
---@param effect boolean
---@param sound boolean
function explodeCarInCutsceneShakeAndBits(car, shake, effect, sound) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isSkipCutsceneButtonPressed)**
---
---@return boolean result
function isSkipCutsceneButtonPressed() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCutsceneOffset)**
---
---@return boolean result
---@return number X
---@return number Y
---@return number Z
function getCutsceneOffset() end

---@param object Object
---@param scale number
function setObjectScale(object, scale) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCurrentPopulationZoneType)**
---
---@return number popcycle
function getCurrentPopulationZoneType() end

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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMenuColumnOrientation)**
---
---@param menu number
---@param column number
---@param alignment number
function setMenuColumnOrientation(menu, column, alignment) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getMenuItemSelected)**
---
---@param menu number
---@return number item
function getMenuItemSelected(menu) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getMenuItemAccepted)**
---
---@param menu number
---@return number item
function getMenuItemAccepted(menu) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/activateMenuItem)**
---
---@param menu number
---@param row number
---@param enable boolean
function activateMenuItem(menu, row, enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/deleteMenu)**
---
---@param menu number
function deleteMenu(menu) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMenuColumn)**
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

---@param marker Marker
---@param X number
---@param Y number
---@param radius number
function setBlipEntryExit(marker, X, Y, radius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchDeathPenalties)**
---
---@param lose boolean
function switchDeathPenalties(lose) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchArrestPenalties)**
---
---@param lose boolean
function switchArrestPenalties(lose) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setExtraHospitalRestartPoint)**
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param angle number
function setExtraHospitalRestartPoint(X, Y, Z, radius, angle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setExtraPoliceStationRestartPoint)**
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param angle number
function setExtraPoliceStationRestartPoint(X, Y, Z, radius, angle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/findNumberTagsTagged)**
---
---@return number num
function findNumberTagsTagged() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getTerritoryUnderControlPercentage)**
---
---@return number percentage
function getTerritoryUnderControlPercentage() end

---@param object Object
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param radius number
---@param sphere boolean
---@return boolean result
function isObjectInAngledArea2d(object, x1, y1, x2, y2, radius, sphere) end

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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCharInSphereNoBrain)**
---
---@param X number
---@param Y number
---@param Z number
---@param radius number
---@return Ped ped
function getRandomCharInSphereNoBrain(X, Y, Z, radius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlaneUndercarriageUp)**
---
---@param plane number
---@param set boolean
function setPlaneUndercarriageUp(plane, set) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/disableAllEntryExits)**
---
---@param disable boolean
function disableAllEntryExits(disable) end

---@param modelId Model
---@param externalScript GxtString
function attachAnimsToModel(modelId, externalScript) end

---@param object Object
---@param liftable boolean
function setObjectAsStealable(object, liftable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCreateRandomGangMembers)**
---
---@param enable boolean
function setCreateRandomGangMembers(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addSparks)**
---
---@param posX number
---@param posY number
---@param posZ number
---@param vecX number
---@param vecY number
---@param vecZ number
---@param density number
function addSparks(posX, posY, posZ, vecX, vecY, vecZ, density) end

---@param car Vehicle
---@return number class
function getVehicleClass(car) end

---@param ped Ped
function clearConversationForChar(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMenuItemWithNumber)**
---
---@param panel number
---@param column number
---@param row number
---@param gxtString GxtString
---@param number number
function setMenuItemWithNumber(panel, column, row, gxtString, number) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMenuItemWith2Numbers)**
---
---@param panel number
---@param column number
---@param row number
---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
function setMenuItemWith2Numbers(panel, column, row, gxtString, numbers1, numbers2) end

---@param cutsceneModel GxtString
---@param textureName GxtString
function setCutsceneModelTexture(cutsceneModel, textureName) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNameOfInfoZone)**
---
---@param atX number
---@param atY number
---@param atZ number
---@return GxtString nameB
function getNameOfInfoZone(atX, atY, atZ) end

---@param car Vehicle
---@param targetable boolean
function vehicleCanBeTargettedByHsMissile(car, targetable) end

---@param car Vehicle
---@param containsGoodies boolean
function setFreebiesInVehicle(car, containsGoodies) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setScriptLimitToGangSize)**
---
---@param max boolean
function setScriptLimitToGangSize(max) end

function makePlayerGangDisappear() end

function makePlayerGangReappear() end

---@param player Player
---@param bodypart number
---@return number textureCRC
---@return number modelCRC
function getClothesItem(player, bodypart) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/showUpdateStats)**
---
---@param display boolean
function showUpdateStats(display) end

---@param checkpoint Checkpoint
---@param type number
function setCoordBlipAppearance(checkpoint, type) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setHeathazeEffect)**
---
---@param enable boolean
function setHeathazeEffect(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isHelpMessageBeingDisplayed)**
---
---@return boolean result
function isHelpMessageBeingDisplayed() end

---@param object Object
---@param type number
---@return boolean result
function hasObjectBeenDamagedByWeapon(object, type) end

---@param object Object
function clearObjectLastWeaponDamage(object) end

---@param player Player
---@param enable boolean
function setPlayerJumpButton(player, enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getHudColour)**
---
---@param interface number
---@return number r
---@return number g
---@return number b
---@return number a
function getHudColour(interface) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/lockDoor)**
---
---@param door number
---@param lock boolean
function lockDoor(door, lock) end

---@param object Object
---@param mass number
function setObjectMass(object, mass) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getObjectMass)**
---
---@param number number
---@return number mass
function getObjectMass(number) end

---@param object Object
---@param turnMass number
function setObjectTurnMass(object, turnMass) end

---@param object Object
---@return number turnMass
function getObjectTurnMass(object) end

---@param zone GxtString
function setSpecificZoneToTriggerGangWar(zone) end

function clearSpecificZonesToTriggerGangWar() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setActiveMenuItem)**
---
---@param panel number
---@param activeRow number
function setActiveMenuItem(panel, activeRow) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/markStreamedScriptAsNoLongerNeeded)**
---
---@param externalScript number
function markStreamedScriptAsNoLongerNeeded(externalScript) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/removeStreamedScript)**
---
---@param externalScript number
function removeStreamedScript(externalScript) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMessageFormatting)**
---
---@param priority boolean
---@param leftmargin number
---@param maxwidth number
function setMessageFormatting(priority, leftmargin, maxwidth) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/startNewStreamedScript)**
---
---@param externalScript number
---@param args table
function startNewStreamedScript(externalScript, args) end

function setWeatherToAppropriateTypeNow() end

---@param object Object
---@param enable boolean
function winchCanPickObjectUp(object, enable) end

---@param zone GxtString
---@param enableSound boolean
function switchAudioZone(zone, enableSound) end

---@param car Vehicle
---@param on boolean
function setCarEngineOn(car, on) end

---@param car Vehicle
---@param lights boolean
function setCarLightsOn(car, lights) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getUserOfClosestMapAttractor)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchRoadsBackToOriginal)**
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchRoadsBackToOriginal(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchPedRoadsBackToOriginal)**
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchPedRoadsBackToOriginal(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPlaneUndercarriagePosition)**
---
---@param plane number
---@return number landingGearStatus
function getPlaneUndercarriagePosition(plane) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraSetVectorTrack)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraSetLerpFov)**
---
---@param from number
---@param to number
---@param timelimit number
---@param smoothTransition boolean
function cameraSetLerpFov(from, to, timelimit, smoothTransition) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchAmbientPlanes)**
---
---@param enable boolean
function switchAmbientPlanes(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setDarknessEffect)**
---
---@param enable boolean
---@param value number
function setDarknessEffect(enable, value) end

function cameraResetNewScriptables() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getNumberOfInstancesOfStreamedScript)**
---
---@param externalScript number
---@return number value
function getNumberOfInstancesOfStreamedScript(externalScript) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/allocateStreamedScriptToRandomPed)**
---
---@param externalScript number
---@param actorModel Model
---@param priority number
function allocateStreamedScriptToRandomPed(externalScript, actorModel, priority) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/allocateStreamedScriptToObject)**
---
---@param externalScript number
---@param objectModel Model
---@param priority number
---@param radius number
---@param type number
function allocateStreamedScriptToObject(externalScript, objectModel, priority, radius, type) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getGroupMember)**
---
---@param group number
---@param member number
---@return number handle
function getGroupMember(group, member) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getWaterHeightAtCoords)**
---
---@param atX number
---@param atY number
---@param ignoreWaves boolean
---@return number height
function getWaterHeightAtCoords(atX, atY, ignoreWaves) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraPersistTrack)**
---
---@param lock boolean
function cameraPersistTrack(lock) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraPersistPos)**
---
---@param lock boolean
function cameraPersistPos(lock) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraPersistFov)**
---
---@param lock boolean
function cameraPersistFov(lock) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraIsVectorMoveRunning)**
---
---@return boolean result
function cameraIsVectorMoveRunning() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraIsVectorTrackRunning)**
---
---@return boolean result
function cameraIsVectorTrackRunning() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraSetVectorMove)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/drawWindow)**
---
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param gxtString GxtString
---@param style number
function drawWindow(cornerAX, cornerAY, cornerBX, cornerBY, gxtString, style) end

---@param car Vehicle
---@param object Object
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function attachCarToObject(car, object, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---@param garage GxtString
---@param free boolean
function setGarageResprayFree(garage, free) end

---@param ped Ped
---@param enable boolean
function setCharBulletproofVest(ped, enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCinemaCamera)**
---
---@param lock boolean
function setCinemaCamera(lock) end

---@param ped Ped
---@param multiplier number
function setCharFireDamageMultiplier(ped, multiplier) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGroupFollowStatus)**
---
---@param group number
---@param status boolean
function setGroupFollowStatus(group, status) end

---@param searchlight Searchlight
---@param flag boolean
function setSearchlightClipIfColliding(searchlight, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasPlayerBoughtItem)**
---
---@param item number
---@return boolean result
function hasPlayerBoughtItem(item) end

---@param ped Ped
function setCameraInFrontOfChar(ped) end

---@param player Player
---@return number maxArmour
function getPlayerMaxArmour(player) end

---@param ped Ped
---@param uninterupted boolean
function setCharUsesUpperbodyDamageAnimsOnly(ped, uninterupted) end

---@param ped Ped
---@param speech number
---@return number spokenPhrase
function setCharSayContext(ped, speech) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addExplosionVariableShake)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param type number
---@param cameraShake number
function addExplosionVariableShake(atX, atY, atZ, type, cameraShake) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/attachMissionAudioToChar)**
---
---@param id number
---@param ped Ped
function attachMissionAudioToChar(id, ped) end

---@param pickup Pickup
---@param cash number
function updatePickupMoneyPerDay(pickup, cash) end

---@param ped Ped
---@return GxtString interiorName
function getNameOfEntryExitCharUsed(ped) end

---@param ped Ped
---@return number coordX
---@return number coordY
---@return number coordZ
---@return number number
function getPositionOfEntryExitCharUsed(ped) end

---@param ped Ped
---@return boolean result
function isCharTalking(ped) end

---@param ped Ped
---@param disable boolean
function disableCharSpeech(ped, disable) end

---@param ped Ped
function enableCharSpeech(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpSkip)**
---
---@param posX number
---@param posY number
---@param posZ number
---@param angle number
function setUpSkip(posX, posY, posZ, angle) end

function clearSkip() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/preloadBeatTrack)**
---
---@param soundtrack number
function preloadBeatTrack(soundtrack) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getBeatTrackStatus)**
---
---@return number status
function getBeatTrackStatus() end

function playBeatTrack() end

function stopBeatTrack() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/findMaxNumberOfGroupMembers)**
---
---@return number max
function findMaxNumberOfGroupMembers() end

---@param car Vehicle
---@param providesCover boolean
function vehicleDoesProvideCover(car, providesCover) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createSnapshotPickup)**
---
---@param atX number
---@param atY number
---@param atZ number
---@return Pickup pickup
function createSnapshotPickup(atX, atY, atZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createHorseshoePickup)**
---
---@param atX number
---@param atY number
---@param atZ number
---@return Pickup pickup
function createHorseshoePickup(atX, atY, atZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createOysterPickup)**
---
---@param atX number
---@param atY number
---@param atZ number
---@return Pickup pickup
function createOysterPickup(atX, atY, atZ) end

---@param object Object
---@return boolean result
function hasObjectBeenUprooted(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addSmokeParticle)**
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

---@param ped Ped
---@return boolean result
function isCharStuckUnderCar(ped) end

---@param car Vehicle
---@param door number
---@param unlatch number
---@param angle number
function controlCarDoor(car, door, unlatch, angle) end

---@param car Vehicle
---@param door number
---@return number angle
function getDoorAngleRatio(car, door) end

---@param player Player
---@param display boolean
function setPlayerDisplayVitalStatsButton(player, display) end

---@param ped Ped
---@param keepTasks boolean
function setCharKeepTask(ped, keepTasks) end

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

---@param ped Ped
---@return boolean result
function isCharSwimming(ped) end

---@param ped Ped
---@return number status
function getCharSwimState(ped) end

---@param ped Ped
---@param time number
function startCharFacialTalk(ped, time) end

---@param ped Ped
function stopCharFacialTalk(ped) end

---@param car Vehicle
---@return boolean result
function isBigVehicle(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchPoliceHelis)**
---
---@param enable boolean
function switchPoliceHelis(enable) end

function storeCarModState() end

function restoreCarModState() end

---@param car Vehicle
---@param slot number
---@return Model modelId
function getCurrentCarMod(car, slot) end

---@param car Vehicle
---@return boolean result
function isCarLowRider(car) end

---@param car Vehicle
---@return boolean result
function isCarStreetRacer(car) end

function forceDeathRestart() end

function syncWater() end

---@param ped Ped
---@param atX number
---@param atY number
---@param atZ number
function setCharCoordinatesNoOffset(ped, atX, atY, atZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doesScriptFireExist)**
---
---@param fire number
---@return boolean result
function doesScriptFireExist(fire) end

function resetStuffUponResurrection() end

---@param car Vehicle
---@return boolean result
function isEmergencyServicesVehicle(car) end

---@param particle Particle
function killFxSystemNow(particle) end

---@param player Player
---@return boolean result
function isObjectWithinBrainActivationRange(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/copySharedCharDecisionMaker)**
---
---@param from number
---@return number to
function copySharedCharDecisionMaker(from) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtPosition)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param event number
function reportMissionAudioEventAtPosition(atX, atY, atZ, event) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/reportMissionAudioEventAtObject)**
---
---@param at number
---@param event number
function reportMissionAudioEventAtObject(at, event) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/attachMissionAudioToObject)**
---
---@param id number
---@param object Object
function attachMissionAudioToObject(id, object) end

---@param car Vehicle
---@return number colours
function getNumCarColours(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/extinguishFireAtPoint)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param radius number
function extinguishFireAtPoint(atX, atY, atZ, radius) end

---@param train Vehicle
---@return boolean result
function hasTrainDerailed(train) end

---@param ped Ped
---@param stayInCarWhenDead boolean
function setCharForceDieInCar(ped, stayInCarWhenDead) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setOnlyCreateGangMembers)**
---
---@param enable boolean
function setOnlyCreateGangMembers(enable) end

---@param object Object
---@return Model modelId
function getObjectModel(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCharUsesCollisionClosestObjectOfType)**
---
---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radius number
---@param modelId Model
---@param solid boolean
---@param forActor number
function setCharUsesCollisionClosestObjectOfType(sphereX, sphereY, sphereZ, radius, modelId, solid, forActor) end

function clearAllScriptFireFlags() end

---@param car Vehicle
---@return number blockingCar
function getCarBlockingCar(car) end

---@param car Vehicle
---@return number paintjob
function getCurrentVehiclePaintjob(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setHelpMessageBoxSize)**
---
---@param width number
function setHelpMessageBoxSize(width) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setGunshotSenseRangeForRiot2)**
---
---@param range number
function setGunshotSenseRangeForRiot2(range) end

---@param car Vehicle
---@return number angle
function getCarMovingComponentOffset(car) end

---@param interior GxtString
---@param bitmask number
---@param flag boolean
function setNamedEntryExitFlag(interior, bitmask, flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/pauseCurrentBeatTrack)**
---
---@param paused boolean
function pauseCurrentBeatTrack(paused) end

---@param player Player
---@param scrollable boolean
function setPlayerWeaponsScrollable(player, scrollable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/markRoadNodeAsDontWander)**
---
---@param atX number
---@param atY number
---@param atZ number
function markRoadNodeAsDontWander(atX, atY, atZ) end

function unmarkAllRoadNodesAsDontWander() end

---@param checkpoint Checkpoint
---@param angle number
function setCheckpointHeading(checkpoint, angle) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMissionRespectTotal)**
---
---@param respect number
function setMissionRespectTotal(respect) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/awardPlayerMissionRespect)**
---
---@param respect number
function awardPlayerMissionRespect(respect) end

---@param car Vehicle
---@param collision boolean
function setCarCollision(car, collision) end

---@param car Vehicle
function changePlaybackToUseAi(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/cameraSetShakeSimulationSimple)**
---
---@param type number
---@param timelimit number
---@param intensity number
function cameraSetShakeSimulationSimple(type, timelimit, intensity) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isNightVisionActive)**
---
---@return boolean result
function isNightVisionActive() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCreateRandomCops)**
---
---@param enable boolean
function setCreateRandomCops(enable) end

---@param ped Ped
---@param ignore boolean
function taskSetIgnoreWeaponRangeFlag(ped, ignore) end

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

---@param ped Ped
---@param to boolean
function dropSecondObject(ped, to) end

---@param object Object
function removeObjectElegantly(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/drawCrosshair)**
---
---@param draw boolean
function drawCrosshair(draw) end

---@param question GxtString
---@param answerY GxtString
---@param answerN GxtString
---@param questionWav number
---@param answerYWav number
---@param answerNWav number
function setUpConversationNodeWithSpeech(question, answerY, answerN, questionWav, answerYWav, answerNWav) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/showBlipsOnAllLevels)**
---
---@param enable boolean
function showBlipsOnAllLevels(enable) end

---@param ped Ped
---@param druggedUp boolean
function setCharDruggedUp(ped, druggedUp) end

---@param ped Ped
---@return boolean result
function isCharHeadMissing(ped) end

---@param string string
---@return number CRC32
function getHashKey(string) end

---@param gxtString GxtString
---@param speech number
function setUpConversationEndNodeWithSpeech(gxtString, speech) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/randomPassengerSay)**
---
---@param passengers number
---@param audioTable number
function randomPassengerSay(passengers, audioTable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hideAllFrontendBlips)**
---
---@param hide boolean
function hideAllFrontendBlips(hide) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPlayerInCarCameraMode)**
---
---@param mode number
function setPlayerInCarCameraMode(mode) end

---@param ped Ped
---@return boolean result
function isCharInAnyTrain(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpSkipAfterMission)**
---
---@param posX number
---@param posY number
---@param posZ number
---@param angle number
function setUpSkipAfterMission(posX, posY, posZ, angle) end

---@param car Vehicle
---@param accessible boolean
function setVehicleIsConsideredByPlayer(car, accessible) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCarModelInMemory)**
---
---@param unk boolean
---@return Model modelId
---@return number class
function getRandomCarModelInMemory(unk) end

---@param car Vehicle
---@return number doorStatus
function getCarDoorLockStatus(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setClosestEntryExitFlag)**
---
---@param atX number
---@param atY number
---@param radius number
---@param bitmask number
---@param flag boolean
function setClosestEntryExitFlag(atX, atY, radius, bitmask, flag) end

---@param ped Ped
---@param signal boolean
function setCharSignalAfterKill(ped, signal) end

---@param ped Ped
---@param wanted boolean
function setCharWantedByPolice(ped, wanted) end

---@param zone GxtString
---@param disableCops boolean
function setZoneNoCops(zone, disableCops) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addBlood)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayCarNames)**
---
---@param show boolean
function displayCarNames(show) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayZoneNames)**
---
---@param show boolean
function displayZoneNames(show) end

---@param car Vehicle
---@param door number
---@return boolean result
function isCarDoorDamaged(car, door) end

---@param ped Ped
---@param atX number
---@param atY number
---@param atZ number
function setCharCoordinatesDontWarpGangNoOffset(ped, atX, atY, atZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMinigameInProgress)**
---
---@param enable boolean
function setMinigameInProgress(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isMinigameInProgress)**
---
---@return boolean result
function isMinigameInProgress() end

---@param modelId Model
function setForceRandomCarModel(modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCarOfTypeInAngledAreaNoSave)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/addNextMessageToPreviousBriefs)**
---
---@param int1 boolean
function addNextMessageToPreviousBriefs(int1) end

function failKillFrenzy() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isCopVehicleInArea3dNoSave)**
---
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@return boolean result
function isCopVehicleInArea3dNoSave(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---@param car Vehicle
---@param enabled boolean
function setPetrolTankWeakpoint(car, enabled) end

---@param ped Ped
---@return boolean result
function isCharUsingMapAttractor(ped) end

---@param player Player
---@param modelId Model
function setPlayerModel(player, modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/areSubtitlesSwitchedOn)**
---
---@return boolean result
function areSubtitlesSwitchedOn() end

---@param ped Ped
---@param car Vehicle
function removeCharFromCarMaintainPosition(ped, car) end

---@param object Object
---@param BP boolean
---@param FP boolean
---@param EP boolean
---@param CP boolean
---@param MP boolean
function setObjectProofs(object, BP, FP, EP, CP, MP) end

---@param car1 Vehicle
---@param car2 Vehicle
---@return boolean result
function isCarTouchingCar(car1, car2) end

---@param object Object
---@param modelId Model
---@return boolean result
function doesObjectHaveThisModel(object, modelId) end

---@param train Vehicle
---@param forced boolean
function setTrainForcedToSlowDown(train, forced) end

---@param car Vehicle
---@return boolean result
function isVehicleOnAllWheels(car) end

---@param pickup Pickup
---@return boolean result
function doesPickupExist(pickup) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/enableAmbientCrime)**
---
---@param enable boolean
function enableAmbientCrime(enable) end

function clearWantedLevelInGarage() end

---@param ped Ped
---@param soundslot number
---@param flags1 boolean
---@param flags2 boolean
---@param flags3 boolean
---@return number unk
function setCharSayContextImportant(ped, soundslot, flags1, flags2, flags3) end

---@param ped Ped
---@param sound number
---@param flags1 boolean
---@param flags2 boolean
---@param flags3 boolean
function setCharSayScript(ped, sound, flags1, flags2, flags3) end

---@param player Player
---@param force boolean
function forceInteriorLightingForPlayer(player, force) end

function useDetonator() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isMoneyPickupAtCoords)**
---
---@param atX number
---@param atY number
---@param atZ number
---@return boolean result
function isMoneyPickupAtCoords(atX, atY, atZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setMenuColumnWidth)**
---
---@param panel number
---@param column number
---@param width number
function setMenuColumnWidth(panel, column, width) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/makeRoomInPlayerGangForMissionPeds)**
---
---@param group number
function makeRoomInPlayerGangForMissionPeds(group) end

---@param ped Ped
---@return boolean result
function isCharGettingInToACar(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpSkipForSpecificVehicle)**
---
---@param posX number
---@param posY number
---@param posZ number
---@param angle number
---@param car Vehicle
function setUpSkipForSpecificVehicle(posX, posY, posZ, angle, car) end

---@param modelId Model
---@return number price
function getCarModelValue(modelId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createCarGeneratorWithPlate)**
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

---@param train Vehicle
---@return boolean result
function findTrainDirection(train) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setAircraftCarrierSamSite)**
---
---@param enable boolean
function setAircraftCarrierSamSite(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/drawLightWithRange)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/enableBurglaryHouses)**
---
---@param enable boolean
function enableBurglaryHouses(enable) end

---@param player Player
---@return boolean result
function isPlayerControlOn(player) end

---@param ped Ped
---@return number interior
function getCharActiveInterior(ped) end

---@param car Vehicle
function giveNonPlayerCarNitro(car) end

---@param player Player
---@param useAnim boolean
function playerTakeOffGoggles(player, useAnim) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/allowFixedCameraCollision)**
---
---@param allow boolean
function allowFixedCameraCollision(allow) end

---@param ped Ped
---@param ped2 Ped
---@return boolean result
function hasCharSpottedCharInFront(ped, ped2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/forceBigMessageAndCounter)**
---
---@param stayOnScreen boolean
function forceBigMessageAndCounter(stayOnScreen) end

---@param carModel Model
---@param distance number
---@param altitudeMultiplier number
---@param angleX number
function setVehicleCameraTweak(carModel, distance, altitudeMultiplier, angleX) end

function resetVehicleCameraTweak() end

---@param ped Ped
---@param event number
function reportMissionAudioEventAtChar(ped, event) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/doesDecisionMakerExist)**
---
---@param maker number
---@return boolean result
function doesDecisionMakerExist(maker) end

---@param ped Ped
---@param ignore boolean
function ignoreHeightDifferenceFollowingNodes(ped, ignore) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/shutAllCharsUp)**
---
---@param enable boolean
function shutAllCharsUp(enable) end

---@param ped Ped
---@param canGetOut boolean
function setCharGetOutUpsideDownCar(ped, canGetOut) end

---@param car Vehicle
---@param event number
function reportMissionAudioEventAtCar(car, event) end

function doWeaponStuffAtStartOf2pGame() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasGameJustReturnedFromFrontend)**
---
---@return boolean result
function hasGameJustReturnedFromFrontend() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCurrentLanguage)**
---
---@return number language
function getCurrentLanguage() end

---@param object Object
---@return boolean result
function isObjectIntersectingWorld(object) end

---@param gxtString GxtString
---@return number width
function getStringWidth(gxtString) end

---@param car Vehicle
function resetVehicleHydraulics(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setRespawnPointForDurationOfMission)**
---
---@param posX number
---@param posY number
---@param posZ number
function setRespawnPointForDurationOfMission(posX, posY, posZ) end

---@param modelId Model
---@return boolean result
function isThisModelACar(modelId) end

---@param searchlight Searchlight
---@param lightsThroughObstacles boolean
function switchOnGroundSearchlight(searchlight, lightsThroughObstacles) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isGangWarFightingGoingOn)**
---
---@return boolean result
function isGangWarFightingGoingOn() end

---@param train Vehicle
---@return boolean result
function isNextStationAllowed(train) end

---@param train Vehicle
function skipToNextAllowedStation(train) end

---@param gxtString GxtString
---@param number number
---@return number width
function getStringWidthWithNumber(gxtString, number) end

---@param ped Ped
---@param muted boolean
function shutCharUpForScriptedSpeech(ped, muted) end

---@param object Object
---@param enable boolean
function enableDisabledAttractorsOnObject(object, enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/loadSceneInDirection)**
---
---@param coordX number
---@param coordY number
---@param coordZ number
---@param angle number
function loadSceneInDirection(coordX, coordY, coordZ, angle) end

---@param player Player
---@return boolean result
function isPlayerUsingJetpack(player) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/clearThisPrintBigNow)**
---
---@param style number
function clearThisPrintBigNow(style) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/hasLanguageChanged)**
---
---@return boolean result
function hasLanguageChanged() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/incrementIntStatNoMessage)**
---
---@param stat number
---@param value number
function incrementIntStatNoMessage(stat, value) end

---@param car Vehicle
---@param tertiaryColor number
---@param quaternaryColor number
function setExtraCarColours(car, tertiaryColor, quaternaryColor) end

---@param car Vehicle
---@return number tertiaryColor
---@return number quaternaryColor
function getExtraCarColours(car) end

function manageAllPopulation() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setNoResprays)**
---
---@param enable boolean
function setNoResprays(enable) end

---@param car Vehicle
---@return boolean result
function hasCarBeenResprayed(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/attachMissionAudioToCar)**
---
---@param audioId number
---@param car Vehicle
function attachMissionAudioToCar(audioId, car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setHasBeenOwnedForCarGenerator)**
---
---@param generator number
---@param owned boolean
function setHasBeenOwnedForCarGenerator(generator, owned) end

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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setAreaName)**
---
---@param gxtString GxtString
function setAreaName(gxtString) end

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

---@param ped Ped
---@param ped2 Ped
---@return boolean result
function isCharTouchingChar(ped, ped2) end

---@param helicopter Vehicle
---@param disable boolean
function disableHeliAudio(helicopter, disable) end

---@param ped Ped
---@param ped2 Ped
function taskHandGesture(ped, ped2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/takePhoto)**
---
---@param unk boolean
function takePhoto(unk) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/incrementFloatStatNoMessage)**
---
---@param stat number
---@param value number
function incrementFloatStatNoMessage(stat, value) end

---@param player Player
---@param followAlways boolean
function setPlayerGroupToFollowAlways(player, followAlways) end

---@param car Vehicle
---@param affectedByCheats boolean
function improveCarByCheating(car, affectedByCheats) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/changeCarColourFromMenu)**
---
---@param panelID number
---@param car Vehicle
---@param colorslot number
---@param activeRow number
function changeCarColourFromMenu(panelID, car, colorslot, activeRow) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/highlightMenuItem)**
---
---@param panel number
---@param row number
---@param highlight boolean
function highlightMenuItem(panel, row, highlight) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setDisableMilitaryZones)**
---
---@param disable boolean
function setDisableMilitaryZones(disable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCameraPositionUnfixed)**
---
---@param xAngle number
---@param zAngle number
function setCameraPositionUnfixed(xAngle, zAngle) end

function setRadioToPlayersFavouriteStation() end

---@param ped Ped
---@param persist boolean
function setDeathWeaponsPersist(ped, persist) end

---@param ped Ped
---@param speed number
function setCharSwimSpeed(ped, speed) end

---@param player Player
---@return boolean result
function isPlayerClimbing(player) end

---@param gxtString GxtString
---@return boolean result
function isThisHelpMessageBeingDisplayed(gxtString) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isWidescreenOnInOptions)**
---
---@return boolean result
function isWidescreenOnInOptions() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/drawSubtitlesBeforeFade)**
---
---@param flag boolean
function drawSubtitlesBeforeFade(flag) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/drawOddjobTitleBeforeFade)**
---
---@param flag boolean
function drawOddjobTitleBeforeFade(flag) end

---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param mode number
---@param time number
---@param stopRadius number
function taskFollowPathNodesToCoordWithRadius(ped, toX, toY, toZ, mode, time, stopRadius) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setPhotoCameraEffect)**
---
---@param firstPersonView boolean
function setPhotoCameraEffect(firstPersonView) end

---@param car Vehicle
function fixCar(car) end

---@param player Player
---@param neverFollow boolean
function setPlayerGroupToFollowNever(player, neverFollow) end

---@param ped Ped
---@return boolean result
function isCharAttachedToAnyCar(ped) end

---@param car Vehicle
---@return Ped ped
function storeCarCharIsAttachedToNoSave(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setUpSkipForVehicleFinishedByScript)**
---
---@param posX number
---@param posY number
---@param posZ number
---@param angle number
---@param car Vehicle
function setUpSkipForVehicleFinishedByScript(posX, posY, posZ, angle, car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isSkipWaitingForScriptToFadeIn)**
---
---@return boolean result
function isSkipWaitingForScriptToFadeIn() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/forceAllVehicleLightsOff)**
---
---@param off boolean
function forceAllVehicleLightsOff(off) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPlayerInCarCameraMode)**
---
---@return number mode
function getPlayerInCarCameraMode() end

---@param player Player
---@param modelId Model
---@return boolean result
function isLastBuildingModelShotByPlayer(player, modelId) end

---@param player Player
function clearLastBuildingModelShotByPlayer(player) end

---@param dialogueGxt GxtString
---@param wav number
function setUpConversationEndNodeWithScriptedSpeech(dialogueGxt, wav) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/activatePimpCheat)**
---
---@param enable boolean
function activatePimpCheat(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getRandomCharInAreaOffsetNoSave)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setScriptCoopGame)**
---
---@param enable boolean
function setScriptCoopGame(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createUser3dMarker)**
---
---@param atX number
---@param atY number
---@param atZ number
---@param color number
---@return Marker marker
function createUser3dMarker(atX, atY, atZ, color) end

---@param marker Marker
function removeUser3dMarker(marker) end

function getRidOfPlayerProstitute() end

---@param display boolean
function displayNonMinigameHelpMessages(display) end

---@param tracksFriction number
function setRailtrackResistanceMult(tracksFriction) end

---@param externalScript number
---@param canBeStreamedIn boolean
function switchObjectBrains(externalScript, canBeStreamedIn) end

function finishSettingUpConversationNoSubtitles() end

---@param enable boolean
function allowPauseInWidescreen(enable) end

---@return number x
---@return number y
function getPcMouseMovement() end

---@return boolean result
function isPcUsingJoypad() end

---@return boolean result
function isMouseUsingVerticalInversion() end

---@param filepath string
---@param args table
---@return boolean result
function startNewCustomScript(filepath, args) end

---@param filepath string
---@param args table
function launchCustomMission(filepath, args) end

---@param thread GxtString
---@return number handle
function getScmThreadStructNamed(thread) end

---@param var number
---@param value number
function setCleoSharedVar(var, value) end

---@param var number
---@return number value
function getCleoSharedVar(var) end

function sampSpawnPlayer() end

---@return number handle
function sampGetBase() end

---@param text string
---@param color number
function sampAddChatMessage(text, color) end

---@param text string
function sampSendChat(text) end

---@return boolean result
function isSampAvailable() end

---@param class number
function sampRequestClass(class) end

---@param event number
---@param id number
---@param param1 number
---@param param2 number
function sampSendScmEvent(event, id, param1, param2) end

---@param action number
function sampSetSpecialAction(action) end

---@param playerId number
---@param reason number
function sampSendDeathByPlayer(playerId, reason) end

---@param id number
---@return boolean result
---@return Vehicle car
function sampGetCarHandleBySampVehicleId(id) end

---@param id number
---@return boolean result
---@return Ped ped
function sampGetCharHandleBySampPlayerId(id) end

---@return boolean result
function sampIsChatInputActive() end

---@param type number
---@param rate number
function sampSetSendrate(type, rate) end

---@param id number
---@return boolean result
function sampIsPlayerConnected(id) end

---@param id number
---@return number structPtr
function sampGetPlayerStructPtr(id) end

---@param id number
---@return number health
function sampGetPlayerHealth(id) end

---@param id number
---@return number armor
function sampGetPlayerArmor(id) end

---@param gamestate number
function sampSetGamestate(gamestate) end

---@param timeout boolean
function sampDisconnectWithReason(timeout) end

---@param name string
function sampSetLocalPlayerName(name) end

---@param id number
---@return number ping
function sampGetPlayerPing(id) end

---@param handle Ped
---@return boolean result
---@return number id
function sampGetPlayerIdByCharHandle(handle) end

---@param car Vehicle
---@return boolean result
---@return number id
function sampGetVehicleIdByCarHandle(car) end

---@param id number
---@return boolean result
---@return number posX
---@return number posY
---@return number posZ
function sampGetStreamedOutPlayerPos(id) end

---@param id number
---@param passenger boolean
function sampSendEnterVehicle(id, passenger) end

---@param id number
function sampSendExitVehicle(id) end

function sampSendSpawn() end

---@param car Vehicle
---@param panel number
---@param doors number
---@param lights number
---@param tires number
function sampSendDamageVehicle(car, panel, doors, lights, tires) end

---@param cmd string
---@param func function
---@return boolean result
function sampRegisterChatCommand(cmd, func) end

---@param id number
---@return string name
function sampGetPlayerNickname(id) end

---@param id number
---@return number color
function sampGetPlayerColor(id) end

---@param ip string
---@param port number
function sampConnectToServer(ip, port) end

---@return string ip
---@return number port
function sampGetCurrentServerAddress() end

---@return string name
function sampGetCurrentServerName() end

---@param id number
---@param caption string
---@param text string
---@param button1 string
---@param button2 string
---@param style number
function sampShowDialog(id, caption, text, button1, button2, style) end

---@param id number
---@return boolean result
---@return number button
---@return number list
---@return string input
function sampHasDialogRespond(id) end

---@return Bitstream bs
function raknetNewBitStream() end

---@param bs Bitstream
function raknetDeleteBitStream(bs) end

---@param bs Bitstream
function raknetResetBitStream(bs) end

---@param bs Bitstream
---@param value boolean
function raknetBitStreamWriteBool(bs, value) end

---@param bs Bitstream
---@param value number
function raknetBitStreamWriteInt8(bs, value) end

---@param bs Bitstream
---@param value number
function raknetBitStreamWriteInt16(bs, value) end

---@param bs Bitstream
---@param value number
function raknetBitStreamWriteInt32(bs, value) end

---@param bs Bitstream
---@param value number
function raknetBitStreamWriteFloat(bs, value) end

---@param bs Bitstream
---@param dest number
---@param size number
function raknetBitStreamWriteBuffer(bs, dest, size) end

---@param bs Bitstream
---@param bitStream Bitstream
function raknetBitStreamWriteBitStream(bs, bitStream) end

---@param bs Bitstream
---@param str string
function raknetBitStreamWriteString(bs, str) end

---@param rpc number
---@param bs Bitstream
---@param priority number
---@param reliability number
---@param channel number
---@param timestamp boolean
function raknetSendRpcEx(rpc, bs, priority, reliability, channel, timestamp) end

---@param bs Bitstream
---@param priority number
---@param reliability number
---@param channel number
function raknetSendBitStreamEx(bs, priority, reliability, channel) end

---@param text string
---@param color number
---@param posX number
---@param posY number
---@param posZ number
---@param distance number
---@param ignoreWalls boolean
---@param playerId number
---@param vehicleId number
---@return number textlabel
function sampCreate3dText(text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId) end

---@param textlabel number
function sampDestroy3dText(textlabel) end

---@param Text3d number
---@return boolean result
function sampIs3dTextDefined(Text3d) end

---@param button number
function sampCloseCurrentDialogWithButton(button) end

---@return number list
function sampGetCurrentDialogListItem() end

---@param list number
function sampSetCurrentDialogListItem(list) end

---@return string text
function sampGetCurrentDialogEditboxText() end

---@param text string
function sampSetCurrentDialogEditboxText(text) end

---@return boolean result
function sampIsDialogActive() end

---@return number type
function sampGetCurrentDialogType() end

---@return number id
function sampGetCurrentDialogId() end

---@return number gamestate
function sampGetGamestate() end

---@param id number
---@return Object object
function sampGetObjectHandleBySampId(id) end

---@param id number
---@return Pickup pickup
function sampGetPickupHandleBySampId(id) end

---@param object Object
---@return number objectId
function sampGetObjectSampIdByHandle(object) end

---@param pickup Pickup
---@return number pickupId
function sampGetPickupSampIdByHandle(pickup) end

---@return number count
function sampGetListboxItemsCount() end

---@param playerId number
---@return number animid
function sampGetPlayerAnimationId(playerId) end

---@param animid number
---@return string name
---@return string file
function sampGetAnimationNameAndFile(animid) end

---@param name string
---@param file string
---@return number id
function sampFindAnimationIdByNameAndFile(name, file) end

---@return number resX
---@return number resY
function getScreenResolution() end

---@param item number
---@return string text
function sampGetListboxItemText(item) end

---@param id number
---@return boolean result
function sampIsPlayerPaused(id) end

---@param show boolean
function sampToggleCursor(show) end

---@return boolean result
function sampIsLocalPlayerSpawned() end

---@param id number
---@return number action
function sampGetPlayerSpecialAction(id) end

---@param cmd string
---@return boolean result
function sampUnregisterChatCommand(cmd) end

---@param id number
---@return boolean result
function sampIsPlayerNpc(id) end

---@param id number
---@return number score
function sampGetPlayerScore(id) end

---@param id number
---@param text string
---@param prefix string
---@param color number
---@param pcolor number
function sampSetChatString(id, text, prefix, color, pcolor) end

---@param id number
---@return string text
---@return string prefix
---@return number color
---@return number pcolor
function sampGetChatString(id) end

---@param text string
function sampSetChatInputText(text) end

---@return string text
function sampGetChatInputText() end

---@param msg string
function sampfuncsLog(msg) end

---@param enabled boolean
function sampSetChatInputEnabled(enabled) end

---@return number rakclientPtr
function sampGetRakclientInterface() end

---@return number rakpeer
function sampGetRakpeer() end

---@param index number
---@return number address
function sampGetRakclientFuncAddressByIndex(index) end

---@param index number
---@return number callbackAddress
function sampGetRpcCallbackByRpcId(index) end

---@param index number
---@return number node
function sampGetRpcNodeByRpcId(index) end

---@return number sampPtr
function sampGetSampInfoPtr() end

---@param name string
---@return DxutDialog dialog
function dxutCreateDialog(name) end

---@param dialog DxutDialog
---@return boolean result
---@return number event
---@return number id
function dxutPopEvent(dialog) end

---@param dialog DxutDialog
---@param id number
---@param text string
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutAddButton(dialog, id, text, posX, posY, sizeX, sizeY) end

---@param dialog DxutDialog
---@param id number
---@param text string
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutAddCheckbox(dialog, id, text, posX, posY, sizeX, sizeY) end

---@param dialog DxutDialog
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutSetDialogPos(dialog, posX, posY, sizeX, sizeY) end

---@param dialog DxutDialog
---@return number posX
---@return number posY
---@return number sizeX
---@return number sizeY
function dxutGetDialogPosAndSize(dialog) end

---@param dialog DxutDialog
---@param visible boolean
function dxutSetDialogVisible(dialog, visible) end

---@param dialog DxutDialog
---@return boolean result
function dxutIsDialogVisible(dialog) end

---@param dialog DxutDialog
---@param id number
---@param text string
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutAddEditbox(dialog, id, text, posX, posY, sizeX, sizeY) end

---@param dialog DxutDialog
---@param id number
---@return string text
function dxutGetControlText(dialog, id) end

---@param rpc number
---@param bs Bitstream
function raknetSendRpc(rpc, bs) end

---@param bs Bitstream
function raknetSendBitStream(bs) end

---@return boolean result
function sampIsCursorActive() end

---@param mode number
function sampSetCursorMode(mode) end

---@return number mode
function sampGetCursorMode() end

---@param dialog DxutDialog
---@param id number
---@param visible boolean
function dxutSetControlVisible(dialog, id, visible) end

---@param dialog DxutDialog
---@param id number
---@param text string
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutAddStatic(dialog, id, text, posX, posY, sizeX, sizeY) end

---@param dialog DxutDialog
---@param id number
---@return boolean result
function dxutIsCheckboxChecked(dialog, id) end

---@param dialog DxutDialog
---@param color number
function dxutSetDialogBackgroundColor(dialog, color) end

---@param dialog DxutDialog
---@param id number
---@param text string
function dxutSetControlText(dialog, id, text) end

---@param dialog DxutDialog
---@param id number
---@return boolean result
function dxutControlIsVisible(dialog, id) end

---@param dialog DxutDialog
---@param id number
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
---@param max number
function dxutAddSlider(dialog, id, posX, posY, sizeX, sizeY, max) end

---@param dialog DxutDialog
---@param id number
---@return number value
function dxutGetSliderValue(dialog, id) end

---@param dialog DxutDialog
---@param id number
---@param value number
function dxutSetSliderValue(dialog, id, value) end

---@param dialog DxutDialog
---@param id number
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutAddListbox(dialog, id, posX, posY, sizeX, sizeY) end

---@param dialog DxutDialog
---@param id number
---@param element string
---@param data number
---@param after number
function dxutListboxInsertItem(dialog, id, element, data, after) end

---@param dialog DxutDialog
---@param id number
---@return number element
---@return number count
function dxutGetListboxSelectedItemAndCount(dialog, id) end

---@param dialog DxutDialog
---@param id number
---@param element number
function dxutListboxDeleteItem(dialog, id, element) end

---@param dialog DxutDialog
---@param id number
---@param element number
---@return string text
---@return number data
function dxutGetListboxItemTextAndData(dialog, id, element) end

---@param dialog DxutDialog
---@param id number
---@param checked boolean
function dxutCheckboxSetChecked(dialog, id, checked) end

---@param dialog DxutDialog
---@param enable boolean
function dxutEnableDialogCaption(dialog, enable) end

---@param dialog DxutDialog
---@return boolean result
function dxutIsDialogCaptionEnabled(dialog) end

---@param dialog DxutDialog
---@param minimized boolean
function dxutSetDialogMinimized(dialog, minimized) end

---@param dialog DxutDialog
---@return boolean result
function dxutIsDialogMinimized(dialog) end

---@param dialog DxutDialog
---@param id number
function dxutDeleteControl(dialog, id) end

---@param dialog DxutDialog
function dxutDeleteDialog(dialog) end

---@param dialog DxutDialog
---@param id number
function dxutSetFocusOnControl(dialog, id) end

---@param dialog DxutDialog
---@param id number
---@param sizeX number
---@param sizeY number
function dxutSetControlSize(dialog, id, sizeX, sizeY) end

---@param dialog DxutDialog
---@param id number
---@return number sizeX
---@return number sizeY
function dxutGetControlSize(dialog, id) end

---@param dialog DxutDialog
---@param id number
---@param posX number
---@param posY number
function dxutSetControlPos(dialog, id, posX, posY) end

---@param dialog DxutDialog
---@param id number
---@return number posX
---@return number posY
function dxutGetControlPos(dialog, id) end

---@param dialog DxutDialog
---@param id number
---@param color number
function dxutSetCheckboxColor(dialog, id, color) end

---@param dialog DxutDialog
---@return boolean result
function dxutIsDialogExists(dialog) end

---@return number settingsPtr
function sampGetServerSettingsPtr() end

---@return number poolsPtr
function sampGetSampPoolsPtr() end

---@return number chatPtr
function sampGetChatInfoPtr() end

---@return number inputPtr
function sampGetInputInfoPtr() end

---@return number dialogPtr
function sampGetDialogInfoPtr() end

---@return number kill
function sampGetKillInfoPtr() end

---@return number miscPtr
function sampGetMiscInfoPtr() end

---@return number tdpoolPtr
function sampGetTextdrawPoolPtr() end

---@return number objpoolPtr
function sampGetObjectPoolPtr() end

---@return number gzpoolPtr
function sampGetGangzonePoolPtr() end

---@return number tlabelpoolPtr
function sampGetTextlabelPoolPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/displayNonMinigameHelpMessages)**
---
---@param display boolean
function displayNonMinigameHelpMessages(display) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setRailtrackResistanceMult)**
---
---@param tracksFriction number
function setRailtrackResistanceMult(tracksFriction) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/switchObjectBrains)**
---
---@param externalScript number
---@param canBeStreamedIn boolean
function switchObjectBrains(externalScript, canBeStreamedIn) end

---@param id number
---@param dstBuffer number
function sampStorePlayerOnfootData(id, dstBuffer) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/allowPauseInWidescreen)**
---
---@param enable boolean
function allowPauseInWidescreen(enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getPcMouseMovement)**
---
---@return number x
---@return number y
function getPcMouseMovement() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isPcUsingJoypad)**
---
---@return boolean result
function isPcUsingJoypad() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isMouseUsingVerticalInversion)**
---
---@return boolean result
function isMouseUsingVerticalInversion() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/startNewCustomScript)**
---
---@param filepath string
---@param args table
---@return boolean result
function startNewCustomScript(filepath, args) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/launchCustomMission)**
---
---@param filepath string
---@param args table
function launchCustomMission(filepath, args) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getScmThreadStructNamed)**
---
---@param thread GxtString
---@return number handle
function getScmThreadStructNamed(thread) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setCleoSharedVar)**
---
---@param var number
---@param value number
function setCleoSharedVar(var, value) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCleoSharedVar)**
---
---@param var number
---@return number value
function getCleoSharedVar(var) end

---@param dataPtr number
function sampSendBulletData(dataPtr) end

---
--- Возвращает адрес samp.dll
--- То же самое, что и `getModuleHandle("samp.dll")`
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetBase)**
---
---@return number handle адрес
function sampGetBase() end

---
--- Добавляет в окно чата SA:MP сообщение заданного цвета
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampAddChatMessage)**
---
---@param text string текст сообщения
---@param color number цвет
function sampAddChatMessage(text, color) end

---
--- Отправляет на сервер текстовое сообщение или команду, если сообщение начинается с символа '/'
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendChat)**
---
---@param text string текст сообщения
function sampSendChat(text) end

---
--- Проверяет инициализацию структур SA:MP
--- Если функция вернула `false`, то использование любых функций, начинающихся на `samp` вызовет ошибку
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isSampAvailable)**
---
---@return boolean result статус
function isSampAvailable() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampRequestClass)**
---
---@param class number
function sampRequestClass(class) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendScmEvent)**
---
---@param event number
---@param id number
---@param param1 number
---@param param2 number
function sampSendScmEvent(event, id, param1, param2) end

---
--- Устанавливает специальное действие локальному игроку
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetSpecialAction)**
---
---@param action number Специальное действие. Подробнее см. [здесь](https://sampwiki.blast.hk/wiki/SpecialActions)
function sampSetSpecialAction(action) end

---
--- Убивает игрока.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendDeathByPlayer)**
---
---@param playerId number ID игрока
---@param reason number причина смерти
function sampSendDeathByPlayer(playerId, reason) end

---
--- Получает хендл т/с по его иду. Если автомобиля нет в зоне стрима, то возвращает false.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCarHandleBySampVehicleId)**
---
---@param id number ID т/c
---@return boolean result результат
---@return Vehicle car хендл т/c
function sampGetCarHandleBySampVehicleId(id) end

---
--- Получает хендл игрока по его иду.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCharHandleBySampPlayerId)**
---
---@param id number ID игрока
---@return boolean result результат
---@return Ped ped хендл игрока
function sampGetCharHandleBySampPlayerId(id) end

---
--- Проверяет открыт ли инпут чата.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsChatInputActive)**
---
---@return boolean result результат проверки
function sampIsChatInputActive() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetSendrate)**
---
---@param type number
---@param rate number
function sampSetSendrate(type, rate) end

---
--- Проверяет подключен ли игрок к серверу.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsPlayerConnected)**
---
---@param id number ID игрока
---@return boolean result результат выполнения
function sampIsPlayerConnected(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerStructPtr)**
---
---@param id number
---@return number structPtr
function sampGetPlayerStructPtr(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerHealth)**
---
---@param id number
---@return number health
function sampGetPlayerHealth(id) end

---
--- Получает уровень здоровья игрока.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerArmor)**
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
--- Устанавливает статус подключения к серверу.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetGamestate)**
---
---@param gamestate GameState статус
function sampSetGamestate(gamestate) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampDisconnectWithReason)**
---
---@param timeout boolean
function sampDisconnectWithReason(timeout) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetLocalPlayerName)**
---
---@param name string
function sampSetLocalPlayerName(name) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerPing)**
---
---@param id number
---@return number ping
function sampGetPlayerPing(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerIdByCharHandle)**
---
---@param ped Ped
---@return boolean result
---@return number id
function sampGetPlayerIdByCharHandle(ped) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetVehicleIdByCarHandle)**
---
---@param car Vehicle
---@return boolean result
---@return number id
function sampGetVehicleIdByCarHandle(car) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetStreamedOutPlayerPos)**
---
---@param id number
---@return boolean result
---@return number posX
---@return number posY
---@return number posZ
function sampGetStreamedOutPlayerPos(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendEnterVehicle)**
---
---@param id number
---@param passenger boolean
function sampSendEnterVehicle(id, passenger) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendExitVehicle)**
---
---@param id number
function sampSendExitVehicle(id) end

---@param thread number
function resumeScmThread(thread) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendDamageVehicle)**
---
---@param car Vehicle
---@param panel number
---@param doors number
---@param lights number
---@param tires number
function sampSendDamageVehicle(car, panel, doors, lights, tires) end

---
--- Регистрирует новую команду чата SA:MP с возможностью задать ей произвольное поведение.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampRegisterChatCommand)**
---
---@param cmd string команда без символа '/'
---@param func fun(argument: string) функция-обработчик
---@return boolean result результат выполнения
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerNickname)**
---
---@param id number ID игрока
---@return string name ник
function sampGetPlayerNickname(id) end

---
--- Получает цвет игрока из scoreboard'a
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerColor)**
---
---@param id number ИД игрока.
---@return number color Цвет(ARGB).
function sampGetPlayerColor(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampConnectToServer)**
---
---@param ip string
---@param port number
function sampConnectToServer(ip, port) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCurrentServerAddress)**
---
---@return string ip
---@return number port
function sampGetCurrentServerAddress() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCurrentServerName)**
---
---@return string name
function sampGetCurrentServerName() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampShowDialog)**
---
---@param id number
---@param caption string
---@param text string
---@param button1 string
---@param button2 string
---@param style number
function sampShowDialog(id, caption, text, button1, button2, style) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampHasDialogRespond)**
---
---@param id number
---@return boolean result
---@return number button
---@return number list
---@return string input
function sampHasDialogRespond(id) end

---@param bs Bitstream
---@param amount number
function raknetBitStreamIgnoreBits(bs, amount) end

---@param bs Bitstream
---@param offset number
function raknetBitStreamSetWriteOffset(bs, offset) end

---@param bs Bitstream
---@param offset number
function raknetBitStreamSetReadOffset(bs, offset) end

---@param bs Bitstream
---@param value boolean
function raknetBitStreamWriteBool(bs, value) end

---@param bs Bitstream
---@param value number
function raknetBitStreamWriteInt8(bs, value) end

---@param bs Bitstream
---@param value number
function raknetBitStreamWriteInt16(bs, value) end

---@param bs Bitstream
---@param value number
function raknetBitStreamWriteInt32(bs, value) end

---@param bs Bitstream
---@param value number
function raknetBitStreamWriteFloat(bs, value) end

---@param bs Bitstream
---@param dest number
---@param size number
function raknetBitStreamWriteBuffer(bs, dest, size) end

---@param bs Bitstream
---@param size number
---@return string string
function raknetBitStreamDecodeString(bs, size) end

---@param bs Bitstream
---@param string string
function raknetBitStreamEncodeString(bs, string) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetSendRpcEx)**
---
---@param rpc number
---@param bs Bitstream
---@param priority number
---@param reliability number
---@param channel number
---@param timestamp boolean
function raknetSendRpcEx(rpc, bs, priority, reliability, channel, timestamp) end

---@param packet number
---@param bs Bitstream
---@param priority number
---@param reliability number
---@param channel number
function raknetSendBitStreamEx(bs, priority, reliability, channel) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampCreate3dText)**
---
---@param text string
---@param color number
---@param posX number
---@param posY number
---@param posZ number
---@param distance number
---@param ignoreWalls boolean
---@param playerId number
---@param vehicleId number
---@return number textlabel
function sampCreate3dText(text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampDestroy3dText)**
---
---@param textlabel number
function sampDestroy3dText(textlabel) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIs3dTextDefined)**
---
---@param _3dText number
---@return boolean result
function sampIs3dTextDefined(_3dText) end

---
--- Закрывает открытый диалог с указанием нажатой кнопки.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampCloseCurrentDialogWithButton)**
---
---@param button number номер кнопки
function sampCloseCurrentDialogWithButton(button) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogListItem)**
---
---@return number list
function sampGetCurrentDialogListItem() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogListItem)**
---
---@param list number
function sampSetCurrentDialogListItem(list) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogEditboxText)**
---
---@return string text
function sampGetCurrentDialogEditboxText() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetCurrentDialogEditboxText)**
---
---@param text string
function sampSetCurrentDialogEditboxText(text) end

---
--- Проверяет, активен ли любой SA:MP-диалог.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsDialogActive)**
---
---@return boolean result статус
function sampIsDialogActive() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogType)**
---
---@return number type
function sampGetCurrentDialogType() end

---
--- Возвращает ID последнего(открытого) диалогового окна
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCurrentDialogId)**
---
---@return number id ID диалогового окна
function sampGetCurrentDialogId() end

---
--- Возвращает текущий gamestate.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetGamestate)**
---
---@return GameState gamestate ID gamestate
function sampGetGamestate() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetObjectHandleBySampId)**
---
---@param id number
---@return Object object
function sampGetObjectHandleBySampId(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPickupHandleBySampId)**
---
---@param id number
---@return Pickup pickup
function sampGetPickupHandleBySampId(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetObjectSampIdByHandle)**
---
---@param object Object
---@return number objectId
function sampGetObjectSampIdByHandle(object) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPickupSampIdByHandle)**
---
---@param pickup Pickup
---@return number pickupId
function sampGetPickupSampIdByHandle(pickup) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetListboxItemsCount)**
---
---@return number count
function sampGetListboxItemsCount() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerAnimationId)**
---
---@param playerId number
---@return number animid
function sampGetPlayerAnimationId(playerId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetAnimationNameAndFile)**
---
---@param animid number
---@return string file
---@return string name
function sampGetAnimationNameAndFile(animid) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampFindAnimationIdByNameAndFile)**
---
---@param name string
---@param file string
---@return number id
function sampFindAnimationIdByNameAndFile(name, file) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getScreenResolution)**
---
---@return number resX
---@return number resY
function getScreenResolution() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetListboxItemText)**
---
---@param item number
---@return string text
function sampGetListboxItemText(item) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsPlayerPaused)**
---
---@param id number
---@return boolean result
function sampIsPlayerPaused(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampToggleCursor)**
---
---@param show boolean
function sampToggleCursor(show) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsLocalPlayerSpawned)**
---
---@return boolean result
function sampIsLocalPlayerSpawned() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerSpecialAction)**
---
---@param id number
---@return number action
function sampGetPlayerSpecialAction(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampUnregisterChatCommand)**
---
---@param cmd string
---@return boolean result
function sampUnregisterChatCommand(cmd) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsPlayerNpc)**
---
---@param id number
---@return boolean result
function sampIsPlayerNpc(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerScore)**
---
---@param id number
---@return number score
function sampGetPlayerScore(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetChatString)**
---
---@param id number
---@param text string
---@param prefix string
---@param color number
---@param pcolor number
function sampSetChatString(id, text, prefix, color, pcolor) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetChatString)**
---
---@param id number
---@return string text
---@return string prefix
---@return number color
---@return number pcolor
function sampGetChatString(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetChatInputText)**
---
---@param text string
function sampSetChatInputText(text) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetChatInputText)**
---
---@return string text
function sampGetChatInputText() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampfuncsLog)**
---
---@param msg string
function sampfuncsLog(msg) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetChatInputEnabled)**
---
---@param enabled boolean
function sampSetChatInputEnabled(enabled) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetRakclientInterface)**
---
---@return number rakclientPtr
function sampGetRakclientInterface() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetRakpeer)**
---
---@return number rakpeer
function sampGetRakpeer() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetRakclientFuncAddressByIndex)**
---
---@param index number
---@return number address
function sampGetRakclientFuncAddressByIndex(index) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetRpcCallbackByRpcId)**
---
---@param index number
---@return number callbackAddress
function sampGetRpcCallbackByRpcId(index) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetRpcNodeByRpcId)**
---
---@param index number
---@return number node
function sampGetRpcNodeByRpcId(index) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetSampInfoPtr)**
---
---@return number sampPtr
function sampGetSampInfoPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutCreateDialog)**
---
---@param name string
---@return DxutDialog dialog
function dxutCreateDialog(name) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutPopEvent)**
---
---@param dialog DxutDialog
---@return boolean result
---@return number event
---@return number id
function dxutPopEvent(dialog) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutAddButton)**
---
---@param dialog DxutDialog
---@param id number
---@param text string
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutAddButton(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutAddCheckbox)**
---
---@param dialog DxutDialog
---@param id number
---@param text string
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutAddCheckbox(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetDialogPos)**
---
---@param dialog DxutDialog
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutSetDialogPos(dialog, posX, posY, sizeX, sizeY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetDialogPosAndSize)**
---
---@param dialog DxutDialog
---@return number posX
---@return number posY
---@return number sizeX
---@return number sizeY
function dxutGetDialogPosAndSize(dialog) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetDialogVisible)**
---
---@param dialog DxutDialog
---@param visible boolean
function dxutSetDialogVisible(dialog, visible) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutIsDialogVisible)**
---
---@param dialog DxutDialog
---@return boolean result
function dxutIsDialogVisible(dialog) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutAddEditbox)**
---
---@param dialog DxutDialog
---@param id number
---@param text string
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutAddEditbox(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetControlText)**
---
---@param dialog DxutDialog
---@param id number
---@return string text
function dxutGetControlText(dialog, id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetSendRpc)**
---
---@param rpc number
---@param bs Bitstream
function raknetSendRpc(rpc, bs) end

---@param audio string
---@return AudioStream handle
function loadAudioStream(audio) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsCursorActive)**
---
---@return boolean result
function sampIsCursorActive() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetCursorMode)**
---
---@param mode number
function sampSetCursorMode(mode) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetCursorMode)**
---
---@return number mode
function sampGetCursorMode() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetControlVisible)**
---
---@param dialog DxutDialog
---@param id number
---@param visible boolean
function dxutSetControlVisible(dialog, id, visible) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutAddStatic)**
---
---@param dialog DxutDialog
---@param id number
---@param text string
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutAddStatic(dialog, id, text, posX, posY, sizeX, sizeY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutIsCheckboxChecked)**
---
---@param dialog DxutDialog
---@param id number
---@return boolean result
function dxutIsCheckboxChecked(dialog, id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetDialogBackgroundColor)**
---
---@param dialog DxutDialog
---@param color number
function dxutSetDialogBackgroundColor(dialog, color) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetControlText)**
---
---@param dialog DxutDialog
---@param id number
---@param text string
function dxutSetControlText(dialog, id, text) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutControlIsVisible)**
---
---@param dialog DxutDialog
---@param id number
---@return boolean result
function dxutControlIsVisible(dialog, id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutAddSlider)**
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetSliderValue)**
---
---@param dialog DxutDialog
---@param id number
---@return number value
function dxutGetSliderValue(dialog, id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetSliderValue)**
---
---@param dialog DxutDialog
---@param id number
---@param value number
function dxutSetSliderValue(dialog, id, value) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutAddListbox)**
---
---@param dialog DxutDialog
---@param id number
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
function dxutAddListbox(dialog, id, posX, posY, sizeX, sizeY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutListboxInsertItem)**
---
---@param dialog DxutDialog
---@param id number
---@param element string
---@param data number
---@param after number
function dxutListboxInsertItem(dialog, id, element, data, after) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetListboxSelectedItemAndCount)**
---
---@param dialog DxutDialog
---@param id number
---@return number element
---@return number count
function dxutGetListboxSelectedItemAndCount(dialog, id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutListboxDeleteItem)**
---
---@param dialog DxutDialog
---@param id number
---@param element number
function dxutListboxDeleteItem(dialog, id, element) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetListboxItemTextAndData)**
---
---@param dialog DxutDialog
---@param id number
---@param element number
---@return string text
---@return number data
function dxutGetListboxItemTextAndData(dialog, id, element) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutCheckboxSetChecked)**
---
---@param dialog DxutDialog
---@param id number
---@param checked boolean
function dxutCheckboxSetChecked(dialog, id, checked) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutEnableDialogCaption)**
---
---@param dialog DxutDialog
---@param enable boolean
function dxutEnableDialogCaption(dialog, enable) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutIsDialogCaptionEnabled)**
---
---@param dialog DxutDialog
---@return boolean result
function dxutIsDialogCaptionEnabled(dialog) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetDialogMinimized)**
---
---@param dialog DxutDialog
---@param minimized boolean
function dxutSetDialogMinimized(dialog, minimized) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutIsDialogMinimized)**
---
---@param dialog DxutDialog
---@return boolean result
function dxutIsDialogMinimized(dialog) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutDeleteControl)**
---
---@param dialog DxutDialog
---@param id number
function dxutDeleteControl(dialog, id) end

---@param font DxFont
---@param text string
---@param posX number
---@param posY number
---@param color number
---@param ignoreColorTags boolean
function renderFontDrawText(font, text, posX, posY, color, ignoreColorTags) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetFocusOnControl)**
---
---@param dialog DxutDialog
---@param id number
function dxutSetFocusOnControl(dialog, id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetControlSize)**
---
---@param dialog DxutDialog
---@param id number
---@param sizeX number
---@param sizeY number
function dxutSetControlSize(dialog, id, sizeX, sizeY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetControlSize)**
---
---@param dialog DxutDialog
---@param id number
---@return number sizeX
---@return number sizeY
function dxutGetControlSize(dialog, id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetControlPos)**
---
---@param dialog DxutDialog
---@param id number
---@param posX number
---@param posY number
function dxutSetControlPos(dialog, id, posX, posY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutGetControlPos)**
---
---@param dialog DxutDialog
---@param id number
---@return number posX
---@return number posY
function dxutGetControlPos(dialog, id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutSetCheckboxColor)**
---
---@param dialog DxutDialog
---@param id number
---@param color number
function dxutSetCheckboxColor(dialog, id, color) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/dxutIsDialogExists)**
---
---@param dialog DxutDialog
---@return boolean result
function dxutIsDialogExists(dialog) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetServerSettingsPtr)**
---
---@return number settingsPtr
function sampGetServerSettingsPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetSampPoolsPtr)**
---
---@return number poolsPtr
function sampGetSampPoolsPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetChatInfoPtr)**
---
---@return number chatPtr
function sampGetChatInfoPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetInputInfoPtr)**
---
---@return number inputPtr
function sampGetInputInfoPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetDialogInfoPtr)**
---
---@return number dialogPtr
function sampGetDialogInfoPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetKillInfoPtr)**
---
---@return number kill
function sampGetKillInfoPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetMiscInfoPtr)**
---
---@return number miscPtr
function sampGetMiscInfoPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetTextdrawPoolPtr)**
---
---@return number tdpoolPtr
function sampGetTextdrawPoolPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetObjectPoolPtr)**
---
---@return number objpoolPtr
function sampGetObjectPoolPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetGangzonePoolPtr)**
---
---@return number gzpoolPtr
function sampGetGangzonePoolPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetTextlabelPoolPtr)**
---
---@return number tlabelpoolPtr
function sampGetTextlabelPoolPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerPoolPtr)**
---
---@return number playerpoolPtr
function sampGetPlayerPoolPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetVehiclePoolPtr)**
---
---@return number vehpoolPtr
function sampGetVehiclePoolPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPickupPoolPtr)**
---
---@return number pickuppoolPtr
function sampGetPickupPoolPtr() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampStorePlayerOnfootData)**
---
---@param id number
---@param dstBuffer number
function sampStorePlayerOnfootData(id, dstBuffer) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampStorePlayerIncarData)**
---
---@param id number
---@param dstBuffer number
function sampStorePlayerIncarData(id, dstBuffer) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampStorePlayerPassengerData)**
---
---@param id number
---@param dstBuffer number
function sampStorePlayerPassengerData(id, dstBuffer) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampStorePlayerTrailerData)**
---
---@param id number
---@param dstBuffer number
function sampStorePlayerTrailerData(id, dstBuffer) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampStorePlayerAimData)**
---
---@param id number
---@param dstBuffer number
function sampStorePlayerAimData(id, dstBuffer) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendRconCommand)**
---
---@param cmd string
function sampSendRconCommand(cmd) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendOnfootData)**
---
---@param dataPtr number
function sampSendOnfootData(dataPtr) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendIncarData)**
---
---@param dataPtr number
function sampSendIncarData(dataPtr) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendPassengerData)**
---
---@param dataPtr number
function sampSendPassengerData(dataPtr) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendAimData)**
---
---@param dataPtr number
function sampSendAimData(dataPtr) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendBulletData)**
---
---@param dataPtr number
function sampSendBulletData(dataPtr) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendTrailerData)**
---
---@param dataPtr number
function sampSendTrailerData(dataPtr) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendUnoccupiedData)**
---
---@param dataPtr number
function sampSendUnoccupiedData(dataPtr) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendSpectatorData)**
---
---@param dataPtr number
function sampSendSpectatorData(dataPtr) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendClickPlayer)**
---
---@param id number
---@param source number
function sampSendClickPlayer(id, source) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendDialogResponse)**
---
---@param id number
---@param button number
---@param listitem number
---@param input string
function sampSendDialogResponse(id, button, listitem, input) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendClickTextdraw)**
---
---@param id number
function sampSendClickTextdraw(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendGiveDamage)**
---
---@param id number
---@param damage number
---@param weapon number
---@param bodypart number
function sampSendGiveDamage(id, damage, weapon, bodypart) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendTakeDamage)**
---
---@param id number
---@param damage number
---@param weapon number
---@param bodypart number
function sampSendTakeDamage(id, damage, weapon, bodypart) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendEditObject)**
---
---@param playerObject boolean
---@param objectId number
---@param response number
---@param posX number
---@param posY number
---@param posZ number
---@param rotX number
---@param rotY number
---@param rotZ number
function sampSendEditObject(playerObject, objectId, response, posX, posY, posZ, rotX, rotY, rotZ) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendEditAttachedObject)**
---
---@param response number
---@param index number
---@param model number
---@param bone number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotX number
---@param rotY number
---@param rotZ number
---@param scaleX number
---@param scaleY number
---@param scaleZ number
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendInteriorChange)**
---
---@param id number
function sampSendInteriorChange(id) end

---@return boolean foreground
function isGameWindowForeground() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendPickedUpPickup)**
---
---@param id number
function sampSendPickedUpPickup(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendMenuSelectRow)**
---
---@param id number
function sampSendMenuSelectRow(id) end

---@return number time
function localClock() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSendVehicleDestroyed)**
---
---@param id number
function sampSendVehicleDestroyed(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsScoreboardOpen)**
---
---@return boolean result
function sampIsScoreboardOpen() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampToggleScoreboard)**
---
---@param show boolean
function sampToggleScoreboard(show) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetDialogText)**
---
---@return string text
function sampGetDialogText() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetDialogCaption)**
---
---@return string caption
function sampGetDialogCaption() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetDialogClientside)**
---
---@param clientside boolean
function sampSetDialogClientside(clientside) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsDialogClientside)**
---
---@return boolean result
function sampIsDialogClientside() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsChatVisible)**
---
---@return boolean result
function sampIsChatVisible() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetChatDisplayMode)**
---
---@return number mode
function sampGetChatDisplayMode() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetChatDisplayMode)**
---
---@param mode number
function sampSetChatDisplayMode(mode) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/pauseScmThread)**
---
---@param thread number
function pauseScmThread(thread) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/resumeScmThread)**
---
---@param thread number
function resumeScmThread(thread) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBool)**
---
---@param bs Bitstream
---@return boolean value
function raknetBitStreamReadBool(bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt8)**
---
---@param bs Bitstream
---@return number value
function raknetBitStreamReadInt8(bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt16)**
---
---@param bs Bitstream
---@return number value
function raknetBitStreamReadInt16(bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadInt32)**
---
---@param bs Bitstream
---@return number value
function raknetBitStreamReadInt32(bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadFloat)**
---
---@param bs Bitstream
---@return number value
function raknetBitStreamReadFloat(bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadBuffer)**
---
---@param bs Bitstream
---@param dest number
---@param size number
function raknetBitStreamReadBuffer(bs, dest, size) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamReadString)**
---
---@param bs Bitstream
---@param size number
---@return string value
function raknetBitStreamReadString(bs, size) end

---@param posX number
---@param posY number
---@param posZ number
---@param radius number
---@param findNext boolean
---@param skipDead boolean
---@return boolean result
---@return Ped ped
function findAllRandomCharsInSphere(posX, posY, posZ, radius, findNext, skipDead) end

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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamIgnoreBits)**
---
---@param bs Bitstream
---@param amount number
function raknetBitStreamIgnoreBits(bs, amount) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetWriteOffset)**
---
---@param bs Bitstream
---@param offset number
function raknetBitStreamSetWriteOffset(bs, offset) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamSetReadOffset)**
---
---@param bs Bitstream
---@param offset number
function raknetBitStreamSetReadOffset(bs, offset) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBitsUsed)**
---
---@param bs Bitstream
---@return number value
function raknetBitStreamGetNumberOfBitsUsed(bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfBytesUsed)**
---
---@param bs Bitstream
---@return number value
function raknetBitStreamGetNumberOfBytesUsed(bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetNumberOfUnreadBits)**
---
---@param bs Bitstream
---@return number value
function raknetBitStreamGetNumberOfUnreadBits(bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetWriteOffset)**
---
---@param bs Bitstream
---@return number value
function raknetBitStreamGetWriteOffset(bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetReadOffset)**
---
---@param bs Bitstream
---@return number value
function raknetBitStreamGetReadOffset(bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamGetDataPtr)**
---
---@param bs Bitstream
---@return number value
function raknetBitStreamGetDataPtr(bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamDecodeString)**
---
---@param bs Bitstream
---@param size number
---@return string string
function raknetBitStreamDecodeString(bs, size) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetBitStreamEncodeString)**
---
---@param bs Bitstream
---@param string string
function raknetBitStreamEncodeString(bs, string) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetEmulRpcReceiveBitStream)**
---
---@param rpc number
---@param bs Bitstream
function raknetEmulRpcReceiveBitStream(rpc, bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetEmulPacketReceiveBitStream)**
---
---@param packet number
---@param bs Bitstream
function raknetEmulPacketReceiveBitStream(packet, bs) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetGetRpcName)**
---
---@param rpc number
---@return string name
function raknetGetRpcName(rpc) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/raknetGetPacketName)**
---
---@param packet number
---@return string name
function raknetGetPacketName(packet) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setSampfuncsGlobalVar)**
---
---@param var string
---@param value number
---@return boolean result
function setSampfuncsGlobalVar(var, value) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVar)**
---
---@param var string
---@return boolean result
---@return number value
function getSampfuncsGlobalVar(var) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampCreate3dTextEx)**
---
---@param id number
---@param text string
---@param color number
---@param posX number
---@param posY number
---@param posZ number
---@param distance number
---@param ignoreWalls boolean
---@param playerId number
---@param vehicleId number
function sampCreate3dTextEx(id, text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGet3dTextInfoById)**
---
---@param id number
---@return string string
---@return number color
---@return number posX
---@return number posY
---@return number posZ
---@return number distance
---@return boolean ignoreWalls
---@return number playerId
---@return number vehicleId
function sampGet3dTextInfoById(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSet3dTextString)**
---
---@param id number
---@param text string
function sampSet3dTextString(id, text) end

---
--- Создает текстдрав c заданными параметрами.
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawCreate)**
---
---@param id number ID текстдрава
---@param text string текст текстдрава
---@param posX number координата X текстдрава
---@param posY number координата Y текстдрава
function sampTextdrawCreate(id, text, posX, posY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetBoxColorAndSize)**
---
---@param id number
---@param box number
---@param color number
---@param sizeX number
---@param sizeY number
function sampTextdrawSetBoxColorAndSize(id, box, color, sizeX, sizeY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetAlign)**
---
---@param id number
---@param align number
function sampTextdrawSetAlign(id, align) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetProportional)**
---
---@param id number
---@param proportional number
function sampTextdrawSetProportional(id, proportional) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetStyle)**
---
---@param id number
---@param style number
function sampTextdrawSetStyle(id, style) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetShadow)**
---
---@param id number
---@param shadow number
---@param color number
function sampTextdrawSetShadow(id, shadow, color) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetOutlineColor)**
---
---@param id number
---@param outline number
---@param color number
function sampTextdrawSetOutlineColor(id, outline, color) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetModelRotationZoomVehColor)**
---
---@param id number
---@param model number
---@param rotX number
---@param rotY number
---@param rotZ number
---@param zoom number
---@param clr1 number
---@param clr2 number
function sampTextdrawSetModelRotationZoomVehColor(id, model, rotX, rotY, rotZ, zoom, clr1, clr2) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetString)**
---
---@param id number
---@param text string
function sampTextdrawSetString(id, text) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetPos)**
---
---@param id number
---@param posX number
---@param posY number
function sampTextdrawSetPos(id, posX, posY) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawSetLetterSizeAndColor)**
---
---@param id number
---@param letSizeX number
---@param letSizeY number
---@param color number
function sampTextdrawSetLetterSizeAndColor(id, letSizeX, letSizeY, color) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetBoxEnabledColorAndSize)**
---
---@param id number
---@return number box
---@return number color
---@return number sizeX
---@return number sizeY
function sampTextdrawGetBoxEnabledColorAndSize(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetAlign)**
---
---@param id number
---@return number align
function sampTextdrawGetAlign(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetProportional)**
---
---@param id number
---@return number prop
function sampTextdrawGetProportional(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetStyle)**
---
---@param id number
---@return number style
function sampTextdrawGetStyle(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetShadowColor)**
---
---@param id number
---@return number shadow
---@return number color
function sampTextdrawGetShadowColor(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetOutlineColor)**
---
---@param id number
---@return number outline
---@return number color
function sampTextdrawGetOutlineColor(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetModelRotationZoomVehColor)**
---
---@param id number
---@return number model
---@return number rotX
---@return number rotY
---@return number rotZ
---@return number zoom
---@return number clr1
---@return number clr2
function sampTextdrawGetModelRotationZoomVehColor(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetString)**
---
---@param id number
---@return string text
function sampTextdrawGetString(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetPos)**
---
---@param id number
---@return number posX
---@return number posY
function sampTextdrawGetPos(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawGetLetterSizeAndColor)**
---
---@param id number
---@return number letSizeX
---@return number letSizeY
---@return number color
function sampTextdrawGetLetterSizeAndColor(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawIsExists)**
---
---@param id number
---@return boolean result
function sampTextdrawIsExists(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampTextdrawDelete)**
---
---@param id number
function sampTextdrawDelete(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isSampfuncsGlobalVarDefined)**
---
---@param var string
---@return boolean result
function isSampfuncsGlobalVarDefined(var) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getSampfuncsGlobalVarAccessForThread)**
---
---@param var string
---@param thread number
---@return boolean read
---@return boolean write
function getSampfuncsGlobalVarAccessForThread(var, thread) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/runSampfuncsConsoleCommand)**
---
---@param cmd string
function runSampfuncsConsoleCommand(cmd) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampfuncsRegisterConsoleCommand)**
---
---@param cmd string
---@param func function
---@return boolean result
function sampfuncsRegisterConsoleCommand(cmd, func) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampfuncsUnregisterConsoleCommand)**
---
---@param cmd string
---@return boolean result
function sampfuncsUnregisterConsoleCommand(cmd) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/createScmThreadAtPointer)**
---
---@param pointer number
---@param args table
---@return number thread
function createScmThreadAtPointer(pointer, args) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setScmThreadLocalVar)**
---
---@param thread number
---@param var number
---@param value any
function setScmThreadLocalVar(thread, var, value) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getScmThreadLocalVar)**
---
---@param thread number
---@param var number
---@return number value
function getScmThreadLocalVar(thread, var) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/destroyScmThread)**
---
---@param thread number
function destroyScmThread(thread) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/restartScmThread)**
---
---@param thread number
---@param args table
function restartScmThread(thread, args) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleActive)**
---
---@return boolean result
function isSampfuncsConsoleActive() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampSetClientCommandDescription)**
---
---@param cmd string
---@param text string
function sampSetClientCommandDescription(cmd, text) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/setSampfuncsConsoleCommandDescription)**
---
---@param cmd string
---@param text string
function setSampfuncsConsoleCommandDescription(cmd, text) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampForceVehicleSync)**
---
---@param id number
function sampForceVehicleSync(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampForceUnoccupiedSyncSeatId)**
---
---@param id number
---@param seatId number
function sampForceUnoccupiedSyncSeatId(id, seatId) end

---@param show boolean
---@param lockControls boolean
function showCursor(show, lockControls) end

---@param lock boolean
function lockPlayerControl(lock) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampForceTrailerSync)**
---
---@param id number
function sampForceTrailerSync(id) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampForcePassengerSyncSeatId)**
---
---@param id number
---@param seatId number
function sampForcePassengerSyncSeatId(id, seatId) end

---@param x number
---@param y number
---@param z number
---@return boolean result
function setTargetBlipCoordinates(x, y, z) end

---@param x number
---@param y number
---@param z number
---@return boolean result
function placeWaypoint(x, y, z) end

---
--- Возвращает максимальный SAMP ид игрока на сервере/в зоне прорисовки (стриме)
---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetMaxPlayerId)**
---
---@param streamed boolean Поиск в стриме
---@return number id ID игрока
function sampGetMaxPlayerId(streamed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampGetPlayerCount)**
---
---@param streamed boolean
---@return number count
function sampGetPlayerCount(streamed) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampProcessChatInput)**
---
---@param text string
function sampProcessChatInput(text) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/sampIsChatCommandDefined)**
---
---@param cmd string
---@return boolean result
function sampIsChatCommandDefined(cmd) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/isSampfuncsConsoleCommandDefined)**
---
---@param cmd string
---@return boolean result
function isSampfuncsConsoleCommandDefined(cmd) end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/getCleoLibraryVersion)**
---
---@return number version
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
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/main)**
---
function main() end

---
--- **[Open the wiki](https://wiki.blast.hk/moonloader/lua/PLAYER_PED)**
---
---@type Ped
PLAYER_PED = {}

---@param index number
---@return number value
function getGameGlobalFloat(index) end

---@param index number
---@param value number
function setGameGlobalFloat(index, value) end

--- Use
---```lua
---local moonloader = require('moonloader')
---```
-- FIXME: moonloader not global value
moonloader = {
	TAG = {
		TYPE_INFO = 1,
		TYPE_DEBUG = 2,
		TYPE_ERROR = 3,
		TYPE_WARN = 4,
		TYPE_SYSTEM = 5,
		TYPE_FATAL = 6,
		TYPE_EXCEPTION = 7,
	},
	download_status = {
		STATUS_FINDINGRESOURCE = 1,
		STATUS_CONNECTING = 2,
		STATUS_REDIRECTING = 3,
		STATUS_BEGINDOWNLOADDATA = 4,
		STATUS_DOWNLOADINGDATA = 5,
		STATUS_ENDDOWNLOADDATA = 6,
		STATUS_BEGINDOWNLOADCOMPONENTS = 7,
		STATUS_INSTALLINGCOMPONENTS = 8,
		STATUS_ENDDOWNLOADCOMPONENTS = 9,
		STATUS_USINGCACHEDCOPY = 10,
		STATUS_SENDINGREQUEST = 11,
		STATUS_CLASSIDAVAILABLE = 12,
		STATUS_MIMETYPEAVAILABLE = 13,
		STATUS_CACHEFILENAMEAVAILABLE = 14,
		STATUS_BEGINSYNCOPERATION = 15,
		STATUS_ENDSYNCOPERATION = 16,
		STATUS_BEGINUPLOADDATA = 17,
		STATUS_UPLOADINGDATA = 18,
		STATUS_ENDUPLOADDATA = 19,
		STATUS_PROTOCOLCLASSID = 20,
		STATUS_ENCODING = 21,
		STATUS_VERIFIEDMIMETYPEAVAILABLE = 22,
		STATUS_CLASSINSTALLLOCATION = 23,
		STATUS_DECODING = 24,
		STATUS_LOADINGMIMEHANDLER = 25,
		STATUS_CONTENTDISPOSITIONATTACH = 26,
		STATUS_FILTERREPORTMIMETYPE = 27,
		STATUS_CLSIDCANINSTANTIATE = 28,
		STATUS_IUNKNOWNAVAILABLE = 29,
		STATUS_DIRECTBIND = 30,
		STATUS_RAWMIMETYPE = 31,
		STATUS_PROXYDETECTING = 32,
		STATUS_ACCEPTRANGES = 33,
		STATUS_COOKIE_SENT = 34,
		STATUS_COMPACT_POLICY_RECEIVED = 35,
		STATUS_COOKIE_SUPPRESSED = 36,
		STATUS_COOKIE_STATE_UNKNOWN = 37,
		STATUS_COOKIE_STATE_ACCEPT = 38,
		STATUS_COOKIE_STATE_REJECT = 39,
		STATUS_COOKIE_STATE_PROMPT = 40,
		STATUS_COOKIE_STATE_LEASH = 41,
		STATUS_COOKIE_STATE_DOWNGRADE = 42,
		STATUS_POLICY_HREF = 43,
		STATUS_P3P_HEADER = 44,
		STATUS_SESSION_COOKIE_RECEIVED = 45,
		STATUS_PERSISTENT_COOKIE_RECEIVED = 46,
		STATUS_SESSION_COOKIES_ALLOWED = 47,
		STATUS_CACHECONTROL = 48,
		STATUS_CONTENTDISPOSITIONFILENAME = 49,
		STATUS_MIMETEXTPLAINMISMATCH = 50,
		STATUS_PUBLISHERAVAILABLE = 51,
		STATUS_DISPLAYNAMEAVAILABLE = 52,
		STATUS_SSLUX_NAVBLOCKED = 53,
		STATUS_SERVER_MIMETYPEAVAILABLE = 54,
		STATUS_SNIFFED_CLASSIDAVAILABLE = 55,
		STATUS_64BIT_PROGRESS = 56,
		STATUSEX_STARTBINDING = 57,
		STATUSEX_ENDDOWNLOAD = 58,
		STATUSEX_LOWRESOURCE = 59,
		STATUSEX_DATAAVAILABLE = 60,
	},
	font_flags = {
		NONE = 0x0,
		BOLD = 0x1,
		ITALICS = 0x2,
		BORDER = 0x4,
		SHADOW = 0x8,
		UNDERLINE = 0x10,
		STRIKEOUT = 0x20,
	},
	d3d_prim_type = {
		POINTLIST = 1,
		LINELIST = 2,
		LINESTRIP = 3,
		TRIANGLELIST = 4,
		TRIANGLESTRIP = 5,
		TRIANGLEFAN = 6,
	},
	audiostream_state = {
		STOP = 0,
		PLAY = 1,
		PAUSE = 2,
		RESUME = 3,
	},
	audiostream_status = {
		STOPPED = -1,
		PLAYING = 1,
		PAUSED = 2,
	},
}
