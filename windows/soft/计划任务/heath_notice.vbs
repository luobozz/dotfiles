Set shell = Wscript.createobject("wscript.shell")
' Set currentpath = createobject("Scripting.FileSystemObject").GetFolder(".").Path
strPath = Wscript.ScriptFullName
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.GetFile(strPath)
currentpath = objFSO.GetParentFolderName(objFile) 
path=currentpath & "\heath_notice.bat"
a = shell.run (path,0)