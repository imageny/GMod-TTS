net.Receive( "SayTTS",  function()
	local text = net.ReadString()
	local ply = net.ReadEntity()
	text = string.sub( string.Replace( text, " ", "%20" ), 1, 100 )
	
	sound.PlayURL( "https://tetyys.com/SAPI4/SAPI4?voice=Sam&pitch=100&speed=150&text=" .. text, "3d", function( sound )
		if IsValid( sound ) then
			sound:SetPos( ply:GetPos() )
			sound:SetVolume( 1 )
			sound:Play()
			sound:Set3DFadeDistance( 200, 1000 )
			ply.sound = sound
		end
	end )
end )

hook.Add( "Think", "FollowPlayerSound", function()
	for k,v in pairs( player.GetAll() ) do
		if IsValid( v.sound ) then
			v.sound:SetPos( v:GetPos() )
		end
	end
end )
