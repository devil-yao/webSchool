package com.dwh.tech.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

import org.junit.Test;

public class HtmlTest {

	@Test
	public void decore(){
		StringBuffer str = new StringBuffer();
		try {
			BufferedReader buff = new BufferedReader(new FileReader(new File("G:/11.txt")));
			String get = buff.readLine();
			while(get != null){
			str.append(get);
			get = buff.readLine();
			}
			String ss = str.toString().replaceAll("\"", "'").replaceAll("\r", "").replaceAll("\n", "").replaceAll(">\t", ">");
			while(ss.contains(">\t")){
				ss = ss.replaceAll(">\t", ">");
			}
			System.out.println(ss);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
