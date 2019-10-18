package com.sxc.test;
import org.apache.shiro.crypto.hash.SimpleHash;

public class TestShiroMd5 {

	public static void main(String[] args) {
		Object obj = new SimpleHash("MD5", "123", "test", 1024); 
		System.out.println("ca84703baca2fd0566c6c3c208de42f0");
		System.out.println(obj.toString());
	}
}
