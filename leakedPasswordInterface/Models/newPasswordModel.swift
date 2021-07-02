//
//  newPasswordModel.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 27.04.2021.
//

import Foundation

protocol JSONDecodablePassword {
    init?(JSON: [String: AnyObject])
}

struct NewPasswordModel {

    let success: Bool
    let password: [String]
}

extension NewPasswordModel: JSONDecodablePassword {
    init?(JSON: [String: AnyObject]) {
        guard let success = JSON["success"] as? Bool,
              let password = JSON["passwords"] as? [String]
        else {
            return nil
        }
        self.success = success
        self.password = password
    }
}
