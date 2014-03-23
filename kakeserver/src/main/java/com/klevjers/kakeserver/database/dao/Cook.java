package com.klevjers.kakeserver.database.dao;

import static com.klevjers.kakeserver.utils.ObjectFactoryUtils.instance;
import no.finstadlille.kakekonkurranse.Baker;

public class Cook {

	
	public static Baker getBakerFromDB() {
		
		String fn = null;
		String ln = null;
		String picturedataURI = null;
		Baker retval = instance().createBaker();
		retval.setFirstname(fn);
		retval.setFirstname(ln);
		retval.setPicture(picturedataURI);
		
		return null;
	}
}
