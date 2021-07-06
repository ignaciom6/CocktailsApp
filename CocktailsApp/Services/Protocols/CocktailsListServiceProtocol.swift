//
//  CocktailsListServiceProtocol.swift
//  CocktailsApp
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import Foundation

protocol CocktailsListServiceProtocol {
    typealias CocktailsDataCompletion = (DrinksModel?, Error?) -> ()
    
    static func cocktailsList(completion: @escaping CocktailsDataCompletion)
}
