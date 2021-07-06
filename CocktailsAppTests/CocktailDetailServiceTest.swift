//
//  CocktailDetailServiceTest.swift
//  CocktailsAppTests
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import XCTest
@testable import CocktailsApp

class CocktailDetailServiceTest: XCTestCase {

    func testDataReceivedFromService() {
        let name = self.expectation(description: "Name")
        let thumbnail = self.expectation(description: "Thumbnail")
        let instr = self.expectation(description: "Instructions")
        
        let viewModel = CocktailDetailViewModel()
        
        viewModel.cocktailName.bind {
            if $0.caseInsensitiveCompare("Beach") == .orderedSame {
                name.fulfill()
            }
        }
        
        viewModel.imageURL.bind {
            if $0.caseInsensitiveCompare("https://www.thecocktaildb.com/images/media/drink/xvwusr1472669302.jpg") == .orderedSame {
                thumbnail.fulfill()
            }
        }
        
        viewModel.instructions.bind {
            if $0.caseInsensitiveCompare("Stir") == .orderedSame {
                instr.fulfill()
            }
        }
        
        DispatchQueue.main.async {
            CocktailDetailServiceMock.cocktailsList(cocktailId: "1111") { (drinkDetail, error) in
                do {
                    viewModel.setPropertiesValuesFromData(drinkData: drinkDetail!)
                }
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }

}
