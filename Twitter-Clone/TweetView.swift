//
//  TweetView.swift
//  Twitter-Clone
//
//  Created by hardip gajera on 22/12/21.
//

import SwiftUI


struct TweetView: View {
    
    let tweet: Tweet
    
    var body: some View {
        HStack(alignment: .top) {
            tweet.owner.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(30)
                .padding(.top,6)
            
            VStack(alignment: .leading) {
                HStack(spacing: 8) {
                    
                    Text(tweet.owner.displayName)
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text("@" + tweet.owner.userName)
                        .foregroundColor(Color.gray)
                    
                    Spacer()
                    
                    Image(R.image.menuIcon()!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                    
                }
                
                HStack {
                    Text(tweet.body)
                        .font(.footnote)
                        .lineLimit(nil)
                        .frame(minWidth: 20,maxWidth: 200)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                
                if !tweet.image.isEmpty {
                    tweetImageView()
                        .frame(maxWidth: .infinity)
                }
                
                HStack {
                    Image(R.image.commentIcon()!)
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text(tweet.comments.count.description)
                    Spacer()
                    Image(R.image.retweetIcon()!)
                        .resizable()
                        .frame(width: 20, height: 15)
                    Text(tweet.retweet.description)
                    Spacer()
                    Image(R.image.heartIcon()!)
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text(tweet.like.description)
                    Spacer()
                    Image(R.image.shareIcon()!)
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                .font(.subheadline)
                .foregroundColor(Color.gray.opacity(0.8))
                .frame(height: 15)
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    
    @ViewBuilder
    func tweetImageView() -> some View {
        switch tweet.image.count {
        case 1:
            imageView(image: tweet.image.first!.StringURL)
                .cornerRadius(10)
        case 2:
            HStack(spacing: 3) {
                imageView(image: tweet.image[0].StringURL)
                imageView(image: tweet.image[1].StringURL)
            }
            .frame(height: 150)
            .cornerRadius(10)
        case 3:
            HStack(spacing: 4) {
                imageView(image: tweet.image[0].StringURL)
                VStack(spacing: 4) {
                    imageView(image: tweet.image[1].StringURL)
                    imageView(image: tweet.image[2].StringURL)
                }
            }
            .frame(height: 150)
            .cornerRadius(10)
        case 4:
            HStack(spacing: 4) {
                VStack(spacing: 4) {
                    imageView(image: tweet.image[0].StringURL)
                    imageView(image: tweet.image[1].StringURL)
                }
                VStack(spacing: 4) {
                    imageView(image: tweet.image[2].StringURL)
                    imageView(image: tweet.image[3].StringURL)
                }
            }
            .frame(height: 150)
            .cornerRadius(10)
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func imageProgressView() -> some View {
        HStack(alignment: .center) {
            Spacer()
            ProgressView()
                .padding(32)
            Spacer()
        }
    }
    
    @ViewBuilder
    func imageView(image url: URL) -> some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                imageProgressView()
            case .failure( _):
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Image(systemName: "exclamationmark.icloud")
                        Spacer()
                    }
                    .frame(minHeight: 100)
                    Spacer()
                }
            case .success(let image):
                image
                    .resizable()
            @unknown default:
                fatalError()
            }
        }
    }
    
}
