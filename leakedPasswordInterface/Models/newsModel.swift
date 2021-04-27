//
//  newsModel.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 16.04.2021.
//


import Foundation
import UIKit

protocol JSONDecodable {
    init?(JSON: NSDictionary)
}

struct NewsModel {
    let name: String
    let title: String
    let domain: String
    let breachDate: String
    let pwnCount: Int
    let description: String
    let dataClasses: Array<String>
    let isVerified: Bool
    let isFabricated: Bool
    let isSensitive: Bool
    let isRetired: Bool
    let isSpamList: Bool
    var addedDate: String
    let logoPath: String
    let modifiedDate:String
    var image: UIImage?
//    var sortDate: Date?
}
//
extension NewsModel: JSONDecodable {
    init?(JSON: NSDictionary) {
        guard let isSensetive = JSON["IsSensitive"] as? Bool,
              let modifiedDate = JSON["ModifiedDate"] as? String,
              let domain = JSON["Domain"] as? String,
              let name = JSON["Name"] as? String,
              let description = JSON["Description"] as? String,
              let isFabricated = JSON["IsFabricated"] as? Bool,
              let breachDate = JSON["BreachDate"] as? String,
              let pwnCount = JSON["PwnCount"] as? Int,
              let isVerified = JSON["IsVerified"] as? Bool,
              let isRetired = JSON["IsRetired"] as? Bool,
              let title = JSON["Title"] as? String,
              let dataClasses = JSON["DataClasses"] as? Array<String>,
              let addedDate = JSON["AddedDate"] as? String,
              let isSpamList = JSON["IsSpamList"] as? Bool,
              let logoPath = JSON["LogoPath"] as? String else {
            return nil
        }
        
        self.isSensitive = isSensetive
        self.modifiedDate = modifiedDate
        self.domain = domain
        self.name = name
        self.description = description
        self.isFabricated = isFabricated
        self.breachDate = breachDate
        self.pwnCount = pwnCount
        self.isVerified = isVerified
        self.isRetired = isRetired
        self.title = title
        self.dataClasses = dataClasses
        self.addedDate = addedDate
        self.isSpamList = isSpamList
        self.logoPath = logoPath
        self.image = nil
//        self.sortDate = nil
    }
}



