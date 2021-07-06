//
//  CocktailDetailViewModel.swift
//  CocktailsApp
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import Foundation

class CocktailDetailViewModel: NSObject {
    var error = Box("")
    
    var cocktailName = Box("")
    var instructions = Box("")
    var imageURL = Box("")
    var ingredients: Box<[String]?> = Box(nil)
    
    override init() {
        super.init()
    }
    
    func getCocktailDetail(cocktailId: String) {
        CocktailDetailService.cocktailsList(cocktailId: cocktailId) { [weak self] (drinkDetailData, error) in
            guard let self = self else {return}
            guard let drinkDetailData = drinkDetailData else {
                print(error?.localizedDescription ?? "defaultError")
                print("error")
                return
            }
            self.setPropertiesValuesFromData(drinkData: drinkDetailData)
        }
    }
    
    func setPropertiesValuesFromData(drinkData: DrinkDetailModel) {
        let cocktail = drinkData.drinks.first
        self.cocktailName.value = cocktail?.strDrink ?? ""
        self.instructions.value = cocktail?.strInstructions ?? ""
        self.imageURL.value = cocktail?.strDrinkThumb ?? ""
        self.ingredients.value = Utils.getIngredients(cocktail: cocktail!)
    }
}
