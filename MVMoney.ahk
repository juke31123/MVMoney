#Requires AutoHotkey v2.0

ShopTabs := [[500, 266],[691, 259],[848, 257],[1009, 259]]
EngiShopTabs :=[[1170,260],[537,256],[677,255],[834,259],[1020,258]]
upgradespalten := [1081, 1443]
Engiupgradespalten := [1443, 1081]
upgradereihen := [350, 480, 585, 690]
Engiupgradereihen := [585, 350, 480, 690]




CoordMode("Mouse", "Screen")
Shopx := [0.565, 0.75]
Shopyplus := [0.333, 0.430, 0.535, 0.645]
ShopyMinus := [0.383, 0.480, 0.585, 0.695]
ShopRelx := [0.25, 0.35, 0.45, 0.55, 0.65]
ShopRely := [0.25]


ClickRel(xPercent, yPercent, offsetX := 0, offsetY := 0)
{
    WinGetClientPos(&winX, &winY, &winW, &winH, "A")

    clickX := winX + (winW * xPercent) + offsetX
    clickY := winY + (winH * yPercent) + offsetY

    MouseMove(clickX, clickY)
	sleep 50
	click 2
}

firstrun := true

+r::{ ;money dupe
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
sleep 15
ClickRel(0.3453, 0.79) ;clicking the refund button
sleep 15
click 2
return
}

+q:: ;quick buy crits
{
ClickRel(ShopRelx[5], ShopRely[1])
sleep 15
ClickRel(Shopx[1], Shopyplus[1])
sleep 15
click 2
sleep 20
ClickRel(0.7453, 0.79)
Return
} 


f6:: ;Buy Resistances
{
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


f7:: ;Buy primary
{
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

f8:: ;Buy Secondary
{
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

f9:: ;Buy Melee
{
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

f1:: ;Buy Sentry
{
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

f2:: ;Buy engineer canteens
{
ClickRel(0.7, ShopRely[1])
ClickRel(Shopx[1], Shopyplus[2])
sleep 10
click 2
sleep 20
ClickRel(0.7453, 0.79)
return
}



f12::ExitApp
