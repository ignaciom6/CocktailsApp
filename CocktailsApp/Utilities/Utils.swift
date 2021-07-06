//
//  Utils.swift
//  CocktailsApp
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import UIKit

class Utils: NSObject {
    
    class func getIngredients(cocktail: CocktailDetailModel) -> [String] {
        let mirrorCocktail = Mirror(reflecting: cocktail)
        
        var ingredientsArray: [String] = []
        for child in mirrorCocktail.children {
            if let ingredientKey = child.label {
                let ingredientValue = child.value as? String
                if ingredientKey.contains("Ingredient") && ingredientValue != nil {
                    ingredientsArray.append(ingredientValue!)
                }
            }
        }
        return ingredientsArray.compactMap{ $0 }
    }

}
