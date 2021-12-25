//
//  Extension+String.swift
//  Twitter-Clone
//
//  Created by hardip gajera on 22/12/21.
//

import Foundation

extension String {
    var StringURL: URL {
        guard let url = URL(string: self) else {
            fatalError("Not Found URL")
        }
        return url
    }
}
