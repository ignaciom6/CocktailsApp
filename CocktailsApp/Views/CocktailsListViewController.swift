//
//  ViewController.swift
//  CocktailsApp
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import UIKit

class CocktailsListViewController: UIViewController {

    @IBOutlet weak var cocktailsList: UITableView!
    
    private var cocktailsArr: [CocktailsBasicInfoModel] = []
    private let viewModel = CocktailsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cocktailsList.delegate = self
        cocktailsList.dataSource = self
        
        viewModel.cocktails.bind { [weak self] cocktails in
            self?.cocktailsArr = cocktails ?? []
            self?.cocktailsList.reloadData()
        }
        
        viewModel.error.bind { [weak self] error in
            if !error.isEmpty {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                        self?.dismiss(animated: true, completion: nil)
                    }))
                    self?.present(alert, animated: true, completion: nil)
                }
            }
        }
    }


}

extension CocktailsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktailsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cocktailsList.dequeueReusableCell(withIdentifier: "cocktailsCell", for: indexPath) as! CocktailTableViewCell
        
        let cocktail = self.cocktailsArr[indexPath.row]
        
        cell.cocktailName.text = cocktail.strDrink
        cell.cocktailThumbnail.load(urlString: cocktail.strDrinkThumb)
        
        return cell
    }
}

extension CocktailsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCocktailId = cocktailsArr[indexPath.row].idDrink
        
        if let viewController = storyboard?.instantiateViewController(identifier: "CocktailDetailViewController") as? CocktailDetailViewController {
            viewController.cocktailId = selectedCocktailId
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

