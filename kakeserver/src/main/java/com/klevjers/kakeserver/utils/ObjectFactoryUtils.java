package com.klevjers.kakeserver.utils;

import no.finstadlille.kakekonkurranse.ObjectFactory;

public class ObjectFactoryUtils {

	private static final ObjectFactory OFI = new ObjectFactory();

	public static final ObjectFactory instance() {
		return OFI;
	}

}
