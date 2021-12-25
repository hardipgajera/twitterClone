//
//  Data.swift
//  Twitter-Clone
//
//  Created by hardip gajera on 22/12/21.
//

import SwiftUI

struct Dummy {
    struct ImageURL {
        static var image: String { ["https://picsum.photos/200","https://picsum.photos/200/300","https://picsum.photos/200/250","https://picsum.photos/200/150"].randomElement()!
        }
    }
}


struct User {
    let image: Image
    let displayName: String
    let userName: String
    
    static func sample() -> User {
        [
        .init(image: Image(R.image.men1()!), displayName: "Alex69", userName: "alexgonzaga"),
        .init(image: Image(R.image.men2()!), displayName: "Zzy", userName: "shutupzzy"),
        .init(image: Image(R.image.men3()!), displayName: "GregJW", userName: "gregjoz"),
        .init(image: Image(R.image.men4()!), displayName: "Makwan", userName: "makwanbk"),
        .init(image: Image(R.image.men5()!), displayName: "Sc0tt", userName: "Scout_Willis")
        ].randomElement()!
    }
    
}

struct Comment {
    let owner: User
    let body: String
    let image: [Image]
    
    static func sample() -> Comment {
        .init(owner: .sample(), body: "Hey!! Sounds good...", image: [])
    }
}


struct Tweet: Identifiable {
    
    let id = UUID()
    let owner: User
    let body: String
    let image: [String]
    let like: Int
    let comments: [Comment]
    let retweet: Int
    
    static func samples() -> [Tweet] {
        [
            .init(owner: .sample(), body: "Messages be way funnier when u know how the person talks 😂", image: [], like: 16, comments: [.sample(),.sample()], retweet: 4),
            .init(owner: .sample(), body: "Nature does not hurry, yet everything is accomplished.", image: [Dummy.ImageURL.image], like: 48, comments: [.sample()], retweet: 3),
            .init(owner: .sample(), body: "Study nature, love nature, stay close to nature. It will never fail you.", image: [Dummy.ImageURL.image,Dummy.ImageURL.image], like: 11, comments: [], retweet: 1),
            .init(owner: .sample(), body: "What's the object - oriented way to become wealthy?? 🤔🤔  Inheritance 🤣🤣", image: [], like: 31, comments: [.sample(),.sample(),.sample()], retweet: 8),
            .init(owner: .sample(), body: "Many eyes go through the meadow, but few see the flowers in it. —Ralph Waldo Emerson", image: [Dummy.ImageURL.image,Dummy.ImageURL.image,Dummy.ImageURL.image],  like: 22, comments: [.sample(),.sample()], retweet: 6),
            .init(owner: .sample(), body: "The earth has music for those who listen. —William Shakespeare", image: [Dummy.ImageURL.image,Dummy.ImageURL.image,Dummy.ImageURL.image,Dummy.ImageURL.image], like: 33, comments: [], retweet: 5),
            .init(owner: .sample(), body: "Nature is not a place to visit. It is home.", image: [Dummy.ImageURL.image,Dummy.ImageURL.image], like: 16, comments: [.sample()], retweet: 42),
            .init(owner: .sample(), body: "Messages be way funnier when u know how the person talks 😂", image: [], like: 41, comments: [], retweet: 3),
            .init(owner: .sample(), body: "Nature does not hurry, yet everything is accomplished.", image: [Dummy.ImageURL.image], like: 25, comments: [.sample(),.sample(),.sample(),.sample()], retweet: 9),
            .init(owner: .sample(), body: "Study nature, love nature, stay close to nature. It will never fail you.", image: [Dummy.ImageURL.image,Dummy.ImageURL.image], like: 31, comments: [.sample()], retweet: 5),
            .init(owner: .sample(), body: "What's the object - oriented way to become wealthy?? 🤔🤔  Inheritance 🤣🤣", image: [], like: 16, comments: [], retweet: 1),
            .init(owner: .sample(), body: "Many eyes go through the meadow, but few see the flowers in it. —Ralph Waldo Emerson", image: [Dummy.ImageURL.image,Dummy.ImageURL.image,Dummy.ImageURL.image],  like: 15, comments: [.sample()], retweet: 3),
            .init(owner: .sample(), body: "The earth has music for those who listen. —William Shakespeare", image: [Dummy.ImageURL.image,Dummy.ImageURL.image,Dummy.ImageURL.image,Dummy.ImageURL.image], like: 56, comments: [.sample(),.sample()], retweet: 4),
            .init(owner: .sample(), body: "Nature is not a place to visit. It is home.", image: [Dummy.ImageURL.image,Dummy.ImageURL.image], like: 16, comments: [], retweet: 2)
        ]
    }
    
    static func == (lhs: Tweet, rhs: Tweet) -> Bool {
        lhs.id == rhs.id
    }
    
}
