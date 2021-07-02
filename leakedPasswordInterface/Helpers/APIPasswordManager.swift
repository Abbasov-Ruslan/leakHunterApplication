//
//  APIPasswordManager.swift
//  leakedPasswordInterface
//
//  Created by Ruslan Abbasov on 13.04.2021.
//

import Foundation
import CommonCrypto

class APIPasswordManager {
    private func path(hash: String) -> String {
        return "https://api.pwnedpasswords.com/range/\(hash)"
    }

    typealias CompletionHandler = (_ success: String) -> Void

    func removeFiveCharsFromBeginnig(str: String) -> String {
        var tempStr = str
        for _ in 1...5 {
            tempStr.remove(at: tempStr.startIndex)
        }
        return tempStr
    }

    private func fetchPassword(url: URL, completionHandler: @escaping (String) -> Void) {

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            var str = ""
            if let error = error {
                print("Error with fetching: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            str = String(data: data!, encoding: .utf8)!
            completionHandler(str)
        })
        task.resume()
    }

    func passwordRequest(password: String, completionHandler: @escaping CompletionHandler) {
        let cryptoPassword = password.sha1()
        let firstFiveHash = String(cryptoPassword.prefix(5))
        let urlString = path(hash: firstFiveHash)
        let url = URL(string: urlString)!
        var hashNumberArray: [String] = []
        var crptoPassShort = cryptoPassword.uppercased()
        var result = ""
        var str = ""
        var numberInArray = 0

        fetchPassword(url: url) { (testString) in
            str = testString
            for _ in 1...5 {
                crptoPassShort.remove(at: crptoPassShort.startIndex)
            }

            let separatedStringArray = str.components(separatedBy: "\n")

            for item in separatedStringArray {
                hashNumberArray.append(contentsOf: item.components(separatedBy: ":"))
            }

            for item in hashNumberArray {
                if item.contains(crptoPassShort) {
                    result = hashNumberArray[numberInArray+1]
                }
                numberInArray+=1
            }
            completionHandler(result)
        }
    }
}

extension String {
    func sha1() -> String {
        let data = Data(self.utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0.baseAddress, CC_LONG(data.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
}
