//
//  Md5.swift
//  Marvel-Hero-demo
//
//  Created by Marina Huber on 12/16/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import CommonCrypto
import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func md5() -> String! {
        let str = cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
//fix depricated
        CC_MD5(str!, strLen, result)

        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }

        result.deallocate()

        return String(format: hash as String)
    }
}
