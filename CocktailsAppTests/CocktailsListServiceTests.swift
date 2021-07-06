//
//  CocktailsAppTests.swift
//  CocktailsAppTests
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import XCTest
@testable import CocktailsApp

class CocktailsListServiceTests: XCTestCase {

    func testDataReceivedFromService() {
        let cocktailsQuantity = self.expectation(description: "Cocktails quantity")
        
        let viewModel = CocktailsListViewModel()
        
        viewModel.cocktails.bind {
            if $0?.count == 1 {
                cocktailsQuantity.fulfill()
            }
        }
        
        DispatchQueue.main.async {
            CocktailsListServiceMock.cocktailsList() { (drinksData, error) in
                do {
                    viewModel.setPropertiesValuesFromData(drinksData: drinksData!)
                }
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }

}
