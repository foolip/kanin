<% Response.Expires = 0 %>
<HTML>
<HEAD>
<TITLE>Skjuta Kanin High Scores</TITLE>
<!-- #include file="kanin.css" -->
<%
Dim namn, antal, skytttar, totalt, F, T, C, O, post1, post2, post3, post4, post5, post6, post7, post8, post9, post0, plac
fil = Server.MapPath("/phulip/kanin/high.cnt")
namn = Request.Form("namn")
If namn = "" Then
namn = "Okänd"
ElseIf namn = "Ditt för- och efternamn" Then
namn = "Okänd"
End If
antal = Request.Form("antal")
Set F = CreateObject("Scripting.FileSystemObject")
Set T = F.OpenTextFile(fil)
skyttar = T.ReadLine
total = T.ReadLine
post1 = Array(T.ReadLine, T.ReadLine)
post2 = Array(T.ReadLine, T.ReadLine)
post3 = Array(T.ReadLine, T.ReadLine)
post4 = Array(T.ReadLine, T.ReadLine)
post5 = Array(T.ReadLine, T.ReadLine)
post6 = Array(T.ReadLine, T.ReadLine)
post7 = Array(T.ReadLine, T.ReadLine)
post8 = Array(T.ReadLine, T.ReadLine)
post9 = Array(T.ReadLine, T.ReadLine)
post0 = Array(T.ReadLine, T.ReadLine)
T.Close
skyttar = skyttar + 1
total = total * 1
total = total + antal
snitt = Round(total / skyttar)
If antal > post1(1) Then
post0(0) = post9(0)
post0(1) = post9(1)
post9(0) = post8(0)
post9(1) = post8(1)
post8(0) = post7(0)
post8(1) = post7(1)
post7(0) = post6(0)
post7(1) = post6(1)
post6(0) = post5(0)
post6(1) = post5(1)
post5(0) = post4(0)
post5(1) = post4(1)
post4(0) = post3(0)
post4(1) = post3(1)
post3(0) = post2(0)
post3(1) = post2(1)
post2(0) = post1(0)
post2(1) = post1(1)
post1(0) = namn
post1(1) = antal
plac = "Du är den bästa kaninjägaren genom tiderna!"
Else
If antal > post2(1) Then
post0(0) = post9(0)
post0(1) = post9(1)
post9(0) = post8(0)
post9(1) = post8(1)
post8(0) = post7(0)
post8(1) = post7(1)
post7(0) = post6(0)
post7(1) = post6(1)
post6(0) = post5(0)
post6(1) = post5(1)
post5(0) = post4(0)
post5(1) = post4(1)
post4(0) = post3(0)
post4(1) = post3(1)
post3(0) = post2(0)
post3(1) = post2(1)
post2(0) = namn
post2(1) = antal
plac = "Du är den näst bästa kaninjägaren genom tiderna!"
Else
If antal > post3(1) Then
post0(0) = post9(0)
post0(1) = post9(1)
post9(0) = post8(0)
post9(1) = post8(1)
post8(0) = post7(0)
post8(1) = post7(1)
post7(0) = post6(0)
post7(1) = post6(1)
post6(0) = post5(0)
post6(1) = post5(1)
post5(0) = post4(0)
post5(1) = post4(1)
post4(0) = post3(0)
post4(1) = post3(1)
post3(0) = namn
post3(1) = antal
plac = "Du är den tredje bästa kaninjägaren genom tiderna!"
Else
If antal > post4(1) Then
post0(0) = post9(0)
post0(1) = post9(1)
post9(0) = post8(0)
post9(1) = post8(1)
post8(0) = post7(0)
post8(1) = post7(1)
post7(0) = post6(0)
post7(1) = post6(1)
post6(0) = post5(0)
post6(1) = post5(1)
post5(0) = post4(0)
post5(1) = post4(1)
post4(0) = namn
post4(1) = antal
plac = "Du är den fjärde bästa kaninjägaren genom tiderna!"
Else
If antal > post5(1) Then
post0(0) = post9(0)
post0(1) = post9(1)
post9(0) = post8(0)
post9(1) = post8(1)
post8(0) = post7(0)
post8(1) = post7(1)
post7(0) = post6(0)
post7(1) = post6(1)
post6(0) = post5(0)
post6(1) = post5(1)
post5(0) = namn
post5(1) = antal
plac = "Du är den femte bästa kaninjägaren genom tiderna!"
Else
If antal > post6(1) Then
post0(0) = post9(0)
post0(1) = post9(1)
post9(0) = post8(0)
post9(1) = post8(1)
post8(0) = post7(0)
post8(1) = post7(1)
post7(0) = post6(0)
post7(1) = post6(1)
post6(0) = namn
post6(1) = antal
plac = "Du är den sjätte bästa kaninjägaren genom tiderna!"
Else
If antal > post7(1) Then
post0(0) = post9(0)
post0(1) = post9(1)
post9(0) = post8(0)
post9(1) = post8(1)
post8(0) = post7(0)
post8(1) = post7(1)
post7(0) = namn
post7(1) = antal
plac = "Du är den sjunde bästa kaninjägaren genom tiderna!"
Else
If antal > post8(1) Then
post0(0) = post9(0)
post0(1) = post9(1)
post9(0) = post8(0)
post9(1) = post8(1)
post8(0) = namn
post8(1) = antal
plac = "Du är den åttonde bästa kaninjägaren genom tiderna!"
Else
If antal > post9(1) Then
post0(0) = post9(0)
post0(1) = post9(1)
post9(0) = namn
post9(1) = antal
plac = "Du är den nionde bästa kaninjägaren genom tiderna!"
Else
If antal > post0(1) Then
post0(0) = namn
post0(1) = antal
plac = "Du är den tionde bästa kaninjägaren genom tiderna!"
Else
plac = "Dessvärre kom du inte med på High-Score listan."
End If
End If
End If
End If
End If
End If
End If
End If
End If
End If
Set C = CreateObject("Scripting.FileSystemObject")
Set O = C.CreateTextFile(fil)
O.WriteLine skyttar
O.WriteLine total
O.WriteLine post1(0)
O.WriteLine post1(1)
O.WriteLine post2(0)
O.WriteLine post2(1)
O.WriteLine post3(0)
O.WriteLine post3(1)
O.WriteLine post4(0)
O.WriteLine post4(1)
O.WriteLine post5(0)
O.WriteLine post5(1)
O.WriteLine post6(0)
O.WriteLine post6(1)
O.WriteLine post7(0)
O.WriteLine post7(1)
O.WriteLine post8(0)
O.WriteLine post8(1)
O.WriteLine post9(0)
O.WriteLine post9(1)
O.WriteLine post0(0)
O.WriteLine post0(1)
O.Close
%>
<SCRIPT LANGUAGE="JavaScript">
function nyttSpel() {
window.open("kanin.asp", "<% =(Hour(Now) + Minute(Now) + Second(Now)) %>", "width=503,height=535,resizable=0,status=1,toolbar=0,menubar=0,scrollbars=0");
parent.close();
}
</SCRIPT>
</HEAD>
<BODY>
<TABLE BORDER=1 BORDERCOLOR="#FFFFFF" CELLSPACING=0 CELLPADDING=10 STYLE="position:absolute;top:0px;left:0px;Width:502px;Height:502px;Cursor:crosshair">
<TR><TD VALIGN=top STYLE="Text-align:left;Z-index:0">
<FONT STYLE="Font-size:12px;Font-weight:Bold"><CENTER>High-Scores</CENTER></FONT>
<CENTER>
<BR><B>Du sköt <% =antal %> kaniner, medel är <% =snitt %> st.
<BR>Hittills har <% =total %> kaniner skjutits av <% =skyttar %> jägare.</B>
<BR><BR>
<TABLE BORDER=1 CELLPADDING=5 CELLSPACING=0 BORDERCOLOR="#FFFFFF" STYLE="width:400;height:200">
<TR><TD STYLE="Background:#204060;text-align:left"><B>Jägare:</B></TD><TD STYLE="Background:#204060;text-align:right"><B>Kaniner:</B></TD></TR>
<TR><TD STYLE="Background:#204060;text-align:left"><% =post1(0) %></TD><TD STYLE="Background:#204060;text-align:right"><% =post1(1) %></TD></TR>
<TR><TD STYLE="Background:#204060;text-align:left"><% =post2(0) %></TD><TD STYLE="Background:#204060;text-align:right"><% =post2(1) %></TD></TR>
<TR><TD STYLE="Background:#204060;text-align:left"><% =post3(0) %></TD><TD STYLE="Background:#204060;text-align:right"><% =post3(1) %></TD></TR>
<TR><TD STYLE="Background:#204060;text-align:left"><% =post4(0) %></TD><TD STYLE="Background:#204060;text-align:right"><% =post4(1) %></TD></TR>
<TR><TD STYLE="Background:#204060;text-align:left"><% =post5(0) %></TD><TD STYLE="Background:#204060;text-align:right"><% =post5(1) %></TD></TR>
<TR><TD STYLE="Background:#204060;text-align:left"><% =post6(0) %></TD><TD STYLE="Background:#204060;text-align:right"><% =post6(1) %></TD></TR>
<TR><TD STYLE="Background:#204060;text-align:left"><% =post7(0) %></TD><TD STYLE="Background:#204060;text-align:right"><% =post7(1) %></TD></TR>
<TR><TD STYLE="Background:#204060;text-align:left"><% =post8(0) %></TD><TD STYLE="Background:#204060;text-align:right"><% =post8(1) %></TD></TR>
<TR><TD STYLE="Background:#204060;text-align:left"><% =post9(0) %></TD><TD STYLE="Background:#204060;text-align:right"><% =post9(1) %></TD></TR>
<TR><TD STYLE="Background:#204060;text-align:left"><% =post0(0) %></TD><TD STYLE="Background:#204060;text-align:right"><% =post0(1) %></TD></TR>
</TABLE>
<BR><% =plac %>
<BR><IMG SRC="slutkanin.gif" onClick="">
</CENTER>
</TD></TR>
</TABLE>
</BODY>
<TABLE  BORDER=1 CELLPADDING=0 CELLSPACING=0 BORDERCOLOR="#FFFFFF" STYLE="visibility:visible;position:absolute;top:501;left:0;Cursor:crosshair;Z-index:1">
<TR><TD WIDTH=500 HEIGHT=15 onMouseOver="this.className='tdColorOn'" onMouseOut="this.className='tdColorOff'" onClick="nyttSpel();">
- Spela Igen -
</TD></TR>
</TABLE>
<TABLE BORDER=1 CELLPADDING=0 CELLSPACING=0 BORDERCOLOR="#FFFFFF" STYLE="visibility:visible;position:absolute;top:517;left:0;Cursor:crosshair;Z-index:1">
<TR><TD WIDTH=500 HEIGHT=15 onMouseOver="this.className='tdColorOn'" onMouseOut="this.className='tdColorOff'" onClick="parent.close();">
- Avsluta -
</TD></TR>
</TABLE>
</HTML>