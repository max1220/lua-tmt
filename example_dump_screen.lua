#!/usr/bin/env lua
local tmt = require("tmt")
local function td(t, i)
	local i = tonumber(i) or 0
	for k,v in pairs(t) do
		print(("\t"):rep(i)..tostring(k),tostring(v))
		if type(v) == "table" then
			td(v, i+1)
		end
	end
end

local test_str = "Hello World!\r\nThis is a test!\r\ncan't see this I guess you can't read the first part of this line!\rlalalalalalala"

print("creating new term...")
local term = tmt.new(80, 25)
print("test_str = " .. test_str:gsub("\n", [[\n]]):gsub("\r", [[\r]]))
print("writing test_str(and getting events)...")
local events = term:write(test_str)
print("got events:")
td(events, 1)
print()
print("getting screen...")
local screen = term:get_screen()

local function get_term_str()
	local lines = {}
	for _,line in ipairs(screen.lines) do
		local cline_str_t = {}
		for _,cell in ipairs(line) do
			table.insert(cline_str_t, string.char(cell.char))
		end
		table.insert(lines, "|" .. table.concat(cline_str_t) .. "|")
	end
	local spacer = "+" .. ("-"):rep(#lines[1]-2) .. "+\n"
	return spacer .. table.concat(lines, "\n") .. "\n" .. spacer
end

print("current screen content:")
print(get_term_str())
