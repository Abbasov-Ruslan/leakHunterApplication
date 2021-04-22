////
////  APINewsManager.swift
////  leakedPasswordInterface
////
////  Created by Ruslan Abbasov on 16.04.2021.
////
//
//import Foundation
//
//
//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
//
////
//// To read values from URLs:
////
////   let task = URLSession.shared.welcomeElementTask(with: url) { welcomeElement, response, error in
////     if let welcomeElement = welcomeElement {
////       ...
////     }
////   }
////   task.resume()
//
//typealias JSONCompletionHandler = ([String: AnyObject]?, Error?) -> Void
//
//class ApiNewsManager {
//    typealias Welcome = [WelcomeElement]
//    func getNewsJson() {
////        let url = URL(string: "https://haveibeenpwned.com/api/v3/breaches")!
//        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
//        let task = URLSession.shared.dataTask(with: url, completionHandler: { welcomeElement, response, error in
////            jsonSerialize(welcomeElement:welcomeElement!) { (json, error) in
////                if let dictionary = json {
////                    let welcome2 = NewsModel(JSON: dictionary)
////
//            do {
//                jsonSerialize(welcomeElement2: welcomeElement) { (json, nil) in
//                    if let dictionary = json!["currently"] as? [String: AnyObject] {
//                      var one = NewsModel(JSON: dictionary)
//                        var two = 1
//                    } else {
//                    }
//                }
//            } catch let error as NSError {
//                print(error)
//            }
//                })
//        task.resume()
//    }
//}
//
//func jsonSerialize(welcomeElement2: Data?, completionHandler: @escaping JSONCompletionHandler) {
//    
//    do {
//        var json = try JSONSerialization.jsonObject(with: welcomeElement2!, options: []) as? [String: AnyObject]
//        completionHandler(json, nil)
//    } catch let error as NSError {
//        print(error)
//    }
//}
//
//
//// MARK: - WelcomeElement
//class WelcomeElement: Codable {
//    let name, title, domain, breachDate: String
//    let addedDate, modifiedDate: Date
//    let pwnCount: Int
//    let welcomeDescription: String
//    let logoPath: String
//    let dataClasses: [String]
//    let isVerified, isFabricated, isSensitive, isRetired: Bool
//    let isSpamList: Bool
//    
//    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case title
//        case domain
//        case breachDate
//        case addedDate
//        case modifiedDate
//        case pwnCount
//        case welcomeDescription
//        case logoPath
//        case dataClasses
//        case isVerified
//        case isFabricated
//        case isSensitive
//        case isRetired
//        case isSpamList
//    }
//    
//    init(name: String, title: String, domain: String, breachDate: String, addedDate: Date, modifiedDate: Date, pwnCount: Int, welcomeDescription: String, logoPath: String, dataClasses: [String], isVerified: Bool, isFabricated: Bool, isSensitive: Bool, isRetired: Bool, isSpamList: Bool) {
//        self.name = name
//        self.title = title
//        self.domain = domain
//        self.breachDate = breachDate
//        self.addedDate = addedDate
//        self.modifiedDate = modifiedDate
//        self.pwnCount = pwnCount
//        self.welcomeDescription = welcomeDescription
//        self.logoPath = logoPath
//        self.dataClasses = dataClasses
//        self.isVerified = isVerified
//        self.isFabricated = isFabricated
//        self.isSensitive = isSensitive
//        self.isRetired = isRetired
//        self.isSpamList = isSpamList
//    }
//}
//
//
//// MARK: - Helper functions for creating encoders and decoders
//
//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}
//
//typealias Welcome = [WelcomeElement]
//
//// MARK: - URLSession response handlers
//
//extension URLSession {
//    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        return self.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                completionHandler(nil, response, error)
//                return
//            }
//            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
//        }
//    }
//    
//    func welcomeTask(with url: URL, completionHandler: @escaping (Welcome?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        return self.codableTask(with: url, completionHandler: completionHandler)
//    }
//}
//
