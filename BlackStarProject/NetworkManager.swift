//
//  NetworkManager.swift
//  BlackStarProject
//
//  Created by Роман Зобнин on 05.12.2021.
//

import Foundation

class NetworkManager {
    func fetchDataCategory(urlString: String, with completion: @escaping ([Category]) -> Void){
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error
            {print (error)}
            guard let data = data else {return}
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else {return}
            var categories = [Category]()
            if let jsonDict = json as? [String: [String: Any]] {
                for (_, category) in jsonDict {
                    if let name = category["name"] as? String,
                        let image = category["image"] as? String,
                        let subcategories = category["subcategories"] as? [[String:Any]] {
                        var subcategoryList = [Subcategory]()
                        
                        for subcategory in subcategories {
                            var subcategoryObject = Subcategory(id: "", name: subcategory["name"] as? String ?? "None")
                            
                            if let id = subcategory["id"] as? Int {
                                subcategoryObject.id = "\(id)"
                            } else if let id = subcategory["id"] as? String{
                                subcategoryObject.id = id
                            }
                            subcategoryList.append(subcategoryObject)
                            print(subcategoryList.count)
                        }
                        categories.append(Category(name: name, image: image, subcategories: subcategoryList))
                        print(categories.count)
                    }
                    categories.sort(by: { $0.name < $1.name })
                    completion(categories)
                }
            }
        }.resume()
    }
}
