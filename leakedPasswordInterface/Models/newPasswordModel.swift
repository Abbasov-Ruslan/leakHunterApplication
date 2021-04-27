//
//  newPasswordModel.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 27.04.2021.
//

import Foundation


struct newPasswordModel {
    
    let success: Bool
    let password: [String]
}
extension newPasswordModel: JSONDecodable {
    init?(JSON: NSDictionary) {
        guard let success = JSON["success"] as? Bool,
              let password = JSON["passwords"] as? [String]
        else {
            return nil
        }
        self.success = success
        self.password = password
    }
}
