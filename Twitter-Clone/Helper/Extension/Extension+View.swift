//
//  Extension+View.swift
//  SwiftUI Example
//
//  Created by hardip gajera on 22/12/21.
//

import SwiftUI
import UIKit

extension View {
    
    func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    @ViewBuilder
    func isHidden(_ hidden: Bool) -> some View {
        if hidden {
            self.hidden()
        } else {
            self
        }
    }
}
