#Requires AutoHotkey v2.0

;ShopTabs := [[500, 266],[691, 259],[848, 257],[1009, 259]]
;EngiShopTabs :=[[1170,260],[537,256],[677,255],[834,259],[1020,258]]
;upgradespalten := [1081, 1443]
;Engiupgradespalten := [1443, 1081]
;upgradereihen := [350, 480, 585, 690]
;Engiupgradereihen := [585, 350, 480, 690]

CoordMode("Mouse", "Screen")
Shopx := [0.565, 0.75]
Shopyplus := [0.333, 0.430, 0.535, 0.645]
ShopyMinus := [0.383, 0.480, 0.585, 0.695]
ShopRelx := [0.25, 0.35, 0.45, 0.55, 0.65]
ShopRely := [0.25]

delaymed := 100
firstrun := true

;+r::MoneyDupe()
;+n::QuickMedic()
;+q::QuickCrit()
;^q::QuickUber()
;F2::QuickbuyEnig()
;F6::BuyRes()
;F7::BuyPrime()
;F8::BuySecond()
;F9::BuyMelee()
;F1::BuySentry()


;Makros
ClickRel(xPercent, yPercent, offsetX := 0, offsetY := 0)
{
    WinGetClientPos(&winX, &winY, &winW, &winH, "A")

    clickX := winX + (winW * xPercent) + offsetX
    clickY := winY + (winH * yPercent) + offsetY

    MouseMove(clickX, clickY)
	sleep 50
	click 2
}

MoneyDupe(*) { ;money dupe
    global ShopRelx, ShopRely, Shopx, Shopyplus, Shopyminus
    global firstrun
    ClickRel(ShopRelx[3], ShopRely[1])
    sleep 15
    if (firstrun != true){
    ClickRel(Shopx[1], Shopyplus[1]) ;clicking the + of the übercharge upgrade
    sleep 15
    click 2
    sleep 10
    ClickRel(Shopx[1], Shopyminus[1]) ; clicking the - of the übercharge upgrade
    sleep 15
    click 2
    sleep 15
    }
    if (firstrun = true)
    {
    firstrun := false
    }
    ClickRel(Shopx[1], Shopyplus[1])
    sleep 15
    click 2
    sleep 10
    send "{s down}"
    sleep 450
    send "{s up}"
    send "{w down}"
    sleep 550
    send "{w up}"
    sleep 50
    ClickRel(ShopRelx[3], ShopRely[1])
    sleep 15
    ClickRel(Shopx[1], Shopyminus[1])
    sleep 10
    click
    sleep 25
    ClickRel(0.3453, 0.79) ;clicking the refund button
    return
}

QuickMedic(*){  ;Quick Revive Medic (beta)
    delaymed := Medicslider.Value
    sleep delaymed
    click
    sleep 25
    click
    return
}

QuickCrit(*){ ;quick buy crits
    ClickRel(ShopRelx[5], ShopRely[1])
    sleep 15
    ClickRel(Shopx[1], Shopyplus[1])
    sleep 15
    click 2
    sleep 20
    ClickRel(0.7453, 0.79)
    Return
} 

QuickbuyEnig(*){ ;Buy engineer canteens
    ClickRel(0.7, ShopRely[1])
    ClickRel(Shopx[1], Shopyplus[2])
    sleep 10
    click 2
    sleep 20
    ClickRel(0.7453, 0.79)
    return
}

QuickUber(*){ ;quick Buy Uber
    ClickRel(ShopRelx[5], ShopRely[1])
    sleep 15
    ClickRel(Shopx[2], Shopyplus[1])
    sleep 15
    click 2
    sleep 20
    ClickRel(0.7453, 0.79)
    Return
} 

BuyRes(*){ ;Buy Resistances
    ClickRel(ShopRelx[1], ShopRely[1])
        for _, x in Shopx {
            for _, y in Shopyplus {
                if(x = 0.75 && y = 0.430)
                {
                continue
                }
                ClickRel(x,y) ; Alle Upgrade-Kombinationen klicken
                sleep 15
                Click 2
                sleep 15
                Click 2
            }
        }
        sleep 20
        ClickRel(0.7453, 0.79)
        return
}
 
BuyPrime(*){ ;Buy primary
    ClickRel(ShopRelx[2], ShopRely[1])
        for _, x in Shopx {
            for _, y in Shopyplus {
                ClickRel(x,y) ; Alle Upgrade-Kombinationen klicken
                sleep 15
                Click 2
                sleep 15
                Click 2
            }
        }
        sleep 20
        ClickRel(0.7453, 0.79)
        return
} 

