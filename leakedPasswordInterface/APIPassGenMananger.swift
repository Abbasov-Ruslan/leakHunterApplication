//
//  APIPassGenMananger.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 27.04.2021.
//

import Foundation

class APIPassGenManager {
    typealias JSONCompletionHandler = (_ passwordStr: String) -> Void
    
    func generatePassword(length: Int, num: Bool, symbols: Bool, upper: Bool,completionHandler: @escaping JSONCompletionHandler) {
        let url = getURL(length: length, num: num, symbols: symbols, upper: upper)
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                
                if let dictionary = json {
                    let one =  newPasswordModel(JSON: dictionary)
                    let str = one?.password[0]
                    completionHandler(str ?? "12345")
                } else {
                }
                
            } catch let error as NSError {
                print(error)
            }
        }
        task.resume()
    }
}

func getURL(length: Int, num: Bool, symbols: Bool, upper: Bool) -> URL {
    let locNum = num ? "1" : "0"
    let locSymols = symbols ? "1" : "0"
    let locUpper = upper ? "1" : "0"
    let locLength = String(length)
    
    let str = "https://api.happi.dev/v1/generate-password?" + "apikey=aff60ch7OuMyc5QylYNz6gscXWNKT6nZiuFPP6bwDuGegvWIw8aAes6t"
        + "&limit=" + "1"
        + "&length=" + locLength
        + "&num=" + locNum
        + "&upper=" + locUpper
        + "&symbols=" + locSymols
    let url = URL(string: str) ?? URL(string: "https://api.happi.dev/v1/generate-password?apikey=aff60ch7OuMyc5QylYNz6gscXWNKT6nZiuFPP6bwDuGegvWIw8aAes6t&limit=1&length=10&num=0&upper=0&symbols=0")
    return url!
}
