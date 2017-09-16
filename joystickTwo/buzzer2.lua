buzzerPin = 5
gpio.mode(buzzerPin, gpio.OUTPUT)
tones = {}
tones["aS"] = 880
tones["cS"] = 523
tones["eS"] = 659
function beep(pin, tone, duration)
    local freq = tones[tone]
    pwm.setup(pin, freq, 512)
    pwm.start(pin)
    -- delay in uSeconds
    tmr.delay(duration * 1000)
    pwm.stop(pin)
    --20ms pause
    tmr.wdclr()
    tmr.delay(20000)
end

function playoff()
    beep(buzzerPin, "cS", 100)
    beep(buzzerPin, "eS", 100)
    beep(buzzerPin, "aS", 100)
end
function playon()
    beep(buzzerPin, "aS", 100)
    beep(buzzerPin, "eS", 100)
    beep(buzzerPin, "cS", 100)
end
