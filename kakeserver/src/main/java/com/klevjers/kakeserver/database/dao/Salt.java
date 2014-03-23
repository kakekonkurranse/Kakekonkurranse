package com.klevjers.kakeserver.database.dao;

public class Salt {
	
	final byte[] salt;
	final long validto;

	public Salt(byte[] salt, long validto) {
		this.salt = salt;
		this.validto = validto;
	}
}
