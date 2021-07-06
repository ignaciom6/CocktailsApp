//
//  CocktailDetailViewController.swift
//  CocktailsApp
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import UIKit

class CocktailDetailViewController: UIViewController {
    
    @IBOutlet weak var cocktailImg: UIImageView!
    @IBOutlet weak var ingredientsTxtView: UITextView!
    @IBOutlet weak var instructionsTxtView: UITextView!
    
    private let viewModel = CocktailDetailViewModel()
    private var ingredientsArr: [String] = []
    public var cocktailId: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getCocktailDetail(cocktailId: cocktailId)
        
        viewModel.cocktailName.bind { [weak self] name in
            self?.title = name
        }
        
        viewModel.imageURL.bind { [weak self] cocktailThumbUrl in
            self?.cocktailImg.load(urlString: cocktailThumbUrl)
        }
        
        viewModel.ingredients.bind { [weak self] ingredients in
            self?.ingredientsArr = ingredients ?? []
            self?.ingredientsTxtView.text = self?.ingredientsArr.map{String($0)}.joined(separator: ", ")
        }
        
        viewModel.instructions.bind { [weak self] instructions in
            self?.instructionsTxtView.text = instructions
        }
    }

}
