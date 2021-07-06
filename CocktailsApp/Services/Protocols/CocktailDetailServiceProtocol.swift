//
//  CocktailDetailServiceProtocol.swift
//  CocktailsApp
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import Foundation

protocol CocktailDetailServiceProtocol {
    typealias CocktailDetailDataCompletion = (DrinkDetailModel?, Error?) -> ()
    
    static func cocktailsList(cocktailId: String, completion: @escaping CocktailDetailDataCompletion)
}
