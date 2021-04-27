//
//  quickType.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 19.04.2021.
//

import Foundation


class apiManager {
    
    typealias JSONCompletionHandler = ([NewsModel]) -> Void
    
    func getNews(completionHandler: @escaping JSONCompletionHandler) {
        
        let url = URL(string: "https://haveibeenpwned.com/api/v3/breaches")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSArray
                var arr2:[NewsModel] = []
                
                for item in json! {
                    let model = NewsModel(JSON: item as! NSDictionary)
                    arr2.append(model!)
                }
                
                completionHandler(arr2)
            } catch let error as NSError {
                print(error)
              }
        }
        task.resume()
    }
}

