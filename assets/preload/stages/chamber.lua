local tailscircle = '';

function onCreate()
	
	-- background shit
	precacheImage('stages/Wall');
	precacheImage('stages/floor');
	precacheImage('stages/fleetwaybgshit');
	precacheImage('stages/Emerald Beam');
	precacheImage('stages/Emerald Beam Charged');
	precacheImage('stages/Emeralds');
	precacheImage('stages/The Chamber');
	precacheImage('stages/pebles');
	
	precacheImage('characters/Fleetway_Super_Sonic');

	makeLuaSprite('wall', 'stages/Wall', -2379.05, -1211.1);

	makeAnimatedLuaSprite('floor', 'floor', -2349, 921.25);
	addAnimationByPrefix('floor', 'blue', 'floor blue', 24, false);
	addAnimationByPrefix('floor', 'yellow', 'floor yellow', 24, false);
	objectPlayAnimation('floor', 'blue', true);

	if not lowQuality then
		makeLuaSprite('bgshit', 'fleetwaybgshit', -2629.05, -1344.05);
	
		makeAnimatedLuaSprite('beamblu', 'Emerald Beam', 0, -1576.95);
		addAnimationByPrefix('beamblu', 'blue', 'Emerald Beam instance 1', 24, true);
		objectPlayAnimation('beamblu', 'blue', true);

		makeAnimatedLuaSprite('beamyello', 'Emerald Beam Charged', -300, -1576.95);
		addAnimationByPrefix('beamyello', 'yellow', 'Emerald Beam Charged instance 1', 24, true);
		objectPlayAnimation('beamyello', 'yellow', true);
	end

	makeAnimatedLuaSprite('emeralds', 'Emeralds', 326.6, -191.75);
	addAnimationByPrefix('emeralds', 'doyothang', 'TheEmeralds instance 1', 24, true);
	objectPlayAnimation('emeralds', 'doyothang', true);

	makeAnimatedLuaSprite('chamber', 'The Chamber', -225.05, 463.9);
	addAnimationByIndices('chamber', 'sonicfuckingdoes', 'Chamber Sonic Fall', 1, 24);-- this is so sonic doesnt immediately fall
	addAnimationByPrefix('chamber', 'sonicfuckingdies', 'Chamber Sonic Fall', 24, false); -- sonic ded
	addAnimationByIndices('chamber', 'sonicfuckingdoesnt', 'Chamber Sonic Fall', 25, 24); -- this is so when the chart script adds it back in to fix the character layering sonic doesnt fall again
	objectPlayAnimation('chamber', 'sonicfuckingdoes', true); -- dont judge me
	
	if not lowQuality then
		makeLuaSprite('pebles', 'pebles', -462.15, 1043.3);
		-- its spelled pebles in the source code which i think is funny
		-- pebles hehe

		makeAnimatedLuaSprite('porker', 'Porker Lewis', 2840.15, -762.8);
		addAnimationByPrefix('porker', 'bop', 'Porker FG', 24, false);
	end

	setScrollFactor('wall', 1.1, 1.1);
	setScrollFactor('floor', 1.1, 1);
	setScrollFactor('bgshit', 1.1, 1);
	setScrollFactor('beamblu', 1.1, 1.1);
	setScrollFactor('beamyello', 1.1, 1);
	setScrollFactor('emeralds', 1.1, 1);
	setScrollFactor('chamber', 1.1, 1);
	setScrollFactor('pebles', 1.1, 1);
	setScrollFactor('porker', 1.4, 1);

	addLuaSprite('wall', false);
	addLuaSprite('floor', true);
	addLuaSprite('bgshit', false);
	addLuaSprite('beamblu', false);
	addLuaSprite('emeralds', false);
	addLuaSprite('pebles', true)
	addLuaSprite('chamber', true);
	addLuaSprite('porker', true);
	
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('porker', 'bop', true)
	end

	if curBeat == 16 then
		tailscircle = 'hovering'
	end
end

function onUpdate()

	if tailscircle == 'hovering' then
        setProperty('dad.y', getProperty('dad.y') + math.sin(floaty) * 1.3);
		floaty = floaty + 0.03
    end
    if tailscircle == 'circling' then
        setProperty('dad.y', getProperty('dad.y') + math.sin(floaty) * 1.3);
        setProperty('dad.x', getProperty('dad.x') + math.cos(floaty) * 1.3);
		floaty = floaty + 0.03
    end
end