//
//  newsModel.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 16.04.2021.
//


import Foundation
import UIKit

protocol JSONDecodable {
  init?(JSON: [String: AnyObject])
}

struct NewsModel {
    let name: String
    let title: String
    let domain: String
    let newsIcon: UIImage
    let breachDate: String
    let pwnCount: Int
    let description: String
    let dataClasses: [String]
    let isVerified: Bool
    let isFabricated: Bool
    let isSensitive: Bool
    let isRetired: Bool
    let isSpamList: Bool
}

extension NewsModel: JSONDecodable {
  init?(JSON: [String : AnyObject]) {
    guard let name = JSON["Name"] as? String,
    let title = JSON["Title"] as? String,
    let domain = JSON["Domain"] as? String,
    let newsIconPath = JSON["LogoPath"] as? String,
    let breachDate = JSON["BreachDate"] as? String,
    let pwnCount = JSON["PwnCount"] as? Int,
    let description = JSON["Description"] as? String,
    let dataClases = JSON["DataClasses"] as? [String],
    let isVerified = JSON["IsVerified"] as? Bool,
    let isFabricated = JSON["IsFabricated"] as? Bool,
    let isSensitive = JSON["IsSensitive"] as? Bool,
    let isRetired = JSON["IsRetired"] as? Bool,
    let isSpamList = JSON["IsSpamList"] as? Bool
    
    else {
        return nil
    }
    
    self.name = name
    self.title = title
    self.domain = domain
//    self.newsIcon = newsIconPath
    self.breachDate = breachDate
    self.pwnCount = pwnCount
    self.description = description
    self.dataClasses = dataClases
    self.isVerified = isVerified
    self.isFabricated = isFabricated
    self.isSensitive = isSensitive
    self.isRetired = isRetired
    self.isSpamList = isSpamList
    
    
  }
}



