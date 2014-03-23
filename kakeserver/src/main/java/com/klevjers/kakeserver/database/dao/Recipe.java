package com.klevjers.kakeserver.database.dao;
import no.finstadlille.kakekonkurranse.Baker;
import no.finstadlille.kakekonkurranse.Cake;
import no.finstadlille.kakekonkurranse.Complexity;
import no.finstadlille.kakekonkurranse.IngredientWarnings;
import no.finstadlille.kakekonkurranse.ModuleList;
import no.finstadlille.kakekonkurranse.Time;
import static com.klevjers.kakeserver.utils.ObjectFactoryUtils.instance;

public class Recipe {

	
	public Recipe(String title, String description, String bekimSays, String imagedataURI) {
		
		Baker baker = instance().createBaker();
		Complexity complexity = instance().createComplexity();
		IngredientWarnings ingredientWarnings = instance().createIngredientWarnings();
		ModuleList modules = instance().createModuleList();
		Time time = instance().createTime();
		
		
		Cake cake = instance().createCake();
		cake.setBaker(baker);
		cake.setBekimSays(bekimSays);
		cake.setComplexity(complexity);
		cake.setDescription(description);
		if (imagedataURI != null) {
			cake.setImage(imagedataURI);
		}
		cake.setIngredientWarnings(ingredientWarnings);
		cake.setModules(modules);
		cake.setTime(time);
		cake.setTitle(title);
	
	}
}
