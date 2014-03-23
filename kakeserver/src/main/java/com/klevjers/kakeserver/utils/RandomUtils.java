package com.klevjers.kakeserver.utils;

import com.sun.org.apache.xml.internal.security.utils.Base64;

import sun.security.provider.SecureRandom;

public class RandomUtils {
	
	private static final int SZ_SALT = 32;
	private static final SecureRandom RND = new SecureRandom();

	public static String generateSalt() {
		
		byte[] saltbytes = RND.engineGenerateSeed(SZ_SALT);
		return "CryptoJS.enc.Base64.parse('" + Base64.encode(saltbytes) + "')";
	}
	
}
