---@meta

---@class LuaScript
---@field name string ��� �������, �������� �������� 'script_name'. ���� ��� �� ������ ������������ �������� �����
---@field description string �������� �������, ��������� �������� 'script_description'. ������ ������, ���� �� �������
---@field version_num number �������� ������ �������. 0, ���� �� �������
---@field version string ��������� ������ �������. ����� ������������ �������� ������, ���� �� ������
---@field authors table ������ ������� �������. ������, ���� �� �������
---@field dependencies table ������ ������������ �������. ������, ���� �� �������
---@field path string ������ ���� � ����� �������
---@field filename string �������� ����� �������, ������� ����������
---@field directory string ������ ���� ����������, �� ������� ��� �������� ������
---@field frozen boolean ������ ���������� ������ (�������������/�������)
---@field dead boolean ������ ������������� ������. ���� ������, ����� ����� ��� ��������, � lua-������ ������� ��� ����������. �������� dead ��������� ������ ������� �� ����������
---@field exports any �������������� �������� ��������. ����� �������� � �������� import
---@field id number ���������� ������������� �������
---@field url string web-����� �������
---@field properties table ������ �������, �������� ���������� script_properties
---@field pause function ���������������� ����� �������
---@field resume function ������� ������������� ����� � �����
---@field unload function ��������� ������
---@field reload function ������������� ������

---@type table
script = {}

---@type LuaScript
script.this = {}
---��������� ������ �� ����� � ���������� ������ �������. ���������� `nil`, ���� ������ �� ��� ��������
---@param file string
---@return LuaScript | nil
function script.load(file) end

---���� ����������� ������ �� �����. ���������� `nil`, ���� ������ �� ������
---@param name string
---@return LuaScript | nil
function script.find(name) end

---���������� ������ ����������� ��������
---@return LuaScript[] Scripts list
function script.list() end

---���������� ������ ������� �� ��������������. ���� ������� � ��������� ��������������� �� ����������, �� ���������� nil
---@param scriptId number
---@return LuaScript | nil
function script.get(scriptId) end

---@return LuaScript LuaScript
function thisScript() end

return script