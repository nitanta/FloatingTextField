//
//  StringExtension.swift
//  FloatingTextField-Swiftui (iOS)
//
//  Created by ebpearls on 4/21/21.
//

import Foundation


extension String {
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }

    
    func creditCardFormatting(separator: String, chunkSize: Int, limit: Int) -> String {
        let formatted = self.replacingOccurrences(of: " ", with: "").chunk(n: chunkSize)
            .map{ String($0) }.joined(separator: " ")
        return String(formatted.prefix(limit))
    }

}

extension Collection {
    public func chunk(n: Int) -> [SubSequence] {
        var res: [SubSequence] = []
        var i = startIndex
        var j: Index
        while i != endIndex {
            j = index(i, offsetBy: n, limitedBy: endIndex) ?? endIndex
            res.append(self[i..<j])
            i = j
        }
        return res
    }
}

