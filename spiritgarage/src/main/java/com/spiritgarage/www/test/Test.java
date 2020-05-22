package com.spiritgarage.www.test;

import java.util.UUID;

import com.spiritgarage.www.util.SHA256;

public class Test {

	public static void main(String[] args) {
		
		String key = SHA256.generateKey();
		
		String en = SHA256.getEncrypt("spirit13579", key);
		
		System.out.println(UUID.randomUUID().toString());
		System.out.println(key);
		System.out.println(en);
		
	}
	
}
