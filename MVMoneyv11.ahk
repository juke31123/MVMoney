ShopTabs := [[500, 266],[691, 259],[848, 257],[1009, 259]]
upgradespalten := [1081, 1443]
upgradereihen := [350, 480, 585, 690]

r::{ ;money dupe

firstrun := true

if(firstrun != true)
{
click 850, 250 ;clicking the upgrade tab for the quick fix
click 1079, 360 ;clicking the + of the übercharge upgrade
click 1079, 360
click 1080, 419 ; clicking the - of the übercharge upgrade
click 1080, 419
}

if(firstrun = true)
{
click 850, 250 

firstrun := false
}

click 1079, 360
click 1079, 360
send "{s down}"
sleep 400
send "{s up}"
send "{w down}"
sleep 500
send "{w up}"
sleep 50
click 850, 250
click 1080, 419
click 1080, 419
click 631, 850 ;clicking the refund button
return
}

f2::
{
;reset 
firstrun := true
return
} 

f1::
{
;pauses exicution
Suspend
Return 
} 

q::
{
;quick buy crits
click 1200, 300
click 1089, 360
click 2
click 1378 852
return
} 



f7:: ;Buy Resistances
{
click 500, 266
    for _, x in upgradeSpalten {
        for _, y in upgradeReihen {
            if(x = 1443 && y = 480)
            continue

            Click x, y, "Left" ; Alle Upgrade-Kombinationen klicken
            Click 2
            Click 2
        }
    }
    click 1378, 852
    return
}

F8:: ;Buy ALL
{
    global ShopTabs, upgradeSpalten, upgradeReihen

    for _, tab in ShopTabs {
        Click tab[1], tab[2], "Left" ; ShopTab klicken
        

        for _, x in upgradeSpalten {
            for _, y in upgradeReihen {
                Click x, y, "Left" ; Alle Upgrade-Kombinationen klicken
                Click 2
                Click 2
            }
        }
    }
    click 1378, 852
    return
}


f12::ExitApp