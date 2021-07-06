//
//  CocktailsListViewModel.swift
//  CocktailsApp
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import Foundation

class CocktailsListViewModel: NSObject {
    var cocktails: Box<[CocktailsBasicInfoModel]?> = Box(nil)
    var error = Box("")
    
    override init() {
        super.init()
        getCocktailsList()
    }
    
    func getCocktailsList() {
        CocktailsListService.cocktailsList() { [weak self] (drinksData, error) in
            guard let self = self else {return}
            guard let drinksData = drinksData else {
                print(error?.localizedDescription ?? "defaultError")
                print("error")
                return
            }
            self.setPropertiesValuesFromData(drinksData: drinksData)
        }
    }
    
    func setPropertiesValuesFromData(drinksData: DrinksModel) {
        self.cocktails.value = drinksData.drinks
    }
}
