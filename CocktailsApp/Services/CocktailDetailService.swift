//
//  CocktailDetailService.swift
//  CocktailsApp
//
//  Created by Ignacio Mariani on 06/07/2021.
//

import Foundation

class CocktailDetailService {
    typealias CocktailDetailDataCompletion = (DrinkDetailModel?, Error?) -> ()
    
    private static let host = "www.thecocktaildb.com"
    private static let path = "/api/json/v1/1/lookup.php"
    
    static func cocktailsList(cocktailId: String, completion: @escaping CocktailDetailDataCompletion) {
        
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = host
        urlBuilder.path = path
        urlBuilder.queryItems = [URLQueryItem(name: "i", value: cocktailId)]
        
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
                    let drinkDetailModel: DrinkDetailModel = try decoder.decode(DrinkDetailModel.self, from: data)
                    completion(drinkDetailModel, error)
                } catch {
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
