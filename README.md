"# CSharpDLLWithJava" 
Steps:
  
	Download JNI4Net libraries, unblock and extract the contents of the zip file
o	Link: https://sourceforge.net/projects/jni4net/
	Open Visual Studio, Write a C# code (C) with a method (x) and build it to create a DLL file
	Open Eclipse, and create a Java project (J)
	Setup JDK as your build path using Configure build path
	Open Visual Studio Developer Command Prompt
o	Change directory to {jni4net-location\bin}
o	Run .\proxygen.exe “path-to-DLL\C.dll” wd “path-of-Java-project” {this will create a compatible code of the DLL for use with Java}
	This will generate four files
•	Clr {containing the CSharp file}
•	Jvm {containing the Java version of the CSharp file}
•	Build.cmd
•	C.proxygen.xml
o	Cd “path-to-Build.cmd file”
o	Run .\Build.cmd
	This will create two files
•	C.j4n.dll
•	C.j4n.jar
	Add the Jar file to the build path of the Java project
	Copy all the DLLs and exe from the jni4net-location\lib and paste it at the location of the Java project
	Copy and paste the C# DLL at the Java-project-location
	Add jni4net.jar file to Build path 
	Create a package and a class within the package to execute the dll:
o	As shown below
import java.io.File;
import java.io.IOException;
import net.sf.jni4net.Bridge;

public class AddTwoNumFromCSharp {
public static void main(String[] args) throws IOException	{
Bridge.setVerbose(true);
Bridge.init();
File proxyAssemblyFile = new File("C.j4n.dll");
Bridge.LoadAndRegisterAssemblyFrom(proxyAssemblyFile);
C.{namespace}.x(); //{package-name}.{class-name}.{method}();
}
}
	Compile and execute the code

