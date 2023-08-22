(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is TurboPower SysTools
 *
 * The Initial Developer of the Original Code is
 * TurboPower Software
 *
 * Portions created by the Initial Developer are Copyright (C) 1996-2002
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** *)

{*********************************************************}
{* SysTools: StJup.pas 4.03                              *}
{*********************************************************}
{* SysTools: Astronomical Routines (for Jupiter)         *}
{*********************************************************}

{$I StDefine.inc}

unit StJup;

interface

uses
  StAstroP;

function ComputeJupiter(JD : Double) : TStEclipticalCord;


implementation

{--------------------------------------------------------------------------}

function GetLongitude(Tau, Tau2, Tau3, Tau4, Tau5 : Double) : Double;
var
  L0, L1,
  L2, L3,
  L4, L5  : Double;
begin
  L0 := 0.59954691495 * cos(0.00000000000 +    0.00000000000 * Tau)
      + 0.09695898711 * cos(5.06191793110 +  529.69096509000 * Tau)
      + 0.00573610145 * cos(1.44406205980 +    7.11354700080 * Tau)
      + 0.00306389180 * cos(5.41734729980 + 1059.38193020000 * Tau)
      + 0.00097178280 * cos(4.14264708820 +  632.78373931000 * Tau)
      + 0.00072903096 * cos(3.64042909250 +  522.57741809000 * Tau)
      + 0.00064263986 * cos(3.41145185200 +  103.09277422000 * Tau)
      + 0.00039806051 * cos(2.29376744860 +  419.48464388000 * Tau)
      + 0.00038857780 * cos(1.27231724860 +  316.39186966000 * Tau)
      + 0.00027964622 * cos(1.78454589490 +  536.80451210000 * Tau)
      + 0.00013589738 * cos(5.77481031590 + 1589.07289530000 * Tau)
      + 0.00008768686 * cos(3.63000324420 +  949.17560897000 * Tau)
      + 0.00008246362 * cos(3.58227961650 +  206.18554844000 * Tau)
      + 0.00007368057 * cos(5.08101125610 +  735.87651353000 * Tau)
      + 0.00006263171 * cos(0.02497643742 +  213.29909544000 * Tau)
      + 0.00006114050 * cos(4.51319531670 + 1162.47470440000 * Tau)
      + 0.00005305457 * cos(4.18625053490 + 1052.26838320000 * Tau)
      + 0.00005305283 * cos(1.30671236850 +   14.22709400200 * Tau)
      + 0.00004905419 * cos(1.32084631680 +  110.20632122000 * Tau)
      + 0.00004647249 * cos(4.69958109500 +    3.93215326310 * Tau)
      + 0.00003045009 * cos(4.31675960320 +  426.59819088000 * Tau)
      + 0.00002610001 * cos(1.56667594850 +  846.08283475000 * Tau)
      + 0.00002028191 * cos(1.06376547380 +    3.18139373770 * Tau)
      + 0.00001920959 * cos(0.97168928755 +  639.89728631000 * Tau)
      + 0.00001764768 * cos(2.14148077770 + 1066.49547720000 * Tau)
      + 0.00001722983 * cos(3.88036008870 + 1265.56747860000 * Tau)
      + 0.00001633217 * cos(3.58201089760 +  515.46387109000 * Tau)
      + 0.00001431997 * cos(4.29683690270 +  625.67019231000 * Tau)
      + 0.00000973278 * cos(4.09764957060 +   95.97922721800 * Tau)
      + 0.00000884439 * cos(2.43701426120 +  412.37109687000 * Tau)
      + 0.00000732875 * cos(6.08534113240 +  838.96928775000 * Tau)
      + 0.00000731072 * cos(3.80591233960 + 1581.95934830000 * Tau)
      + 0.00000709190 * cos(1.29272573660 +  742.99006053000 * Tau)
      + 0.00000691928 * cos(6.13368222940 + 2118.76386040000 * Tau)
      + 0.00000614464 * cos(4.10853496760 + 1478.86657410000 * Tau)
      + 0.00000581902 * cos(4.53967717550 +  309.27832266000 * Tau)
      + 0.00000495224 * cos(3.75567461380 +  323.50541666000 * Tau)
      + 0.00000440854 * cos(2.95818460940 +  454.90936653000 * Tau)
      + 0.00000417266 * cos(1.03554430160 +    2.44768055480 * Tau)
      + 0.00000389864 * cos(4.89716105850 + 1692.16566950000 * Tau)
      + 0.00000375657 * cos(4.70299124830 + 1368.66025280000 * Tau)
      + 0.00000341006 * cos(5.71452525780 +  533.62311836000 * Tau)
      + 0.00000330458 * cos(4.74049819490 +    0.04818410980 * Tau)
      + 0.00000261540 * cos(1.87652461030 +    0.96320784650 * Tau)
      + 0.00000261009 * cos(0.82047246448 +  380.12776796000 * Tau)
      + 0.00000256568 * cos(3.72410724160 +  199.07200144000 * Tau)
      + 0.00000244170 * cos(5.22020878900 +  728.76296653000 * Tau)
      + 0.00000235141 * cos(1.22693908120 +  909.81873305000 * Tau)
      + 0.00000220382 * cos(1.65115016000 +  543.91805910000 * Tau)
      + 0.00000207327 * cos(1.85461666590 +  525.75881183000 * Tau)
      + 0.00000201996 * cos(1.80684574190 + 1375.77379980000 * Tau)
      + 0.00000197046 * cos(5.29252149020 + 1155.36115740000 * Tau)
      + 0.00000175191 * cos(3.72966554760 +  942.06206197000 * Tau)
      + 0.00000175184 * cos(3.22634903430 + 1898.35121790000 * Tau)
      + 0.00000174809 * cos(5.90973505280 +  956.28915597000 * Tau)
      + 0.00000157909 * cos(4.36483921770 + 1795.25844370000 * Tau)
      + 0.00000150502 * cos(3.90625022620 +   74.78159856700 * Tau)
      + 0.00000149368 * cos(4.37745104270 + 1685.05212250000 * Tau)
      + 0.00000141445 * cos(3.13568357860 +  491.55792946000 * Tau)
      + 0.00000137871 * cos(1.31797920780 + 1169.58825140000 * Tau)
      + 0.00000130531 * cos(4.16867945490 + 1045.15483620000 * Tau)
      + 0.00000117495 * cos(2.50022140890 + 1596.18644230000 * Tau)
      + 0.00000116757 * cos(3.38920921040 +    0.52126486180 * Tau)
      + 0.00000105895 * cos(4.55439798240 +  526.50957136000 * Tau);

  L1 := 529.93480758000 * cos(0.00000000000 + 0.00000000000 * Tau)
      + 0.00489741194 * cos(4.22066689930 +  529.69096509000 * Tau)
      + 0.00228918538 * cos(6.02647464020 +    7.11354700080 * Tau)
      + 0.00027655380 * cos(4.57265956820 + 1059.38193020000 * Tau)
      + 0.00020720943 * cos(5.45938936290 +  522.57741809000 * Tau)
      + 0.00012105732 * cos(0.16985765041 +  536.80451210000 * Tau)
      + 0.00006068051 * cos(4.42419502010 +  103.09277422000 * Tau)
      + 0.00005433924 * cos(3.98478382570 +  419.48464388000 * Tau)
      + 0.00004237795 * cos(5.89009351270 +   14.22709400200 * Tau)
      + 0.00002211854 * cos(5.26771446620 +  206.18554844000 * Tau)
      + 0.00001745919 * cos(4.92669378490 + 1589.07289530000 * Tau)
      + 0.00001295769 * cos(5.55132765090 +    3.18139373770 * Tau)
      + 0.00001173129 * cos(5.85647304350 + 1052.26838320000 * Tau)
      + 0.00001163411 * cos(0.51450895328 +    3.93215326310 * Tau)
      + 0.00001098735 * cos(5.30704981590 +  515.46387109000 * Tau)
      + 0.00001007216 * cos(0.46478398551 +  735.87651353000 * Tau)
      + 0.00001003574 * cos(3.15040301820 +  426.59819088000 * Tau)
      + 0.00000847678 * cos(5.75805850450 +  110.20632122000 * Tau)
      + 0.00000827329 * cos(4.80312015730 +  213.29909544000 * Tau)
      + 0.00000816397 * cos(0.58643054886 + 1066.49547720000 * Tau)
      + 0.00000725447 * cos(5.51827471470 +  639.89728631000 * Tau)
      + 0.00000567845 * cos(5.98867049450 +  625.67019231000 * Tau)
      + 0.00000474181 * cos(4.13245269170 +  412.37109687000 * Tau)
      + 0.00000412930 * cos(5.73652891260 +   95.97922721800 * Tau)
      + 0.00000345249 * cos(4.24159565410 +  632.78373931000 * Tau)
      + 0.00000335817 * cos(3.73248749050 + 1162.47470440000 * Tau)
      + 0.00000234340 * cos(4.03469970330 +  949.17560897000 * Tau)
      + 0.00000234066 * cos(6.24302226650 +  309.27832266000 * Tau)
      + 0.00000198525 * cos(1.50458442830 +  838.96928775000 * Tau)
      + 0.00000194784 * cos(2.21879010910 +  323.50541666000 * Tau)
      + 0.00000186899 * cos(6.08620565910 +  742.99006053000 * Tau)
      + 0.00000183938 * cos(6.27963588820 +  543.91805910000 * Tau)
      + 0.00000171380 * cos(5.41655983840 +  199.07200144000 * Tau)
      + 0.00000130771 * cos(0.62643377351 +  728.76296653000 * Tau)
      + 0.00000115393 * cos(0.68019050174 +  846.08283475000 * Tau)
      + 0.00000115047 * cos(5.28641699140 + 2118.76386040000 * Tau)
      + 0.00000107575 * cos(4.49282760120 +  956.28915597000 * Tau)
      + 0.00000079686 * cos(5.82412400270 + 1045.15483620000 * Tau)
      + 0.00000071643 * cos(5.34162650320 +  942.06206197000 * Tau)
      + 0.00000069618 * cos(5.97263450280 +  532.87235883000 * Tau)
      + 0.00000066824 * cos(5.73365126530 +   21.34064100200 * Tau)
      + 0.00000065635 * cos(0.12924191430 +  526.50957136000 * Tau)
      + 0.00000064850 * cos(6.08803490290 + 1581.95934830000 * Tau)
      + 0.00000058509 * cos(0.58626971028 + 1155.36115740000 * Tau)
      + 0.00000057939 * cos(0.99453087342 + 1596.18644230000 * Tau)
      + 0.00000057368 * cos(5.96851304800 + 1169.58825140000 * Tau)
      + 0.00000056600 * cos(1.41198438840 +  533.62311836000 * Tau)
      + 0.00000054935 * cos(5.42806383720 +   10.29494073800 * Tau)
      + 0.00000052309 * cos(5.72661448390 +  117.31986822000 * Tau)
      + 0.00000052016 * cos(0.22981299129 + 1368.66025280000 * Tau)
      + 0.00000050418 * cos(6.08075147810 +  525.75881183000 * Tau)
      + 0.00000047418 * cos(3.62611843240 + 1478.86657410000 * Tau)
      + 0.00000046678 * cos(0.51144073175 + 1265.56747860000 * Tau)
      + 0.00000039888 * cos(4.16158013600 + 1692.16566950000 * Tau)
      + 0.00000033558 * cos(0.09913904872 +  302.16477566000 * Tau)
      + 0.00000032827 * cos(5.03596689460 +  220.41264244000 * Tau)
      + 0.00000032449 * cos(5.37492530700 +  508.35032409000 * Tau)
      + 0.00000029483 * cos(5.42208897100 + 1272.68102560000 * Tau)
      + 0.00000029379 * cos(3.35927241530 +    4.66586644600 * Tau)
      + 0.00000029307 * cos(0.75907909735 +   88.86568021700 * Tau)
      + 0.00000025195 * cos(1.60723063390 +  831.85574075000 * Tau);

  L2 := 0.00047233598 * cos(4.32148323550 +    7.11354700080 * Tau)
      + 0.00038965550 * cos(0.00000000000 +    0.00000000000 * Tau)
      + 0.00030629053 * cos(2.93021440220 +  529.69096509000 * Tau)
      + 0.00003189317 * cos(1.05504615600 +  522.57741809000 * Tau)
      + 0.00002729292 * cos(4.84545481350 +  536.80451210000 * Tau)
      + 0.00002723358 * cos(3.41411526640 + 1059.38193020000 * Tau)
      + 0.00001721069 * cos(4.18734385160 +   14.22709400200 * Tau)
      + 0.00000383258 * cos(5.76790714390 +  419.48464388000 * Tau)
      + 0.00000377524 * cos(0.76048964872 +  515.46387109000 * Tau)
      + 0.00000367498 * cos(6.05509120410 +  103.09277422000 * Tau)
      + 0.00000337386 * cos(3.78644384240 +    3.18139373770 * Tau)
      + 0.00000308200 * cos(0.69356654052 +  206.18554844000 * Tau)
      + 0.00000218408 * cos(3.81389191350 + 1589.07289530000 * Tau)
      + 0.00000198883 * cos(5.33996443440 + 1066.49547720000 * Tau)
      + 0.00000197445 * cos(2.48356402050 +    3.93215326310 * Tau)
      + 0.00000155862 * cos(1.40642426470 + 1052.26838320000 * Tau)
      + 0.00000146230 * cos(3.81373196840 +  639.89728631000 * Tau)
      + 0.00000141932 * cos(1.63435169020 +  426.59819088000 * Tau)
      + 0.00000129570 * cos(5.83738872530 +  412.37109687000 * Tau)
      + 0.00000117327 * cos(1.41435462590 +  625.67019231000 * Tau)
      + 0.00000096733 * cos(4.03383427890 +  110.20632122000 * Tau)
      + 0.00000090823 * cos(1.10630629040 +   95.97922721800 * Tau)
      + 0.00000087292 * cos(2.52235174820 +  632.78373931000 * Tau)
      + 0.00000078769 * cos(4.63726131330 +  543.91805910000 * Tau)
      + 0.00000072392 * cos(2.21716670030 +  735.87651353000 * Tau)
      + 0.00000058475 * cos(0.83216317444 +  199.07200144000 * Tau)
      + 0.00000056910 * cos(3.12292059850 +  213.29909544000 * Tau)
      + 0.00000048622 * cos(1.67283791620 +  309.27832266000 * Tau)
      + 0.00000040150 * cos(4.02485444740 +   21.34064100200 * Tau)
      + 0.00000039784 * cos(0.62416945827 +  323.50541666000 * Tau)
      + 0.00000035718 * cos(2.32581247000 +  728.76296653000 * Tau)
      + 0.00000029255 * cos(3.60838327800 +   10.29494073800 * Tau)
      + 0.00000027814 * cos(3.23992013740 +  838.96928775000 * Tau)
      + 0.00000025993 * cos(4.50118298290 +  742.99006053000 * Tau)
      + 0.00000025620 * cos(2.51240623860 + 1162.47470440000 * Tau)
      + 0.00000025194 * cos(1.21868110690 + 1045.15483620000 * Tau)
      + 0.00000023591 * cos(3.00532139310 +  956.28915597000 * Tau)                  
      + 0.00000019458 * cos(4.29028644670 +  532.87235883000 * Tau)                  
      + 0.00000017660 * cos(0.80953941560 +  508.35032409000 * Tau)
      + 0.00000017058 * cos(4.20001977720 + 2118.76386040000 * Tau)       
      + 0.00000017040 * cos(1.83402146640 +  526.50957136000 * Tau)                  
      + 0.00000015355 * cos(5.81037986940 + 1596.18644230000 * Tau)                  
      + 0.00000015292 * cos(0.68174165476 +  942.06206197000 * Tau)                  
      + 0.00000014661 * cos(3.99989622590 +  117.31986822000 * Tau)       
      + 0.00000013920 * cos(5.95169568480 +  316.39186966000 * Tau)                  
      + 0.00000013639 * cos(1.80336677960 +  302.16477566000 * Tau)                  
      + 0.00000013230 * cos(2.51856643600 +   88.86568021700 * Tau)                  
      + 0.00000012756 * cos(4.36856232410 + 1169.58825140000 * Tau)       
      + 0.00000010986 * cos(4.43586634640 +  525.75881183000 * Tau)                  
      + 0.00000009681 * cos(1.71563161050 + 1581.95934830000 * Tau)
      + 0.00000009437 * cos(2.17684563460 + 1155.36115740000 * Tau)
      + 0.00000008812 * cos(3.29452783340 +  220.41264244000 * Tau)       
      + 0.00000008690 * cos(3.31924493610 +  831.85574075000 * Tau)                  
      + 0.00000007823 * cos(5.75672228350 +  846.08283475000 * Tau)                  
      + 0.00000007549 * cos(2.70955516780 +  533.62311836000 * Tau)
      + 0.00000006685 * cos(2.17560093280 + 1265.56747860000 * Tau)
      + 0.00000006285 * cos(0.49939863541 +  949.17560897000 * Tau);

  L3 := 0.00006501665 * cos(2.59862880480 +    7.11354700080 * Tau)
      + 0.00001356524 * cos(1.34635886410 +  529.69096509000 * Tau)
      + 0.00000470716 * cos(2.47503977880 +   14.22709400200 * Tau)                  
      + 0.00000416960 * cos(3.24451243210 +  536.80451210000 * Tau)                  
      + 0.00000352851 * cos(2.97360159000 +  522.57741809000 * Tau)                  
      + 0.00000154880 * cos(2.07565585820 + 1059.38193020000 * Tau)
      + 0.00000086771 * cos(2.51431584320 +  515.46387109000 * Tau)
      + 0.00000044378 * cos(0.00000000000 +    0.00000000000 * Tau)
      + 0.00000033538 * cos(3.82633794500 + 1066.49547720000 * Tau)                  
      + 0.00000028457 * cos(2.44754756060 +  206.18554844000 * Tau)                  
      + 0.00000023737 * cos(1.27667172310 +  412.37109687000 * Tau)                  
      + 0.00000022644 * cos(2.98231326770 +  543.91805910000 * Tau)       
      + 0.00000019798 * cos(2.10099934010 +  639.89728631000 * Tau)                  
      + 0.00000019740 * cos(1.40255938970 +  419.48464388000 * Tau)                  
      + 0.00000018768 * cos(1.59368403500 +  103.09277422000 * Tau)                  
      + 0.00000017033 * cos(2.30214681200 +   21.34064100200 * Tau)       
      + 0.00000016774 * cos(2.59821460670 + 1589.07289530000 * Tau)                  
      + 0.00000016214 * cos(3.14521117300 +  625.67019231000 * Tau)                  
      + 0.00000016055 * cos(3.36030126300 + 1052.26838320000 * Tau)                  
      + 0.00000013392 * cos(2.75973892200 +   95.97922721800 * Tau)
      + 0.00000013234 * cos(2.53862244340 +  199.07200144000 * Tau)                  
      + 0.00000012611 * cos(6.26578110400 +  426.59819088000 * Tau)                  
      + 0.00000008701 * cos(1.76334960740 +   10.29494073800 * Tau)       
      + 0.00000008637 * cos(2.26563256290 +  110.20632122000 * Tau)
      + 0.00000006725 * cos(3.42566433320 +  309.27832266000 * Tau)                  
      + 0.00000006527 * cos(4.03869562910 +  728.76296653000 * Tau)                  
      + 0.00000005675 * cos(2.52096417680 +  508.35032409000 * Tau)                  
      + 0.00000005399 * cos(2.91184687110 + 1045.15483620000 * Tau)
      + 0.00000005368 * cos(5.25196153540 +  323.50541666000 * Tau)                  
      + 0.00000003996 * cos(4.30290261180 +   88.86568021700 * Tau)                  
      + 0.00000003857 * cos(3.52381361550 +  302.16477566000 * Tau)                  
      + 0.00000003774 * cos(4.09125315150 +  735.87651353000 * Tau)
      + 0.00000003269 * cos(1.43175991270 +  956.28915597000 * Tau)
      + 0.00000002783 * cos(4.35817507670 + 1596.18644230000 * Tau)                  
      + 0.00000002661 * cos(1.25276590760 +  213.29909544000 * Tau)       
      + 0.00000002656 * cos(5.01505839850 +  838.96928775000 * Tau)       
      + 0.00000002553 * cos(2.23785673280 +  117.31986822000 * Tau)       
      + 0.00000002371 * cos(2.89662409240 +  742.99006053000 * Tau)
      + 0.00000002279 * cos(2.35581871230 +  942.06206197000 * Tau);

  L4 := 0.00000669483 * cos(0.85282421090 +    7.11354700080 * Tau)
      + 0.00000114019 * cos(3.14159265360 +    0.00000000000 * Tau)
      + 0.00000099961 * cos(0.74258947751 +   14.22709400200 * Tau)
      + 0.00000050024 * cos(1.65346208250 +  536.80451210000 * Tau)
      + 0.00000043585 * cos(5.82026386620 +  529.69096509000 * Tau)
      + 0.00000031813 * cos(4.85829986650 +  522.57741809000 * Tau)
      + 0.00000014742 * cos(4.29061635780 +  515.46387109000 * Tau)
      + 0.00000008899 * cos(0.71478520741 + 1059.38193020000 * Tau)
      + 0.00000004957 * cos(1.29502259430 +  543.91805910000 * Tau)
      + 0.00000004484 * cos(2.31715516630 + 1066.49547720000 * Tau)
      + 0.00000004251 * cos(0.48326797501 +   21.34064100200 * Tau)
      + 0.00000003100 * cos(3.00245542680 +  412.37109687000 * Tau)
      + 0.00000002055 * cos(0.39858940218 +  639.89728631000 * Tau)
      + 0.00000001902 * cos(4.25925620270 +  199.07200144000 * Tau)
      + 0.00000001762 * cos(4.90536207310 +  625.67019231000 * Tau)
      + 0.00000001695 * cos(4.26147580800 +  206.18554844000 * Tau)
      + 0.00000001375 * cos(5.25546955670 + 1052.26838320000 * Tau)
      + 0.00000001203 * cos(4.71614633840 +   95.97922721800 * Tau)
      + 0.00000001086 * cos(1.28604571170 + 1589.07289530000 * Tau);

  L5 := 0.00000049577 * cos(5.25658966180 +    7.11354700080 * Tau)
      + 0.00000015761 * cos(5.25126837480 +   14.22709400200 * Tau)
      + 0.00000004343 * cos(0.01461869263 +  536.80451210000 * Tau)
      + 0.00000001526 * cos(1.09739911440 +  522.57741809000 * Tau)
      + 0.00000000845 * cos(3.14159265360 +    0.00000000000 * Tau);
  Result := (L0 + L1*Tau + L2*Tau2 + L3*Tau3 + L4*Tau4 + L5*Tau5);
