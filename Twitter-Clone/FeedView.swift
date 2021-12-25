//
//  FeedView.swift
//  Twitter-Clone
//
//  Created by hardip gajera on 22/12/21.
//

import SwiftUI

struct FeedView: View {
    
    @Binding var isShowSideBar: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
                .frame(width: screenWidth(), height: 60)
            
            TweetListView()
                .frame(maxHeight: .infinity)
        }
    }
    
    var headerView: some View {
        VStack(spacing: 0) {
            HStack {
                Image(R.image.men1()!)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                    .onTapGesture {
                        isShowSideBar.toggle()
                    }
                
                Spacer()
                
                Image(R.image.twitterLogo()!)
                    .resizable()
                    .frame(width: 25, height: 25)
                
                Spacer()
                
                Image(R.image.stars()!)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.primary)
                
            }
            .padding(16)
            Spacer()
            Divider()
        }
    }
}

