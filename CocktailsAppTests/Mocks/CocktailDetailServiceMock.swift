//
//  CocktailDetailServiceMock.swift
//  CocktailsAppTests
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import Foundation
@testable import CocktailsApp

class CocktailDetailServiceMock {
    
}

extension CocktailDetailServiceMock: CocktailDetailServiceProtocol {
    typealias CocktailDetailDataCompletion = (DrinkDetailModel?, Error?) -> ()
    
    static func cocktailsList(cocktailId: String, completion: @escaping CocktailDetailDataCompletion) {
        
        let cocktailDetailModel = CocktailDetailModel(strDrink: "Beach", strInstructions: "stir", strDrinkThumb: thumbnailUrl, strIngredient1: "water", strIngredient2: "gin", strIngredient3: nil, strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil)
        
        let drinkDetailModel = DrinkDetailModel(drinks: [cocktailDetailModel])
        
        completion(drinkDetailModel, nil)
    }
}
