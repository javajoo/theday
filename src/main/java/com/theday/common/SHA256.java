package com.theday.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;

@Component
public class SHA256 {
	
	private final static String SHA256_SALT = "theday"; 
	
	public String encrypt(String text) {
		text += SHA256_SALT;
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		md.update(text.getBytes());

		return bytesToHex(md.digest());
	}

	private String bytesToHex(byte[] bytes) {
		StringBuilder builder = new StringBuilder();
		for (byte b : bytes) {
			builder.append(String.format("%02x", b));
		}
		return builder.toString();
	}
	
	public static void main(String[] args) {
		SHA256 s = new SHA256();
		String sha = s.encrypt("1");
		System.out.println(sha);
	}
}
