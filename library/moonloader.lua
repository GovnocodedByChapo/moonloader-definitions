---@meta
---@diagnostic disable: missing-return

--// by chapo
-- FIXME: Fix optional types, as is done in renderCreateFont

---@class Ped
---@class Model
---@class Vehicle
---@class AudioStream
---@class DxFont
---@class Checkpoint
---@class Player
---@class Object
---@class VarId
---@class Marker
---@class Particle
---@class Pickup
---@class GxtString
---@class Searchlight
---@class DxutDialog
---@class Filesearch
---@class DxTexture
---@class Bitstream

---@type Ped
PLAYER_PED = nil
---@type Player
PLAYER_HANDLE = nil
---@deprecated
---@type Ped
playerPed = nil
---@deprecated
---@type Player
playerHandle = nil

--// FUNCTIONS

---@return boolean result
function isCursorActive() end

---@return Pickup[] pickups
function getAllPickups() end

---@return number handle
function getPickupPointerHandle() end

---@param pickup Pickup
---@return number pointer
function getPickupPointer(pickup) end

---@param pickup Pickup
---@return number type
function getPickupType(pickup) end

---@param pickup Pickup
---@return number model
function getPickupModel(pickup) end

---@param shake number
function shakeCam(shake) end

---@param modelId Model
---@param atX number
---@param atY number
---@param atZ number
---@return Player player
function createPlayer(modelId, atX, atY, atZ) end

---asdhttps://wiki.blast.hk/moonloader/lua/getAllPickups
---@param pedtype number
---@param modelId Model
---@param atX number
---@param atY number
---@param atZ number
---@return Ped ped
function createChar(pedtype, modelId, atX, atY, atZ) end

---Lua: https://wiki.blast.hk/moonloader/lua/getAllPickups
---Cleo: https://wiki.blast.hk/gta-sa/opcodes/0001
---@param ped Ped
function deleteChar(ped) end

---@param ped Ped
---@return number positionX
---@return number positionY
---@return number positionZ
function getCharCoordinates(ped) end

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

---@param modelId Model
---@param atX number
---@param atY number
---@param atZ number
---@return Vehicle car
function createCar(modelId, atX, atY, atZ) end

---@param car Vehicle
function deleteCar(car) end

---@param car Vehicle
---@param driveToX number
---@param driveToY number
---@param driveToZ number
function carGotoCoordinates(car, driveToX, driveToY, driveToZ) end

---@param car Vehicle
function carWanderRandomly(car) end

---@param car Vehicle
function carSetIdle(car) end

---@param car Vehicle
---@return number positionX
---@return number positionY
---@return number positionZ
function getCarCoordinates(car) end

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

---@param gxtString GxtString
---@param time number
---@param style number
function printBig(gxtString, time, style) end

---@param gxtString GxtString
---@param time number
---@param flag number
function printText(gxtString, time, flag) end

---@param gxtString GxtString
---@param time number
---@param flag number
function printTextNow(gxtString, time, flag) end

function clearPrints() end

---@return number hours
---@return number mins
function getTimeOfDay() end

---@param hours number
---@param minutes number
function setTimeOfDay(hours, minutes) end

---@param hours number
---@param minutes number
---@return number minutes
function getMinutesToTimeOfDay(hours, minutes) end

---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radius number
---@return boolean result
function isPointOnScreen(sphereX, sphereY, sphereZ, radius) end

---@param ped Ped
---@return Vehicle car
function storeCarCharIsIn(ped) end

---@param ped Ped
---@param car Vehicle
---@return boolean result
function isCharInCar(ped, car) end

---@param ped Ped
---@param carModel Model
---@return boolean result
function isCharInModel(ped, carModel) end

---@param ped Ped
---@return boolean result
function isCharInAnyCar(ped) end

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

---@param ped Ped
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateStoppedCharAnyMeans2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---@param ped Ped
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateStoppedCharOnFoot2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---@param ped Ped
---@param pointX number
---@param pointY number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateStoppedCharInCar2d(ped, pointX, pointY, radiusX, radiusY, sphere) end

---@param ped Ped
---@param nearPed Ped
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansChar2d(ped, nearPed, radiusX, radiusY, sphere) end

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

---@param modelId Model
---@param atX number
---@param atY number
---@param atZ number
---@return Object object
function createObject(modelId, atX, atY, atZ) end

---@param object Object
function deleteObject(object) end

---@param player Player
---@param money number
function givePlayerMoney(player, money) end

---@param player Player
---@return number money
function getPlayerMoney(player) end

---@param player Player
---@param float2 number
---@param float3 number
---@param float4 number
function giveRemoteControlledCarToPlayer(player, float2, float3, float4) end

---@param player Player
---@param wantedLevel number
function alterWantedLevel(player, wantedLevel) end

---@param player Player
---@param minimumWantedLevel number
function alterWantedLevelNoDrop(player, minimumWantedLevel) end

---@param player Player
---@param level number
---@return boolean result
function isWantedLevelGreater(player, level) end

---@param player Player
function clearWantedLevel(player) end

---@param value boolean
function setDeatharrestState(value) end

---@return boolean result
function hasDeatharrestBeenExecuted() end

---@param ped Ped
---@param weapon number
---@param ammo number
function addAmmoToChar(ped, weapon, ammo) end

---@param player Player
---@return boolean result
function isPlayerDead(player) end

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

---@param carGenerator number
---@param carsToGenerate number
function switchCarGenerator(carGenerator, carsToGenerate) end

---@param var VarId
---@param countInDirection boolean
function displayOnscreenTimer(var, countInDirection) end

---@param var VarId
function clearOnscreenTimer(var) end

---@param var VarId
function clearOnscreenCounter(var) end

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

function restoreCamera() end

---@param player Player
---@param time number
---@param intensity number
function shakePad(player, time, intensity) end

---@param gamespeed number
function setTimeScale(gamespeed) end

---@param positionX number
---@param positionY number
---@param positionZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function setFixedCameraPosition(positionX, positionY, positionZ, rotationX, rotationY, rotationZ) end

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

---@param marker Marker
function removeBlip(marker) end

---@param marker Marker
---@param color number
function changeBlipColour(marker, color) end

---@param atX number
---@param atY number
---@param atZ number
---@param color number
---@param flag number
---@return Marker marker
function addBlipForCoordOld(atX, atY, atZ, color, flag) end

---@param marker Marker
---@param size number
function changeBlipScale(marker, size) end

---@param r number
---@param g number
---@param b number
function setFadingColour(r, g, b) end

---@param _in boolean
---@param time number
function doFade(_in, time) end

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

---@param atX number
---@param atY number
---@param atZ number
---@param angle number
function overrideNextRestart(atX, atY, atZ, angle) end

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

---@param ped Ped
---@return number angle
function getCharHeading(ped) end

---@param ped Ped
---@param angle number
function setCharHeading(ped, angle) end

---@param car Vehicle
---@return number angle
function getCarHeading(car) end

---@param car Vehicle
---@param angle number
function setCarHeading(car, angle) end

---@param object Object
---@return number angle
function getObjectHeading(object) end

---@param object Object
---@param angle number
function setObjectHeading(object, angle) end

---@param ped Ped
---@param object Object
---@return boolean result
function isCharTouchingObject(ped, object) end

---@param ped Ped
---@param weapon number
---@param ammo number
function setCharAmmo(ped, weapon, ammo) end

---@param flag VarId
function declareMissionFlag(flag) end

---@param car Vehicle
---@return Marker marker
function addBlipForCar(car) end

---@param ped Ped
---@return Marker marker
function addBlipForChar(ped) end

---@param object Object
---@return Marker marker
function addBlipForObject(object) end

---@param atX number
---@param atY number
---@param atZ number
---@return Checkpoint checkpoint
function addBlipForCoord(atX, atY, atZ) end

---@param marker Marker
---@param mode number
function changeBlipDisplay(marker, mode) end

---@param atX number
---@param atY number
---@param atZ number
---@param sound number
function addOneOffSound(atX, atY, atZ, sound) end

---@param atX number
---@param atY number
---@param atZ number
---@param sound number
---@return number unk
function addContinuousSound(atX, atY, atZ, sound) end

---@param sound number
function removeSound(sound) end

---@param car Vehicle
---@return boolean result
function isCarStuckOnRoof(car) end

---@param car Vehicle
function addUpsidedownCarCheck(car) end

---@param car Vehicle
function removeUpsidedownCarCheck(car) end

