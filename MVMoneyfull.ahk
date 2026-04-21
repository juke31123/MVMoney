#Requires AutoHotkey v2.0
CoordMode "Mouse", "Window"

ShopTabs := [[500, 266],[691, 259],[848, 257],[1009, 259]]
EngiShopTabs :=[[1170,260],[537,256],[677,255],[834,259],[1020,258]]
upgradespalten := [1081, 1443]
Engiupgradespalten := [1443, 1081]
upgradereihen := [350, 480, 585, 690]
Engiupgradereihen := [585, 350, 480, 690]

firstrun := true

+r::{ ;money dupe

global firstrun

click 850, 250, "Left" ;clicking the upgrade tab for the vac
sleep 15


if (firstrun != true){
click 1079, 360, "Left" ;clicking the + of the übercharge upgrade
sleep 15
click 2
sleep 10
click 1080, 419, "Left" ; clicking the - of the übercharge upgrade
sleep 15
click 2
sleep 15
}

if (firstrun = true)
{
firstrun := false
}

click 1079, 360, "Left"
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
click 850, 250, "Left"
sleep 15
click 1080, 419
sleep 10
click
sleep 15
click 631, 850, "Left" ;clicking the refund button
sleep 15
click 2
return
}

+q:: ;quick buy crits
{
click 1167, 277, "Left"
sleep 15
click 1079, 370, "Left"
sleep 15
click 2
sleep 5
click 2
sleep 15
click 1402, 856, "Left"
sleep 5
click 2
Return
} 

f5:: ;Buy Building canteen
{
click 1351, 263, "left"
sleep 15
click 1083, 472, "left"
sleep 15
click 2
sleep 15
click 2
sleep 15
click 1402, 856, "Left"
sleep 5
click 2
return
}

f6:: ;Buy Resistances
{
click 500, 266, "left"
    for _, x in upgradeSpalten {
        for _, y in upgradeReihen {
            if(x = 1443 && y = 480)
			{
            continue
			}

            Click x, y, "Left" ; Alle Upgrade-Kombinationen klicken
			sleep 15
            Click 2
			sleep 15
            Click 2
        }
    }
	sleep 25
	click 1378, 852, "Left"
	sleep 25
	click 2
    return
}

f3:: ;Buy Resistances (engi)
{
click 537, 256, "left"
    for _, x in upgradeSpalten {
        for _, y in upgradeReihen {
            if(x = 1443 && y = 480)
			{
            continue
			}
			if(x = 1081 && y = 585)
			{
			continue
			}
            Click x, y, "Left" ; Alle Upgrade-Kombinationen klicken
			sleep 15
            Click 2
			sleep 15
            Click 2
        }
    }
	sleep 25
	click 1378, 852, "Left"
	sleep 25
	click 2
    return
}

f7:: ;Buy secondary weapon
{
click 850, 250, "Left"
    for _, x in upgradeSpalten {
        for _, y in upgradeReihen {

            Click x, y, "Left" ; Alle Upgrade-Kombinationen klicken
			sleep 15
            Click 2
			sleep 15
            Click 2
        }
    }
	sleep 25
	click 1378, 852, "Left"
	sleep 25
	click 2
    return
}

f2:: ;Buy Centry 
{
click 1170, 260, "Left"
    for _, x in EngiupgradeSpalten {
        for _, y in EngiupgradeReihen {

            Click x, y, "Left" ; Alle Upgrade-Kombinationen klicken
			sleep 15
            Click 2
			sleep 15
            Click 2
        }
    }
	sleep 25
	click 1378, 852, "Left"
	sleep 25
	click 2
    return
}

F8:: ;Buy ALL
{
    global ShopTabs, upgradeSpalten, upgradeReihen

    for _, tab in ShopTabs {
        Click tab[1], tab[2], "Left" ; ShopTab klicken
        sleep 10

        for _, x in upgradeSpalten {
            for _, y in upgradeReihen {
                Click x, y, "Left" ; Alle Upgrade-Kombinationen klicken
				sleep 15
                Click 2
				sleep 15
                Click 2
            }
        }
    }
	sleep 25
	click 1378, 852, "Left"
	sleep 25
	click 2
    return
}


f1:: ;Buy ALL (Engi)
{
    global EngiShopTabs, Engiupgradereihen, EngiupgradeReihen

    for _, tab in EngiShopTabs {
        Click tab[1], tab[2], "Left" ; ShopTab klicken
        sleep 25
		click 2
		sleep 25

        for _, x in EngiupgradeSpalten {
            for _, y in EngiupgradeReihen {
                Click x, y, "Left" ; Alle Upgrade-Kombinationen klicken
				sleep 15
                Click 2
				sleep 15
                Click 2
            }
        }
    }
	sleep 25
	click 1378, 852, "Left"
	sleep 25
	click 2
    return
}

f12::ExitApp
