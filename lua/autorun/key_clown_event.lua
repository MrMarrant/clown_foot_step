-- ClownFootStep, A little addon on Garry's Mod who make sound whenever a player is doing somes actions.
-- Copyright (C) 2023  MrMarrant aka BIBI.

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

-- [[ SHARED ]]
/*
* Allows to load all the language files that the addon can handle.
* @string path Path containing the language files.
* @string default Default language.
* @table handledLanguage Array containing the supported languages.
* @table langData Table containing all translations.
*/

hook.Add( "KeyPress", "KeyPress.KeyClownPress", function( ply, key )
	if ( key == IN_JUMP and ply:IsOnGround()) then
		ply:EmitSound("clown/jump/clown_jump"..math.random(1,6)..".mp3")
	end
	if ( key == IN_DUCK ) then
		ply:EmitSound("clown/duck/honk_1.mp3")
	end
	if ( key == IN_USE and CLIENT) then
		ply:EmitSound("clown/onuse/ballon_"..math.random(1,5)..".mp3")
	end
	if ( key == IN_SCORE and CLIENT) then
		ply:StartLoopingSound("clown/clown_tab.mp3")
	end
end )

hook.Add( "KeyRelease", "KeyRelease.KeyClownRelease", function( ply, key )
	if ( key == IN_DUCK ) then
		ply:EmitSound("clown/duck/honk_2.mp3")
	end
	if ( key == IN_SCORE ) then
		ply:StopSound("clown/clown_tab.mp3")
	end
end )


hook.Add( "PlayerFootstep", "PlayerFootstep.ClownFootStep", function( ply, pos, foot, sound, volume, rf )
	if (foot) then
		ply:EmitSound( "clown/footstep/FootstepClown"..math.random(1,2)..".mp3" )
	else
		ply:EmitSound( "clown/footstep/FootstepClown"..math.random(3,4)..".mp3" )
	end
	return true -- Don't allow default footsteps, or other addon footsteps
end )

hook.Add( "EntityTakeDamage", "EntityTakeDamage.ClownSoundOnHit", function( ent, dmginfo )
	if ( ent:IsPlayer() ) then
		ent:EmitSound( "clown/onhit/HitClown"..math.random(1,2)..".mp3" )
	end
end )