---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isCharInAreaOnFoot2d(ped, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

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

---@param ped Ped
---@param weapon number
---@param ammo number
function giveWeaponToChar(ped, weapon, ammo) end

---@param player Player
---@param canMove boolean
---@return boolean result
function setPlayerControl(player, canMove) end

---@param weather number
---@return boolean result
function forceWeather(weather) end

---@param weather number
---@return boolean result
function forceWeatherNow(weather) end

function releaseWeather() end

---@param ped Ped
---@param weapon number
function setCurrentCharWeapon(ped, weapon) end

---@param object Object
---@return boolean result
---@return number positionX
---@return number positionY
---@return number positionZ
function getObjectCoordinates(object) end

---@param object Object
---@param atX number
---@param atY number
---@param atZ number
---@return boolean result
function setObjectCoordinates(object, atX, atY, atZ) end

---@return number timeMs
function getGameTimer() end

---@param player Player
---@return boolean result
---@return number level
function storeWantedLevel(player) end

---@param car Vehicle
---@return boolean result
function isCarStopped(car) end

---@param ped Ped
function markCharAsNoLongerNeeded(ped) end

---@param car Vehicle
function markCarAsNoLongerNeeded(car) end

---@param object Object
function markObjectAsNoLongerNeeded(object) end

---@param ped Ped
function dontRemoveChar(ped) end

---@param object Object
function dontRemoveObject(object) end

---@param car Vehicle
---@param pedtype Model
---@param model number
---@param passengerSeat number
---@return boolean result
---@return Ped ped
function createCharAsPassenger(car, pedtype, model, passengerSeat) end

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

---@param gxtString GxtString
---@param number number
---@param time number
---@param flag number
---@return boolean result
function printWithNumberNow(gxtString, number, time, flag) end

---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@return boolean result
function switchRoadsOn(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchRoadsOff(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

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

---@param car Vehicle
---@param heavy boolean
---@return boolean result
function setCarHeavy(car, heavy) end

---@param level number
function setMaxWantedLevel(level) end

---@param car Vehicle
---@return boolean result
function isCarInAirProper(car) end

---@param car Vehicle
---@return boolean result
function isCarUpsidedown(car) end

---@param player Player
---@return boolean result
---@return Ped ped
function getPlayerChar(player) end

---@return boolean result
function cancelOverrideRestart() end

---@param player Player
---@param ignored boolean
---@return boolean result
function setPoliceIgnorePlayer(player, ignored) end

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

---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param flag boolean
---@return boolean result
function locateCharOnFootCar2d(ped, car, radiusX, radiusY, flag) end

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
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param flag boolean
---@return boolean result
function locateCharOnFootCar3d(ped, car, radiusX, radiusY, radiusZ, flag) end

---@param ped Ped
---@param car Vehicle
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@param flag boolean
---@return boolean result
function locateCharInCarCar3d(ped, car, radiusX, radiusY, radiusZ, flag) end

---@param car Vehicle
---@param status number
function lockCarDoors(car, status) end

---@param car Vehicle
---@return boolean result
function explodeCar(car) end

---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@return boolean result
function addExplosion(atX, atY, atZ, radius) end

---@param car Vehicle
---@return boolean result
function isCarUpright(car) end

---@param modelId Model
---@param type number
---@param atX number
---@param atY number
---@param atZ number
---@return boolean result
---@return Pickup pickup
function createPickup(modelId, type, atX, atY, atZ) end

---@param pickup Pickup
---@return boolean result
function hasPickupBeenCollected(pickup) end

---@param pickup Pickup
---@return boolean result
function removePickup(pickup) end

---@param taxi Vehicle
---@param light boolean
---@return boolean result
function setTaxiLights(taxi, light) end

---@param gxtString GxtString
---@param time number
---@param style number
---@return boolean result
function printBigQ(gxtString, time, style) end

---@param garage GxtString
---@param car Vehicle
---@return boolean result
function setTargetCarForMissionGarage(garage, car) end

---@param player Player
---@param apply boolean
---@return boolean result
function applyBrakesToPlayersCar(player, apply) end

---@param ped Ped
---@param health number
function setCharHealth(ped, health) end

---@param car Vehicle
---@param health number
function setCarHealth(car, health) end

---@param ped Ped
---@return number health
function getCharHealth(ped) end

---@param car Vehicle
---@return number health
function getCarHealth(car) end

---@param car Vehicle
---@param primaryColor number
---@param secondaryColor number
---@return boolean result
function changeCarColour(car, primaryColor, secondaryColor) end

---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchPedRoadsOn(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchPedRoadsOff(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---@param gang number
---@param weapons1 number
---@param weapons2 number
---@param weapons3 number
function setGangWeapons(gang, weapons1, weapons2, weapons3) end

---@param ped Ped
---@param object Object
---@return boolean result
function isCharTouchingObjectOnFoot(ped, object) end

---@param gxtString GxtString
---@param id number
function loadSpecialCharacter(gxtString, id) end

---@param id number
---@return boolean result
function hasSpecialCharacterLoaded(id) end

---@param player Player
---@return boolean result
function isPlayerInRemoteMode(player) end

---@param posX number
---@param posY number
---@param posZ number
function setCutsceneOffset(posX, posY, posZ) end

---@param ped Ped
---@param style string
function setAnimGroupForChar(ped, style) end

---@param modelId Model
function requestModel(modelId) end

---@param modelId Model
---@return boolean result
function hasModelLoaded(modelId) end

---@param modelId Model
function markModelAsNoLongerNeeded(modelId) end

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

function storeClock() end

function restoreClock() end

---@param player Player
---@return boolean result
function isPlayerPlaying(player) end

---@return number mode
function getControllerMode() end

---@param car Vehicle
---@param sprayable boolean
function setCanResprayCar(car, sprayable) end

---@param id number
function unloadSpecialCharacter(id) end

---@param player Player
function resetNumOfModelsKilledByPlayer(player) end

---@param player Player
---@param modelId Model
---@return number quantity
function getNumOfModelsKilledByPlayer(player, modelId) end

---@param garage GxtString
function activateGarage(garage) end

---@param modelId Model
---@param atX number
---@param atY number
---@param atZ number
---@return Object object
function createObjectNoOffset(modelId, atX, atY, atZ) end

---@param ped Ped
---@return boolean result
function isCharStopped(ped) end

---@param enable boolean
function switchWidescreen(enable) end

---@param atX number
---@param atY number
---@param atZ number
---@param icon number
---@return Marker marker
function addSpriteBlipForContactPoint(atX, atY, atZ, icon) end

---@param atX number
---@param atY number
---@param atZ number
---@param type number
---@return Marker marker
function addSpriteBlipForCoord(atX, atY, atZ, type) end

---@param ped Ped
---@param enabled boolean
function setCharOnlyDamagedByPlayer(ped, enabled) end

---@param car Vehicle
---@param enabled boolean
function setCarOnlyDamagedByPlayer(car, enabled) end

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

---@param garage GxtString
function deactivateGarage(garage) end

---@param car Vehicle
---@return boolean result
function isCarInWater(car) end

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

---@param car Vehicle
---@param toX number
---@param toY number
---@param toZ number
function carGotoCoordinatesAccurate(car, toX, toY, toZ) end

---@param car Vehicle
---@return boolean result
function isCarOnScreen(car) end

---@param ped Ped
---@return boolean result
function isCharOnScreen(ped) end

---@param object Object
---@return boolean result
function isObjectOnScreen(object) end

---@param atX number
---@param atY number
---@param atZ number
---@return number z
function getGroundZFor3dCoord(atX, atY, atZ) end

---@param atX number
---@param atY number
---@param atZ number
---@param propagation number
---@param size number
---@return number fire
function startScriptFire(atX, atY, atZ, propagation, size) end

---@param fire number
---@return boolean result
function isScriptFireExtinguished(fire) end

---@param fire number
function removeScriptFire(fire) end

---@param boat Vehicle
---@param toX number
---@param toY number
---@param toZ number
function boatGotoCoords(boat, toX, toY, toZ) end

---@param car Vehicle
function boatStop(car) end

---@param ped Ped
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param weapon number
---@return boolean result
function isCharShootingInArea(ped, cornerAX, cornerAY, cornerBX, cornerBY, weapon) end

---@param ped Ped
---@param weapon number
---@return boolean result
function isCurrentCharWeapon(ped, weapon) end

---@param boat Vehicle
---@param speed number
function setBoatCruiseSpeed(boat, speed) end

---@param zone GxtString
---@param pedtype boolean
---@param gang boolean
---@param criminal_prostitute boolean
---@return Ped ped
function getRandomCharInZone(zone, pedtype, gang, criminal_prostitute) end

---@param ped Ped
---@return boolean result
function isCharShooting(ped) end

---@param atX number
---@param atY number
---@param atZ number
---@param cash number
---@param permanenceFlag boolean
---@return Pickup pickup
function createMoneyPickup(atX, atY, atZ, cash, permanenceFlag) end

---@param ped Ped
---@param accuracy number
function setCharAccuracy(ped, accuracy) end

---@param car Vehicle
---@return number speed
function getCarSpeed(car) end

---@param cutscene GxtString
function loadCutscene(cutscene) end

---@param modelId Model
---@return Object object
function createCutsceneObject(modelId) end

---@param cutscene number
---@param anim GxtString
function setCutsceneAnim(cutscene, anim) end

function startCutscene() end

---@return number time
function getCutsceneTime() end

---@return boolean result
function hasCutsceneFinished() end

function clearCutscene() end

function restoreCameraJumpcut() end

---@param total number
function setCollectable1Total(total) end

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

---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param time number
---@param flag number
function printWith2NumbersNow(gxtString, numbers1, numbers2, time, flag) end

---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param numbers3 number
---@param time number
---@param flag number
function printWith3Numbers(gxtString, numbers1, numbers2, numbers3, time, flag) end

---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param numbers3 number
---@param numbers4 number
---@param time number
---@param flag number
function printWith4Numbers(gxtString, numbers1, numbers2, numbers3, numbers4, time, flag) end

---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param numbers3 number
---@param numbers4 number
---@param time number
---@param flag number
function printWith4NumbersNow(gxtString, numbers1, numbers2, numbers3, numbers4, time, flag) end

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

---@param progress number
function playerMadeProgress(progress) end

---@param maxProgress number
function setProgressTotal(maxProgress) end

function registerMissionGiven() end

---@param mission GxtString
function registerMissionPassed(mission) end

function removeAllScriptFires() end

---@param ped Ped
---@param weapon number
---@return boolean result
function hasCharBeenDamagedByWeapon(ped, weapon) end

---@param car Vehicle
---@param weapon number
---@return boolean result
function hasCarBeenDamagedByWeapon(car, weapon) end

---@param ped Ped
function explodeCharHead(ped) end

---@param boat Vehicle
---@param anchor boolean
function anchorBoat(boat, anchor) end

---@param car Vehicle
---@return number fire
function startCarFire(car) end

---@param ped Ped
---@return number fire
function startCharFire(ped) end

---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param modelId Model
---@return Vehicle car
function getRandomCarOfTypeInArea(cornerAX, cornerAY, cornerBX, cornerBY, modelId) end

---@param car Vehicle
---@return boolean result
function hasResprayHappened(car) end

---@param mode number
function setCameraZoom(mode) end

---@param modelId Model
---@param type number
---@param ammo number
---@param atX number
---@param atY number
---@param atZ number
---@return Pickup pickup
function createPickupWithAmmo(modelId, type, ammo, atX, atY, atZ) end

---@param car1 Vehicle
---@param car2 Vehicle
function setCarRamCar(car1, car2) end

---@param player Player
---@param infiniteRun boolean
function setPlayerNeverGetsTired(player, infiniteRun) end

---@param player Player
---@param fastReload boolean
function setPlayerFastReload(player, fastReload) end

---@param ped Ped
---@param bleeding boolean
function setCharBleeding(ped, bleeding) end

---@param enable boolean
function setFreeResprays(enable) end

---@param ped Ped
---@param visible boolean
function setCharVisible(ped, visible) end

---@param car Vehicle
---@param visible boolean
function setCarVisible(car, visible) end

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

---@param posX number
---@param posY number
---@param gxtString GxtString
function displayText(posX, posY, gxtString) end

---@param sizeX number
---@param sizeY number
function setTextScale(sizeX, sizeY) end

---@param r number
---@param g number
---@param b number
---@param a number
function setTextColour(r, g, b, a) end

---@param alignJustify boolean
function setTextJustify(alignJustify) end

---@param centered boolean
function setTextCentre(centered) end

---@param linewidth number
function setTextWrapx(linewidth) end

---@param linewidth number
function setTextCentreSize(linewidth) end

---@param background boolean
function setTextBackground(background) end

---@param proportional boolean
function setTextProportional(proportional) end

---@param font number
function setTextFont(font) end

---@param object Object
---@param fromAngle number
---@param toAngle number
---@param flag boolean
---@return boolean result
function rotateObject(object, fromAngle, toAngle, flag) end

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
function removeCharElegantly(ped) end

---@param ped Ped
---@param enabled boolean
function setCharStayInSamePlace(ped, enabled) end

---@param explosionType number
---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@return boolean result
function isExplosionInArea(explosionType, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---@param object Object
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
function placeObjectRelativeToCar(object, car, offsetX, offsetY, offsetZ) end

---@param object Object
---@param targetable boolean
function makeObjectTargettable(object, targetable) end

---@param ped Ped
---@param points number
function addArmourToChar(ped, points) end

---@param garage GxtString
function openGarage(garage) end

---@param garage GxtString
function closeGarage(garage) end

---@param ped Ped
---@param placeAtX number
---@param placeAtY number
---@param placeAtZ number
function warpCharFromCarToCoord(ped, placeAtX, placeAtY, placeAtZ) end

---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@param modelId Model
---@param visibility boolean
function setVisibilityOfClosestObjectOfType(atX, atY, atZ, radius, modelId, visibility) end

---@param ped1 Ped
---@param ped2 Ped
---@return boolean result
function hasCharSpottedChar(ped1, ped2) end

---@param object Object
---@return boolean result
function hasObjectBeenDamaged(object) end

---@param ped Ped
---@param car Vehicle
function warpCharIntoCar(ped, car) end

---@param gxtString GxtString
---@param numbers1 number
---@param numbers2 number
---@param time number
---@param style number
function printWith2NumbersBig(gxtString, numbers1, numbers2, time, style) end

function setCameraBehindPlayer() end

---@param atX number
---@param atY number
---@param atZ number
---@return Ped ped
function createRandomChar(atX, atY, atZ) end

---@param float1 number
---@param float2 number
---@param float3 number
---@param float4 number
---@param float5 number
---@param float6 number
---@return boolean result
function isSniperBulletInArea(float1, float2, float3, float4, float5, float6) end

---@param object Object
---@param velocityInDirectionX number
---@param velocityInDirectionY number
---@param velocityInDirectionZ number
function setObjectVelocity(object, velocityInDirectionX, velocityInDirectionY, velocityInDirectionZ) end

---@param object Object
---@param collision boolean
function setObjectCollision(object, collision) end

---@param gxtString GxtString
---@param string GxtString
---@param time1 number
---@param time2 number
function printStringInStringNow(gxtString, string, time1, time2) end

---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@return boolean result
function isPointObscuredByAMissionEntity(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

function loadAllModelsNow() end

---@param object Object
---@param velocityX number
---@param velocityY number
---@param velocityZ number
function addToObjectVelocity(object, velocityX, velocityY, velocityZ) end

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

---@param positionX number
---@param positionY number
---@param width number
---@param height number
---@param r number
---@param g number
---@param b number
---@param a number
function drawRect(positionX, positionY, width, height, r, g, b, a) end

---@param name string
---@return number id
function loadSprite(name) end

---@param txd string
---@return boolean result
function loadTextureDictionary(txd) end

function removeTextureDictionary() end

---@param object Object
---@param moveable boolean
function setObjectDynamic(object, moveable) end

---@param ped Ped
---@param animation string
---@param speed number
function setCharAnimSpeed(ped, animation, speed) end

---@param music number
function playMissionPassedTune(music) end

---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@param area boolean
function clearArea(atX, atY, atZ, radius, area) end

---@param timer boolean
function freezeOnscreenTimer(timer) end

---@param car Vehicle
---@param siren boolean
function switchCarSiren(car, siren) end

---@param car Vehicle
---@param watertight boolean
function setCarWatertight(car, watertight) end

---@param ped Ped
---@param locked boolean
function setCharCantBeDraggedOut(ped, locked) end

---@param car Vehicle
---@param coordX number
---@param coordY number
function turnCarToFaceCoord(car, coordX, coordY) end

---@param atX number
---@param atY number
---@param atZ number
---@param radius number
function drawSphere(atX, atY, atZ, radius) end

---@param car Vehicle
---@param action number
function setCarStatus(car, action) end

---@param ped Ped
---@return boolean result
function isCharMale(ped) end

---@param float1 number
---@param float2 number
---@param float3 number
function policeRadioMessage(float1, float2, float3) end

---@param car Vehicle
---@param strong boolean
function setCarStrong(car, strong) end

---@param int1 boolean
function switchRubbish(int1) end

---@param streaming boolean
function switchStreaming(streaming) end

---@param garage GxtString
---@return boolean result
function isGarageOpen(garage) end

---@param garage GxtString
---@return boolean result
function isGarageClosed(garage) end

---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@param from Model
---@param to Model
function swapNearestBuildingModel(atX, atY, atZ, radius, from, to) end

---@param cutsceneOnly boolean
function switchWorldProcessing(cutsceneOnly) end

---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function clearAreaOfCars(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@return number sphere
function addSphere(atX, atY, atZ, radius) end

---@param sphere number
function removeSphere(sphere) end

---@param player Player
---@param ignored boolean
function setEveryoneIgnorePlayer(player, ignored) end

---@param ped Ped
---@return Vehicle car
function storeCarCharIsInNoSave(ped) end

---@param timer VarId
---@param type number
---@param gxtString GxtString
function displayOnscreenTimerWithString(timer, type, gxtString) end

---@param var VarId
---@param type boolean
---@param gxtString GxtString
function displayOnscreenCounterWithString(var, type, gxtString) end

---@param coordsX number
---@param coordsY number
---@param coordsZ number
---@param zAngle number
function createRandomCarForCarPark(coordsX, coordsY, coordsZ, zAngle) end

---@param sensitivity number
function setWantedMultiplier(sensitivity) end

function setCameraInFrontOfPlayer() end

---@param car Vehicle
---@return boolean result
function isCarVisiblyDamaged(car) end

---@param object Object
---@return boolean result
function doesObjectExist(object) end

---@param atX number
---@param atY number
---@param atZ number
function loadScene(atX, atY, atZ) end

---@param car Vehicle
---@param stuckCheckDistance number
---@param time number
function addStuckCarCheck(car, stuckCheckDistance, time) end

---@param car Vehicle
function removeStuckCarCheck(car) end

---@param car Vehicle
---@return boolean result
function isCarStuck(car) end

---@param asId number
---@param name number
function loadMissionAudio(asId, name) end

---@param id number
---@return boolean result
function hasMissionAudioLoaded(id) end

---@param id number
function playMissionAudio(id) end

---@param id number
---@return boolean result
function hasMissionAudioFinished(id) end

---@param X number
---@param Y number
---@param Z number
---@return number nodeX
---@return number nodeY
---@return number nodeZ
---@return number angle
function getClosestCarNodeWithHeading(X, Y, Z) end

---@param int1 number
---@param int2 number
---@return boolean result
function hasImportGarageSlotBeenFilled(int1, int2) end

---@param text GxtString
function clearThisPrint(text) end

---@param text GxtString
function clearThisBigPrint(text) end

---@param id number
---@param locationX number
---@param locationY number
---@param locationZ number
function setMissionAudioPosition(id, locationX, locationY, locationZ) end

function activateSaveMenu() end

---@return boolean result
function hasSaveGameFinished() end

---@param int1 number
function noSpecialCameraForThisGarage(int1) end

---@param pickup Pickup
---@return Marker marker
function addBlipForPickup(pickup) end

---@param multiplier number
function setPedDensityMultiplier(multiplier) end

---@param int1 boolean
function setTextDrawBeforeFade(int1) end

---@return number collected
function getCollectable1sCollected() end

---@param antialiased boolean
function setSpritesDrawBeforeFade(antialiased) end

---@param alignRight boolean
function setTextRightJustify(alignRight) end

---@param gxtString GxtString
function printHelp(gxtString) end

function clearHelp() end

---@param hudComponent number
function flashHudObject(hudComponent) end

---@param int1 boolean
function setGenerateCarsAroundCamera(int1) end

function clearSmallPrints() end

---@param car Vehicle
---@param disableFlippedExplosion boolean
function setUpsidedownCarNotDamaged(car, disableFlippedExplosion) end

---@param player Player
---@return boolean result
function isPlayerControllable(player) end

---@param player Player
function makePlayerSafe(player) end

---@param car Vehicle
---@return number primaryColor
---@return number secondaryColor
function getCarColours(car) end

---@param enable boolean
function setAllCarsCanBeDamaged(enable) end

---@param car Vehicle
---@param enable boolean
function setCarCanBeDamaged(car, enable) end

---@param player Player
---@param handlingResponsiveness number
function setDrunkInputDelay(player, handlingResponsiveness) end

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

---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@return number X
---@return number Y
---@return number Z
function getOffsetFromCarInWorldCoords(car, offsetX, offsetY, offsetZ) end

---@param id number
function clearMissionAudio(id) end

---@param player Player
---@param free boolean
function setFreeHealthCare(player, free) end

---@param mission number
function loadAndLaunchMissionInternal(mission) end

---@param object Object
---@param drawLast boolean
function setObjectDrawLast(object, drawLast) end

---@param ped Ped
---@param number number
---@return number ammo
function getAmmoInCharWeapon(ped, number) end

---@param clip number
function setNearClip(clip) end

---@param radioStation number
function setRadioChannel(radioStation) end

---@param car Vehicle
---@param traction number
function setCarTraction(car, traction) end

---@return boolean result
function areMeasurementsInMetres() end

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

---@param totalMissions number
function setTotalNumberOfMissions(totalMissions) end

---@param metric number
---@return number imperial
function convertMetresToFeetInt(metric) end

---@param stat number
---@param to number
function registerFastestTime(stat, to) end

---@param int1 number
---@param int2 number
function registerHighestScore(int1, int2) end

---@param ped Ped
---@param car Vehicle
---@param passengerSeat number
function warpCharIntoCarAsPassenger(ped, car, passengerSeat) end

---@param car Vehicle
---@param seat number
---@return boolean result
function isCarPassengerSeatFree(car, seat) end

---@param car Vehicle
---@param seat number
---@return Ped ped
function getCharInCarPassengerSeat(car, seat) end

---@param ped Ped
---@param flag boolean
function setCharIsChrisCriminal(ped, flag) end

function startCredits() end

function stopCredits() end

---@return boolean result
function areCreditsFinished() end

---@param enable boolean
function setMusicDoesFade(enable) end

---@param number number
---@return Model modelId
function getCarModel(number) end

---@return boolean result
function areAnyCarCheatsActivated() end

---@param ped Ped
---@param enable boolean
function setCharSuffersCriticalHits(ped, enable) end

---@param ped Ped
---@param car Vehicle
---@return boolean result
function isCharSittingInCar(ped, car) end

---@param ped Ped
---@return boolean result
function isCharSittingInAnyCar(ped) end

---@param ped Ped
---@return boolean result
function isCharOnFoot(ped) end

---@param gxtString GxtString
function loadSplashScreen(gxtString) end

---@param int1 number
function setJamesCarOnPathToPlayer(int1) end

---@param object Object
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function setObjectRotation(object, rotationX, rotationY, rotationZ) end

---@return number X
---@return number Y
---@return number Z
function getDebugCameraCoordinates() end

---@param player Player
---@param ped Ped
---@return boolean result
function isPlayerTargettingChar(player, ped) end

---@param player Player
---@param object Object
---@return boolean result
function isPlayerTargettingObject(player, object) end

---@param x number
---@param y number
---@param gxtString GxtString
---@param number number
function displayTextWithNumber(x, y, gxtString, number) end

---@param x number
---@param y number
---@param gxtString GxtString
---@param numbersX number
---@param numbersY number
function displayTextWith2Numbers(x, y, gxtString, numbersX, numbersY) end

function failCurrentMission() end

---@param delay number
---@param time number
function setInterpolationParameters(delay, time) end

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
function detachCharFromCar(ped) end

---@param car Vehicle
---@param flag boolean
function setCarStayInFastLane(car, flag) end

---@param ped Ped
function clearCharLastWeaponDamage(ped) end

---@param car Vehicle
function clearCarLastWeaponDamage(car) end

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
function getDriverOfCar(car) end

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

---@param ped Ped
---@return number weapon
function getCurrentCharWeapon(ped) end

---@param ped Ped
---@param object Object
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateCharAnyMeansObject2d(ped, object, radiusX, radiusY, sphere) end

---@param ped Ped
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

---@param ped Ped
---@return boolean result
function isCharOnAnyBike(ped) end

---@param ped Ped
---@param pedtype number
---@return boolean result
function canCharSeeDeadChar(ped, pedtype) end

---@param float1 number
function setEnterCarRangeMultiplier(float1) end

---@param player Player
---@return Vehicle car
function getRemoteControlledCar(player) end

---@return boolean result
function isPcVersion() end

---@param modelId Model
---@return boolean result
function isModelAvailable(modelId) end

---@param ped Ped
---@param muted boolean
function shutCharUp(ped, muted) end

---@param detonation boolean
function setEnableRcDetonate(detonation) end

---@param car Vehicle
---@param routeSeed number
function setCarRandomRouteSeed(car, routeSeed) end

---@param pickupX number
---@param pickupY number
---@param pickupZ number
---@return boolean result
function isAnyPickupAtCoords(pickupX, pickupY, pickupZ) end

---@param ped Ped
function removeAllCharWeapons(ped) end

---@param ped Ped
---@param weapon number
---@return boolean result
function hasCharGotWeapon(ped, weapon) end

---@param tank number
---@param detonate boolean
function setTankDetonateCars(tank, detonate) end

---@param joystick number
---@return number offset1
---@return number offset2
---@return number offset3
---@return number offset4
function getPositionOfAnalogueSticks(joystick) end

---@param car Vehicle
---@return boolean result
function isCarOnFire(car) end

---@param car Vehicle
---@param tire number
---@return boolean result
function isCarTireBurst(car, tire) end

---@param int1 number
---@param float2 number
function initialiseObjectPath(int1, float2) end

---@param int1 number
---@param int2 number
function setObjectPathSpeed(int1, int2) end

---@param int1 number
---@param float2 number
function setObjectPathPosition(int1, float2) end

---@param int1 number
function clearObjectPath(int1) end

---@param heli Vehicle
---@param toX number
---@param toY number
---@param toZ number
---@param altitudeMin number
---@param altitudeMax number
function heliGotoCoords(heli, toX, toY, toZ, altitudeMin, altitudeMax) end

---@param ped Ped
---@return number coordsX
---@return number coordsY
---@return number coordsZ
function getDeadCharPickupCoords(ped) end

---@param atX number
---@param atY number
---@param atZ number
---@param int4 number
---@param int5 number
---@return Pickup pickup
function createProtectionPickup(atX, atY, atZ, int4, int5) end

---@param ped Ped
---@return boolean result
function isCharInAnyBoat(ped) end

---@param ped Ped
---@return boolean result
function isCharInAnyHeli(ped) end

---@param ped Ped
---@return boolean result
function isCharInAnyPlane(ped) end

---@param ped Ped
---@return boolean result
function isCharInWater(ped) end

---@param ped Ped
---@param slot number
---@return number weapon
---@return number ammo
---@return Model modelId
function getCharWeaponInSlot(ped, slot) end

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

---@param car Vehicle
---@param speed number
function setCarForwardSpeed(car, speed) end

---@param interior number
function setInteriorVisible(interior) end

---@param car Vehicle
---@param convoy boolean
function markCarAsConvoyCar(car, convoy) end

---@param int1 number
function resetHavocCausedByPlayer(int1) end

---@param int1 number
---@return number int2
function getHavocCausedByPlayer(int1) end

---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
---@param type number
function createScriptRoadblock(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, type) end

function clearAllScriptRoadblocks() end

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

---@param int1 boolean
function switchSecurityCamera(int1) end

---@param ped Ped
---@return boolean result
function isCharInFlyingVehicle(ped) end

---@param atX number
---@param atY number
---@param atZ number
---@param icon number
---@return Marker marker
function addShortRangeSpriteBlipForCoord(atX, atY, atZ, icon) end

---@param heli Vehicle
---@param angle number
function setHeliOrientation(heli, angle) end

---@param heli Vehicle
function clearHeliOrientation(heli) end

---@param plane number
---@param X number
---@param Y number
---@param Z number
---@param z1 number
---@param z2 number
function planeGotoCoords(plane, X, Y, Z, z1, z2) end

---@param X number
---@param Y number
---@param Z number
---@param type number
---@return number X
---@return number Y
---@return number Z
function getNthClosestCarNode(X, Y, Z, type) end

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

---@param enable boolean
function setEnableRcDetonateOnContact(enable) end

---@param ped Ped
---@param locked boolean
function freezeCharPosition(ped, locked) end

---@param ped Ped
---@param drowns boolean
function setCharDrownsInWater(ped, drowns) end

---@param object Object
---@param set boolean
function setObjectRecordsCollisions(object, set) end

---@param object Object
---@return boolean result
function hasObjectCollidedWithAnything(object) end

function removeRcBuggy() end

---@param ped Ped
---@return number armour
function getCharArmour(ped) end

---@param heli Vehicle
---@param limiter boolean
function setHeliStabiliser(heli, limiter) end

---@param car Vehicle
---@param radius number
function setCarStraightLineDistance(car, radius) end

---@param car Vehicle
function popCarBoot(car) end

---@param player Player
---@param shut boolean
function shutPlayerUp(player, shut) end

---@param player Player
---@param flag number
---@param time number
function setPlayerMood(player, flag, time) end

---@param X number
---@param Y number
function requestCollision(X, Y) end

---@param object Object
---@param X number
---@param Y number
---@param radiusX number
---@param radiusY number
---@param sphere boolean
---@return boolean result
function locateObject2d(object, X, Y, radiusX, radiusY, sphere) end

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

---@param object Object
---@return boolean result
function isObjectInWater(object) end

---@param object Object
---@param cornerAX number
---@param cornerAY number
---@param cornerBX number
---@param cornerBY number
---@param sphere boolean
---@return boolean result
function isObjectInArea2d(object, cornerAX, cornerAY, cornerBX, cornerBY, sphere) end

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

---@param animation string
function requestAnimation(animation) end

---@param animation string
---@return boolean result
function hasAnimationLoaded(animation) end

---@param animation string
function removeAnimation(animation) end

---@param ped Ped
---@return boolean result
function isCharWaitingForWorldCollision(ped) end

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

---@param text VarId
---@param type number
---@param line number
---@param gxtString GxtString
function displayNthOnscreenCounterWithString(text, type, line, gxtString) end

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

---@param color number
---@param fade boolean
function setExtraColours(color, fade) end

---@param fade boolean
function clearExtraColours(fade) end

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

---@param player Player
---@param bodypart string
---@param skin number
---@return boolean result
function isPlayerWearing(player, bodypart, skin) end

---@param player Player
---@param mode boolean
function setPlayerCanDoDriveBy(player, mode) end

---@param pedtype number
---@param modelId Model
---@param X number
---@param Y number
---@param Z number
---@return number handleAs
function createSwatRope(pedtype, modelId, X, Y, Z) end

---@param car Model
---@param variation1 number
---@param variation2 number
function setCarModelComponents(car, variation1, variation2) end

---@param car Vehicle
function closeAllCarDoors(car) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number distance
function getDistanceBetweenCoords2d(x1, y1, x2, y2) end

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

---@return number level
function getMaxWantedLevel() end

---@param text GxtString
function printHelpForever(text) end

---@param text GxtString
---@param number number
function printHelpForeverWithNumber(text, number) end

---@param pX number
---@param pY number
---@param pZ number
---@param gxtString GxtString
---@return Pickup pickup
function createLockedPropertyPickup(pX, pY, pZ, gxtString) end

---@param pX number
---@param pY number
---@param pZ number
---@param price number
---@param gxtString GxtString
---@return Pickup pickup
function createForsalePropertyPickup(pX, pY, pZ, price, gxtString) end

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

---@param car Vehicle
---@param byActor Ped
---@return boolean result
function hasCarBeenDamagedByChar(car, byActor) end

---@param car Vehicle
---@param byCar Vehicle
---@return boolean result
function hasCarBeenDamagedByCar(car, byCar) end

---@return number radio
function getRadioChannel() end

---@param ped Ped
---@param stay boolean
function setCharStayInCarWhenJacked(ped, stay) end

---@param player Player
---@param drunk number
function setPlayerDrunkenness(player, drunk) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param modelId Model
---@return Vehicle car
function getRandomCarOfTypeInAreaNoSave(x1, y1, x2, y2, modelId) end

---@param car Vehicle
---@param vulnerability boolean
function setCanBurstCarTires(car, vulnerability) end

---@param car Vehicle
function fireHunterGun(car) end

---@param ped Ped
---@param car Vehicle
---@return boolean result
function isCharTouchingVehicle(ped, car) end

---@param ped Ped
---@param can boolean
function setCharCanBeShotInVehicle(ped, can) end

---@param table GxtString
function loadMissionText(table) end

---@param ped Ped
function clearCharLastDamageEntity(ped) end

---@param car Vehicle
function clearCarLastDamageEntity(car) end

---@param object Object
---@param freeze boolean
function freezeObjectPosition(object, freeze) end

---@param ped Ped
---@param weapon number
function removeWeaponFromChar(ped, weapon) end

---@param player Player
---@param fireproof boolean
function makePlayerFireProof(player, fireproof) end

---@param player Player
---@param increase number
function increasePlayerMaxHealth(player, increase) end

---@param player Player
---@param increase number
function increasePlayerMaxArmour(player, increase) end

---@param car Vehicle
---@return Ped ped
function createRandomCharAsDriver(car) end

---@param car Vehicle
---@param seat number
---@return Ped ped
function createRandomCharAsPassenger(car, seat) end

---@param player Player
---@param ammo number
function ensurePlayerHasDriveByWeapon(player, ammo) end

---@param heli Vehicle
function makeHeliComeCrashingDown(heli) end

---@param pX number
---@param pY number
---@param pZ number
---@param type number
function addExplosionNoSound(pX, pY, pZ, type) end

---@param object Object
---@param interior number
function linkObjectToInterior(object, interior) end

---@param ped Ped
---@param untargetable boolean
function setCharNeverTargetted(ped, untargetable) end

---@return boolean result
function wasCutsceneSkipped() end

---@param ped Ped
---@return boolean result
function isCharInAnyPoliceVehicle(ped) end

---@param ped Ped
---@return boolean result
function doesCharExist(ped) end

---@param car Vehicle
---@return boolean result
function doesVehicleExist(car) end

---@param pX number
---@param pY number
---@param pZ number
---@param icon number
---@return Marker blip
function addShortRangeSpriteBlipForContactPoint(pX, pY, pZ, icon) end

---@param toggle boolean
function setAllTaxisHaveNitro(toggle) end

---@param car Vehicle
---@param keep boolean
function freezeCarPositionAndDontLoadCollision(car, keep) end

---@param ped Ped
---@param keep boolean
function freezeCharPositionAndDontLoadCollision(ped, keep) end

---@param set boolean
function setPlayerIsInStadium(set) end

---@param enable boolean
function displayRadar(enable) end

---@param stat number
---@param number number
function registerBestPosition(stat, number) end

---@param player Player
---@param zone GxtString
---@return boolean result
function isPlayerInInfoZone(player, zone) end

---@param car Vehicle
---@param enable boolean
function setLoadCollisionForCarFlag(car, enable) end

---@param ped Ped
---@param enable boolean
function setLoadCollisionForCharFlag(ped, enable) end

---@param fromX number
---@param fromY number
---@param fromZ number
---@param toX number
---@param toY number
---@param toZ number
function addBigGunFlash(fromX, fromY, fromZ, toX, toY, toZ) end

---@return number progress
function getProgressPercentage() end

---@param car Vehicle
---@param flag number
function setVehicleToFadeIn(car, flag) end

function registerOddjobMissionPassed() end

---@param player Player
---@return boolean result
function isPlayerInShortcutTaxi(player) end

---@param ped Ped
---@return boolean result
function isCharDucking(ped) end

---@param text VarId
---@param flashing boolean
function setOnscreenCounterFlashWhenFirstDisplayed(text, flashing) end

---@param shuffle boolean
function shuffleCardDecks(shuffle) end

---@return number card
function fetchNextCard() end

---@param object Object
---@return number vecX
---@return number vecY
---@return number vecZ
function getObjectVelocity(object) end

---@return boolean result
function isDebugCameraOn() end

---@param object Object
---@param vecX number
---@param vecY number
---@param vecZ number
function addToObjectRotationVelocity(object, vecX, vecY, vecZ) end

---@param object Object
---@param vecX number
---@param vecY number
---@param vecZ number
function setObjectRotationVelocity(object, vecX, vecY, vecZ) end

---@param object Object
---@return boolean result
function isObjectStatic(object) end

---@param vecX number
---@param vecY number
---@param vecX2 number
---@param vecY2 number
---@return number angle
function getAngleBetween2dVectors(vecX, vecY, vecX2, vecY2) end

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

---@param object Object
---@return number axisX
---@return number axisY
---@return number axisZ
function getObjectRotationVelocity(object) end

---@param object Object
---@param vecX number
---@param vecY number
---@param vecZ number
function addVelocityRelativeToObjectVelocity(object, vecX, vecY, vecZ) end

---@param object Object
---@return number speed
function getObjectSpeed(object) end

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

---@param ped Ped
---@param timeMS number
function taskStandStill(ped, timeMS) end

---@param ped Ped
---@param int2 boolean
---@param time number
function taskFallAndGetUp(ped, int2, time) end

---@param ped Ped
---@param jump boolean
function taskJump(ped, jump) end

---@param ped Ped
---@param timeMS number
function taskTired(ped, timeMS) end

---@param ped Ped
function taskDie(ped) end

---@param ped Ped
---@param lookAt number
---@param timeMS number
function taskLookAtChar(ped, lookAt, timeMS) end

---@param ped Ped
---@param lookAt number
---@param timeMS number
function taskLookAtVehicle(ped, lookAt, timeMS) end

---@param ped Ped
---@param audio number
function taskSay(ped, audio) end

---@param ped Ped
function taskShakeFist(ped) end

---@param ped Ped
function taskCower(ped) end

---@param ped Ped
---@param timeMS number
function taskHandsUp(ped, timeMS) end

---@param ped Ped
---@param timeMS number
function taskDuck(ped, timeMS) end

---@param ped Ped
function taskUseAtm(ped) end

---@param ped Ped
function taskScratchHead(ped) end

---@param ped Ped
---@param timeMS number
function taskLookAbout(ped, timeMS) end

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
---@param car Vehicle
function taskLeaveCar(ped, car) end

---@param ped Ped
---@param car Vehicle
---@param X number
---@param Y number
---@param Z number
function taskLeaveCarAndFlee(ped, car, X, Y, Z) end

---@param ped Ped
---@param car Vehicle
---@param toX number
---@param toY number
---@param toZ number
---@param speed number
---@param int7 number
---@param model number
---@param int9 number
function taskCarDriveToCoord(ped, car, toX, toY, toZ, speed, int7, model, int9) end

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

function flushRoute() end

---@param pointX number
---@param pointY number
---@param pointZ number
function extendRoute(pointX, pointY, pointZ) end

---@param ped Ped
---@param flags1 number
---@param flags2 number
function taskFollowPointRoute(ped, flags1, flags2) end

---@param ped Ped
---@param toActor Ped
---@param timelimit number
---@param stopWithinRadius number
function taskGotoChar(ped, toActor, timelimit, stopWithinRadius) end

---@param ped Ped
---@param fromX number
---@param fromY number
---@param fromZ number
---@param awayRadius number
---@param timelimit number
function taskFleePoint(ped, fromX, fromY, fromZ, awayRadius, timelimit) end

---@param ped Ped
---@param fromActor Ped
---@param radius number
---@param timelimit number
function taskFleeChar(ped, fromActor, radius, timelimit) end

---@param ped Ped
---@param fromX number
---@param fromY number
---@param fromZ number
---@param stopAtRadius number
---@param timelimit number
function taskSmartFleePoint(ped, fromX, fromY, fromZ, stopAtRadius, timelimit) end

---@param ped Ped
---@param fromActor Ped
---@param originRadius number
---@param timelimit number
function taskSmartFleeChar(ped, fromActor, originRadius, timelimit) end

---@param ped Ped
function taskWanderStandard(ped) end

---@param ped Ped
---@param killActor Ped
function taskKillCharOnFoot(ped, killActor) end

---@param car Vehicle
---@param path number
function startPlaybackRecordedCar(car, path) end

---@param car Vehicle
function stopPlaybackRecordedCar(car) end

---@param car Vehicle
function pausePlaybackRecordedCar(car) end

---@param car Vehicle
function unpausePlaybackRecordedCar(car) end

---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarLeft(car, followCar) end

---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarRight(car, followCar) end

---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarRear(car, followCar) end

---@param car Vehicle
---@param followCar Vehicle
function setCarEscortCarFront(car, followCar) end

---@param ped Ped
---@param pathX number
---@param pathY number
---@param pathZ number
---@param mode number
---@param time number
function taskFollowPathNodesToCoord(ped, pathX, pathY, pathZ, mode, time) end

---@param ped Ped
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isCharInAngledArea2d(ped, x1, y1, x2, y2, angle, sphere) end

---@param ped Ped
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isCharInAngledAreaOnFoot2d(ped, x1, y1, x2, y2, angle, sphere) end

---@param ped Ped
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isCharInAngledAreaInCar2d(ped, x1, y1, x2, y2, angle, sphere) end

---@param ped Ped
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param height number
---@param flag boolean
---@return boolean result
function isCharStoppedInAngledArea2d(ped, x1, y1, x2, y2, height, flag) end

---@param ped Ped
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isCharStoppedInAngledAreaOnFoot2d(ped, x1, y1, x2, y2, angle, sphere) end

---@param ped Ped
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param height number
---@param flag boolean
---@return boolean result
function isCharStoppedInAngledAreaInCar2d(ped, x1, y1, x2, y2, height, flag) end

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

---@param ped Ped
---@return boolean result
function isCharInTaxi(ped) end

---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param mode number
---@param useCar Vehicle
function taskGoToCoordAnyMeans(ped, toX, toY, toZ, mode, useCar) end

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

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
function loadPathNodesInArea(x1, y1, x2, y2) end

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
function isPlaybackGoingOnForCar(car) end

---@param ped Ped
---@param accuracy number
function setSenseRange(ped, accuracy) end

---@param ped Ped
---@param animation string
---@return boolean result
function isCharPlayingAnim(ped, animation) end

---@param ped Ped
---@param animation string
---@param flag boolean
function setCharAnimPlayingFlag(ped, animation, flag) end

---@param ped Ped
---@param animation string
---@return number time
function getCharAnimCurrentTime(ped, animation) end

---@param ped Ped
---@param animation string
---@param time number
function setCharAnimCurrentTime(ped, animation, time) end

---@return number task
function openSequenceTask() end

---@param task number
function closeSequenceTask(task) end

---@param ped Ped
---@param task number
function performSequenceTask(ped, task) end

---@param ped Ped
---@param enable boolean
function setCharCollision(ped, enable) end

---@param ped Ped
---@param animation string
---@return number totalTime
function getCharAnimTotalTime(ped, animation) end

---@param task number
function clearSequenceTask(task) end

---@param originX number
---@param originY number
---@param originZ number
---@param zAngle number
---@param unknownAngle number
---@param taskSequence number
---@return number handle
function addAttractor(originX, originY, originZ, zAngle, unknownAngle, taskSequence) end

---@param handle number
function clearAttractor(handle) end

---@param pedtype number
---@param modelId Model
---@param ASOrigin number
---@param task number
---@return Ped ped
function createCharAtAttractor(pedtype, modelId, ASOrigin, task) end

---@param ped Ped
---@param car Vehicle
function taskLeaveCarImmediately(ped, car) end

---@param stat number
---@param add number
function incrementIntStat(stat, add) end

---@param stat number
---@param add number
function incrementFloatStat(stat, add) end

---@param stat number
---@param number number
function decrementIntStat(stat, number) end

---@param stat number
---@param number number
function decrementFloatStat(stat, number) end

---@param stat number
---@param number number
function registerIntStat(stat, number) end

---@param stat number
---@param value number
function registerFloatStat(stat, value) end

---@param stat number
---@param number number
function setIntStat(stat, number) end

---@param stat number
---@param number number
function setFloatStat(stat, number) end

---@param ped Ped
---@param task number
---@return number status
function getScriptTaskStatus(ped, task) end

---@param type number
---@return number group
function createGroup(type) end

---@param group number
---@param ped Ped
function setGroupLeader(group, ped) end

---@param group number
---@param ped Ped
function setGroupMember(group, ped) end

---@param group number
function removeGroup(group) end

---@param ped Ped
function taskLeaveAnyCar(ped) end

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

---@param ped Ped
---@param rotateTo number
function taskTurnCharToFaceChar(ped, rotateTo) end

---@param ped Ped
---@param origin number
---@return boolean result
function isCharAtScriptedAttractor(ped, origin) end

---@param pack number
---@param loop boolean
function setSequenceToRepeat(pack, loop) end

---@param ped Ped
---@return number progess
function getSequenceProgress(ped) end

---@param ped Ped
function clearLookAt(ped) end

---@param ped Ped
---@param dist number
function setFollowNodeThresholdDistance(ped, dist) end

---@param particle string
---@param pX number
---@param pY number
---@param pZ number
---@param type number
---@return Particle particle
function createFxSystem(particle, pX, pY, pZ, type) end

---@param particle Particle
function playFxSystem(particle) end

---@param particle Particle
function stopFxSystem(particle) end

---@param particle Particle
function playAndKillFxSystem(particle) end

---@param particle Particle
function killFxSystem(particle) end

---@param stat number
---@return number stat
function getIntStat(stat) end

---@param stat number
---@return number stat
function getFloatStat(stat) end

---@param object Object
---@param fireproof boolean
function setObjectRenderScorched(object, fireproof) end

---@param ped Ped
---@param lookAt number
---@param timeMS number
function taskLookAtObject(ped, lookAt, timeMS) end

---@param angle number
---@return number number
function limitAngle(angle) end

---@param car Vehicle
---@param door number
function openCarDoor(car, door) end

---@param pickup Pickup
---@return number X
---@return number Y
---@return number Z
function getPickupCoordinates(pickup) end

---@param maker number
function removeDecisionMaker(maker) end

---@param ped Ped
---@return Model modelId
function getCharModel(ped) end

---@param ped Ped
---@param atX number
---@param atY number
---@param atZ number
---@param timeMS number
function taskAimGunAtCoord(ped, atX, atY, atZ, timeMS) end

---@param ped Ped
---@param atX number
---@param atY number
---@param atZ number
---@param timeMS number
function taskShootAtCoord(ped, atX, atY, atZ, timeMS) end

---@param particle string
---@param ped Ped
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param type number
---@return Particle particle
function createFxSystemOnChar(particle, ped, offsetX, offsetY, offsetZ, type) end

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

---@param particle string
---@param object Object
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param type number
---@return Particle particle
function createFxSystemOnObject(particle, object, offsetX, offsetY, offsetZ, type) end

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
---@param toOffsetX number
---@param toOffsetY number
---@param time number
function taskDiveAndGetUp(ped, toOffsetX, toOffsetY, time) end

---@param modelId Model
---@param numberplate string
function customPlateForNextCar(modelId, numberplate) end

---@param ped Ped
---@param car Vehicle
function taskShuffleToNextCarSeat(ped, car) end

---@param ped Ped
---@param withActor number
---@param flag boolean
---@param unknownFlag number
function taskChatWithChar(ped, withActor, flag, unknownFlag) end

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

---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param ped Ped
---@param tilt number
---@param switchstyle number
function attachCameraToVehicleLookAtChar(car, offsetX, offsetY, offsetZ, ped, tilt, switchstyle) end

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

---@param car Vehicle
---@param lights number
function forceCarLights(car, lights) end

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

---@param car Vehicle
---@param toCar number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function attachCarToCar(car, toCar, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end

---@param car Vehicle
---@param X number
---@param Y number
---@param Z number
---@param collisionDetection boolean
function detachCar(car, X, Y, Z, collisionDetection) end

---@param object Object
---@return boolean result
function isObjectAttached(object) end

---@param car Vehicle
---@return boolean result
function isVehicleAttached(car) end

---@param ped Ped
function clearCharTasks(ped) end

---@param ped Ped
---@param unknownFlag1 boolean
---@param unknownFlag2 boolean
---@param unknownFlag3 boolean
function taskTogglePedThreatScanner(ped, unknownFlag1, unknownFlag2, unknownFlag3) end

---@param car Vehicle
---@param door number
---@param visible boolean
function popCarDoor(car, door, visible) end

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
---@param timeMS number
function taskDiveFromAttachmentAndGetUp(ped, timeMS) end

---@param ped Ped
---@param car Vehicle
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param position number
---@param shootingAngle1 number
---@param shootingAngle2 number
---@param weapon number
function attachCharToBike(ped, car, offsetX, offsetY, offsetZ, position, shootingAngle1, shootingAngle2, weapon) end

---@param ped Ped
---@param toActor number
---@param timelimit number
---@param approachDistance number
---@param approachAngle number
function taskGotoCharOffset(ped, toActor, timelimit, approachDistance, approachAngle) end

---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
---@param timeMS number
function taskLookAtCoord(ped, toX, toY, toZ, timeMS) end

---@param ped Ped
---@param hide boolean
function hideCharWeaponForScriptedCutscene(ped, hide) end

---@param ped Ped
---@return number speed
function getCharSpeed(ped) end

---@param group number
---@param maker number
function setGroupDecisionMaker(group, maker) end

---@param type number
---@return number maker
function loadGroupDecisionMaker(type) end

---@param player Player
---@param mode boolean
function disablePlayerSprint(player, mode) end

---@param ped Ped
---@param timeMS number
function taskSitDown(ped, timeMS) end

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

---@param searchlight Searchlight
function deleteSearchlight(searchlight) end

---@param searchlight Searchlight
---@return boolean result
function doesSearchlightExist(searchlight) end

---@param searchlight Searchlight
---@param fromX number
---@param fromY number
---@param fromZ number
---@param toX number
---@param toY number
---@param toZ number
---@param speed number
function moveSearchlightBetweenCoords(searchlight, fromX, fromY, fromZ, toX, toY, toZ, speed) end

---@param searchlight Searchlight
---@param toX number
---@param toY number
---@param toZ number
---@param speed number
function pointSearchlightAtCoord(searchlight, toX, toY, toZ, speed) end

---@param searchlight Searchlight
---@param ped Ped
---@param speed number
function pointSearchlightAtChar(searchlight, ped, speed) end

---@param searchlight Searchlight
---@param ped Ped
---@return boolean result
function isCharInSearchlight(searchlight, ped) end

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

---@param fromX number
---@param fromY number
---@param fromZ number
---@param targetX number
---@param targetY number
---@param targetZ number
---@param energy number
function fireSingleBullet(fromX, fromY, fromZ, targetX, targetY, targetZ, energy) end

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

---@param car Vehicle
---@return number roll
function getCarRoll(car) end

---@param searchlight Searchlight
---@param car Vehicle
---@param speed number
function pointSearchlightAtVehicle(searchlight, car, speed) end

---@param number number
---@param car Vehicle
---@return boolean result
function isVehicleInSearchlight(number, car) end

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

---@param atX number
---@param atY number
---@param atZ number
---@param radius number
---@return number num
function getNumberOfFiresInRange(atX, atY, atZ, radius) end

---@param searchlight Searchlight
---@return Marker marker
function addBlipForSearchlight(searchlight) end

---@param car Vehicle
function skipToEndAndStopPlaybackRecordedCar(car) end

---@param ped Ped
---@param car Vehicle
---@param performAction number
---@param timelimit number
function taskCarTempAction(ped, car, performAction, timelimit) end

---@param enable boolean
function setLaRiots(enable) end

---@param ped Ped
function removeCharFromGroup(ped) end

---@param searchlight Searchlight
---@param tower number
---@param housing number
---@param bulb number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
function attachSearchlightToSearchlightObject(searchlight, tower, housing, bulb, offsetX, offsetY, offsetZ) end

---@param enable boolean
function switchEmergencyServices(enable) end

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

---@param checkpoint Checkpoint
function deleteCheckpoint(checkpoint) end

---@param enable boolean
function switchRandomTrains(enable) end

---@param type number
---@param atX number
---@param atY number
---@param atZ number
---@param direction boolean
---@return Vehicle train
function createMissionTrain(type, atX, atY, atZ, direction) end

function deleteMissionTrains() end

function markMissionTrainsAsNoLongerNeeded() end

function deleteAllTrains() end

---@param train Vehicle
---@param speed number
function setTrainSpeed(train, speed) end

---@param train Vehicle
---@param speed number
function setTrainCruiseSpeed(train, speed) end

---@param train Vehicle
---@return number caboose
function getTrainCaboose(train) end

---@param player Player
function deletePlayer(player) end

---@param mode boolean
function setTwoPlayerCameraMode(mode) end

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

---@param component Model
---@return number type
function getVehicleModType(component) end

---@param car Vehicle
---@param component Model
---@return number componentId
function addVehicleMod(car, component) end

---@param car Vehicle
---@param componentId number
function removeVehicleMod(car, componentId) end

---@param component Model
function requestVehicleMod(component) end

---@param component Model
---@return boolean result
function hasVehicleModLoaded(component) end

---@param component Model
function markVehicleModAsNoLongerNeeded(component) end

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

---@param group number
---@param range number
function setGroupSeparationRange(group, range) end

---@param distance number
function limitTwoPlayerDistance(distance) end

function releaseTwoPlayerDistance() end

---@param can boolean
function setPlayerPlayerTargetting(can) end

---@param fire number
---@return number X
---@return number Y
---@return number Z
function getScriptFireCoords(fire) end

---@param forX number
---@param forY number
---@param forZ number
---@param direction number
---@return number X
---@return number Y
---@return number Z
---@return number ZAngle
function getNthClosestCarNodeWithHeading(forX, forY, forZ, direction) end

---@param allow boolean
function setPlayersCanBeInSeparateCars(allow) end

---@param car Vehicle
---@return boolean result
function doesCarHaveStuckCarCheck(car) end

---@param car Vehicle
---@param speed number
function setPlaybackSpeed(car, speed) end

---@param ped Ped
---@param range number
---@return boolean result
function areAnyCharsNearChar(ped, range) end

function skipCutsceneEnd() end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number percentage
function getPercentageTaggedInArea(x1, y1, x2, y2) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param value boolean
function setTagStatusInArea(x1, y1, x2, y2, value) end

---@param car Vehicle
---@param toX number
---@param toY number
---@param toZ number
function carGotoCoordinatesRacing(car, toX, toY, toZ) end

---@param car Vehicle
---@param path number
function startPlaybackRecordedCarUsingAi(car, path) end

---@param car Vehicle
---@param path number
function skipInPlaybackRecordedCar(car, path) end

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
---@param boneId1 number
---@param boneId2 number
---@param performAnimation string
---@param IFPFile number
---@param time number
function taskPickUpObject(ped, object, offsetX, offsetY, offsetZ, boneId1, boneId2, performAnimation, IFPFile, time) end

---@param ped Ped
---@param object boolean
function dropObject(ped, object) end

---@param car Vehicle
function explodeCarInCutscene(car) end

---@param player Player
function buildPlayerModel(player) end

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

---@param car Vehicle
---@param stay boolean
function setCarStayInSlowLane(car, stay) end

---@param player Player
---@param car Vehicle
function takeRemoteControlOfCar(player, car) end

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
function startSettingUpConversation(ped) end

function finishSettingUpConversation() end

---@param ped Ped
---@param gxtString GxtString
---@return boolean result
function isConversationAtNode(ped, gxtString) end

---@param object Object
---@return number health
function getObjectHealth(object) end

---@param object Object
---@param health number
function setObjectHealth(object, health) end

---@param object Object
---@param intensity number
function breakObject(object, intensity) end

---@param heli Vehicle
---@param player Player
---@param radius number
function heliAttackPlayer(heli, player, radius) end

---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param radius number
function heliFollowEntity(heli, ped, car, radius) end

---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param radius number
function policeHeliChaseEntity(heli, ped, car, radius) end

---@param ped Ped
---@param hold boolean
function taskUseMobilePhone(ped, hold) end

---@param ped Ped
---@param car Vehicle
function taskWarpCharIntoCarAsDriver(ped, car) end

---@param ped Ped
---@param car Vehicle
---@param passengerseat number
function taskWarpCharIntoCarAsPassenger(ped, car, passengerseat) end

---@param generate boolean
function switchCopsOnBikes(generate) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param angle number
---@param sphere boolean
---@return boolean result
function isFlameInAngledArea2d(x1, y1, x2, y2, angle, sphere) end

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

---@param modelId Model
---@return boolean result
function suppressCarModel(modelId) end

---@param modelId Model
function dontSuppressCarModel(modelId) end

function dontSuppressAnyCarModels() end

---@param key number
---@return boolean result
function isPs2KeyboardKeyPressed(key) end

---@param key number
---@return boolean result
function isPs2KeyboardKeyJustPressed(key) end

---@param ped Ped
---@param liftingObject number
---@return boolean result
function isCharHoldingObject(ped, liftingObject) end

---@param car Vehicle
---@param can boolean
function setCarCanGoAgainstTraffic(car, can) end

---@param car Vehicle
---@param door number
function damageCarDoor(car, door) end

---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param model number
---@return Vehicle car
function getRandomCarInSphereNoSave(X, Y, Z, radius, model) end

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

---@param plane number
---@param throttle number
function setPlaneThrottle(plane, throttle) end

---@param heli Vehicle
---@param X number
---@param Y number
---@param Z number
---@param minaltitude number
---@param maxaltitude number
function heliLandAtCoords(heli, X, Y, Z, minaltitude, maxaltitude) end

---@param hydra number
function planeStartsInAir(hydra) end

---@param acquaintance number
---@param pedtype number
---@param toPedtype number
function setRelationship(acquaintance, pedtype, toPedtype) end

---@param acquaintance number
---@param pedtype number
---@param toPedtype number
function clearRelationship(acquaintance, pedtype, toPedtype) end

---@param maker number
---@param event number
function clearGroupDecisionMakerEventResponse(maker, event) end

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

---@param ped Ped
---@param attractor number
function taskUseAttractor(ped, attractor) end

---@param ped Ped
---@param atActor number
---@param timelimit number
function taskShootAtChar(ped, atActor, timelimit) end

---@param flags number
---@param radius number
---@param pedsToScan number
function setInformRespectedFriends(flags, radius, pedsToScan) end

---@param ped Ped
---@param event number
---@return boolean result
function isCharRespondingToEvent(ped, event) end

---@param object Object
---@param visibility boolean
function setObjectVisible(object, visibility) end

---@param ped Ped
---@param fleeFrom number
---@param runDistance number
---@param time number
---@param changeCourse boolean
---@param unkTime1 number
---@param unkTime2 number
---@param awayRadius number
function taskFleeCharAnyMeans(ped, fleeFrom, runDistance, time, changeCourse, unkTime1, unkTime2, awayRadius) end

function flushPatrolRoute() end

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

---@param zoom number
function setRadarZoom(zoom) end

---@param marker Marker
---@return boolean result
function doesBlipExist(marker) end

---@param shopping GxtString
function loadPrices(shopping) end

---@param shopping GxtString
function loadShop(shopping) end

---@return number num
function getNumberOfItemsInShop() end

---@param index number
---@return number item
function getItemInShop(index) end

---@param item number
---@return number price
function getPriceOfItem(item) end

---@param ped Ped
function taskDead(ped) end

---@param car Vehicle
function setCarAsMissionCar(car) end

---@param zone GxtString
---@param popcycle number
function setZonePopulationType(zone, popcycle) end

---@param zone GxtString
---@param density number
function setZoneDealerStrength(zone, density) end

---@param zone GxtString
---@return number strength
function getZoneDealerStrength(zone) end

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

---@param ped Ped
---@param targetPriority boolean
function setCharIsTargetPriority(ped, targetPriority) end

---@param modelNumplate Model
---@param townTexture number
function customPlateDesignForNextCar(modelNumplate, townTexture) end

---@param ped Ped
---@param car Vehicle
---@param timeMS number
---@param stopAtDistance number
function taskGotoCar(ped, car, timeMS, stopAtDistance) end

---@param group string
function requestIpl(group) end

---@param group string
function removeIpl(group) end

---@param group string
function removeIplDiscreetly(group) end

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

---@param car Vehicle
---@return number pitch
function getCarPitch(car) end

---@return number interior
function getActiveInterior() end

---@param heli Vehicle
---@param ped Ped
---@param car Vehicle
---@param minaltitude number
---@param maxaltitude number
function heliKeepEntityInView(heli, ped, car, minaltitude, maxaltitude) end

---@param id number
---@return number model
function getWeapontypeModel(id) end

---@param id number
---@return number slot
function getWeapontypeSlot(id) end

---@param item number
---@param flag number
---@return number info
function getShoppingExtraInfo(item, flag) end

---@param player Player
---@param texture number
---@param model number
---@param bodypart number
function givePlayerClothes(player, texture, model, bodypart) end

---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@return number num
function getNumberOfFiresInArea(x1, y1, z1, x2, y2, z2) end

---@param heli Vehicle
---@param magnet boolean
function attachWinchToHeli(heli, magnet) end

---@param heli Vehicle
function releaseEntityFromWinch(heli) end

---@param train Vehicle
---@param handle number
---@return number carriage
function getTrainCarriage(train, handle) end

---@param heli Vehicle
---@return Vehicle carHandle
---@return Ped pedHandle
---@return Object objectHandle
function grabEntityOnWinch(heli) end

---@param item number
---@return GxtString name
function getNameOfItem(item) end

---@param ped Ped
---@param climb boolean
function taskClimb(ped, climb) end

---@param item number
function buyItem(item) end

---@param ped Ped
function clearCharTasksImmediately(ped) end

function storeClothesState() end

function restoreClothesState() end

---@param magnet number
---@return number length
function getRopeHeightForObject(magnet) end

---@param magnet number
---@param length number
function setRopeHeightForObject(magnet, length) end

---@param magnet number
---@return Vehicle carHandle
---@return Ped pedHandle
---@return Object objectHandle
function grabEntityOnRopeForObject(magnet) end

---@param magnet number
function releaseEntityFromRopeForObject(magnet) end

function playerEnteredDockCrane() end

function playerEnteredBuildingsiteCrane() end

function playerLeftCrane() end

---@param ped Ped
---@param sequence number
---@param unkProgress1 number
---@param unkProgress2 number
function performSequenceTaskFromProgress(ped, sequence, unkProgress1, unkProgress2) end

---@param speed number
function setNextDesiredMoveState(speed) end

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

---@param X number
---@param Y number
---@param Z number
---@return number X
---@return number Y
---@return number Z
function getNearestTagPosition(X, Y, Z) end

---@param ped Ped
function taskJetpack(ped) end

---@param enable boolean
function setArea51SamSite(enable) end

---@param ped Ped
---@return boolean result
---@return Searchlight searchlight
function isCharInAnySearchlight(ped) end

---@param trailer Vehicle
---@param car Vehicle
---@return boolean result
function isTrailerAttachedToCab(trailer, car) end

---@param trailer Vehicle
---@param cab Vehicle
function detachTrailerFromCab(trailer, cab) end

---@param player Player
---@return number group
function getPlayerGroup(player) end

---@return GxtString shop
function getLoadedShop() end

---@param track number
---@return number int2
---@return number int3
---@return number int4
function getBeatProximity(track) end

---@param group number
---@param command number
function setGroupDefaultTaskAllocator(group, command) end

---@param player Player
---@param enabled boolean
function setPlayerGroupRecruitment(player, enabled) end

---@param heli Vehicle
---@param power number
function activateHeliSpeedCheat(heli, power) end

---@param ped Ped
---@param maker number
function taskSetCharDecisionMaker(ped, maker) end

---@param train Vehicle
function deleteMissionTrain(train) end

---@param train Vehicle
function markMissionTrainAsNoLongerNeeded(train) end

---@param marker Marker
---@param displayAlways boolean
function setBlipAlwaysDisplayOnZoomedRadar(marker, displayAlways) end

---@param path number
function requestCarRecording(path) end

---@param path number
---@return boolean result
function hasCarRecordingBeenLoaded(path) end

---@param train Vehicle
---@param X number
---@param Y number
---@param Z number
function setMissionTrainCoordinates(train, X, Y, Z) end

---@param ped Ped
---@param object Object
function taskComplexPickupObject(ped, object) end

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

---@return number weekday
function getCurrentDayOfWeek() end

---@param id number
---@param gxtString GxtString
function registerScriptBrainForCodeUse(id, gxtString) end

---@param car Vehicle
---@param vecX number
---@param vecY number
---@param vecZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
function applyForceToCar(car, vecX, vecY, vecZ, rotationX, rotationY, rotationZ) end

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

---@param modelId Model
---@return boolean result
function isModelInCdimage(modelId) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
function removeOilPuddlesInArea(x1, y1, x2, y2) end

---@param marker Marker
---@param type boolean
function setBlipAsFriendly(marker, type) end

---@param ped Ped
---@param toX number
---@param toY number
---@param toZ number
function taskSwimToCoord(ped, toX, toY, toZ) end

---@param modelId Model
---@return number x1
---@return number y1
---@return number z1
---@return number x2
---@return number y2
---@return number z2
function getModelDimensions(modelId) end

---@param ped Ped
---@return number maker
function copyCharDecisionMaker(ped) end

---@param group number
---@return number maker
function copyGroupDecisionMaker(group) end

---@param ped Ped
---@param car Vehicle
---@param speed number
---@param flag1 number
---@param flag2 number
---@param flag3 number
function taskDrivePointRouteAdvanced(ped, car, speed, flag1, flag2, flag3) end

---@param acquaintance number
---@param ofActors number
---@param toActors number
---@return boolean result
function isRelationshipSet(acquaintance, ofActors, toActors) end

---@param car Vehicle
---@param enable boolean
function setCarAlwaysCreateSkids(car, enable) end

---@param X number
---@param Y number
---@param Z number
---@return number city
function getCityFromCoords(X, Y, Z) end

---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param modelId Model
---@return boolean result
function hasObjectOfTypeBeenSmashed(X, Y, Z, radius, modelId) end

---@param player Player
---@return boolean result
function isPlayerPerformingWheelie(player) end

---@param player Player
---@return boolean result
function isPlayerPerformingStoppie(player) end

---@param checkpoint Checkpoint
---@param X number
---@param Y number
---@param Z number
function setCheckpointCoords(checkpoint, X, Y, Z) end

---@param car Vehicle
---@param f1 number
---@param f2 number
---@param f3 number
---@param f4 number
function controlCarHydraulics(car, f1, f2, f3, f4) end

---@param group number
---@return number numberOfLeaders
---@return number numberOfMembers
function getGroupSize(group) end

---@param object Object
---@param destructible boolean
function setObjectCollisionDamageEffect(object, destructible) end

---@param car Vehicle
---@param followCar number
---@param radius number
function setCarFollowCar(car, followCar, radius) end

function playerEnteredQuarryCrane() end

function playerEnteredLasVegasCrane() end

---@param interior GxtString
---@param access boolean
function switchEntryExit(interior, access) end

---@param X number
---@param Y number
---@param GXT GxtString
---@param value number
---@param flag number
function displayTextWithFloat(X, Y, GXT, value, flag) end

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

---@return boolean result
function is2playerGameGoingOn() end

---@return number fov
function getCameraFov() end

---@param car Vehicle
---@return boolean result
function doesCarHaveHydraulics(car) end

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

---@param player Player
---@return number number
function getTotalNumberOfPedsKilledByPlayer(player) end

---@param object Object
---@param spoot number
---@return number X
---@return number Y
---@return number Z
function getLevelDesignCoordsForObject(object, spoot) end

---@param ped Ped
---@return number event
function getCharHighestPriorityEvent(ped) end

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
---@return Vehicle car
function getCarCharIsUsing(ped) end

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
---@param stay boolean
function setCharKindaStayInSamePlace(ped, stay) end

---@param ped Ped
---@param walkMode number
---@param routeMode number
function taskFollowPatrolRoute(ped, walkMode, routeMode) end

---@param ped Ped
---@return boolean result
function isCharInAir(ped) end

---@param ped Ped
---@return number height
function getCharHeightAboveGround(ped) end

---@param ped Ped
---@param skill number
function setCharWeaponSkill(ped, skill) end

---@param size number
---@param r number
---@param g number
---@param b number
---@param a number
function setTextEdge(size, r, g, b, a) end

---@param car Vehicle
---@param broken boolean
function setCarEngineBroken(car, broken) end

---@param modelId Model
---@return boolean result
function isThisModelABoat(modelId) end

---@param modelId Model
---@return boolean result
function isThisModelAPlane(modelId) end

---@param modelId Model
---@return boolean result
function isThisModelAHeli(modelId) end

---@param enable boolean
function setFirstPersonInCarCameraMode(enable) end

---@param ped Ped
---@param ped2 Ped
---@param unk1 number
---@param unk2 number
function taskGreetPartner(ped, ped2, unk1, unk2) end

---@param heli Vehicle
function setHeliBladesFullSpeed(heli) end

---@param enable boolean
function displayHud(enable) end

---@param object Object
---@param lod number
function connectLods(object, lod) end

---@param max number
function setMaxFireGenerations(max) end

---@param ped Ped
---@param animation string
---@param ifp1 string
---@param ifp2 number
---@param time number
function taskDieNamedAnim(ped, animation, ifp1, ifp2, time) end

---@param player Player
---@param able boolean
function setPlayerDuckButton(player, able) end

---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
function setPoolTableCoords(x1, y1, z1, x2, y2, z2) end

---@param object Object
---@return boolean result
function hasObjectBeenPhotographed(object) end

---@param rotationZ number
---@param rotationY number
function doCameraBump(rotationZ, rotationY) end

---@return number day
---@return number month
function getCurrentDate() end

---@param object Object
---@param animation string
---@param speed number
function setObjectAnimSpeed(object, animation, speed) end

---@param object Object
---@param anim string
---@return boolean result
function isObjectPlayingAnim(object, anim) end

---@param object Object
---@param animation string
---@return number progress
function getObjectAnimCurrentTime(object, animation) end

---@param object Object
---@param animation string
---@param progress number
function setObjectAnimCurrentTime(object, animation, progress) end

---@param ped Ped
---@param vecX number
---@param vecY number
---@param vecZ number
function setCharVelocity(ped, vecX, vecY, vecZ) end

---@param ped Ped
---@return number vecX
---@return number vecY
---@return number vecZ
function getCharVelocity(ped) end

---@param ped Ped
---@param vecX number
---@param vecY number
---@param vecZ number
function setCharRotation(ped, vecX, vecY, vecZ) end

---@param car Vehicle
---@return number value
function getCarUprightValue(car) end

---@param car Vehicle
---@param interior number
function setVehicleInterior(car, interior) end

---@param car Vehicle
---@param gun boolean
function selectWeaponsForVehicle(car, gun) end

---@param player Player
---@return number city
function getCityPlayerIsIn(player) end

---@param X number
---@param Y number
---@param Z number
---@return GxtString name
function getNameOfZone(X, Y, Z) end

---@param activate boolean
function activateInteriorPeds(activate) end

---@param car Vehicle
---@param unk boolean
function setVehicleCanBeTargetted(car, unk) end

---@param ped Ped
---@param followActor number
function taskFollowFootsteps(ped, followActor) end

---@param ped Ped
---@param health number
---@param affectArmour boolean
function damageChar(ped, health, affectArmour) end

---@param car Vehicle
---@param can boolean
function setCarCanBeVisiblyDamaged(car, can) end

---@param heli Vehicle
---@param dist number
function setHeliReachedTargetDistance(heli, dist) end

---@param ped Ped
---@param X number
---@param Y number
---@param Z number
---@return number level
function getSoundLevelAtCoords(ped, X, Y, Z) end

---@param ped Ped
---@param enable boolean
function setCharAllowedToDuck(ped, enable) end

---@param player Player
---@param toAngle number
---@param rotationSpeed number
function setHeadingForAttachedPlayer(player, toAngle, rotationSpeed) end

---@param ped Ped
---@param alongisdeActor number
function taskWalkAlongsideChar(ped, alongisdeActor) end

---@param car Model
---@param X number
---@param Y number
---@param Z number
function createEmergencyServicesCar(car, X, Y, Z) end

---@param ped Ped
---@param stay boolean
function taskKindaStayInSamePlace(ped, stay) end

---@param car Vehicle
---@param path number
function startPlaybackRecordedCarLooped(car, path) end

---@param ped Ped
---@param interior number
function setCharInterior(ped, interior) end

---@param player Player
---@return boolean result
function isAttachedPlayerHeadingAchieved(player) end

---@param X number
---@param Y number
---@param radius number
---@param access boolean
function enableEntryExitPlayerGroupWarping(X, Y, radius, access) end

---@param X number
---@param Y number
---@param Z number
---@param radius number
---@return Object object
function getClosestStealableObject(X, Y, Z, radius) end

---@param interior number
---@return boolean result
function isProceduralInteriorActive(interior) end

---@param path number
function removeCarRecording(path) end

---@param zone GxtString
---@param popcycle number
function setZonePopulationRace(zone, popcycle) end

---@param object Object
---@param player boolean
function setObjectOnlyDamagedByPlayer(object, player) end

---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param flag1 number
---@param flag2 number
function createBirds(x1, y1, z1, x2, y2, z2, flag1, flag2) end

---@param car Vehicle
---@param level number
function setVehicleDirtLevel(car, level) end

---@param enable boolean
function setGangWarsActive(enable) end

---@return boolean result
function isGangWarGoingOn() end

---@param player Player
---@param clothes string
---@param model string
---@param bodyPart number
function givePlayerClothesOutsideShop(player, clothes, model, bodyPart) end

function clearLoadedShop() end

---@param group number
---@param Aspack number
function setGroupSequence(group, Aspack) end

---@param ped Ped
---@param droppable boolean
function setCharDropsWeaponsWhenDead(ped, droppable) end

---@param ped Ped
---@param set boolean
function setCharNeverLeavesGroup(ped, set) end

---@param player Player
---@param able boolean
function setPlayerFireButton(player, able) end

---@param particle Particle
---@param ped Ped
---@param mode number
function attachFxSystemToCharBone(particle, ped, mode) end

---@param handle number
---@param script GxtString
function registerAttractorScriptBrainForCodeUse(handle, script) end

---@param ped Ped
---@param orientation number
---@param limit number
function setHeadingLimitForAttachedChar(ped, orientation, limit) end

---@param ped Ped
---@return Marker blip
function addBlipForDeadChar(ped) end

---@param ped Ped
---@return number X
---@return number Y
---@return number Z
function getDeadCharCoordinates(ped) end

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

---@param car Vehicle
---@param multiplier number
function setVehicleAirResistanceMultiplier(car, multiplier) end

---@param car Vehicle
---@param X number
---@param Y number
---@param Z number
function setCarCoordinatesNoOffset(car, X, Y, Z) end

---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param modelId Model
---@param collisionDetection boolean
function setUsesCollisionOfClosestObjectOfType(X, Y, Z, radius, modelId, collisionDetection) end

function setTimeOneDayForward() end

---@param timer VarId
---@param reach number
function setTimerBeepCountdownTime(timer, reach) end

---@param trailer number
---@param cab number
function attachTrailerToCab(trailer, cab) end

---@param car Vehicle
---@param object Object
---@return boolean result
function isVehicleTouchingObject(car, object) end

---@param UP boolean
---@param DOWN boolean
---@param RELEASE boolean
function enableCraneControls(UP, DOWN, RELEASE) end

---@param ped Ped
---@return boolean result
function isPlayerInPositionForConversation(ped) end

---@param ped Ped
---@param enable boolean
function enableConversation(ped, enable) end

---@param X number
---@param Y number
---@param Z number
---@param radius number
---@return Ped ped
function getRandomCharInSphereOnlyDrugsBuyers(X, Y, Z, radius) end

---@param ped Ped
---@return number pedtype
function getPedType(ped) end

---@param ped Ped
---@param radius number
---@param nearModel Model
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param scriptNamed string
---@return boolean result
function taskUseClosestMapAttractor(ped, radius, nearModel, offsetX, offsetY, offsetZ, scriptNamed) end

---@param hydra number
---@param player Player
---@param radius number
function planeAttackPlayerUsingDogFight(hydra, player, radius) end

---@param can boolean
function canTriggerGangWarWhenOnAMission(can) end

---@param car Vehicle
---@param angle number
function controlMovableVehiclePart(car, angle) end

---@param car Vehicle
---@param attractive boolean
function winchCanPickVehicleUp(car, attractive) end

---@param car Vehicle
---@param door number
---@param rotation number
function openCarDoorABit(car, door, rotation) end

---@param car Vehicle
---@param door number
---@return boolean result
function isCarDoorFullyOpen(car, door) end

---@param set boolean
function setAlwaysDraw3dMarkers(set) end

---@param script number
function streamScript(script) end

---@param script number
---@return boolean result
function hasStreamedScriptLoaded(script) end

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

---@param enable boolean
function setNightVision(enable) end

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

---@param item number
---@param price number
function addPriceModifier(item, price) end

---@param item number
function removePriceModifier(item) end

function initZonePopulationSettings() end

---@param car Vehicle
---@param shake boolean
---@param effect boolean
---@param sound boolean
function explodeCarInCutsceneShakeAndBits(car, shake, effect, sound) end

---@return boolean result
function isSkipCutsceneButtonPressed() end

---@return boolean result
---@return number X
---@return number Y
---@return number Z
function getCutsceneOffset() end

---@param object Object
---@param scale number
function setObjectScale(object, scale) end

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

---@param menu number
---@param column number
---@param alignment number
function setMenuColumnOrientation(menu, column, alignment) end

---@param menu number
---@return number item
function getMenuItemSelected(menu) end

---@param menu number
---@return number item
function getMenuItemAccepted(menu) end

---@param menu number
---@param row number
---@param enable boolean
function activateMenuItem(menu, row, enable) end

---@param menu number
function deleteMenu(menu) end

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

---@param lose boolean
function switchDeathPenalties(lose) end

---@param lose boolean
function switchArrestPenalties(lose) end

---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param angle number
function setExtraHospitalRestartPoint(X, Y, Z, radius, angle) end

---@param X number
---@param Y number
---@param Z number
---@param radius number
---@param angle number
function setExtraPoliceStationRestartPoint(X, Y, Z, radius, angle) end

---@return number num
function findNumberTagsTagged() end

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

---@param X number
---@param Y number
---@param Z number
---@param radius number
---@return Ped ped
function getRandomCharInSphereNoBrain(X, Y, Z, radius) end

---@param plane number
---@param set boolean
function setPlaneUndercarriageUp(plane, set) end

---@param disable boolean
function disableAllEntryExits(disable) end

---@param modelId Model
---@param externalScript GxtString
function attachAnimsToModel(modelId, externalScript) end

---@param object Object
---@param liftable boolean
function setObjectAsStealable(object, liftable) end

---@param enable boolean
function setCreateRandomGangMembers(enable) end

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

---@param panel number
---@param column number
---@param row number
---@param gxtString GxtString
---@param number number
function setMenuItemWithNumber(panel, column, row, gxtString, number) end

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

---@param max boolean
function setScriptLimitToGangSize(max) end

function makePlayerGangDisappear() end

function makePlayerGangReappear() end

---@param player Player
---@param bodypart number
---@return number textureCRC
---@return number modelCRC
function getClothesItem(player, bodypart) end

---@param display boolean
function showUpdateStats(display) end

---@param checkpoint Checkpoint
---@param type number
function setCoordBlipAppearance(checkpoint, type) end

---@param enable boolean
function setHeathazeEffect(enable) end

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

---@param interface number
---@return number r
---@return number g
---@return number b
---@return number a
function getHudColour(interface) end

---@param door number
---@param lock boolean
function lockDoor(door, lock) end

---@param object Object
---@param mass number
function setObjectMass(object, mass) end

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

---@param panel number
---@param activeRow number
function setActiveMenuItem(panel, activeRow) end

---@param externalScript number
function markStreamedScriptAsNoLongerNeeded(externalScript) end

---@param externalScript number
function removeStreamedScript(externalScript) end

---@param priority boolean
---@param leftmargin number
---@param maxwidth number
function setMessageFormatting(priority, leftmargin, maxwidth) end

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

---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radius number
---@param modelId Model
---@param externalScriptNamed string
---@return Ped ped
function getUserOfClosestMapAttractor(sphereX, sphereY, sphereZ, radius, modelId, externalScriptNamed) end

---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchRoadsBackToOriginal(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---@param cornerAX number
---@param cornerAY number
---@param cornerAZ number
---@param cornerBX number
---@param cornerBY number
---@param cornerBZ number
function switchPedRoadsBackToOriginal(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ) end

---@param plane number
---@return number landingGearStatus
function getPlaneUndercarriagePosition(plane) end

---@param pointX number
---@param pointY number
---@param pointZ number
---@param transverseX number
---@param transverseY number
---@param transverseZ number
---@param time number
---@param smooth boolean
function cameraSetVectorTrack(pointX, pointY, pointZ, transverseX, transverseY, transverseZ, time, smooth) end

---@param from number
---@param to number
---@param timelimit number
---@param smoothTransition boolean
function cameraSetLerpFov(from, to, timelimit, smoothTransition) end

---@param enable boolean
function switchAmbientPlanes(enable) end

---@param enable boolean
---@param value number
function setDarknessEffect(enable, value) end

function cameraResetNewScriptables() end

---@param externalScript number
---@return number value
function getNumberOfInstancesOfStreamedScript(externalScript) end

---@param externalScript number
---@param actorModel Model
---@param priority number
function allocateStreamedScriptToRandomPed(externalScript, actorModel, priority) end

---@param externalScript number
---@param objectModel Model
---@param priority number
---@param radius number
---@param type number
function allocateStreamedScriptToObject(externalScript, objectModel, priority, radius, type) end

---@param group number
---@param member number
---@return number handle
function getGroupMember(group, member) end

---@param atX number
---@param atY number
---@param ignoreWaves boolean
---@return number height
function getWaterHeightAtCoords(atX, atY, ignoreWaves) end

---@param lock boolean
function cameraPersistTrack(lock) end

---@param lock boolean
function cameraPersistPos(lock) end

---@param lock boolean
function cameraPersistFov(lock) end

---@return boolean result
function cameraIsVectorMoveRunning() end

---@return boolean result
function cameraIsVectorTrackRunning() end

---@param cameraX number
---@param cameraY number
---@param cameraZ number
---@param positionX number
---@param positionY number
---@param positionZ number
---@param time number
---@param smoothTransition boolean
function cameraSetVectorMove(cameraX, cameraY, cameraZ, positionX, positionY, positionZ, time, smoothTransition) end

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

---@param lock boolean
function setCinemaCamera(lock) end

---@param ped Ped
---@param multiplier number
function setCharFireDamageMultiplier(ped, multiplier) end

---@param group number
---@param status boolean
function setGroupFollowStatus(group, status) end

---@param searchlight Searchlight
---@param flag boolean
function setSearchlightClipIfColliding(searchlight, flag) end

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

---@param atX number
---@param atY number
---@param atZ number
---@param type number
---@param cameraShake number
function addExplosionVariableShake(atX, atY, atZ, type, cameraShake) end

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

---@param posX number
---@param posY number
---@param posZ number
---@param angle number
function setUpSkip(posX, posY, posZ, angle) end

function clearSkip() end

---@param soundtrack number
function preloadBeatTrack(soundtrack) end

---@return number status
function getBeatTrackStatus() end

function playBeatTrack() end

function stopBeatTrack() end

---@return number max
function findMaxNumberOfGroupMembers() end

---@param car Vehicle
---@param providesCover boolean
function vehicleDoesProvideCover(car, providesCover) end

---@param atX number
---@param atY number
---@param atZ number
---@return Pickup pickup
function createSnapshotPickup(atX, atY, atZ) end

---@param atX number
---@param atY number
---@param atZ number
---@return Pickup pickup
function createHorseshoePickup(atX, atY, atZ) end

---@param atX number
---@param atY number
---@param atZ number
---@return Pickup pickup
function createOysterPickup(atX, atY, atZ) end

---@param object Object
---@return boolean result
function hasObjectBeenUprooted(object) end

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

---@param from number
---@return number to
function copySharedCharDecisionMaker(from) end

---@param atX number
---@param atY number
---@param atZ number
---@param event number
function reportMissionAudioEventAtPosition(atX, atY, atZ, event) end

---@param at number
---@param event number
function reportMissionAudioEventAtObject(at, event) end

---@param id number
---@param object Object
function attachMissionAudioToObject(id, object) end

---@param car Vehicle
---@return number colours
function getNumCarColours(car) end

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

---@param enable boolean
function setOnlyCreateGangMembers(enable) end

---@param object Object
---@return Model modelId
function getObjectModel(object) end

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

---@param width number
function setHelpMessageBoxSize(width) end

---@param range number
function setGunshotSenseRangeForRiot2(range) end

---@param car Vehicle
---@return number angle
function getCarMovingComponentOffset(car) end

---@param interior GxtString
---@param bitmask number
---@param flag boolean
function setNamedEntryExitFlag(interior, bitmask, flag) end

---@param paused boolean
function pauseCurrentBeatTrack(paused) end

---@param player Player
---@param scrollable boolean
function setPlayerWeaponsScrollable(player, scrollable) end

---@param atX number
---@param atY number
---@param atZ number
function markRoadNodeAsDontWander(atX, atY, atZ) end

function unmarkAllRoadNodesAsDontWander() end

---@param checkpoint Checkpoint
---@param angle number
function setCheckpointHeading(checkpoint, angle) end

---@param respect number
function setMissionRespectTotal(respect) end

---@param respect number
function awardPlayerMissionRespect(respect) end

---@param car Vehicle
---@param collision boolean
function setCarCollision(car, collision) end

---@param car Vehicle
function changePlaybackToUseAi(car) end

---@param type number
---@param timelimit number
---@param intensity number
function cameraSetShakeSimulationSimple(type, timelimit, intensity) end

---@return boolean result
function isNightVisionActive() end

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

---@param draw boolean
function drawCrosshair(draw) end

---@param question GxtString
---@param answerY GxtString
---@param answerN GxtString
---@param questionWav number
---@param answerYWav number
---@param answerNWav number
function setUpConversationNodeWithSpeech(question, answerY, answerN, questionWav, answerYWav, answerNWav) end

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

---@param passengers number
---@param audioTable number
function randomPassengerSay(passengers, audioTable) end

---@param hide boolean
function hideAllFrontendBlips(hide) end

---@param mode number
function setPlayerInCarCameraMode(mode) end

---@param ped Ped
---@return boolean result
function isCharInAnyTrain(ped) end

---@param posX number
---@param posY number
---@param posZ number
---@param angle number
function setUpSkipAfterMission(posX, posY, posZ, angle) end

---@param car Vehicle
---@param accessible boolean
function setVehicleIsConsideredByPlayer(car, accessible) end

---@param unk boolean
---@return Model modelId
---@return number class
function getRandomCarModelInMemory(unk) end

---@param car Vehicle
---@return number doorStatus
function getCarDoorLockStatus(car) end

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

---@param atX number
---@param atY number
---@param atZ number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param density number
---@param onActor number
function addBlood(atX, atY, atZ, offsetX, offsetY, offsetZ, density, onActor) end

---@param show boolean
function displayCarNames(show) end

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

---@param enable boolean
function setMinigameInProgress(enable) end

---@return boolean result
function isMinigameInProgress() end

---@param modelId Model
function setForceRandomCarModel(modelId) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param angle number
---@param int6 number
---@return Vehicle car
function getRandomCarOfTypeInAngledAreaNoSave(x1, y1, x2, y2, angle, int6) end

---@param int1 boolean
function addNextMessageToPreviousBriefs(int1) end

function failKillFrenzy() end

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

---@param atX number
---@param atY number
---@param atZ number
---@return boolean result
function isMoneyPickupAtCoords(atX, atY, atZ) end

---@param panel number
---@param column number
---@param width number
function setMenuColumnWidth(panel, column, width) end

---@param group number
function makeRoomInPlayerGangForMissionPeds(group) end

---@param ped Ped
---@return boolean result
function isCharGettingInToACar(ped) end

---@param posX number
---@param posY number
---@param posZ number
---@param angle number
---@param car Vehicle
function setUpSkipForSpecificVehicle(posX, posY, posZ, angle, car) end

---@param modelId Model
---@return number price
function getCarModelValue(modelId) end

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

---@param enable boolean
function setAircraftCarrierSamSite(enable) end

---@param atX number
---@param atY number
---@param atZ number
---@param r number
---@param g number
---@param b number
---@param radius number
function drawLightWithRange(atX, atY, atZ, r, g, b, radius) end

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

---@param allow boolean
function allowFixedCameraCollision(allow) end

---@param ped Ped
---@param ped2 Ped
---@return boolean result
function hasCharSpottedCharInFront(ped, ped2) end

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

---@param maker number
---@return boolean result
function doesDecisionMakerExist(maker) end

---@param ped Ped
---@param ignore boolean
function ignoreHeightDifferenceFollowingNodes(ped, ignore) end

---@param enable boolean
function shutAllCharsUp(enable) end

---@param ped Ped
---@param canGetOut boolean
function setCharGetOutUpsideDownCar(ped, canGetOut) end

---@param car Vehicle
---@param event number
function reportMissionAudioEventAtCar(car, event) end

function doWeaponStuffAtStartOf2pGame() end

---@return boolean result
function hasGameJustReturnedFromFrontend() end

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

---@param coordX number
---@param coordY number
---@param coordZ number
---@param angle number
function loadSceneInDirection(coordX, coordY, coordZ, angle) end

---@param player Player
---@return boolean result
function isPlayerUsingJetpack(player) end

---@param style number
function clearThisPrintBigNow(style) end

---@return boolean result
function hasLanguageChanged() end

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

---@param enable boolean
function setNoResprays(enable) end

---@param car Vehicle
---@return boolean result
function hasCarBeenResprayed(car) end

---@param audioId number
---@param car Vehicle
function attachMissionAudioToCar(audioId, car) end

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

---@param unk boolean
function takePhoto(unk) end

---@param stat number
---@param value number
function incrementFloatStatNoMessage(stat, value) end

---@param player Player
---@param followAlways boolean
function setPlayerGroupToFollowAlways(player, followAlways) end

---@param car Vehicle
---@param affectedByCheats boolean
function improveCarByCheating(car, affectedByCheats) end

---@param panelID number
---@param car Vehicle
---@param colorslot number
---@param activeRow number
function changeCarColourFromMenu(panelID, car, colorslot, activeRow) end

---@param panel number
---@param row number
---@param highlight boolean
function highlightMenuItem(panel, row, highlight) end

---@param disable boolean
function setDisableMilitaryZones(disable) end

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

---@return boolean result
function isWidescreenOnInOptions() end

---@param flag boolean
function drawSubtitlesBeforeFade(flag) end

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

---@param posX number
---@param posY number
---@param posZ number
---@param angle number
---@param car Vehicle
function setUpSkipForVehicleFinishedByScript(posX, posY, posZ, angle, car) end

---@return boolean result
function isSkipWaitingForScriptToFadeIn() end

---@param off boolean
function forceAllVehicleLightsOff(off) end

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

---@param enable boolean
function activatePimpCheat(enable) end

---@param sphereX number
---@param sphereY number
---@param sphereZ number
---@param radiusX number
---@param radiusY number
---@param radiusZ number
---@return Ped ped
function getRandomCharInAreaOffsetNoSave(sphereX, sphereY, sphereZ, radiusX, radiusY, radiusZ) end

---@param enable boolean
function setScriptCoopGame(enable) end

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

---@return number playerpoolPtr
function sampGetPlayerPoolPtr() end

---@return number vehpoolPtr
function sampGetVehiclePoolPtr() end

---@return number pickuppoolPtr
function sampGetPickupPoolPtr() end

---@param id number
---@param dstBuffer number
function sampStorePlayerOnfootData(id, dstBuffer) end

---@param id number
---@param dstBuffer number
function sampStorePlayerIncarData(id, dstBuffer) end

---@param id number
---@param dstBuffer number
function sampStorePlayerPassengerData(id, dstBuffer) end

---@param id number
---@param dstBuffer number
function sampStorePlayerTrailerData(id, dstBuffer) end

---@param id number
---@param dstBuffer number
function sampStorePlayerAimData(id, dstBuffer) end

---@param cmd string
function sampSendRconCommand(cmd) end

---@param dataPtr number
function sampSendOnfootData(dataPtr) end

---@param dataPtr number
function sampSendIncarData(dataPtr) end

---@param dataPtr number
function sampSendPassengerData(dataPtr) end

---@param dataPtr number
function sampSendAimData(dataPtr) end

---@param dataPtr number
function sampSendBulletData(dataPtr) end

---@param dataPtr number
function sampSendTrailerData(dataPtr) end

---@param dataPtr number
function sampSendUnoccupiedData(dataPtr) end

---@param dataPtr number
function sampSendSpectatorData(dataPtr) end

---@param id number
---@param source number
function sampSendClickPlayer(id, source) end

---@param id number
---@param button number
---@param listitem number
---@param input string
function sampSendDialogResponse(id, button, listitem, input) end

---@param id number
function sampSendClickTextdraw(id) end

---@param id number
---@param damage number
---@param weapon number
---@param bodypart number
function sampSendGiveDamage(id, damage, weapon, bodypart) end

---@param id number
---@param damage number
---@param weapon number
---@param bodypart number
function sampSendTakeDamage(id, damage, weapon, bodypart) end

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

---@param id number
function sampSendInteriorChange(id) end

function sampSendRequestSpawn() end

---@param id number
function sampSendPickedUpPickup(id) end

---@param id number
function sampSendMenuSelectRow(id) end

function sampSendMenuQuit() end

---@param id number
function sampSendVehicleDestroyed(id) end

---@return boolean result
function sampIsScoreboardOpen() end

---@param show boolean
function sampToggleScoreboard(show) end

---@return string text
function sampGetDialogText() end

---@return string caption
function sampGetDialogCaption() end

---@param clientside boolean
function sampSetDialogClientside(clientside) end

---@return boolean result
function sampIsDialogClientside() end

---@return boolean result
function sampIsChatVisible() end

---@return number mode
function sampGetChatDisplayMode() end

---@param mode number
function sampSetChatDisplayMode(mode) end

---@param thread number
function pauseScmThread(thread) end

---@param thread number
function resumeScmThread(thread) end

---@param bs Bitstream
---@return boolean value
function raknetBitStreamReadBool(bs) end

---@param bs Bitstream
---@return number value
function raknetBitStreamReadInt8(bs) end

---@param bs Bitstream
---@return number value
function raknetBitStreamReadInt16(bs) end

---@param bs Bitstream
---@return number value
function raknetBitStreamReadInt32(bs) end

---@param bs Bitstream
---@return number value
function raknetBitStreamReadFloat(bs) end

---@param bs Bitstream
---@param dest number
---@param size number
function raknetBitStreamReadBuffer(bs, dest, size) end

---@param bs Bitstream
---@param size number
---@return string value
function raknetBitStreamReadString(bs, size) end

---@param bs Bitstream
function raknetBitStreamResetReadPointer(bs) end

---@param bs Bitstream
function raknetBitStreamResetWritePointer(bs) end

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
---@return number value
function raknetBitStreamGetNumberOfBitsUsed(bs) end

---@param bs Bitstream
---@return number value
function raknetBitStreamGetNumberOfBytesUsed(bs) end

---@param bs Bitstream
---@return number value
function raknetBitStreamGetNumberOfUnreadBits(bs) end

---@param bs Bitstream
---@return number value
function raknetBitStreamGetWriteOffset(bs) end

---@param bs Bitstream
---@return number value
function raknetBitStreamGetReadOffset(bs) end

---@param bs Bitstream
---@return number value
function raknetBitStreamGetDataPtr(bs) end

---@param bs Bitstream
---@param size number
---@return string string
function raknetBitStreamDecodeString(bs, size) end

---@param bs Bitstream
---@param string string
function raknetBitStreamEncodeString(bs, string) end

---@param rpc number
---@param bs Bitstream
function raknetEmulRpcReceiveBitStream(rpc, bs) end

---@param packet number
---@param bs Bitstream
function raknetEmulPacketReceiveBitStream(packet, bs) end

---@param rpc number
---@return string name
function raknetGetRpcName(rpc) end

---@param packet number
---@return string name
function raknetGetPacketName(packet) end

---@param var string
---@param value number
---@return boolean result
function setSampfuncsGlobalVar(var, value) end

---@param var string
---@return boolean result
---@return number value
function getSampfuncsGlobalVar(var) end

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

---@param id number
---@param text string
function sampSet3dTextString(id, text) end

---@param id number
---@param text string
---@param posX number
---@param posY number
function sampTextdrawCreate(id, text, posX, posY) end

---@param id number
---@param box number
---@param color number
---@param sizeX number
---@param sizeY number
function sampTextdrawSetBoxColorAndSize(id, box, color, sizeX, sizeY) end

---@param id number
---@param align number
function sampTextdrawSetAlign(id, align) end

---@param id number
---@param proportional number
function sampTextdrawSetProportional(id, proportional) end

---@param id number
---@param style number
function sampTextdrawSetStyle(id, style) end

---@param id number
---@param shadow number
---@param color number
function sampTextdrawSetShadow(id, shadow, color) end

---@param id number
---@param outline number
---@param color number
function sampTextdrawSetOutlineColor(id, outline, color) end

---@param id number
---@param model number
---@param rotX number
---@param rotY number
---@param rotZ number
---@param zoom number
---@param clr1 number
---@param clr2 number
function sampTextdrawSetModelRotationZoomVehColor(id, model, rotX, rotY, rotZ, zoom, clr1, clr2) end

---@param id number
---@param text string
function sampTextdrawSetString(id, text) end

---@param id number
---@param posX number
---@param posY number
function sampTextdrawSetPos(id, posX, posY) end

---@param id number
---@param letSizeX number
---@param letSizeY number
---@param color number
function sampTextdrawSetLetterSizeAndColor(id, letSizeX, letSizeY, color) end

---@param id number
---@return number box
---@return number color
---@return number sizeX
---@return number sizeY
function sampTextdrawGetBoxEnabledColorAndSize(id) end

---@param id number
---@return number align
function sampTextdrawGetAlign(id) end

---@param id number
---@return number prop
function sampTextdrawGetProportional(id) end

---@param id number
---@return number style
function sampTextdrawGetStyle(id) end

---@param id number
---@return number shadow
---@return number color
function sampTextdrawGetShadowColor(id) end

---@param id number
---@return number outline
---@return number color
function sampTextdrawGetOutlineColor(id) end

---@param id number
---@return number model
---@return number rotX
---@return number rotY
---@return number rotZ
---@return number zoom
---@return number clr1
---@return number clr2
function sampTextdrawGetModelRotationZoomVehColor(id) end

---@param id number
---@return string text
function sampTextdrawGetString(id) end

---@param id number
---@return number posX
---@return number posY
function sampTextdrawGetPos(id) end

---@param id number
---@return number letSizeX
---@return number letSizeY
---@return number color
function sampTextdrawGetLetterSizeAndColor(id) end

---@param id number
---@return boolean result
function sampTextdrawIsExists(id) end

---@param id number
function sampTextdrawDelete(id) end

---@param var string
---@return boolean result
function isSampfuncsGlobalVarDefined(var) end

---@param var string
---@param thread number
---@return boolean read
---@return boolean write
function getSampfuncsGlobalVarAccessForThread(var, thread) end

---@param cmd string
function runSampfuncsConsoleCommand(cmd) end

---@param cmd string
---@param func function
---@return boolean result
function sampfuncsRegisterConsoleCommand(cmd, func) end

---@param cmd string
---@return boolean result
function sampfuncsUnregisterConsoleCommand(cmd) end

---@param pointer number
---@param args table
---@return number thread
function createScmThreadAtPointer(pointer, args) end

---@param thread number
---@param var number
---@param value any
function setScmThreadLocalVar(thread, var, value) end

---@param thread number
---@param var number
---@return number value
function getScmThreadLocalVar(thread, var) end

---@param thread number
function destroyScmThread(thread) end

---@param thread number
---@param args table
function restartScmThread(thread, args) end

---@return boolean result
function isSampfuncsConsoleActive() end

---@param cmd string
---@param text string
function sampSetClientCommandDescription(cmd, text) end

---@param cmd string
---@param text string
function setSampfuncsConsoleCommandDescription(cmd, text) end

---@param id number
function sampForceVehicleSync(id) end

---@param id number
---@param seatId number
function sampForceUnoccupiedSyncSeatId(id, seatId) end

function sampForceOnfootSync() end

function sampForceAimSync() end

---@param id number
function sampForceTrailerSync(id) end

---@param id number
---@param seatId number
function sampForcePassengerSyncSeatId(id, seatId) end

function sampForceStatsSync() end

function sampForceWeaponsSync() end

---@param streamed boolean
---@return number id
function sampGetMaxPlayerId(streamed) end

---@param streamed boolean
---@return number count
function sampGetPlayerCount(streamed) end

---@param text string
function sampProcessChatInput(text) end

---@param cmd string
---@return boolean result
function sampIsChatCommandDefined(cmd) end

---@param cmd string
---@return boolean result
function isSampfuncsConsoleCommandDefined(cmd) end

---@return number version
function getCleoLibraryVersion() end

---@param object Object
---@return number x
---@return number y
---@return number z
---@return number w
function getObjectQuaternion(object) end

---@param object Object
---@param x number
---@param y number
---@param z number
---@param w number
function setObjectQuaternion(object, x, y, z, w) end

---@param car Vehicle
---@return number x
---@return number y
---@return number z
---@return number w
function getVehicleQuaternion(car) end

---@param car Vehicle
---@param x number
---@param y number
---@param z number
---@param w number
function setVehicleQuaternion(car, x, y, z, w) end

---@param ped Ped
---@return number x
---@return number y
---@return number z
---@return number w
function getCharQuaternion(ped) end

---@param ped Ped
---@param x number
---@param y number
---@param z number
---@param w number
function setCharQuaternion(ped, x, y, z, w) end

---@param audio string
---@return AudioStream handle
function loadAudioStream(audio) end

---@param handle AudioStream
---@param state number
function setAudioStreamState(handle, state) end

---@param handle AudioStream
function releaseAudioStream(handle) end

---@param handle AudioStream
---@return number length
function getAudioStreamLength(handle) end

---@param handle AudioStream
---@return number state
function getAudioStreamState(handle) end

---@param audio AudioStream
---@return number volume
function getAudioStreamVolume(audio) end

---@param audio AudioStream
---@param volume number
function setAudioStreamVolume(audio, volume) end

---@param audio AudioStream
---@param loop boolean
function setAudioStreamLooped(audio, loop) end

---@param audio string
---@return AudioStream handle
function load3dAudioStream(audio) end

---@param handle AudioStream
---@param posX number
---@param posY number
---@param posZ number
function setPlay3dAudioStreamAtCoordinates(handle, posX, posY, posZ) end

---@param audio AudioStream
---@param object Object
function setPlay3dAudioStreamAtObject(audio, object) end

---@param audio AudioStream
---@param ped Ped
function setPlay3dAudioStreamAtChar(audio, ped) end

---@param audio AudioStream
---@param car Vehicle
function setPlay3dAudioStreamAtCar(audio, car) end

---@param address number
---@param size number
---@return AudioStream handle
function loadAudioStreamFromMemory(address, size) end

---@param address number
---@param size number
---@return AudioStream handle
function load3dAudioStreamFromMemory(address, size) end

---@param pos1X number
---@param pos1Y number
---@param pos2X number
---@param pos2Y number
---@param width number
---@param color number
function renderDrawLine(pos1X, pos1Y, pos2X, pos2Y, width, color) end

---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
---@param color number
function renderDrawBox(posX, posY, sizeX, sizeY, color) end

---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
---@param color number
---@param bsize number
---@param bcolor number
function renderDrawBoxWithBorder(posX, posY, sizeX, sizeY, color, bsize, bcolor) end

---@param font DxFont
---@param text string
---@param ignoreColorTags boolean
---@return number length
function renderGetFontDrawTextLength(font, text, ignoreColorTags) end

---@param font DxFont
---@return number height
function renderGetFontDrawHeight(font) end

---@param font DxFont
---@param text string
---@param x number
---@param ignoreColorTags boolean
---@return number index
function renderGetFontCharIndexAt(font, text, x, ignoreColorTags) end

---@param font DxFont
---@param char number
---@return number width
function renderGetFontCharWidth(font, char) end

---@param font string
---@param height number
---@param flags number
---@param charset? number
---@return DxFont font
function renderCreateFont(font, height, flags, charset) end

---@param font DxFont
function renderReleaseFont(font) end

---@param font DxFont
---@param text string
---@param posX number
---@param posY number
---@param color number
---@param ignoreColorTags boolean
function renderFontDrawText(font, text, posX, posY, color, ignoreColorTags) end

---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
---@param corners number
---@param rotation number
---@param color number
function renderDrawPolygon(posX, posY, sizeX, sizeY, corners, rotation, color) end

---@param file string
---@return DxTexture texture
function renderLoadTextureFromFile(file) end

---@param texture DxTexture
function renderReleaseTexture(texture) end

---@param texture DxTexture
---@param posX number
---@param posY number
---@param sizeX number
---@param sizeY number
---@param rotation number
---@param color number
function renderDrawTexture(texture, posX, posY, sizeX, sizeY, rotation, color) end

---@param type number
function renderBegin(type) end

function renderEnd() end

---@param color number
function renderColor(color) end

---@param vX number
---@param vY number
function renderVertex(vX, vY) end

---@param posX number
---@param posY number
function renderSetTexCoord(posX, posY) end

---@param texture DxTexture
function renderBindTexture(texture) end

---@param texture DxTexture
---@return number struct
function renderGetTextureStruct(texture) end

---@param texture DxTexture
---@return number sprite
function renderGetTextureSprite(texture) end

---@param texture DxTexture
---@return number sizeX
---@return number sizeY
function renderGetTextureSize(texture) end

---@param state number
---@param value number
function renderSetRenderState(state, value) end

---@param pointer number
---@param size number
---@return DxTexture texture
function renderLoadTextureFromFileInMemory(pointer, size) end

---@param version number
function script_version_number(version) end

---@param version string
function script_version(version) end

---@param name string
function script_name(name) end

---@param description string
function script_description(description) end

---@param author string
function script_authors(author) end

---@param author string
function script_author(author) end

---@param name string
function script_dependencies(name) end

---@param version number
function script_moonloader(version) end

---@param time number
function wait(time) end

---@param value any
function print(value) end

---@param index number
---@return number value
function getGameGlobal(index) end

---@param index number
---@param value number
function setGameGlobal(index, value) end

---@param index number
---@return number ptr
function getGameGlobalPtr(index) end

---@return boolean loaded
function isSampfuncsLoaded() end

---@return boolean loaded
function isCleoLoaded() end

---@return boolean loaded
function isSampLoaded() end

---@param keyId number
---@return boolean state
function isKeyDown(keyId) end

function reloadScripts() end

---@return boolean status
function isOpcodesAvailable() end

---@param f number
---@return number i
function representFloatAsInt(f) end

---@param i number
---@return number i
function representIntAsFloat(i) end

---@param key string
---@param text string
function setGxtEntry(key, text) end

---@param text string
---@return string key
function setFreeGxtEntry(text) end

---@return string key
function getFreeGxtKey() end

---@param key string
---@return string text
function getGxtText(key) end

---@param key string
function clearGxtEntry(key) end

---@return boolean active
function isPauseMenuActive() end

---@return boolean foreground
function isGameWindowForeground() end

---@return number major
---@return number minor
---@return number majorRev
---@return number minorRev
---@return number game
---@return number region
---@return boolean steam
---@return boolean cracked
function getGameVersion() end

---@return number version
function getMoonloaderVersion() end

---@return number time
function localClock() end

function freeTextures() end

---@return string path
function getWorkingDirectory() end

---@return string path
function getGameDirectory() end

---@param enable boolean
function useRenderCommands(enable) end

---@param address number
---@param size number
---@param value number
---@param virtualProtect boolean
function writeMemory(address, size, value, virtualProtect) end

---@param address number
---@param size number
---@param virtualProtect boolean
---@return number value
function readMemory(address, size, virtualProtect) end

---@param library string
---@return boolean result
---@return number handle
function loadDynamicLibrary(library) end

---@param handle number
function freeDynamicLibrary(handle) end

---@param proc string
---@param handle number
---@return boolean result
---@return number proc
function getDynamicLibraryProcedure(proc, handle) end

---@param file string
---@return boolean result
function doesFileExist(file) end

---@param directory string
---@return boolean result
function doesDirectoryExist(directory) end

---@param directory string
---@return boolean result
function createDirectory(directory) end

---@return number val
function popFloat() end

---@return boolean result
function isGameVersionOriginal() end

---@param size number
---@return number memory
function allocateMemory(size) end

---@param memory number
function freeMemory(memory) end

---@param mask string
---@return Filesearch handle
---@return string name
function findFirstFile(mask) end

---@param handle Filesearch
---@return string file
function findNextFile(handle) end

---@param handle Filesearch
function findClose(handle) end

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

---@param address number
---@param params number
---@param pop number
---@return number returnValue
function callFunction(address, params, pop) end

---@param address number
---@param struct number
---@param params number
---@param pop number
---@return number returnValue
function callMethod(address, struct, params, pop) end

---@param ped Ped
---@return Vehicle car
---@return Ped ped
function storeClosestEntities(ped) end

---@param car Vehicle
---@param state boolean
function switchCarEngine(car, state) end

---@return boolean result
---@return number posX
---@return number posY
---@return number posZ
function getTargetBlipCoordinates() end

---@param car Vehicle
---@return number gears
function getCarNumberOfGears(car) end

---@param car Vehicle
---@return number gear
function getCarCurrentGear(car) end

---@param car Vehicle
---@return boolean state
function isCarSirenOn(car) end

---@param car Vehicle
---@return boolean state
function isCarEngineOn(car) end

---@param text string
function printHelpString(text) end

---@param text string
---@param time number
---@param style number
function printStyledString(text, time, style) end

---@param text string
---@param time number
function printString(text, time) end

---@param text string
---@param time number
function printStringNow(text, time) end

---@param player Player
---@return boolean result
---@return Ped ped
function getCharPlayerIsTargeting(player) end

---@param modelId Model
---@return GxtString name
function getNameOfVehicleModel(modelId) end

---@param text string
---@return boolean result
function testCheat(text) end

---@param modelId Model
---@return boolean result
function spawnVehicleByCheating(modelId) end

---@param ptr number
---@return Ped handle
function getCharPointerHandle(ptr) end

---@param ptr number
---@return Vehicle handle
function getVehiclePointerHandle(ptr) end

---@param ptr number
---@return Object handle
function getObjectPointerHandle(ptr) end

---@param originX number
---@param originY number
---@param originZ number
---@param targetX number
---@param targetY number
---@param targetZ number
---@param checkSolid boolean
---@param car boolean
---@param ped boolean
---@param object boolean
---@param particle boolean
---@param seeThrough boolean
---@param ignoreSomeObjects boolean
---@param shootThrough boolean
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

---@param text string
---@return boolean result
function setClipboardText(text) end

---@return string text
function getClipboardText() end

---@param struct number
---@param offset number
---@param size number
---@param unprotect boolean
---@return number value
function getStructElement(struct, offset, size, unprotect) end

---@param struct number
---@param offset number
---@param size number
---@param value number
---@param unprotect boolean
function setStructElement(struct, offset, size, value, unprotect) end

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

---@param posX number
---@param posY number
---@param posZ number
---@return number wposX
---@return number wposY
function convert3DCoordsToScreen(posX, posY, posZ) end

---@param key number
---@param state number
function setGameKeyState(key, state) end

---@return number posX
---@return number posY
function getCursorPos() end

---@param wposX number
---@param wposY number
---@return number gposX
---@return number gposY
function convertWindowScreenCoordsToGameScreenCoords(wposX, wposY) end

---@param gposX number
---@param gposY number
---@return number wposX
---@return number wposY
function convertGameScreenCoordsToWindowScreenCoords(gposX, gposY) end

---@param posX number
---@param posY number
---@param depth number
---@return number posX
---@return number posY
---@return number posZ
function convertScreenCoordsToWorld3D(posX, posY, depth) end

---@param module string
---@return number handle
function getModuleHandle(module) end

---@param module string
---@param proc string
---@return number address
function getModuleProcAddress(module, proc) end

---@param vkey number
---@param down boolean
function setVirtualKeyDown(vkey, down) end

---@param ckey number
---@param down boolean
function setCharKeyDown(ckey, down) end

---@param url string
---@param file string
---@param statusCallback function
---@return number index
function downloadUrlToFile(url, file, statusCallback) end

---@param key number
---@return boolean state
function isKeyJustPressed(key) end

---@param posX number
---@param posY number
---@param posZ number
---@param checkMin boolean
---@param checkMax boolean
---@return boolean result
---@return number x
---@return number y
---@return number z
---@return number w
---@return number h
function convert3DCoordsToScreenEx(posX, posY, posZ, checkMin, checkMax) end

---@param struct number
---@param offset number
---@param unprotect boolean
---@return number value
function getStructFloatElement(struct, offset, unprotect) end

---@param struct number
---@param offset number
---@param value number
---@param unprotect boolean
function setStructFloatElement(struct, offset, value, unprotect) end

---@param key number
---@return boolean state
function wasKeyPressed(key) end

---@param key number
---@return boolean state
function wasKeyReleased(key) end

---@return number delta
function getMousewheelDelta() end

---@param game boolean
---@param scripts boolean
function consumeWindowMessage(game, scripts) end

---@param eventName string
---@param callback function
function addEventHandler(eventName, callback) end

---@return boolean paused
function isGamePaused() end

---@return number time
function gameClock() end

---@param property string
function script_properties(property) end

---@param url string
function script_url(url) end

---@param filename string
---@return any imports
function import(filename) end

---@param data table
---@return string json
function encodeJson(data) end

---@param json string
---@return table data
function decodeJson(json) end

---@param show boolean
---@param lockControls boolean
function showCursor(show, lockControls) end

---@param lock boolean
function lockPlayerControl(lock) end

---@return boolean locked
function isPlayerControlLocked() end

---@param blip Marker
---@param x number
---@param y number
---@param z number
---@return boolean result
function setBlipCoordinates(blip, x, y, z) end

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

---@return boolean result
function removeWaypoint() end

---@param csidl number
---@return string path
function getFolderPath(csidl) end

---@return number value
function getTimeStepValue() end

---@return number devicePtr
function getD3DDevicePtr() end

---@return table objects
function getAllObjects() end

---@return table peds
function getAllChars() end

---@return table vehicles
function getAllVehicles() end

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
