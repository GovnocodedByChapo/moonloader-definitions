--- @meta
--- Use
---```lua
---local sampfuncs = require('sampfuncs')
---```
local sampfuncs = {
	RPC_CLICKPLAYER = 23,
	RPC_CLIENTJOIN = 25,
	RPC_ENTERVEHICLE = 26,
	RPC_ENTEREDITOBJECT = 27,
	RPC_SCRIPTCASH = 31,
	RPC_SERVERCOMMAND = 50,
	RPC_SPAWN = 52,
	RPC_DEATH = 53,
	RPC_NPCJOIN = 54,
	RPC_DIALOGRESPONSE = 62,
	RPC_CLICKTEXTDRAW = 83,
	RPC_SCMEVENT = 96,
	RPC_WEAPONPICKUPDESTROY = 97,
	RPC_CHAT = 101,
	RPC_SRVNETSTATS = 102,
	RPC_CLIENTCHECK = 103,
	RPC_DAMAGEVEHICLE = 106,
	RPC_GIVETAKEDAMAGE = 115,
	RPC_EDITATTACHEDOBJECT = 116,
	RPC_EDITOBJECT = 117,
	RPC_SETINTERIORID = 118,
	RPC_MAPMARKER = 119,
	RPC_REQUESTCLASS = 128,
	RPC_REQUESTSPAWN = 129,
	RPC_PICKEDUPPICKUP = 131,
	RPC_MENUSELECT = 132,
	RPC_VEHICLEDESTROYED = 136,
	RPC_MENUQUIT = 140,
	RPC_EXITVEHICLE = 154,
	RPC_UPDATESCORESPINGSIPS = 155,
	RPC_SCRSETPLAYERNAME = 11,
	RPC_SCRSETPLAYERPOS = 12,
	RPC_SCRSETPLAYERPOSFINDZ = 13,
	RPC_SCRSETPLAYERHEALTH = 14,
	RPC_SCRTOGGLEPLAYERCONTROLLABLE = 15,
	RPC_SCRPLAYSOUND = 16,
	RPC_SCRSETPLAYERWORLDBOUNDS = 17,
	RPC_SCRGIVEPLAYERMONEY = 18,
	RPC_SCRSETPLAYERFACINGANGLE = 19,
	RPC_SCRRESETPLAYERMONEY = 20,
	RPC_SCRRESETPLAYERWEAPONS = 21,
	RPC_SCRGIVEPLAYERWEAPON = 22,
	RPC_SCRSETVEHICLEPARAMSEX = 24,
	RPC_SCRCANCELEDIT = 28,
	RPC_SCRSETPLAYERTIME = 29,
	RPC_SCRTOGGLECLOCK = 30,
	RPC_SCRWORLDPLAYERADD = 32,
	RPC_SCRSETPLAYERSHOPNAME = 33,
	RPC_SCRSETPLAYERSKILLLEVEL = 34,
	RPC_SCRSETPLAYERDRUNKLEVEL = 35,
	RPC_SCRCREATE3DTEXTLABEL = 36,
	RPC_SCRDISABLECHECKPOINT = 37,
	RPC_SCRSETRACECHECKPOINT = 38,
	RPC_SCRDISABLERACECHECKPOINT = 39,
	RPC_SCRGAMEMODERESTART = 40,
	RPC_SCRPLAYAUDIOSTREAM = 41,
	RPC_SCRSTOPAUDIOSTREAM = 42,
	RPC_SCRREMOVEBUILDINGFORPLAYER = 43,
	RPC_SCRCREATEOBJECT = 44,
	RPC_SCRSETOBJECTPOS = 45,
	RPC_SCRSETOBJECTROT = 46,
	RPC_SCRDESTROYOBJECT = 47,
	RPC_SCRDEATHMESSAGE = 55,
	RPC_SCRSETPLAYERMAPICON = 56,
	RPC_SCRREMOVEVEHICLECOMPONENT = 57,
	RPC_SCRUPDATE3DTEXTLABEL = 58,
	RPC_SCRCHATBUBBLE = 59,
	RPC_SCRSOMEUPDATE = 60,
	RPC_SCRSHOWDIALOG = 61,
	RPC_SCRDESTROYPICKUP = 63,
	RPC_SCRLINKVEHICLETOINTERIOR = 65,
	RPC_SCRSETPLAYERARMOUR = 66,
	RPC_SCRSETPLAYERARMEDWEAPON = 67,
	RPC_SCRSETSPAWNINFO = 68,
	RPC_SCRSETPLAYERTEAM = 69,
	RPC_SCRPUTPLAYERINVEHICLE = 70,
	RPC_SCRREMOVEPLAYERFROMVEHICLE = 71,
	RPC_SCRSETPLAYERCOLOR = 72,
	RPC_SCRDISPLAYGAMETEXT = 73,
	RPC_SCRFORCECLASSSELECTION = 74,
	RPC_SCRATTACHOBJECTTOPLAYER = 75,
	RPC_SCRINITMENU = 76,
	RPC_SCRSHOWMENU = 77,
	RPC_SCRHIDEMENU = 78,
	RPC_SCRCREATEEXPLOSION = 79,
	RPC_SCRSHOWPLAYERNAMETAGFORPLAYER = 80,
	RPC_SCRATTACHCAMERATOOBJECT = 81,
	RPC_SCRINTERPOLATECAMERA = 82,
	RPC_SCRSETOBJECTMATERIAL = 84,
	RPC_SCRGANGZONESTOPFLASH = 85,
	RPC_SCRAPPLYANIMATION = 86,
	RPC_SCRCLEARANIMATIONS = 87,
	RPC_SCRSETPLAYERSPECIALACTION = 88,
	RPC_SCRSETPLAYERFIGHTINGSTYLE = 89,
	RPC_SCRSETPLAYERVELOCITY = 90,
	RPC_SCRSETVEHICLEVELOCITY = 91,
	RPC_SCRCLIENTMESSAGE = 93,
	RPC_SCRSETWORLDTIME = 94,
	RPC_SCRCREATEPICKUP = 95,
	RPC_SCRMOVEOBJECT = 99,
	RPC_SCRENABLESTUNTBONUSFORPLAYER = 104,
	RPC_SCRTEXTDRAWSETSTRING = 105,
	RPC_SCRSETCHECKPOINT = 107,
	RPC_SCRGANGZONECREATE = 108,
	RPC_SCRPLAYCRIMEREPORT = 112,
	RPC_SCRSETPLAYERATTACHEDOBJECT = 113,
	RPC_SCRGANGZONEDESTROY = 120,
	RPC_SCRGANGZONEFLASH = 121,
	RPC_SCRSTOPOBJECT = 122,
	RPC_SCRSETNUMBERPLATE = 123,
	RPC_SCRTOGGLEPLAYERSPECTATING = 124,
	RPC_SCRPLAYERSPECTATEPLAYER = 126,
	RPC_SCRPLAYERSPECTATEVEHICLE = 127,
	RPC_SCRSETPLAYERWANTEDLEVEL = 133,
	RPC_SCRSHOWTEXTDRAW = 134,
	RPC_SCRTEXTDRAWHIDEFORPLAYER = 135,
	RPC_SCRSERVERJOIN = 137,
	RPC_SCRSERVERQUIT = 138,
	RPC_SCRINITGAME = 139,
	RPC_SCRREMOVEPLAYERMAPICON = 144,
	RPC_SCRSETPLAYERAMMO = 145,
	RPC_SCRSETGRAVITY = 146,
	RPC_SCRSETVEHICLEHEALTH = 147,
	RPC_SCRATTACHTRAILERTOVEHICLE = 148,
	RPC_SCRDETACHTRAILERFROMVEHICLE = 149,
	RPC_SCRSETWEATHER = 152,
	RPC_SCRSETPLAYERSKIN = 153,
	RPC_SCRSETPLAYERINTERIOR = 156,
	RPC_SCRSETPLAYERCAMERAPOS = 157,
	RPC_SCRSETPLAYERCAMERALOOKAT = 158,
	RPC_SCRSETVEHICLEPOS = 159,
	RPC_SCRSETVEHICLEZANGLE = 160,
	RPC_SCRSETVEHICLEPARAMSFORPLAYER = 161,
	RPC_SCRSETCAMERABEHINDPLAYER = 162,
	RPC_SCRWORLDPLAYERREMOVE = 163,
	RPC_SCRWORLDVEHICLEADD = 164,
	RPC_SCRWORLDVEHICLEREMOVE = 165,
	RPC_SCRWORLDPLAYERDEATH = 166,
	PACKET_INTERNAL_PING = 6,
	PACKET_PING = 7,
	PACKET_PING_OPEN_CONNECTIONS = 8,
	PACKET_CONNECTED_PONG = 9,
	PACKET_REQUEST_STATIC_DATA = 10,
	PACKET_CONNECTION_REQUEST = 11,
	PACKET_AUTH_KEY = 12,
	PACKET_BROADCAST_PINGS = 14,
	PACKET_SECURED_CONNECTION_RESPONSE = 15,
	PACKET_SECURED_CONNECTION_CONFIRMATION = 16,
	PACKET_RPC_MAPPING = 17,
	PACKET_SET_RANDOM_NUMBER_SEED = 19,
	PACKET_RPC = 20,
	PACKET_RPC_REPLY = 21,
	PACKET_DETECT_LOST_CONNECTIONS = 23,
	PACKET_OPEN_CONNECTION_REQUEST = 24,
	PACKET_OPEN_CONNECTION_REPLY = 25,
	PACKET_CONNECTION_COOKIE = 26,
	PACKET_RSA_PUBLIC_KEY_MISMATCH = 28,
	PACKET_CONNECTION_ATTEMPT_FAILED = 29,
	PACKET_NEW_INCOMING_CONNECTION = 30,
	PACKET_NO_FREE_INCOMING_CONNECTIONS = 31,
	PACKET_DISCONNECTION_NOTIFICATION = 32,
	PACKET_CONNECTION_LOST = 33,
	PACKET_CONNECTION_REQUEST_ACCEPTED = 34,
	PACKET_INITIALIZE_ENCRYPTION = 35,
	PACKET_CONNECTION_BANNED = 36,
	PACKET_INVALID_PASSWORD = 37,
	PACKET_MODIFIED_PACKET = 38,
	PACKET_PONG = 39,
	PACKET_TIMESTAMP = 40,
	PACKET_RECEIVED_STATIC_DATA = 41,
	PACKET_REMOTE_DISCONNECTION_NOTIFICATION = 42,
	PACKET_REMOTE_CONNECTION_LOST = 43,
	PACKET_REMOTE_NEW_INCOMING_CONNECTION = 44,
	PACKET_REMOTE_EXISTING_CONNECTION = 45,
	PACKET_REMOTE_STATIC_DATA = 46,
	PACKET_ADVERTISE_SYSTEM = 56,
	PACKET_VEHICLE_SYNC = 200,
	PACKET_RCON_COMMAND = 201,
	PACKET_RCON_RESPONCE = 202,
	PACKET_AIM_SYNC = 203,
	PACKET_WEAPONS_UPDATE = 204,
	PACKET_STATS_UPDATE = 205,
	PACKET_BULLET_SYNC = 206,
	PACKET_PLAYER_SYNC = 207,
	PACKET_MARKERS_SYNC = 208,
	PACKET_UNOCCUPIED_SYNC = 209,
	PACKET_TRAILER_SYNC = 210,
	PACKET_PASSENGER_SYNC = 211,
	PACKET_SPECTATOR_SYNC = 212,
	GAMESTATE_NONE = 0,
	GAMESTATE_WAIT_CONNECT = 1,
	GAMESTATE_AWAIT_JOIN = 2,
	GAMESTATE_CONNECTED = 3,
	GAMESTATE_RESTARTING = 4,
	GAMESTATE_DISCONNECTED = 5,
	BS_TYPE_BYTE = 0,
	BS_TYPE_BOOL = 1,
	BS_TYPE_SHORT = 2,
	BS_TYPE_INT = 3,
	BS_TYPE_FLOAT = 4,
	BS_TYPE_ARRAY = 5,
	BS_TYPE_BITSTREAM = 6,
	SYSTEM_PRIORITY = 0,
	HIGH_PRIORITY = 1,
	MEDIUM_PRIORITY = 2,
	LOW_PRIORITY = 3,
	UNRELIABLE = 6,
	UNRELIABLE_SEQUENCED = 7,
	RELIABLE = 8,
	RELIABLE_ORDERED = 9,
	RELIABLE_SEQUENCED = 10,
	ONFOOTSENDRATE = 1,
	INCARSENDRATE = 2,
	AIMSENDRATE = 3,
	MAX_PLAYERS = 1004,
	MAX_VEHICLES = 2000,
	MAX_PICKUPS = 4096,
	MAX_OBJECTS = 1000,
	MAX_GANGZONES = 1024,
	MAX_3DTEXTS = 2048,
	MAX_TEXTDRAWS = 2048,
	MAX_CLIENTCMDS = 144,
	MAX_MENUS = 128,
	FCR_NONE = 0x0,
	FCR_BOLD = 0x1,
	FCR_ITALICS = 0x2,
	FCR_BORDER = 0x4,
	FCR_SHADOW = 0x8,
	FCR_UNDERLINE = 0x10,
	FCR_STRIKEOUT = 0x20,
	SCMEVENT_PAINTJOB = 1,
	SCMEVENT_UPGRADE = 2,
	SCMEVENT_COLOR = 3,
	SCMEVENT_MODSHOPENTEREXIT = 4,
	SPECIAL_ACTION_NONE = 0,
	SPECIAL_ACTION_DUCK = 1,
	SPECIAL_ACTION_USEJETPACK = 2,
	SPECIAL_ACTION_ENTER_VEHICLE = 3,
	SPECIAL_ACTION_EXIT_VEHICLE = 4,
	SPECIAL_ACTION_DANCE1 = 5,
	SPECIAL_ACTION_DANCE2 = 6,
	SPECIAL_ACTION_DANCE3 = 7,
	SPECIAL_ACTION_DANCE4 = 8,
	SPECIAL_ACTION_HANDSUP = 10,
	SPECIAL_ACTION_USECELLPHONE = 11,
	SPECIAL_ACTION_SITTING = 12,
	SPECIAL_ACTION_STOPUSECELLPHONE = 13,
	SPECIAL_ACTION_DRINK_BEER = 20,
	SPECIAL_ACTION_SMOKE_CIGGY = 21,
	SPECIAL_ACTION_DRINK_WINE = 22,
	SPECIAL_ACTION_DRINK_SPRUNK = 23,
	SPECIAL_ACTION_CUFFED = 24,
	SPECIAL_ACTION_CARRY = 25,
	SPECIAL_ACTION_URINATE = 68,
	DIALOG_STYLE_MSGBOX = 0,
	DIALOG_STYLE_INPUT = 1,
	DIALOG_STYLE_LIST = 2,
	DIALOG_STYLE_PASSWORD = 3,
	DIALOG_STYLE_TABLIST = 4,
	DIALOG_STYLE_TABLIST_HEADERS = 5,
	CMODE_DISABLED = 0,
	CMODE_LOCKKEYS_NOCURSOR = 1,
	CMODE_LOCKCAMANDCONTROL = 2,
	CMODE_LOCKCAM = 3,
	CMODE_LOCKCAM_NOCURSOR = 4,
	D3DPT_POINTLIST = 1,
	D3DPT_LINELIST = 2,
	D3DPT_LINESTRIP = 3,
	D3DPT_TRIANGLELIST = 4,
	D3DPT_TRIANGLESTRIP = 5,
	D3DPT_TRIANGLEFAN = 6,
}

return sampfuncs
