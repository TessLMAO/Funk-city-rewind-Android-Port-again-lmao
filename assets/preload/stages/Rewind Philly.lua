local u = false;
local r = 0;
local health = 0;
local xx = 400;
local yy = 620;
local xx2 = 900;
local yy2 = 600;
local ofs = 30;
local followchars = true;
local del = 600;
local del2 = 700;
function onCreate()
        -- background shit
        setProperty('defaultCamZoom',0.6)

        makeLuaSprite('bartop','',0,-30)
        makeGraphic('bartop',1280,100,'000000')
        addLuaSprite('bartop',true)
        setObjectCamera('bartop','hud')
        setScrollFactor('bartop',0,0)

        makeLuaSprite('barbot','',0,650)
        makeGraphic('barbot',1280,100,'000000')
        addLuaSprite('barbot',true)
        setScrollFactor('barbot',0,0)
        setObjectCamera('barbot','hud')

luzPX = getProperty('boyfriend.x')
luzPY = getProperty('gf.y')

    makeLuaSprite('ski', 'ski', -1210, -230);
    setScrollFactor('ski', 1.05, 1.05);
    scaleObject('ski', 2.5, 2.4);

    makeLuaSprite('trem', 'trem', -1210, -230);
    setScrollFactor('trem', 1.05, 1.05);
    scaleObject('trem', 1.4, 1.4);
	
	makeLuaSprite('luz', 'luz', 350, luzPY);
	setScrollFactor('luz', 1.0, 1.0);
	scaleObject('luz', 1.2, 1.2);
	
	makeLuaSprite('rua', 'rua', -1200, -100);
	setScrollFactor('rua', 1.0, 1.0);
	scaleObject('rua', 1.2, 1.2);

	addLuaSprite('ski', false);
	addLuaSprite('trem', false);
	addLuaSprite('rua', false);
	addLuaSprite('luz', true);
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
if not isSustainNote then   
runTimer('whenaciertas', 0.01, 25)
end 
end

function noteMiss(id, noteData, noteType, isSustainNote)
runTimer('butfallas', 0.01, 11)
end

function onTimerCompleted(tag, loops, loopsLeft)
    local health = getProperty('health')
    if tag == 'whenaciertas' then
        setProperty('health', health + loopsLeft*0.00040);
    end
    if tag == 'butfallas' then
        setProperty('health', health - health*(loopsLeft*0.0025));
    end
end

function onUpdate()
if getProperty('health') < 0.050 then   
setProperty('health', 0);
end
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',0.7)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            setProperty('defaultCamZoom',0.7)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end