<HTML>
<HEAD>
<TITLE>Skjuta Kanin</TITLE>
<!-- #include file="kanin.css" -->
<SCRIPT LANGUAGE="JavaScript">
farSkjuta = 1
nr = 0
kaniner = 0
function playSound(fil) {
ljud.src = fil
}
function starta() {
kaninbg.style.visibility = 'visible';
omladd.style.visibility = 'visible';
tid.style.visibility = 'visible';
visaPatroner();
tagTid();
visaKaniner();
}
function visaPatroner() {
p1.style.visibility = 'visible';
p2.style.visibility = 'visible';
p3.style.visibility = 'visible';
p4.style.visibility = 'visible';
p5.style.visibility = 'visible';
p6.style.visibility = 'visible';
patroner = 6
}
function gomPatron() {
gom = "p" + patroner +".style.visibility = 'hidden';"
eval(gom)
patroner = patroner - 1
}
function tagTid() {
if (nr < 99) {
eval("s" + nr + ".className='tdColorOn'");
nr = nr + 1
setTimeout("tagTid();", 1000)
}
else {
eval("s" + nr + ".className='tdColorOn'");
slut();
}
}
function visaKaniner() {
vilken = Math.random() * 60;
vilken = Math.round(vilken);
igen = Math.random() * 3000;
igen = Math.round(igen);
if (vilken < 10) {
stubbkanin.style.visibility = 'visible';
tabort = Math.random() * 600;
tabort = Math.round(tabort) + 400;
gommig = "stubbkanin.style.visibility = 'hidden';";
setTimeout("eval(gommig);", tabort);
}
else if (vilken >= 10 & vilken < 20) {
framkaninv.style.visibility = 'visible';
tabort = Math.random() * 1000;
tabort = Math.round(tabort) + 500;
gommig = "framkaninv.style.visibility = 'hidden';";
setTimeout("eval(gommig);", tabort);
}
else if (vilken >= 20 & vilken < 30) {
framkaninh.style.visibility = 'visible';
tabort = Math.random() * 1000;
tabort = Math.round(tabort) + 500;
gommig = "framkaninh.style.visibility = 'hidden';";
setTimeout("eval(gommig);", tabort);
}
else if (vilken >=30 & vilken < 40) {
mellankaninv.style.visibility = 'visible';
tabort = Math.random() * 600;
tabort = Math.round(tabort) + 400;
gommig = "mellankaninv.style.visibility = 'hidden';";
setTimeout("eval(gommig);", tabort);
}
else if (vilken >=40 & vilken < 50) {
mellankaninh.style.visibility = 'visible';
tabort = Math.random() * 600;
tabort = Math.round(tabort) + 400;
gommig = "mellankaninh.style.visibility = 'hidden';";
setTimeout("eval(gommig);", tabort);
}
else if (vilken >=50 & vilken <= 60) {
bakkanin.style.visibility = 'visible';
tabort = Math.random() * 1100;
tabort = Math.round(tabort) + 400;
gommig = "bakkanin.style.visibility = 'hidden';";
setTimeout("eval(gommig);", tabort);
}
setTimeout("visaKaniner();", igen);
}
function skjutInte() {
farSkjuta = 0;
setTimeout("eval(farSkjuta = 1);", 800);
}
function traff(kanin) {
if (farSkjuta == 1 & patroner > 0) {
skjutInte();
gom = kanin +".style.visibility = 'hidden';"
eval(gom);
blod1.style.left = event.x - 50 + 'px';
blod1.style.top = event.y - 50 + 'px';
blod2.style.left = event.x - 50 + 'px';
blod2.style.top = event.y - 50 + 'px';
blod3.style.left = event.x - 50 + 'px';
blod3.style.top = event.y - 50 + 'px';
ShowBlod1 = "blod1.style.visibility = 'visible';"
HideBlod1 = "blod1.style.visibility = 'hidden';"
ShowBlod2 = "blod2.style.visibility = 'visible';"
HideBlod2 = "blod2.style.visibility = 'hidden';"
ShowBlod3 = "blod3.style.visibility = 'visible';"
HideBlod3 = "blod3.style.visibility = 'hidden';"
eval(ShowBlod1);
setTimeout("eval(HideBlod1);", 100);
setTimeout("eval(ShowBlod2);", 100);
setTimeout("eval(HideBlod2);", 200);
setTimeout("eval(ShowBlod3);", 200);
setTimeout("eval(HideBlod3);", 300);
playSound('traff.wav');
gomPatron();
kaniner = kaniner + 1
}
else if (farSkjuta == 1 & patroner == 0) {
playSound('click.wav');
}
}
function slut() {
omladd.style.visibility = 'hidden';
tid.style.visibility = 'hidden';
resultat.style.visibility = 'visible';
skickaruta.style.visibility = 'visible';
document.forms[0].elements[1].value = kaniner;
}
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript" event=onmousedown for=startkanin>
startkanin.style.visibility = 'hidden';
blod1.style.left = event.x - 50 + 'px';
blod1.style.top = event.y - 50 + 'px';
blod2.style.left = event.x - 50 + 'px';
blod2.style.top = event.y - 50 + 'px';
blod3.style.left = event.x - 50 + 'px';
blod3.style.top = event.y - 50 + 'px';
ShowBlod1 = "blod1.style.visibility = 'visible';"
HideBlod1 = "blod1.style.visibility = 'hidden';"
ShowBlod2 = "blod2.style.visibility = 'visible';"
HideBlod2 = "blod2.style.visibility = 'hidden';"
ShowBlod3 = "blod3.style.visibility = 'visible';"
HideBlod3 = "blod3.style.visibility = 'hidden';"
eval(ShowBlod1);
setTimeout("eval(HideBlod1);", 100);
setTimeout("eval(ShowBlod2);", 100);
setTimeout("eval(HideBlod2);", 200);
setTimeout("eval(ShowBlod3);", 200);
setTimeout("eval(HideBlod3);", 300);
playSound('traff.wav');
setTimeout("starta();", 500);
skjutInte();
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript" event=onmousedown for=stubbkanin>
traff('stubbkanin');
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript" event=onmousedown for=framkaninv>
traff('framkaninv');
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript" event=onmousedown for=framkaninh>
traff('framkaninh');
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript" event=onmousedown for=mellankaninv>
traff('mellankaninv');
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript" event=onmousedown for=mellankaninh>
traff('mellankaninh');
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript" event=onmousedown for=bakkanin>
traff('bakkanin');
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript" event=onmousedown for=kaninbg>
if (farSkjuta == 1 & patroner > 0) {
playSound('miss.wav');
skjutInte();
gomPatron();
}
else if (farSkjuta == 1 & patroner <= 0) {
playSound('click.wav');
}
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript" event=onmousedown for=omladd>
if (farSkjuta == '1') {
playSound('ladda.wav');
skjutInte();
setTimeout("visaPatroner();", 800);
}
</SCRIPT>
</HEAD>
<BODY onLoad="if(document.all){startkanin.style.visibility = 'visible';}">
<BGSOUND ID="ljud">
<BGSOUND SRC="traff.wav" VOLUME="-10000" LOOP=1>
<BGSOUND SRC="miss.wav" VOLUME="-10000" LOOP=1>
<BGSOUND SRC="ladda.wav" VOLUME="-10000" LOOP=1>
<BGSOUND SRC="click.wav" VOLUME="-10000" LOOP=1>
<TABLE ID="tabellen" BORDER=1 BORDERCOLOR="#FFFFFF" CELLSPACING=0 CELLPADDING=10 STYLE="position:absolute;top:0px;left:0px;Width:502px;Height:502px;Cursor:crosshair">
<TR><TD VALIGN=top STYLE="Text-align:left;Z-index:0">
<FONT STYLE="Font-size:12px;Font-weight:Bold"><CENTER>Du ska nu få jaga kanin en härlig höstdag.</CENTER></FONT>
<BR>Ditt vapen är en grovkalibrig älgstudsare vars magasin rymmer 6 patroner.
<BR>Du kan skjuta en gång i sekunden, återstående skott ser du nere i det högra hörnet.
När Magasinet är tomt så laddar du om genom att trycka på "Ladda Om"-knappen.
<BR>Tiden är 100 sekunder och målet är såklart att skjuta så många kaniner som möjligt.
Hur mycket tid som har gått ser du längst ner.
<BR>Är du en duktig skytt så kanske du kommer med på High-Score listan.
<BR><BR><B><CENTER>Skjut ihjäl den här kaninen för att börja.<BR>OBS! Den syns inte förrens alla filer är laddade!</B></CENTER>
</TD></TR>
</TABLE>
<TABLE ID="omladd" BORDER=1 CELLPADDING=0 CELLSPACING=0 BORDERCOLOR="#FFFFFF" STYLE="visibility:hidden;position:absolute;top:501;left:0;Cursor:crosshair;Z-index:1">
<TR><TD WIDTH=500 HEIGHT=15 onMouseOver="this.className='tdColorOn'" onMouseOut="this.className='tdColorOff'">
- Ladda Om -
</TD></TR>
</TABLE>
<TABLE ID="tid" BORDER=1 CELLPADDING=0 CELLSPACING=0 BORDERCOLOR="#FFFFFF" STYLE="visibility:hidden;position:absolute;top:516;left:0;Cursor:crosshair;Z-index:0">
<TR><TD HEIGHT=0 WIDTH=500 COLSPAN=100></TD></TR>
<TR HEIGHT=15><TD ID="s0"></TD><TD ID="s1"></TD><TD ID="s2"></TD><TD ID="s3"></TD><TD ID="s4"></TD><TD ID="s5"></TD><TD ID="s6"></TD><TD ID="s7"></TD><TD ID="s8"></TD><TD ID="s9"></TD><TD ID="s10"></TD><TD ID="s11"></TD><TD ID="s12"></TD><TD ID="s13"></TD><TD ID="s14"></TD><TD ID="s15"></TD><TD ID="s16"></TD><TD ID="s17"></TD><TD ID="s18"></TD><TD ID="s19"></TD><TD ID="s20"></TD><TD ID="s21"></TD><TD ID="s22"></TD><TD ID="s23"></TD><TD ID="s24"></TD><TD ID="s25"></TD><TD ID="s26"></TD><TD ID="s27"></TD><TD ID="s28"></TD><TD ID="s29"></TD><TD ID="s30"></TD><TD ID="s31"></TD><TD ID="s32"></TD><TD ID="s33"></TD><TD ID="s34"></TD><TD ID="s35"></TD><TD ID="s36"></TD><TD ID="s37"></TD><TD ID="s38"></TD><TD ID="s39"></TD><TD ID="s40"></TD><TD ID="s41"></TD><TD ID="s42"></TD><TD ID="s43"></TD><TD ID="s44"></TD><TD ID="s45"></TD><TD ID="s46"></TD><TD ID="s47"></TD><TD ID="s48"></TD><TD ID="s49"></TD><TD ID="s50"></TD><TD ID="s51"></TD><TD ID="s52"></TD><TD ID="s53"></TD><TD ID="s54"></TD><TD ID="s55"></TD><TD ID="s56"></TD><TD ID="s57"></TD><TD ID="s58"></TD><TD ID="s59"></TD><TD ID="s60"></TD><TD ID="s61"></TD><TD ID="s62"></TD><TD ID="s63"></TD><TD ID="s64"></TD><TD ID="s65"></TD><TD ID="s66"></TD><TD ID="s67"></TD><TD ID="s68"></TD><TD ID="s69"></TD><TD ID="s70"></TD><TD ID="s71"></TD><TD ID="s72"></TD><TD ID="s73"></TD><TD ID="s74"></TD><TD ID="s75"></TD><TD ID="s76"></TD><TD ID="s77"></TD><TD ID="s78"></TD><TD ID="s79"></TD><TD ID="s80"></TD><TD ID="s81"></TD><TD ID="s82"></TD><TD ID="s83"></TD><TD ID="s84"></TD><TD ID="s85"></TD><TD ID="s86"></TD><TD ID="s87"></TD><TD ID="s88"></TD><TD ID="s89"></TD><TD ID="s90"></TD><TD ID="s91"></TD><TD ID="s92"></TD><TD ID="s93"></TD><TD ID="s94"></TD><TD ID="s95"></TD><TD ID="s96"></TD><TD ID="s97"></TD><TD ID="s98"></TD><TD ID="s99"></TD></TR>
</TABLE>
<IMG SRC="startkanin.gif" ID="startkanin" STYLE="visibility:hidden;position:absolute;left:145px;top:160px;Z-index:1">
<IMG SRC="kaninbg.gif" ID="kaninbg" STYLE="visibility:hidden;position:absolute;top:1px;left:1px;Z-index:1">
<IMG SRC="stubbkanin.gif" ID="stubbkanin" STYLE="visibility:hidden;position:absolute;left:115px;top:330px;Z-index:2">
<IMG SRC="bakkanin.gif" ID="bakkanin" STYLE="visibility:hidden;position:absolute;left:220px;top:167px;Z-index:3">
<IMG SRC="mellankaninv.gif" ID="mellankaninv" STYLE="visibility:hidden;position:absolute;left:29px;top:255px;Z-index:2">
<IMG SRC="mellankaninh.gif" ID="mellankaninh" STYLE="visibility:hidden;position:absolute;left:110px;top:240px;Z-index:2">
<IMG SRC="framkaninv.gif" ID="framkaninv" STYLE="visibility:hidden;position:absolute;left:263px;top:342px;Z-index:2">
<IMG SRC="framkaninh.gif" ID="framkaninh" STYLE="visibility:hidden;position:absolute;left:373px;top:310px;Z-index:2">
<IMG SRC="patron.gif" ID="p6" STYLE="visibility:hidden;position:absolute;top:441;left:421;z-index:4">
<IMG SRC="patron.gif" ID="p5" STYLE="visibility:hidden;position:absolute;top:441;left:433;z-index:4">
<IMG SRC="patron.gif" ID="p4" STYLE="visibility:hidden;position:absolute;top:441;left:445;z-index:4">
<IMG SRC="patron.gif" ID="p3" STYLE="visibility:hidden;position:absolute;top:441;left:457;z-index:4">
<IMG SRC="patron.gif" ID="p2" STYLE="visibility:hidden;position:absolute;top:441;left:469;z-index:4">
<IMG SRC="patron.gif" ID="p1" STYLE="visibility:hidden;position:absolute;top:441;left:481;z-index:4">
<IMG SRC="blod1.gif" ID="blod1" STYLE="visibility:hidden;position:absolute;top:0px;left:0px;Z-index:3">
<IMG SRC="blod2.gif" ID="blod2" STYLE="visibility:hidden;position:absolute;top:0px;left:0px;Z-index:3">
<IMG SRC="blod3.gif" ID="blod3" STYLE="visibility:hidden;position:absolute;top:0px;left:0px;Z-index:3">
<TABLE ID="resultat" BORDER=1 BORDERCOLOR="#FFFFFF" CELLSPACING=0 CELLPADDING=10 STYLE="visibility:hidden;position:absolute;top:0px;left:0px;Width:502px;Height:502px;z-index:5;Cursor:crosshair">
<TR><TD VALIGN=top STYLE="Text-align:left">
<CENTER>
<FONT STYLE="Font-size:12px;Font-weight:Bold"><CENTER>Resultat</CENTER></FONT>
<CENTER>
<BR>Hur står du dig i konkurensen?
<BR>Skriv in ditt namn och se om
<BR>du kom med på High-Score listan.
<FORM METHOD="post" ACTION="resultat.asp">
<INPUT TYPE="text" NAME=namn STYLE="Font-family:Verdana;Font-size:10px;Background:#204080;Color:#FFFFFF;Text-align:center" SIZE=30 MAXLENGTH=30 NAME="langd" VALUE="Ditt för- och efternamn">
<TABLE ID="skickaruta" BORDER=1 CELLPADDING=0 CELLSPACING=0 BORDERCOLOR="#FFFFFF" STYLE="visibility:hidden;position:absolute;left:166;top:130;z-index:6">
<TR><TD WIDTH=164 HEIGHT=15 STYLE="Background:#204060" onMouseOver="skickaruta2.style.visibility = 'visible'">
- Registrera kaniner -
</TABLE>
<TABLE BORDER=1 ID="skickaruta2" CELLPADDING=0 CELLSPACING=0 BORDERCOLOR="#FFFFFF" STYLE="visibility:hidden;position:absolute;left:166;top:130;z-index:7">
<TR><TD WIDTH=164 HEIGHT=15 STYLE="Background:#204080" onMouseOut="skickaruta2.style.visibility = 'hidden'" onClick="document.forms[0].submit();">
- Registrera kaniner -
</TABLE>
<BR>
<INPUT TYPE="text" NAME=antal STYLE="visibility:hidden">
</FORM>
</CENTER>
</TD></TR>
</TABLE>
</BODY>
</HTML>