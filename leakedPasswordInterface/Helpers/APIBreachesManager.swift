//
//  quickType.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 19.04.2021.
//

import Foundation

class ApiManager {

    typealias JSONCompletionHandler = ([NewsModel]) -> Void

    func getNews(completionHandler: @escaping JSONCompletionHandler) {
        let url = URL(string: "https://haveibeenpwned.com/api/v3/breaches")!
        let task = URLSession.shared.dataTask(with: url) {(data, _, error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSArray
                var newsArray: [NewsModel] = []

                for item in json! {
                    let model = NewsModel(JSON: item as? NSDictionary ?? ["error": "error"])
                    newsArray.append(model!)
                }
                completionHandler(newsArray)
            } catch let error as NSError {
                print(error)
            }
        }
        task.resume()
    }
}
