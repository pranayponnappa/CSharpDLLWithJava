package com.jniexample;

import java.io.File;
import java.io.IOException;

import net.sf.jni4net.Bridge;

public class AddTwoNumFromCSharp {
	
	public static void main(String[] args) throws IOException	{
		
		Bridge.setVerbose(true);
		Bridge.init();
		File proxyAssemblyFile = new File("CSharpCode.j4n.dll");
		Bridge.LoadAndRegisterAssemblyFrom(proxyAssemblyFile);
		csharpcode.AddTwoNumbers.AddTwoNumbers2And3();
	}

}
