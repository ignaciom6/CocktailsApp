//
//  CocktailsListService.swift
//  CocktailsApp
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import Foundation

class CocktailsListService {
    typealias CocktailsDataCompletion = (DrinksModel?, Error?) -> ()
    
    private static let host = "www.thecocktaildb.com"
    private static let path = "/api/json/v1/1/filter.php"
    private static let type = "Cocktail_glass"
    
    static func cocktailsList(completion: @escaping CocktailsDataCompletion) {
        
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = host
        urlBuilder.path = path
        urlBuilder.queryItems = [URLQueryItem(name: "g", value: type)]
        
        let url = urlBuilder.url!
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(nil, error)
                    return
                }
                
                guard let data = data else {
                    completion(nil, error)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let drinksModel: DrinksModel = try decoder.decode(DrinksModel.self, from: data)
                    completion(drinksModel, error)
                } catch {
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
