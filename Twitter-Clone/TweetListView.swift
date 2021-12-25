//
//  TweetListView.swift
//  Twitter-Clone
//
//  Created by hardip gajera on 22/12/21.
//

import SwiftUI

struct TweetListView: View {
    var body: some View {
        List {
            ForEach(Tweet.samples()) { tweet in
                TweetView(tweet: tweet)
            }
        }
        .listStyle(PlainListStyle())
    }
}
