//
//  TrackableScrollView.swift
//  SwiftUI Example
//
//  Created by hardip gajera on 22/11/21.
//

import SwiftUI

struct ScrollViewOffset: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct TrackableScrollView<Content: View>: View {
    
    let content: Content
    let offSet: (CGFloat) -> ()
    
    
    init(offSet: @escaping (CGFloat) -> (),@ViewBuilder content: () -> Content) {
        self.content = content()
        self.offSet = offSet
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                content
            }
            .background(
                GeometryReader { innerView in
                    let offset = innerView.frame(in: .named("scrollView")).origin.y
                    Color.clear.preference(key: ScrollViewOffset.self, value: offset)
                }
            )
        }
        .coordinateSpace(name: "scrollView")
        .onPreferenceChange(ScrollViewOffset.self) { value in
            self.offSet(-value)
        }
    }
}