end;

{---------------------------------------------------------------------------}

function GetLatitude(Tau, Tau2, Tau3, Tau4, Tau5 : Double) : Double;
var
  B0, B1,
  B2, B3,
  B4, B5  : Double;
begin
  B0 := 0.02268615703 * cos(3.55852606720 +  529.69096509000 * Tau)
      + 0.00110090358 * cos(0.00000000000 +    0.00000000000 * Tau)
      + 0.00109971634 * cos(3.90809347390 + 1059.38193020000 * Tau)
      + 0.00008101427 * cos(3.60509573370 +  522.57741809000 * Tau)
      + 0.00006437782 * cos(0.30627121409 +  536.80451210000 * Tau)
      + 0.00006043996 * cos(4.25883108790 + 1589.07289530000 * Tau)
      + 0.00001106880 * cos(2.98534421930 + 1162.47470440000 * Tau)
      + 0.00000944328 * cos(1.67522288400 +  426.59819088000 * Tau)
      + 0.00000941651 * cos(2.93619072400 + 1052.26838320000 * Tau)
      + 0.00000894088 * cos(1.75447429920 +    7.11354700080 * Tau)
      + 0.00000835861 * cos(5.17881973230 +  103.09277422000 * Tau)
      + 0.00000767280 * cos(2.15473594060 +  632.78373931000 * Tau)
      + 0.00000684220 * cos(3.67808770100 +  213.29909544000 * Tau)
      + 0.00000629223 * cos(0.64343282328 + 1066.49547720000 * Tau)
      + 0.00000558524 * cos(0.01354830508 +  846.08283475000 * Tau)
      + 0.00000531670 * cos(2.70305954350 +  110.20632122000 * Tau)
      + 0.00000464449 * cos(1.17337249190 +  949.17560897000 * Tau)
      + 0.00000431072 * cos(2.60825000490 +  419.48464388000 * Tau)
      + 0.00000351433 * cos(4.61062990710 + 2118.76386040000 * Tau)
      + 0.00000132160 * cos(4.77816990670 +  742.99006053000 * Tau)
      + 0.00000123148 * cos(3.34968181380 + 1692.16566950000 * Tau)
      + 0.00000116379 * cos(1.38688232030 +  323.50541666000 * Tau)
      + 0.00000115038 * cos(5.04892295440 +  316.39186966000 * Tau)
      + 0.00000103762 * cos(3.70103838110 +  515.46387109000 * Tau)
      + 0.00000103402 * cos(2.31878999570 + 1478.86657410000 * Tau)
      + 0.00000102420 * cos(3.15293785440 + 1581.95934830000 * Tau);

  B1 := 0.00177351787 * cos(5.70166488490 +  529.69096509000 * Tau)
      + 0.00003230171 * cos(5.77941619340 + 1059.38193020000 * Tau)
      + 0.00003081364 * cos(5.47464296530 +  522.57741809000 * Tau)
      + 0.00002211914 * cos(4.73477480210 +  536.80451210000 * Tau)
      + 0.00001694232 * cos(3.14159265360 +    0.00000000000 * Tau)
      + 0.00000346445 * cos(4.74595174110 + 1052.26838320000 * Tau)
      + 0.00000234264 * cos(5.18856099930 + 1066.49547720000 * Tau)
      + 0.00000196154 * cos(6.18554286640 +    7.11354700080 * Tau)
      + 0.00000150468 * cos(3.92721226090 + 1589.07289530000 * Tau)
      + 0.00000114128 * cos(3.43897271830 +  632.78373931000 * Tau)
      + 0.00000096667 * cos(2.91426304090 +  949.17560897000 * Tau)
      + 0.00000081671 * cos(5.07666097500 + 1162.47470440000 * Tau)
      + 0.00000076599 * cos(2.50522188660 +  103.09277422000 * Tau)
      + 0.00000076572 * cos(0.61288981445 +  419.48464388000 * Tau)
      + 0.00000073875 * cos(5.49958292150 +  515.46387109000 * Tau)
      + 0.00000060544 * cos(5.44740084360 +  213.29909544000 * Tau)
      + 0.00000049915 * cos(3.94799616570 +  735.87651353000 * Tau)
      + 0.00000046032 * cos(0.53850360901 +  110.20632122000 * Tau)
      + 0.00000045123 * cos(1.89516645240 +  846.08283475000 * Tau)
      + 0.00000036561 * cos(4.69828392840 +  543.91805910000 * Tau)
      + 0.00000036019 * cos(6.10952578760 +  316.39186966000 * Tau)
      + 0.00000031975 * cos(4.92452714630 + 1581.95934830000 * Tau);

  B2 := 0.00008094051 * cos(1.46322843660 +  529.69096509000 * Tau)
      + 0.00000813244 * cos(3.14159265360 +    0.00000000000 * Tau)
      + 0.00000742415 * cos(0.95691639003 +  522.57741809000 * Tau)
      + 0.00000398951 * cos(2.89888666450 +  536.80451210000 * Tau)
      + 0.00000342226 * cos(1.44683789730 + 1059.38193020000 * Tau)
      + 0.00000073948 * cos(0.40724675866 + 1052.26838320000 * Tau)
      + 0.00000046151 * cos(3.48036895770 + 1066.49547720000 * Tau)
      + 0.00000029717 * cos(1.92504171330 + 1589.07289530000 * Tau)
      + 0.00000029314 * cos(0.99088831805 +  515.46387109000 * Tau)
      + 0.00000022753 * cos(4.27124052440 +    7.11354700080 * Tau)
      + 0.00000013916 * cos(2.92242387340 +  543.91805910000 * Tau)
      + 0.00000012067 * cos(5.22168932480 +  632.78373931000 * Tau)
      + 0.00000010703 * cos(4.88024222480 +  949.17560897000 * Tau)
      + 0.00000006078 * cos(6.21089108430 + 1045.15483620000 * Tau);

  B3 := 0.00000251624 * cos(3.38087923080 +  529.69096509000 * Tau)
      + 0.00000121738 * cos(2.73311837200 +  522.57741809000 * Tau)
      + 0.00000048694 * cos(1.03689996680 +  536.80451210000 * Tau)
      + 0.00000010988 * cos(2.31463561350 + 1052.26838320000 * Tau)
      + 0.00000008067 * cos(2.76729757620 +  515.46387109000 * Tau)
      + 0.00000007287 * cos(4.25268318970 + 1059.38193020000 * Tau)
      + 0.00000006205 * cos(1.78115827370 + 1066.49547720000 * Tau)
      + 0.00000003627 * cos(1.13028917220 +  543.91805910000 * Tau)
      + 0.00000002798 * cos(3.14159265360 +    0.00000000000 * Tau);

  B4 := 0.00000015050 * cos(4.52956999640 +  522.57741809000 * Tau)
      + 0.00000005370 * cos(4.47427159140 +  529.69096509000 * Tau)
      + 0.00000004456 * cos(5.43908581050 +  536.80451210000 * Tau)
      + 0.00000003422 * cos(0.00000000000 +    0.00000000000 * Tau)
      + 0.00000001833 * cos(4.51807036230 +  515.46387109000 * Tau)
      + 0.00000001322 * cos(4.20117611580 + 1052.26838320000 * Tau);

  B5 := 0.00000001445 * cos(0.09198554072 +  522.57741809000 * Tau);
  Result := (B0 + B1*Tau + B2*Tau2 + B3*Tau3 + B4*Tau4 + B5*Tau5);
