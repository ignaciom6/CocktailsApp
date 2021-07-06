//
//  DrinksModelMock.swift
//  CocktailsAppTests
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import Foundation
@testable import CocktailsApp

let thumbnailUrl = "https://www.thecocktaildb.com/images/media/drink/xvwusr1472669302.jpg"

class CocktailsListServiceMock {
    
}

extension CocktailsListServiceMock: CocktailsListServiceProtocol {
    typealias CocktailsDataCompletion = (DrinksModel?, Error?) -> ()
    
    static func cocktailsList(completion: @escaping CocktailsDataCompletion) {
        let cocktailBasicInfoModel = CocktailsBasicInfoModel(strDrink: "Drink Name", strDrinkThumb: thumbnailUrl, idDrink: "1111")
        
        let drinksModel = DrinksModel(drinks: [cocktailBasicInfoModel])
        
        completion(drinksModel, nil)
    }
}
