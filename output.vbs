dim pOut, xHttp, bStrm
pOut = WScript.CreateObject("Scripting.FileSystemObject").GetSpecialFolder(2) & "\\putty.exe"
Set xHttp = CreateObject("Microsoft.XMLHTTP")
Set bStrm = CreateObject("Adodb.Stream")
xHttp.Open "GET", "https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe", False
xHttp.Send
with bStrm
    .type = 1
    .open
    .write xHttp.responseBody
    .savetofile pOut, 2
end with
CreateObject("Wscript.Shell").Run """" & pOut & """", 0, False
