local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v24,v25) local v26={};for v41=1, #v24 do v6(v26,v0(v4(v1(v2(v24,v41,v41 + 1 )),v1(v2(v25,1 + (v41% #v25) ,1 + (v41% #v25) + 1 )))%256 ));end return v5(v26);end local v8=tonumber;local v9=string.byte;local v10=string.char;local v11=string.sub;local v12=string.gsub;local v13=string.rep;local v14=table.concat;local v15=table.insert;local v16=math.ldexp;local v17=getfenv or function() return _ENV;end ;local v18=setmetatable;local v19=pcall;local v20=select;local v21=unpack or table.unpack ;local v22=tonumber;local function v23(v27,v28,...) local v29=1;local v30;v27=v12(v11(v27,5),v7("\143\197","\110\161\235\102"),function(v42) if (v9(v42,2)==81) then local v93=0;while true do if (0==v93) then v30=v8(v11(v42,1,1));return "";end end else local v94=0;local v95;while true do if (v94==0) then v95=v10(v8(v42,49 -33 ));if v30 then local v124=v13(v95,v30);v30=nil;return v124;else return v95;end break;end end end end);local function v31(v43,v44,v45) if v45 then local v96=0;local v97;while true do if (v96==0) then v97=(v43/(2^(v44-1)))%(2^(((v45-1) -(v44-(2 -1))) + 1)) ;return v97-(v97%(1 -0)) ;end end else local v98=0;local v99;while true do if (v98==0) then v99=2^(v44-1) ;return (((v43%(v99 + v99))>=v99) and 1) or (0 -0) ;end end end end local function v32() local v46=0;local v47;while true do if (v46==1) then return v47;end if (v46==0) then v47=v9(v27,v29,v29);v29=v29 + 1 ;v46=1;end end end local function v33() local v48=0;local v49;local v50;while true do if (v48==0) then v49,v50=v9(v27,v29,v29 + (621 -(555 + 64)) );v29=v29 + 2 ;v48=1;end if (v48==1) then return (v50 * 256) + v49 ;end end end local function v34() local v51=0;local v52;local v53;local v54;local v55;while true do if (v51==1) then return (v55 * 16777216) + (v54 * 65536) + (v53 * 256) + v52 ;end if (v51==0) then v52,v53,v54,v55=v9(v27,v29,v29 + (934 -(857 + 74)) );v29=v29 + 4 ;v51=1;end end end local function v35() local v56=v34();local v57=v34();local v58=1;local v59=(v31(v57,1,20) * (2^32)) + v56 ;local v60=v31(v57,21,31);local v61=((v31(v57,32)==1) and  -1) or 1 ;if (v60==0) then if (v59==0) then return v61 * 0 ;else local v103=0;while true do if (v103==0) then v60=1;v58=0;break;end end end elseif (v60==2047) then return ((v59==0) and (v61 * (1/0))) or (v61 * NaN) ;end return v16(v61,v60-1023 ) * (v58 + (v59/(2^52))) ;end local function v36(v62) local v63=0;local v64;local v65;while true do if (v63==2) then v65={};for v104=1, #v64 do v65[v104]=v10(v9(v11(v64,v104,v104)));end v63=3;end if (0==v63) then v64=nil;if  not v62 then v62=v34();if (v62==0) then return "";end end v63=1;end if (v63==1) then v64=v11(v27,v29,(v29 + v62) -(569 -(367 + 201)) );v29=v29 + v62 ;v63=2;end if (v63==3) then return v14(v65);end end end local v37=v34;local function v38(...) return {...},v20("#",...);end local function v39() local v66=0;local v67;local v68;local v69;local v70;local v71;local v72;while true do if (v66==2) then for v106=1,v34() do local v107=v32();if (v31(v107,1,1)==0) then local v120=0;local v121;local v122;local v123;while true do if (v120==0) then v121=v31(v107,2,3);v122=v31(v107,1 + 3 ,6);v120=1;end if (v120==1) then v123={v33(),v33(),nil,nil};if (v121==0) then local v127=0;while true do if (v127==0) then v123[1640 -(1523 + 114) ]=v33();v123[4]=v33();break;end end elseif (v121==1) then v123[3]=v34();elseif (v121==2) then v123[3]=v34() -(2^16) ;elseif (v121==3) then v123[3]=v34() -(2^16) ;v123[4]=v33();end v120=2;end if (v120==3) then if (v31(v122,3,3)==1) then v123[4]=v72[v123[4]];end v67[v106]=v123;break;end if (v120==2) then if (v31(v122,1,1)==1) then v123[2]=v72[v123[2]];end if (v31(v122,2,2 + 0 )==1) then v123[3]=v72[v123[3]];end v120=3;end end end end for v108=1,v34() do v68[v108-(1 -0) ]=v39();end return v70;end if (v66==1) then v71=v34();v72={};for v110=1,v71 do local v111=0;local v112;local v113;while true do if (v111==1) then if (v112==(1 + 0)) then v113=v32()~=0 ;elseif (v112==2) then v113=v35();elseif (v112==3) then v113=v36();end v72[v110]=v113;break;end if (0==v111) then v112=v32();v113=nil;v111=1;end end end v70[3]=v32();v66=2;end if (v66==0) then v67={};v68={};v69={};v70={v67,v68,nil,v69};v66=1;end end end local function v40(v73,v74,v75) local v76=v73[1];local v77=v73[2];local v78=v73[3];return function(...) local v79=v76;local v80=v77;local v81=v78;local v82=v38;local v83=1;local v84= -1;local v85={};local v86={...};local v87=v20("#",...) -1 ;local v88={};local v89={};for v100=0,v87 do if (v100>=v81) then v85[v100-v81 ]=v86[v100 + 1 ];else v89[v100]=v86[v100 + 1 ];end end local v90=(v87-v81) + 1 ;local v91;local v92;while true do local v101=0;while true do if (1==v101) then if (v92<=29) then if (v92<=14) then if (v92<=6) then if (v92<=2) then if (v92<=0) then v89[v91[2]][v89[v91[3]]]=v89[v91[4]];elseif (v92>1) then local v156=0;local v157;while true do if (v156==0) then v157=v91[2];v89[v157](v21(v89,v157 + (1066 -(68 + 997)) ,v84));break;end end else v89[v91[2]]=v89[v91[3]]%v91[4] ;end elseif (v92<=4) then if (v92==(1273 -(226 + 1044))) then v75[v91[3]]=v89[v91[2]];else do return;end end elseif (v92>5) then do return v89[v91[2]];end else local v161=0;local v162;local v163;local v164;local v165;while true do if (v161==2) then for v527=v162,v84 do local v528=0;while true do if (0==v528) then v165=v165 + 1 ;v89[v527]=v163[v165];break;end end end break;end if (v161==0) then v162=v91[2];v163,v164=v82(v89[v162](v89[v162 + (4 -3) ]));v161=1;end if (v161==1) then v84=(v164 + v162) -1 ;v165=0;v161=2;end end end elseif (v92<=10) then if (v92<=8) then if (v92==7) then local v166;local v167,v168;local v169;v89[v91[2]]=v74[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v169=v91[2];v167,v168=v82(v89[v169](v21(v89,v169 + 1 ,v91[3])));v84=(v168 + v169) -1 ;v166=0;for v311=v169,v84 do local v312=0;while true do if (v312==0) then v166=v166 + (118 -(32 + 85)) ;v89[v311]=v167[v166];break;end end end v83=v83 + 1 ;v91=v79[v83];v169=v91[2];v89[v169](v21(v89,v169 + 1 ,v84));else v89[v91[2]]=v89[v91[3]] + v91[4] ;end elseif (v92>9) then v89[v91[2 + 0 ]]=v89[v91[3]][v89[v91[4]]];else local v178=0;local v179;local v180;local v181;while true do if (v178==1) then v181=v89[v179] + v180 ;v89[v179]=v181;v178=2;end if (v178==2) then if (v180>0) then if (v181<=v89[v179 + 1 ]) then local v581=0;while true do if (v581==0) then v83=v91[3];v89[v179 + 1 + 2 ]=v181;break;end end end elseif (v181>=v89[v179 + 1 ]) then local v582=0;while true do if (0==v582) then v83=v91[3];v89[v179 + 3 ]=v181;break;end end end break;end if (0==v178) then v179=v91[2];v180=v89[v179 + 2 ];v178=1;end end end elseif (v92<=12) then if (v92>(968 -(892 + 65))) then local v182=0;while true do if (v182==0) then v89[v91[2]]=v91[3]~=0 ;v83=v83 + 1 ;break;end end else local v183=0;local v184;while true do if (0==v183) then v184=v91[4 -2 ];v89[v184]=v89[v184](v21(v89,v184 + 1 ,v91[3]));break;end end end elseif (v92>13) then if  not v89[v91[2]] then v83=v83 + 1 ;else v83=v91[3];end else local v185=0;local v186;local v187;local v188;local v189;while true do if (1==v185) then v84=(v188 + v186) -1 ;v189=0;v185=2;end if (v185==0) then v186=v91[2];v187,v188=v82(v89[v186](v21(v89,v186 + 1 ,v91[3])));v185=1;end if (2==v185) then for v531=v186,v84 do local v532=0;while true do if (v532==0) then v189=v189 + (1 -0) ;v89[v531]=v187[v189];break;end end end break;end end end elseif (v92<=21) then if (v92<=17) then if (v92<=15) then local v140;local v141;local v142;v89[v91[3 -1 ]]=v89[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v89[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + (351 -(87 + 263)) ;v91=v79[v83];v142=v91[2];v141=v89[v142];v140=v89[v142 + 2 ];if (v140>0) then if (v141>v89[v142 + 1 ]) then v83=v91[3];else v89[v142 + 3 ]=v141;end elseif (v141<v89[v142 + 1 ]) then v83=v91[3];else v89[v142 + (183 -(67 + 113)) ]=v141;end elseif (v92>16) then v89[v91[2]]=v89[v91[3]][v91[4]];elseif (v89[v91[2]]==v91[4]) then v83=v83 + 1 ;else v83=v91[3];end elseif (v92<=19) then if (v92>18) then local v192;local v193,v194;local v195;v89[v91[2]]=v89[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v74[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v74[v91[3 + 0 ]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v74[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v74[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v89[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v89[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v89[v91[3]] + v91[4] ;v83=v83 + 1 ;v91=v79[v83];v195=v91[2];v193,v194=v82(v89[v195](v21(v89,v195 + (2 -1) ,v91[3])));v84=(v194 + v195) -1 ;v192=0;for v313=v195,v84 do local v314=0;while true do if (v314==0) then v192=v192 + 1 ;v89[v313]=v193[v192];break;end end end v83=v83 + 1 ;v91=v79[v83];v195=v91[2 + 0 ];v89[v195]=v89[v195](v21(v89,v195 + 1 ,v84));v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v74[v91[11 -8 ]];v83=v83 + (953 -(802 + 150)) ;v91=v79[v83];v89[v91[2]]=v74[v91[7 -4 ]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v89[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]= #v89[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v89[v91[3]]%v89[v91[4]] ;v83=v83 + 1 ;v91=v79[v83];v89[v91[3 -1 ]]=v91[3] + v89[v91[4]] ;v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]= #v89[v91[3 + 0 ]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v89[v91[1000 -(915 + 82) ]]%v89[v91[4]] ;v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v91[3] + v89[v91[4]] ;v83=v83 + (2 -1) ;v91=v79[v83];v89[v91[2]]=v89[v91[2 + 1 ]] + v91[4] ;v83=v83 + (1 -0) ;v91=v79[v83];v195=v91[2];v193,v194=v82(v89[v195](v21(v89,v195 + (1188 -(1069 + 118)) ,v91[3])));v84=(v194 + v195) -1 ;v192=0 -0 ;for v315=v195,v84 do local v316=0;while true do if (v316==0) then v192=v192 + 1 ;v89[v315]=v193[v192];break;end end end v83=v83 + 1 ;v91=v79[v83];v195=v91[3 -1 ];v193,v194=v82(v89[v195](v21(v89,v195 + 1 ,v84)));v84=(v194 + v195) -1 ;v192=0;for v317=v195,v84 do local v318=0;while true do if (v318==0) then v192=v192 + 1 ;v89[v317]=v193[v192];break;end end end v83=v83 + 1 ;v91=v79[v83];v195=v91[2];v89[v195]=v89[v195](v21(v89,v195 + 1 ,v84));v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v89[v91[1 + 2 ]]%v91[4] ;v83=v83 + 1 ;v91=v79[v83];v195=v91[2];v193,v194=v82(v89[v195](v89[v195 + (1 -0) ]));v84=(v194 + v195) -1 ;v192=0;for v319=v195,v84 do local v320=0;while true do if (v320==0) then v192=v192 + 1 ;v89[v319]=v193[v192];break;end end end v83=v83 + 1 ;v91=v79[v83];v195=v91[2 + 0 ];v89[v195](v21(v89,v195 + 1 ,v84));else local v208=0;while true do if (v208==1) then v89[v91[2]]=v89[v91[3]][v91[4]];v83=v83 + 1 ;v91=v79[v83];v208=2;end if (v208==2) then v89[v91[2]]=v75[v91[3]];v83=v83 + 1 ;v91=v79[v83];v208=3;end if (v208==3) then v89[v91[2]]=v89[v91[3]][v91[4]];v83=v83 + 1 ;v91=v79[v83];v208=4;end if (v208==4) then v89[v91[2]]=v75[v91[3]];v83=v83 + (3 -2) ;v91=v79[v83];v208=5;end if (v208==7) then if  not v89[v91[444 -(416 + 26) ]] then v83=v83 + 1 ;else v83=v91[3];end break;end if (v208==0) then v89[v91[2]]=v75[v91[3]];v83=v83 + (792 -(368 + 423)) ;v91=v79[v83];v208=1;end if (v208==6) then v89[v91[7 -5 ]]=v75[v91[3]];v83=v83 + 1 ;v91=v79[v83];v208=7;end if (v208==5) then v89[v91[2]]=v89[v91[21 -(10 + 8) ]][v91[4]];v83=v83 + 1 ;v91=v79[v83];v208=6;end end end elseif (v92>20) then local v209=0;local v210;while true do if (v209==0) then v210=v91[2];do return v21(v89,v210,v210 + v91[9 -6 ] );end break;end end else local v211=0;local v212;while true do if (1==v211) then v89[v91[1 + 1 ]]=v75[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v91[3];v211=2;end if (v211==3) then v83=v83 + 1 ;v91=v79[v83];v89[v91[440 -(145 + 293) ]]=v89[v91[3]];v83=v83 + 1 ;v211=4;end if (v211==2) then v83=v83 + 1 ;v91=v79[v83];v212=v91[2];v89[v212]=v89[v212](v89[v212 + (1 -0) ]);v211=3;end if (v211==5) then v83=v91[3];break;end if (v211==0) then v212=nil;v75[v91[3]]=v89[v91[2]];v83=v83 + 1 ;v91=v79[v83];v211=1;end if (v211==4) then v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v211=5;end end end elseif (v92<=25) then if (v92<=23) then if (v92==22) then local v213=0;local v214;local v215;local v216;local v217;local v218;local v219;while true do if (v213==6) then for v541=v219,v84 do local v542=0;while true do if (v542==0) then v216=v216 + 1 ;v89[v541]=v217[v216];break;end end end v83=v83 + 1 ;v91=v79[v83];v219=v91[2];v213=7;end if (v213==7) then v89[v219]=v89[v219](v21(v89,v219 + 1 ,v84));v83=v83 + 1 + 0 ;v91=v79[v83];v89[v91[2]]=v91[3];v213=8;end if (v213==8) then v83=v83 + 1 ;v91=v79[v83];v219=v91[2];v215=v89[v219];v213=9;end if (v213==4) then v91=v79[v83];v89[v91[2]]=v89[v91[3]];v83=v83 + 1 ;v91=v79[v83];v213=5;end if (v213==3) then v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v89[v91[3]][v91[4]];v83=v83 + 1 ;v213=4;end if (0==v213) then v214=nil;v215=nil;v216=nil;v217,v218=nil;v213=1;end if (v213==1) then v219=nil;v89[v91[2]]=v75[v91[3]];v83=v83 + 1 ;v91=v79[v83];v213=2;end if (v213==9) then v214=v89[v219 + 2 ];if (v214>0) then if (v215>v89[v219 + 1 ]) then v83=v91[3 + 0 ];else v89[v219 + 3 ]=v215;end elseif (v215<v89[v219 + 1 ]) then v83=v91[3];else v89[v219 + 3 ]=v215;end break;end if (v213==5) then v219=v91[2];v217,v218=v82(v89[v219](v89[v219 + 1 ]));v84=(v218 + v219) -1 ;v216=0;v213=6;end if (v213==2) then v89[v91[2]]=v89[v91[3]][v91[434 -(44 + 386) ]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v75[v91[1489 -(998 + 488) ]];v213=3;end end else v89[v91[2]]=v89[v91[3]] * v89[v91[4]] ;end elseif (v92>24) then v89[v91[2]]= #v89[v91[3]];else v83=v91[3];end elseif (v92<=27) then if (v92==(798 -(201 + 571))) then v89[v91[2]][v89[v91[3]]]=v91[1142 -(116 + 1022) ];else local v225=0;local v226;local v227;local v228;local v229;local v230;while true do if (0==v225) then v226=nil;v227=nil;v228,v229=nil;v230=nil;v89[v91[2]]=v74[v91[3]];v83=v83 + 1 ;v225=1;end if (v225==2) then v91=v79[v83];v89[v91[2]]={};v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v74[v91[3]];v83=v83 + 1 ;v225=3;end if (v225==3) then v91=v79[v83];v89[v91[2]]=v89[v91[3]];v83=v83 + (3 -2) ;v91=v79[v83];for v543=v91[2],v91[3] do v89[v543]=nil;end v83=v83 + (860 -(814 + 45)) ;v225=4;end if (4==v225) then v91=v79[v83];v230=v91[2];v228,v229=v82(v89[v230](v21(v89,v230 + 1 ,v91[7 -4 ])));v84=(v229 + v230) -1 ;v227=0;for v545=v230,v84 do local v546=0;while true do if (v546==0) then v227=v227 + 1 ;v89[v545]=v228[v227];break;end end end v225=5;end if (v225==1) then v91=v79[v83];v89[v91[8 -6 ]]=v74[v91[3]];v83=v83 + 1 + 0 ;v91=v79[v83];v89[v91[7 -5 ]]=v74[v91[3]];v83=v83 + 1 ;v225=2;end if (v225==5) then v83=v83 + 1 ;v91=v79[v83];v230=v91[2];v226=v89[v230];for v547=v230 + 1 ,v84 do v15(v226,v89[v547]);end break;end end end elseif (v92==28) then local v231=v91[3];local v232=v89[v231];for v321=v231 + 1 ,v91[4] do v232=v232   .. v89[v321] ;end v89[v91[2]]=v232;else local v234=v91[1 + 1 ];do return v21(v89,v234,v84);end end elseif (v92<=(16 + 28)) then if (v92<=36) then if (v92<=32) then if (v92<=30) then local v151=0;local v152;local v153;while true do if (0==v151) then v152=v91[2];v153=v89[v152];v151=1;end if (1==v151) then for v339=v152 + 1 ,v84 do v15(v153,v89[v339]);end break;end end elseif (v92==31) then v89[v91[2]]=v91[3];else local v237=0;local v238;local v239;local v240;local v241;while true do if (v237==5) then v89[v241](v21(v89,v241 + (1081 -(1020 + 60)) ,v84));v83=v83 + 1 ;v91=v79[v83];v83=v91[3];break;end if (v237==4) then for v548=v241,v84 do local v549=0;while true do if (v549==0) then v238=v238 + 1 ;v89[v548]=v239[v238];break;end end end v83=v83 + 1 ;v91=v79[v83];v241=v91[2];v237=5;end if (v237==0) then v238=nil;v239,v240=nil;v241=nil;v89[v91[2]]=v74[v91[3]];v237=1;end if (v237==2) then v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v237=3;end if (v237==3) then v241=v91[2];v239,v240=v82(v89[v241](v21(v89,v241 + (1 -0) ,v91[3])));v84=(v240 + v241) -1 ;v238=0;v237=4;end if (v237==1) then v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + (886 -(261 + 624)) ;v237=2;end end end elseif (v92<=34) then if (v92>33) then local v242=0;local v243;local v244;local v245;while true do if (v242==1) then v245=v89[v243 + 2 ];if (v245>0) then if (v244>v89[v243 + 1 ]) then v83=v91[1426 -(630 + 793) ];else v89[v243 + 3 ]=v244;end elseif (v244<v89[v243 + 1 ]) then v83=v91[3];else v89[v243 + 3 ]=v244;end break;end if (v242==0) then v243=v91[2];v244=v89[v243];v242=1;end end else local v246=0;local v247;local v248;local v249;while true do if (4==v246) then v89[v91[2]]=v89[v91[3]];v83=v83 + 1 ;v91=v79[v83];v248=v91[3];v246=5;end if (v246==2) then v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v246=3;end if (v246==6) then v91=v79[v83];v249=v91[1 + 1 ];v89[v249](v89[v249 + 1 ]);break;end if (v246==3) then v249=v91[2];v89[v249]=v89[v249](v21(v89,v249 + 1 ,v91[3]));v83=v83 + (3 -2) ;v91=v79[v83];v246=4;end if (v246==1) then v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + 1 ;v246=2;end if (v246==5) then v247=v89[v248];for v550=v248 + 1 ,v91[4] do v247=v247   .. v89[v550] ;end v89[v91[2]]=v247;v83=v83 + (4 -3) ;v246=6;end if (v246==0) then v247=nil;v248=nil;v249=nil;v89[v91[2]]=v74[v91[3]];v246=1;end end end elseif (v92==35) then v89[v91[2]]=v40(v80[v91[9 -6 ]],nil,v75);else local v251=0;local v252;while true do if (0==v251) then v252=v91[2];v89[v252]=v89[v252](v89[v252 + 1 ]);break;end end end elseif (v92<=40) then if (v92<=38) then if (v92==(1784 -(760 + 987))) then v89[v91[2]]={};else for v324=v91[2],v91[3] do v89[v324]=nil;end end elseif (v92>(1952 -(1789 + 124))) then local v254=0;local v255;local v256;local v257;while true do if (v254==2) then for v551=1,v91[4] do local v552=0;local v553;while true do if (v552==1) then if (v553[1]==44) then v257[v551-(767 -(745 + 21)) ]={v89,v553[3]};else v257[v551-1 ]={v74,v553[3]};end v88[ #v88 + 1 ]=v257;break;end if (v552==0) then v83=v83 + 1 ;v553=v79[v83];v552=1;end end end v89[v91[2]]=v40(v255,v256,v75);break;end if (1==v254) then v257={};v256=v18({},{[v7("\248\147\123\23\42\87\223","\50\167\204\18\121\78")]=function(v554,v555) local v556=0;local v557;while true do if (v556==0) then v557=v257[v555];return v557[1][v557[2]];end end end,[v7("\202\28\74\164\226\42\74\165\240\59","\193\149\67\36")]=function(v558,v559,v560) local v561=v257[v559];v561[1][v561[2]]=v560;end});v254=2;end if (0==v254) then v255=v80[v91[3]];v256=nil;v254=1;end end else local v258=0;local v259;local v260;local v261;while true do if (1==v258) then v261=0;for v563=v259,v91[4] do local v564=0;while true do if (v564==0) then v261=v261 + 1 ;v89[v563]=v260[v261];break;end end end break;end if (v258==0) then v259=v91[1 + 1 ];v260={v89[v259](v89[v259 + 1 ])};v258=1;end end end elseif (v92<=42) then if (v92>41) then if (v91[2]==v89[v91[4]]) then v83=v83 + 1 ;else v83=v91[3];end else local v262;local v263,v264;local v265;v89[v91[2]]=v74[v91[3]];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + (2 -1) ;v91=v79[v83];v265=v91[2];v263,v264=v82(v89[v265](v21(v89,v265 + 1 ,v91[3])));v84=(v264 + v265) -1 ;v262=0;for v326=v265,v84 do local v327=0;while true do if (0==v327) then v262=v262 + 1 ;v89[v326]=v263[v262];break;end end end v83=v83 + 1 ;v91=v79[v83];v265=v91[2];v89[v265](v21(v89,v265 + 1 ,v84));v83=v83 + 1 ;v91=v79[v83];v89[v91[7 -5 ]]=v91[3];v83=v83 + 1 ;v91=v79[v83];for v328=v91[2],v91[3] do v89[v328]=nil;end end elseif (v92==43) then local v272=0;local v273;local v274;local v275;local v276;while true do if (v272==2) then for v567=v273,v84 do local v568=0;while true do if (v568==0) then v276=v276 + 1 ;v89[v567]=v274[v276];break;end end end break;end if (v272==1) then v84=(v275 + v273) -1 ;v276=0;v272=2;end if (v272==0) then v273=v91[2];v274,v275=v82(v89[v273](v21(v89,v273 + 1 ,v84)));v272=1;end end else v89[v91[2]]=v89[v91[3]];end elseif (v92<=52) then if (v92<=48) then if (v92<=46) then if (v92==45) then local v279=0;local v280;local v281;local v282;while true do if (v279==0) then v280=nil;v281=nil;v282=nil;v279=1;end if (v279==4) then v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v279=5;end if (v279==1) then v89[v91[2]]={};v83=v83 + 1 ;v91=v79[v83];v279=2;end if (v279==3) then v89[v91[2]]= #v89[v91[3]];v83=v83 + 1 ;v91=v79[v83];v279=4;end if (v279==5) then v282=v91[2];v281=v89[v282];v280=v89[v282 + 2 ];v279=6;end if (v279==6) then if (v280>0) then if (v281>v89[v282 + 1 ]) then v83=v91[3];else v89[v282 + 3 ]=v281;end elseif (v281<v89[v282 + 1 ]) then v83=v91[3];else v89[v282 + 3 ]=v281;end break;end if (v279==2) then v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v279=3;end end else v89[v91[2]]=v89[v91[3]]%v89[v91[1 + 3 ]] ;end elseif (v92>47) then local v284=v91[2];v89[v284]=v89[v284](v21(v89,v284 + 1 ,v84));else do return v89[v91[2]]();end end elseif (v92<=50) then if (v92>(39 + 10)) then local v286=0;local v287;while true do if (v286==0) then v287=v91[2];do return v89[v287](v21(v89,v287 + 1 ,v91[3]));end break;end end else v89[v91[2]]=v91[3] + v89[v91[4]] ;end elseif (v92>51) then v89[v91[2]]=v74[v91[1058 -(87 + 968) ]];elseif v89[v91[2]] then v83=v83 + 1 ;else v83=v91[3];end elseif (v92<=56) then if (v92<=54) then if (v92>53) then v89[v91[2]]=v91[3]~=0 ;else local v292=0;local v293;local v294;local v295;local v296;while true do if (v292==0) then v293=nil;v294,v295=nil;v296=nil;v292=1;end if (v292==4) then v296=v91[2];v294,v295=v82(v89[v296](v21(v89,v296 + 1 ,v91[3 + 0 ])));v84=(v295 + v296) -1 ;v292=5;end if (v292==3) then v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v292=4;end if (v292==6) then v91=v79[v83];v296=v91[2];v89[v296](v21(v89,v296 + 1 ,v84));break;end if (v292==2) then v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v292=3;end if (v292==1) then v89[v91[2]]=v74[v91[13 -10 ]];v83=v83 + 1 ;v91=v79[v83];v292=2;end if (v292==5) then v293=0;for v569=v296,v84 do v293=v293 + 1 ;v89[v569]=v294[v293];end v83=v83 + 1 ;v292=6;end end end elseif (v92>(124 -69)) then local v297=v91[2];v89[v297](v89[v297 + (1414 -(447 + 966)) ]);elseif (v89[v91[2]]<v89[v91[4]]) then v83=v83 + 1 ;else v83=v91[8 -5 ];end elseif (v92<=58) then if (v92>57) then v89[v91[2]]=v75[v91[3]];else local v300=0;local v301;local v302;local v303;local v304;while true do if (v300==0) then v301=nil;v302,v303=nil;v304=nil;v300=1;end if (v300==4) then v91=v79[v83];v304=v91[2];v302,v303=v82(v89[v304](v21(v89,v304 + 1 ,v91[3])));v300=5;end if (v300==2) then v304=v91[2];v89[v304]=v89[v304](v21(v89,v304 + 1 ,v91[3]));v83=v83 + 1 ;v300=3;end if (3==v300) then v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + 1 ;v300=4;end if (v300==6) then v83=v83 + 1 ;v91=v79[v83];v304=v91[2];v300=7;end if (v300==7) then v89[v304]=v89[v304](v21(v89,v304 + 1 ,v84));v83=v83 + 1 ;v91=v79[v83];v300=8;end if (v300==8) then if (v89[v91[2]]==v91[4]) then v83=v83 + 1 ;else v83=v91[3];end break;end if (1==v300) then v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v300=2;end if (v300==5) then v84=(v303 + v304) -1 ;v301=0;for v572=v304,v84 do local v573=0;while true do if (v573==0) then v301=v301 + 1 ;v89[v572]=v302[v301];break;end end end v300=6;end end end elseif (v92>59) then local v305=v91[2];local v306=v91[4];local v307=v305 + (1819 -(1703 + 114)) ;local v308={v89[v305](v89[v305 + 1 ],v89[v307])};for v330=702 -(376 + 325) ,v306 do v89[v307 + v330 ]=v308[v330];end local v309=v308[1];if v309 then local v343=0;while true do if (v343==0) then v89[v307]=v309;v83=v91[4 -1 ];break;end end else v83=v83 + 1 ;end else local v310=0;while true do if (v310==1) then v83=v83 + 1 ;v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + 1 ;v310=2;end if (v310==3) then v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];if (v89[v91[2]]<v89[v91[4]]) then v83=v83 + 1 ;else v83=v91[3];end break;end if (0==v310) then v89[v91[2]]=v89[v91[3]] + v91[4] ;v83=v83 + 1 ;v91=v79[v83];v89[v91[5 -3 ]]=v89[v91[1 + 2 ]] + v91[4] ;v310=1;end if (v310==2) then v91=v79[v83];v89[v91[2]]=v91[3];v83=v83 + 1 ;v91=v79[v83];v310=3;end end end v83=v83 + (2 -1) ;break;end if (0==v101) then v91=v79[v83];v92=v91[1];v101=1;end end end end;end return v40(v39(),{},v28)(...);end return v23("LOL!0D3Q0003063Q00737472696E6703043Q006368617203043Q00627974652Q033Q0073756203053Q0062697433322Q033Q0062697403043Q0062786F7203053Q007461626C6503063Q00636F6E63617403063Q00696E7365727403053Q006D6174636803083Q00746F6E756D62657203053Q007063612Q6C00243Q002Q123Q00013Q00206Q000200122Q000100013Q00202Q00010001000300122Q000200013Q00202Q00020002000400122Q000300053Q00062Q0003000A000100010004183Q000A000100123A000300063Q00201100040003000700123A000500083Q00201100050005000900123A000600083Q00201100060006000A00062800073Q000100062Q002C3Q00064Q002C8Q002C3Q00044Q002C3Q00014Q002C3Q00024Q002C3Q00053Q00123A000800013Q00201100080008000B00123A0009000C3Q00123A000A000D3Q000628000B0001000100052Q002C3Q00074Q002C3Q00094Q002C3Q00084Q002C3Q000A4Q002C3Q000B4Q002C000C000B4Q002F000C00014Q001D000C6Q00043Q00013Q00023Q00023Q00026Q00F03F026Q00704002264Q002D00025Q00122Q000300016Q00045Q00122Q000500013Q00042Q0003002100012Q003400076Q0013000800026Q000900016Q000A00026Q000B00036Q000C00046Q000D8Q000E00063Q00202Q000F000600014Q000C000F6Q000B3Q00024Q000C00036Q000D00046Q000E00016Q000F00016Q000F0006000F00102Q000F0001000F4Q001000016Q00100006001000102Q00100001001000202Q0010001000014Q000D00106Q000C8Q000A3Q000200202Q000A000A00024Q0009000A6Q00073Q00010004090003000500012Q0034000300054Q002C000400024Q0032000300044Q001D00036Q00043Q00017Q00043Q00027Q004003053Q003A25642B3A2Q033Q0025642B026Q00F03F001C3Q0006285Q000100012Q00348Q001B000100016Q000200026Q000300026Q00048Q000500036Q00068Q000700076Q000500076Q00043Q0001002011000400040001001239000500026Q00030005000200122Q000400036Q000200046Q00013Q000200262Q00010018000100040004183Q001800012Q002C00016Q002500026Q0032000100024Q001D00015Q0004183Q001B00012Q0034000100044Q002F000100014Q001D00016Q00043Q00013Q00013Q00163Q00024Q00F0E4FD40026Q003440025Q00C05940025Q005D3241024Q0087C63241023Q00406E9B5E4103053Q007072696E7403043Q003002237603073Q00CB44705613C5DE026Q00F03F03193Q00D234FA556BE647C933BC5470E006DE39F24471F14FD238EF0103073Q0026BD569C20188503343Q00DF5BAE45F75EA941BC6C9452EE5EA941EF6AE751F55BAB06FF58AA56F052B343F04EE74EF553A206E85FAE55BC44B354F559A00703043Q00269C37C7028Q0003053Q007061697273030D3Q00986F75251634FC4CBD7378725303083Q0023C81D1C4873149A03153Q0073696576655F6F665F657261746F737468656E6573025Q00407A4003163Q0031B0C69F99237416BDD7CA9E2F350DBA91DD883F204603073Q005479DFB1BFED4C01583Q0006333Q005600013Q0004183Q0056000100121F000100013Q00203B00020001000200202Q00010002000300122Q000200043Q00122Q000300053Q00122Q000400063Q00062Q00020010000100030004183Q0010000100123A000500074Q003500065Q00122Q000700083Q00122Q000800096Q000600086Q00053Q00010010310005000A000400063700030019000100050004183Q0019000100123A000500074Q003500065Q00122Q0007000B3Q00122Q0008000C6Q000600086Q00053Q000100123A000500074Q002900065Q00122Q0007000D3Q00122Q0008000E6Q000600086Q00053Q000100122Q0005000F6Q000600073Q002610000600490001000A0004183Q00490001002610000600360001000A0004183Q0036000100123A000800104Q002C000900074Q002700080002000A0004183Q00330001000633000C003300013Q0004183Q0033000100123A000D00074Q0021000E5Q00122Q000F00113Q00122Q001000126Q000E001000024Q000F000B6Q000E000E000F4Q000D0002000100063C00080029000100020004183Q002900010004183Q004F0001002610000600230001000F0004183Q0023000100121F0008000F3Q0026100008003D0001000A0004183Q003D000100121F0006000A3Q0004183Q00230001002610000800390001000F0004183Q0039000100022300095Q001214000900133Q00122Q000900133Q00122Q000A00146Q0009000200024Q000700093Q00122Q0008000A3Q00044Q003900010004183Q002300010004183Q004F0001002610000600210001000F0004183Q0021000100121F0006000F4Q0026000700073Q00121F0006000A3Q0004183Q0021000100123A000500074Q002000065Q00122Q000700153Q00122Q000800166Q000600086Q00053Q000100044Q0057000100201100013Q000A2Q00043Q00013Q00013Q00073Q00028Q00026Q00F03F027Q004003043Q006D61746803053Q00666C2Q6F7203043Q00737172740100013C3Q00121F000100014Q0026000200033Q00261000010035000100020004183Q0035000100121F000400013Q00261000040005000100010004183Q0005000100261000020016000100010004183Q001600012Q002500056Q000F000300053Q00122Q000500026Q00065Q00122Q000700023Q00042Q000500150001000E2A00020012000100080004183Q001200012Q000C00096Q0036000900016Q0003000800090004090005000F000100121F000200023Q00261000020004000100020004183Q0004000100121F000500013Q00261000050019000100010004183Q0019000100121F000600033Q001216000700043Q00202Q00070007000500122Q000800043Q00202Q0008000800064Q00098Q000800096Q00073Q000200122Q000800023Q00042Q0006002F00012Q000A000A00030009000633000A002E00013Q0004183Q002E00012Q0017000A000900092Q002C000B6Q002C000C00093Q000422000A002E000100201A0003000D0007000409000A002C00010004090006002500012Q0006000300023Q0004183Q001900010004183Q000400010004183Q000500010004183Q000400010004183Q003B000100261000010002000100010004183Q0002000100121F000200014Q0026000300033Q00121F000100023Q0004183Q000200012Q00043Q00017Q00",v17(),...);
