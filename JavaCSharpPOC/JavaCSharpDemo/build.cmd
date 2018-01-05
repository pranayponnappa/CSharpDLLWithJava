@echo off
if not exist target mkdir target
if not exist target\classes mkdir target\classes


echo compile classes
javac -nowarn -d target\classes -sourcepath jvm -cp "c:\users\pkariappa\desktop\jni4net-0.8.8.0-bin\lib\jni4net.j-0.8.8.0.jar"; "jvm\csharpcode\AddTwoNumbers.java" 
IF %ERRORLEVEL% NEQ 0 goto end


echo CSharpCode.j4n.jar 
jar cvf CSharpCode.j4n.jar  -C target\classes "csharpcode\AddTwoNumbers.class"  > nul 
IF %ERRORLEVEL% NEQ 0 goto end


echo CSharpCode.j4n.dll 
csc /nologo /warn:0 /t:library /out:CSharpCode.j4n.dll /recurse:clr\*.cs  /reference:"C:\Users\pkariappa\Desktop\JavaCSharpPOC\CSharpCode\AddTwoNumbers\CSharpCode\bin\Debug\CSharpCode.dll" /reference:"C:\Users\pkariappa\Desktop\jni4net-0.8.8.0-bin\lib\jni4net.n-0.8.8.0.dll"
IF %ERRORLEVEL% NEQ 0 goto end


:end
