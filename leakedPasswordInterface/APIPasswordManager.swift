//
//  APIPasswordManager.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 13.04.2021.
//

import Foundation
import CommonCrypto

extension String {
    func sha1() -> String {
        let data = Data(self.utf8)
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0.baseAddress, CC_LONG(data.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
}





class APIPasswordManager {
    
    
    func path(hash: String) -> String {
        return "https://api.pwnedpasswords.com/range/\(hash)"
    }
    
    func passwordRequest(password: String) {
        let cryptoPassword = password.sha1()
        let cryptoPasswordShort = String(cryptoPassword.prefix(5))
        let urlString = path(hash: cryptoPasswordShort)
        let url = URL(string: urlString)!
        var arr2: [String] = []
        var i = 0
        var crptoPassShort = cryptoPassword.uppercased()
        
        
        for _ in 1...5 {
            crptoPassShort.remove(at: crptoPassShort.startIndex)
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let str = String(data: data, encoding: .utf8)!
            _ = str.contains(cryptoPassword)
            
            let array = str.components(separatedBy: "\n")
            
            for item in array {
                arr2.append(contentsOf: item.components(separatedBy: ":"))
            }
            
            var bool = arr2[1052].contains(crptoPassShort)
            
            for item in arr2 {
                if item.contains(crptoPassShort) {
                    print(arr2[i+1])
                    print("hello")
                }
                i+=1
            }
            //            print(i)
            //            print(arr2[659])
            //            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    
    
    
    
//    func isPasswordPawn(password:String) -> Int? {
//        let cryptoPassword = password.sha1()
//
//    }
}