BuySecond(*){ ;Buy Secondary
    ClickRel(ShopRelx[3], ShopRely[1])
        for _, x in Shopx {
            for _, y in Shopyplus {
                ClickRel(x,y) ; Alle Upgrade-Kombinationen klicken
                sleep 15
                Click 2
                sleep 15
                Click 2
            }
        }
        sleep 20
        ClickRel(0.7453, 0.79)
        return
}

BuyMelee(*){ ;Buy Melee
    ClickRel(ShopRelx[4], ShopRely[1])
        for _, x in Shopx {
            for _, y in Shopyplus {
                ClickRel(x,y) ; Alle Upgrade-Kombinationen klicken
                sleep 15
                Click 2
                sleep 15
                Click 2
            }
        }
        sleep 20
        ClickRel(0.7453, 0.79)
        return
}

BuySentry(*){ ;Buy Sentry
    ClickRel(0.5853, ShopRely[1])
        for _, x in Shopx {
            for _, y in Shopyplus {
                ClickRel(x,y) ; Alle Upgrade-Kombinationen klicken
                sleep 15
                Click 2
                sleep 15
                Click 2
            }
        }
        sleep 20
        ClickRel(0.7453, 0.79)
        return
}

;GUI Design
myGui := Gui("Resize", "MVMoney Controls")

myGui.Add("Text", "x20 y10 w200", "Quick Medic Revive Delay")
valueText := myGui.Add("Text", "x20 y30 w200", "Current: " delaymed " ms")

myGui.Add("Text", "x20 y55 w200", "Delay Presets:")
Medicpreset1 := myGui.Add("Button", "x20 y75 w200", "Preset 1 (Low Ping): 100ms")
Medicpreset2 := myGui.Add("Button", "x20 y105 w200", "Preset 2 (Medium Ping): 250ms")
Medicpreset3 := myGui.Add("Button", "x20 y135 w200", "Preset 3 (High Ping): 400ms")

myGui.Add("Text", "x20 y170 w200", "Custom Delay (50-500 ms):")
Medicslider := myGui.Add("Slider", "x20 y195 w300 Range50-500 ToolTip", delaymed)

myGui.Add("Text", "x20 y235 w200", "Hotkeys:")

HotkeyInputs := Map()

HotkeyList := Map(
    "MoneyDupe", "+r",
    "QuickMedic", "+n",
    "QuickCrit", "+q",
    "QuickUber", "^q",
    "QuickbuyEnig", "F2",
    "BuyRes", "F6",
    "BuyPrime", "F7",
    "BuySecond", "F8",
    "BuyMelee", "F9",
    "BuySentry", "F1"
)

row := 260

for name, key in HotkeyList {
    myGui.Add("Text", "x20 y" row+3 " w130", name)
    hkInput := myGui.Add("Hotkey", "x160 y" row " w120", key)
    hkInput.OnEvent("Change", UpdateHotkey.Bind(name))
    HotkeyInputs[name] := hkInput
    row += 30
}

;GUI Logic
Medicslider.OnEvent("Change", (*) => (
    delaymed := Medicslider.Value,
    valueText.Text := "Current: " delaymed " ms"
))

Medicpreset1.OnEvent("Click", (*) => (
    delaymed := 100,
    Medicslider.Value := delaymed,
    valueText.Text := "Current: " delaymed " ms"
))

Medicpreset2.OnEvent("Click", (*) => (
    delaymed := 250,
    Medicslider.Value := delaymed,
    valueText.Text := "Current: " delaymed " ms"
))

Medicpreset3.OnEvent("Click", (*) => (
    delaymed := 400,
    Medicslider.Value := delaymed,
    valueText.Text := "Current: " delaymed " ms"
))

myGui.Show("x0 y0 w350 h620")
return

UpdateHotkey(name, hkInput, *) {
    global HotkeyList

    oldKey := HotkeyList[name]
    newKey := hkInput.Value

    if newKey = "" || newKey = oldKey
        return

    try Hotkey(oldKey, "Off")

    try {
        Hotkey(newKey, GetFunction(name), "On")
        HotkeyList[name] := newKey
    } catch as e {
        MsgBox("Hotkey konnte nicht gesetzt werden:`n" newKey "`n`n" e.Message)
        hkInput.Value := oldKey
        try Hotkey(oldKey, GetFunction(name), "On")
    }
}

GetFunction(name) {
    switch name {
        case "MoneyDupe": return MoneyDupe
        case "QuickMedic": return QuickMedic
        case "QuickCrit": return QuickCrit
        case "QuickUber": return QuickUber
        case "QuickbuyEnig": return QuickbuyEnig
        case "BuyRes": return BuyRes
        case "BuyPrime": return BuyPrime
        case "BuySecond": return BuySecond
        case "BuyMelee": return BuyMelee
        case "BuySentry": return BuySentry
    }
}

f11::myGui.Show("x0 y0 w350 h200")

f12::ExitApp
