--Minetest
--Copyright (C) 2013 sapier
--
--This program is free software; you can redistribute it and/or modify
--it under the terms of the GNU Lesser General Public License as published by
--the Free Software Foundation; either version 2.1 of the License, or
--(at your option) any later version.
--
--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public License along
--with this program; if not, write to the Free Software Foundation, Inc.,
--51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

--------------------------------------------------------------------------------
local modupdatechecker = {"1.0.0.0"}
local mods_installed = {
	
		--"Unable to find any mods!",

		modmgr.render_modlist(modmgr.global_mods)
}

local found_updates = {
	"No updates found for any Installed mods.",
	"NOTE: This only works for mods that have integrated the MUC API.",
}


local function buildList(source)
	ret = {}
	for i = 1, #source do
		ret[i] = core.formspec_escape(source[i])
	end
	return table.concat(ret, ",,")
end

return {
	name = "modupdatechecker",
	caption = fgettext("jtrent238's Mod Update Checker"),
	cbf_formspec = function(tabview, name, tabdata)
		local modupdatechecker_logofile = defaulttexturedir .. "modupdatechecker_logo.png"
		local version = core.get_version()
		return "image[0.5,1;" .. core.formspec_escape(modupdatechecker_logofile) .. "]" ..
			"label[0.5,3.2;" .. "jtrent238's MUC" .. " " .. "1.0.0.0" .. "]" ..
			"label[0.5,3.5;http://jtrent238.weebly.com]" ..
			"tablecolumns[color;text]" ..
			"tableoptions[background=#00000000;highlight=#00000000;border=false]" ..
			"table[3.5,-0.25;8.5,6.05;list_credits;" ..
			"#FFFF00," .. fgettext("Installed Mods") .. ",," ..
			buildList(mods_installed) .. ",,," ..
			"#FFFF00," .. fgettext("Found Updates") .. ",," ..
			buildList(found_updates) .. ",,," ..
			";1]"
	end
}