end;

{---------------------------------------------------------------------------}

function GetRadiusVector(Tau, Tau2, Tau3, Tau4, Tau5 : Double) : Double;
var
  R0, R1,
  R2, R3,
  R4, R5  : Double;
begin
  R0 := 5.20887429470 * cos(0.00000000000 +    0.00000000000 * Tau)
      + 0.25209327020 * cos(3.49108640020 +  529.69096509000 * Tau)
      + 0.00610599902 * cos(3.84115365600 + 1059.38193020000 * Tau)
      + 0.00282029465 * cos(2.57419879930 +  632.78373931000 * Tau)
      + 0.00187647391 * cos(2.07590380080 +  522.57741809000 * Tau)
      + 0.00086792941 * cos(0.71001090609 +  419.48464388000 * Tau)
      + 0.00072062869 * cos(0.21465694745 +  536.80451210000 * Tau)
      + 0.00065517227 * cos(5.97995850840 +  316.39186966000 * Tau)
      + 0.00030135275 * cos(2.16132058450 +  949.17560897000 * Tau)
      + 0.00029134620 * cos(1.67759243710 +  103.09277422000 * Tau)
      + 0.00023947340 * cos(0.27457854894 +    7.11354700080 * Tau)
      + 0.00023453209 * cos(3.54023147300 +  735.87651353000 * Tau)
      + 0.00022283710 * cos(4.19362773550 + 1589.07289530000 * Tau)
      + 0.00013032600 * cos(2.96043055740 + 1162.47470440000 * Tau)
      + 0.00012749004 * cos(2.71550102860 + 1052.26838320000 * Tau)
      + 0.00009703346 * cos(1.90669572400 +  206.18554844000 * Tau)
      + 0.00009161431 * cos(4.41352618940 +  213.29909544000 * Tau)
      + 0.00007894539 * cos(2.47907551400 +  426.59819088000 * Tau)
      + 0.00007057978 * cos(2.18184753110 + 1265.56747860000 * Tau)
      + 0.00006137755 * cos(6.26417542510 +  846.08283475000 * Tau)                  
      + 0.00005477093 * cos(5.65729325170 +  639.89728631000 * Tau)
      + 0.00004170012 * cos(2.01605033910 +  515.46387109000 * Tau)                  
      + 0.00004136890 * cos(2.72219979680 +  625.67019231000 * Tau)                  
      + 0.00003502519 * cos(0.56531297394 + 1066.49547720000 * Tau)                  
      + 0.00002616955 * cos(2.00993967130 + 1581.95934830000 * Tau)       
      + 0.00002499966 * cos(4.55182055940 +  838.96928775000 * Tau)
      + 0.00002127644 * cos(6.12751461750 +  742.99006053000 * Tau)                  
      + 0.00001911876 * cos(0.85621927419 +  412.37109687000 * Tau)
      + 0.00001610549 * cos(3.08867789270 + 1368.66025280000 * Tau)       
      + 0.00001479484 * cos(2.68026191370 + 1478.86657410000 * Tau)                  
      + 0.00001230708 * cos(1.89042979700 +  323.50541666000 * Tau)
      + 0.00001216810 * cos(1.80171561020 +  110.20632122000 * Tau)                  
      + 0.00001014959 * cos(1.38673237670 +  454.90936653000 * Tau)
      + 0.00000998579 * cos(2.87208940110 +  309.27832266000 * Tau)
      + 0.00000961072 * cos(4.54876989810 + 2118.76386040000 * Tau)                  
      + 0.00000885708 * cos(4.14785948470 +  533.62311836000 * Tau)                  
      + 0.00000821465 * cos(1.59342534400 + 1898.35121790000 * Tau)
      + 0.00000812036 * cos(5.94091899140 +  909.81873305000 * Tau)                  
      + 0.00000776700 * cos(3.67696954690 +  728.76296653000 * Tau)                  
      + 0.00000727162 * cos(3.98824686400 + 1155.36115740000 * Tau)
      + 0.00000655289 * cos(2.79065604220 + 1685.05212250000 * Tau)
      + 0.00000653981 * cos(3.38150775270 + 1692.16566950000 * Tau)                  
      + 0.00000620798 * cos(4.82284338960 +  956.28915597000 * Tau)                  
      + 0.00000614784 * cos(2.27624915600 +  942.06206197000 * Tau)
      + 0.00000562120 * cos(0.08095987241 +  543.91805910000 * Tau)       
      + 0.00000542221 * cos(0.28360266386 +  525.75881183000 * Tau);

  R1 := 0.01271801596 * cos(2.64937511120 +  529.69096509000 * Tau)
      + 0.00061661771 * cos(3.00076251020 + 1059.38193020000 * Tau)
      + 0.00053443592 * cos(3.89717644230 +  522.57741809000 * Tau)
      + 0.00041390257 * cos(0.00000000000 +    0.00000000000 * Tau)
      + 0.00031185167 * cos(4.88276663530 +  536.80451210000 * Tau)
      + 0.00011847190 * cos(2.41329588180 +  419.48464388000 * Tau)
      + 0.00009166360 * cos(4.75979408590 +    7.11354700080 * Tau)
      + 0.00003403605 * cos(3.34688538000 + 1589.07289530000 * Tau)                  
      + 0.00003203446 * cos(5.21083285480 +  735.87651353000 * Tau)                  
      + 0.00003175763 * cos(2.79297987070 +  103.09277422000 * Tau)                  
      + 0.00002806064 * cos(3.74223693580 +  515.46387109000 * Tau)       
      + 0.00002676575 * cos(4.33052878700 + 1052.26838320000 * Tau)                  
      + 0.00002600003 * cos(3.63435101620 +  206.18554844000 * Tau)                  
      + 0.00002412207 * cos(1.46947308300 +  426.59819088000 * Tau)                  
      + 0.00002100507 * cos(3.92762682310 +  639.89728631000 * Tau)
      + 0.00001646182 * cos(5.30953510950 + 1066.49547720000 * Tau)
      + 0.00001641257 * cos(4.41628669820 +  625.67019231000 * Tau)                  
      + 0.00001049866 * cos(3.16113622960 +  213.29909544000 * Tau)
      + 0.00001024802 * cos(2.55432643020 +  412.37109687000 * Tau)
      + 0.00000806404 * cos(2.67750801380 +  632.78373931000 * Tau)                  
      + 0.00000740996 * cos(2.17094630560 + 1162.47470440000 * Tau)                  
      + 0.00000676928 * cos(6.24953479790 +  838.96928775000 * Tau)                  
      + 0.00000567076 * cos(4.57655414710 +  742.99006053000 * Tau)       
      + 0.00000484689 * cos(2.46882793190 +  949.17560897000 * Tau)                  
      + 0.00000468895 * cos(4.70973463480 +  543.91805910000 * Tau)                  
      + 0.00000444683 * cos(0.40281181402 +  323.50541666000 * Tau)                  
      + 0.00000415894 * cos(5.36836018210 +  728.76296653000 * Tau)       
      + 0.00000401738 * cos(4.60528841540 +  309.27832266000 * Tau)
      + 0.00000347378 * cos(4.68148808720 +   14.22709400200 * Tau)
      + 0.00000337555 * cos(3.16781951120 +  956.28915597000 * Tau)
      + 0.00000260753 * cos(5.34290306100 +  846.08283475000 * Tau)
      + 0.00000246603 * cos(3.92313823540 +  942.06206197000 * Tau)
      + 0.00000220084 * cos(4.84210964960 + 1368.66025280000 * Tau)
      + 0.00000203217 * cos(5.59995425430 + 1155.36115740000 * Tau)
      + 0.00000200190 * cos(4.43888814440 + 1045.15483620000 * Tau)
      + 0.00000197134 * cos(3.70551461390 + 2118.76386040000 * Tau)
      + 0.00000196005 * cos(3.75877587140 +  199.07200144000 * Tau)
      + 0.00000183504 * cos(4.26526769700 +   95.97922721800 * Tau)
      + 0.00000180134 * cos(4.40165491160 +  532.87235883000 * Tau)
      + 0.00000170225 * cos(4.84647488870 +  526.50957136000 * Tau)
      + 0.00000146335 * cos(6.12958365530 +  533.62311836000 * Tau)
      + 0.00000133483 * cos(1.32245735860 +  110.20632122000 * Tau)
      + 0.00000132076 * cos(4.51187950810 +  525.75881183000 * Tau);

  R2 := 0.00079644833 * cos(1.35865896600 +  529.69096509000 * Tau)
      + 0.00008251618 * cos(5.77773935440 +  522.57741809000 * Tau)       
      + 0.00007029864 * cos(3.27476965830 +  536.80451210000 * Tau)       
      + 0.00005314006 * cos(1.83835109710 + 1059.38193020000 * Tau)
      + 0.00001860833 * cos(2.97682139370 +    7.11354700080 * Tau)       
      + 0.00000964466 * cos(5.48031822020 +  515.46387109000 * Tau)
      + 0.00000836267 * cos(4.19889881720 +  419.48464388000 * Tau)
      + 0.00000497920 * cos(3.14159265360 +    0.00000000000 * Tau)       
      + 0.00000426570 * cos(2.22753101800 +  639.89728631000 * Tau)       
      + 0.00000406453 * cos(3.78250730350 + 1066.49547720000 * Tau)
      + 0.00000377316 * cos(2.24248352870 + 1589.07289530000 * Tau)       
      + 0.00000362943 * cos(5.36761847270 +  206.18554844000 * Tau)       
      + 0.00000342048 * cos(6.09922969320 + 1052.26838320000 * Tau)       
      + 0.00000339043 * cos(6.12690864040 +  625.67019231000 * Tau)       
      + 0.00000332578 * cos(0.00328961161 +  426.59819088000 * Tau)       
      + 0.00000279920 * cos(4.26162555830 +  412.37109687000 * Tau)       
      + 0.00000257290 * cos(0.96295364983 +  632.78373931000 * Tau)       
      + 0.00000229777 * cos(0.70530766213 +  735.87651353000 * Tau)       
      + 0.00000200783 * cos(3.06850623370 +  543.91805910000 * Tau)       
      + 0.00000199807 * cos(4.42884165320 +  103.09277422000 * Tau)       
      + 0.00000138606 * cos(2.93235671610 +   14.22709400200 * Tau)       
      + 0.00000113535 * cos(0.78713911289 +  728.76296653000 * Tau)       
      + 0.00000094565 * cos(1.70498041070 +  838.96928775000 * Tau)       
      + 0.00000086025 * cos(5.14434751990 +  323.50541666000 * Tau)
      + 0.00000083469 * cos(0.05834873484 +  309.27832266000 * Tau)
      + 0.00000080328 * cos(2.98122361800 +  742.99006053000 * Tau)
      + 0.00000075198 * cos(1.60495195910 +  956.28915597000 * Tau)
      + 0.00000070451 * cos(1.50988357480 +  213.29909544000 * Tau)
      + 0.00000066572 * cos(5.47307178080 +  199.07200144000 * Tau)
      + 0.00000061649 * cos(6.10137889850 + 1045.15483620000 * Tau)
      + 0.00000056203 * cos(0.95534810533 + 1162.47470440000 * Tau)
      + 0.00000051904 * cos(5.58435625610 +  942.06206197000 * Tau)
      + 0.00000050057 * cos(2.72063162320 +  532.87235883000 * Tau)
      + 0.00000044548 * cos(5.52445621410 +  508.35032409000 * Tau)
      + 0.00000044282 * cos(0.27118152557 +  526.50957136000 * Tau)
      + 0.00000039833 * cos(5.94566506230 +   95.97922721800 * Tau);

  R3 := 0.00003519257 * cos(6.05800633850 +  529.69096509000 * Tau)
      + 0.00001073239 * cos(1.67321345760 +  536.80451210000 * Tau)
      + 0.00000915666 * cos(1.41329676120 +  522.57741809000 * Tau)
      + 0.00000341593 * cos(0.52296542656 + 1059.38193020000 * Tau)
      + 0.00000254893 * cos(1.19625473530 +    7.11354700080 * Tau)
      + 0.00000221512 * cos(0.95225226237 +  515.46387109000 * Tau)
      + 0.00000089729 * cos(3.14159265360 +    0.00000000000 * Tau)
      + 0.00000069078 * cos(2.26885282310 + 1066.49547720000 * Tau)
      + 0.00000057827 * cos(1.41389745340 +  543.91805910000 * Tau)
      + 0.00000057653 * cos(0.52580117593 +  639.89728631000 * Tau)
      + 0.00000051079 * cos(5.98016364680 +  412.37109687000 * Tau)
      + 0.00000046935 * cos(1.57864237960 +  625.67019231000 * Tau)
      + 0.00000042824 * cos(6.11689609100 +  419.48464388000 * Tau)
      + 0.00000037477 * cos(1.18262762330 +   14.22709400200 * Tau)
      + 0.00000033816 * cos(1.66671706950 + 1052.26838320000 * Tau)
      + 0.00000033531 * cos(0.84784977903 +  206.18554844000 * Tau)
      + 0.00000031195 * cos(1.04290245900 + 1589.07289530000 * Tau)
      + 0.00000030023 * cos(4.63236245030 +  426.59819088000 * Tau)
      + 0.00000020804 * cos(2.50071243810 +  728.76296653000 * Tau)
      + 0.00000015023 * cos(0.89136998434 +  199.07200144000 * Tau)
      + 0.00000014466 * cos(0.96040197071 +  508.35032409000 * Tau)
      + 0.00000012969 * cos(1.50233788550 + 1045.15483620000 * Tau)
      + 0.00000012319 * cos(2.60952614500 +  735.87651353000 * Tau)
      + 0.00000011654 * cos(3.55513510120 +  323.50541666000 * Tau)
      + 0.00000011160 * cos(1.79041437550 +  309.27832266000 * Tau)
      + 0.00000010554 * cos(6.27845112680 +  956.28915597000 * Tau)
      + 0.00000009812 * cos(6.26016859520 +  103.09277422000 * Tau)
      + 0.00000009301 * cos(3.45126812480 +  838.96928775000 * Tau);

  R4 := 0.00000128628 * cos(0.08419309557 +  536.80451210000 * Tau)
      + 0.00000113458 * cos(4.24858855780 +  529.69096509000 * Tau)
      + 0.00000082650 * cos(3.29754909410 +  522.57741809000 * Tau)
      + 0.00000037883 * cos(2.73326611140 +  515.46387109000 * Tau)
      + 0.00000026694 * cos(5.69142588560 +    7.11354700080 * Tau)
      + 0.00000017650 * cos(5.40012536920 + 1059.38193020000 * Tau)
      + 0.00000012612 * cos(6.01560416060 +  543.91805910000 * Tau)
      + 0.00000009287 * cos(0.76813946494 + 1066.49547720000 * Tau)
      + 0.00000008107 * cos(5.68228065710 +   14.22709400200 * Tau)
      + 0.00000006978 * cos(1.42751292060 +  412.37109687000 * Tau)
      + 0.00000006271 * cos(5.12286932530 +  639.89728631000 * Tau)
      + 0.00000005377 * cos(3.33501947270 +  625.67019231000 * Tau)
      + 0.00000002911 * cos(3.40334805050 + 1052.26838320000 * Tau)
      + 0.00000002593 * cos(4.16090412980 +  728.76296653000 * Tau)
      + 0.00000002562 * cos(2.89802035070 +  426.59819088000 * Tau);

  R5 := 0.00000011188 * cos(4.75249399940 +  536.80451210000 * Tau)
      + 0.00000004255 * cos(5.91516229170 +  522.57741809000 * Tau)
      + 0.00000002079 * cos(5.56781555860 +  515.46387109000 * Tau)
      + 0.00000001908 * cos(4.29659647290 +  543.91805910000 * Tau)
  + 0.00000001875 * cos(3.69357495840 +    7.11354700080 * Tau)
      + 0.00000001612 * cos(4.13222808530 + 1059.38193020000 * Tau)
      + 0.00000001590 * cos(5.49312796170 + 1066.49547720000 * Tau);

  Result := (R0 + R1*Tau + R2*Tau2 + R3*Tau3 + R4*Tau4 + R5*Tau5);
end;

{---------------------------------------------------------------------------}

function ComputeJupiter(JD : Double) : TStEclipticalCord;
var
  Tau,
  Tau2,
  Tau3,
  Tau4,
  Tau5      : Double;
begin
  Tau  := (JD - 2451545.0) / 365250.0;
  Tau2 := sqr(Tau);
  Tau3 := Tau * Tau2;
  Tau4 := sqr(Tau2);
  Tau5 := Tau2 * Tau3;

  Result.L0 := GetLongitude(Tau, Tau2, Tau3, Tau4, Tau5);
  Result.B0 := GetLatitude(Tau, Tau2, Tau3, Tau4, Tau5);
  Result.R0 := GetRadiusVector(Tau, Tau2, Tau3, Tau4, Tau5);
end;

end.
