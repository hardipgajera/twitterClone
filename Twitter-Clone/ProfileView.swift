//
//  ProfileView.swift
//  Twitter-Clone
//
//  Created by hardip gajera on 22/12/21.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var scrollViewOffSet: CGFloat = 0
    @State private var selectedTabs: ProfileTabs = .tweets
    @Namespace private var tabsUnderlineAnimation
    @Environment(\.dismiss) var dismiss
    
    let tweetData = Tweet.samples()
    
    var body: some View {
        ZStack {
            
            TrackableScrollView { offSet in
                self.scrollViewOffSet = offSet
            } content: {
                LazyVStack(spacing: 0,pinnedViews: [.sectionHeaders]) {
                    Section {
                        ZStack {
                            VStack(spacing: 0) {
                                titleSection
                                
                                tabView
                                    
                            }
                        }
                    } header: {
                        headerView
                            .frame(height: getHeaderViewHeight())
                            .overlay(
                                Rectangle()
                                    .foregroundColor(.black.opacity(0.2))
                                    .background(.thinMaterial, in: Rectangle())
                                    .opacity(scrollViewOffSet > 50 ? 1 : 0)
                            )
                    }
                }
                .offset(y: scrollViewOffSet < 0 ? scrollViewOffSet : 0)
            }
            
            
            VStack {
                Spacer().frame(height: 25)
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                            .padding(8)
                            .padding(.vertical)
                            .background(
                                Circle()
                                    .fill(.black.opacity(0.5))
                                    .foregroundStyle(.regularMaterial)
                            )
                    }
                    
                    Spacer()
                    VStack(spacing: 0) {
                        Text("Hardip Gajera")
                            .fontWeight(.heavy)
                        Text("341 Tweets")
                            .font(.footnote)
                            .offset(y: -2)
                    }
                    .foregroundColor(.primary)
                    .offset(y: max(140 - scrollViewOffSet,0))
                    
                    Spacer()
                    
                    Button {} label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                            .padding(8)
                            .padding(.vertical)
                            .background(
                                Circle()
                                    .fill(.black.opacity(0.5))
                                    .foregroundStyle(.regularMaterial)
                            )
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                .frame(height: 55)
                .clipped()
                Spacer()
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
        
    }
    
    var headerView: some View {
        ZStack {
            Image(R.image.header_bg()!)
                .resizable()
                .frame(width: screenWidth())
                .frame(maxHeight: .infinity)
                .overlay(
                    ZStack {
                    Rectangle()
                        .foregroundColor(.black.opacity(0.2))
                        .background(.thinMaterial, in: Rectangle())
                        ProgressView()
                    }.isHidden(scrollViewOffSet > -50)
                )
        }
    }
    
    func getHeaderViewHeight() -> CGFloat {
        if scrollViewOffSet < 0 {
            return -scrollViewOffSet + 120
        } else {
            if scrollViewOffSet > 80 {
                return 80
            } else {
                return max(120 - scrollViewOffSet,80)
            }
        }
    }
    
    var titleSection: some View {
        VStack {
            HStack {
                Image(R.image.men1()!)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(4)
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(.blue)
                    )
                    .padding(.top)
                    .padding(.bottom,4)
                Spacer()
                
                VStack {
                    Spacer().frame(height: 25)
                    Text("Edit profile")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                        .padding(.vertical,6)
                        .overlay(
                            Capsule()
                                .stroke(.white.opacity(0.3),lineWidth: 1)
                        )
                    Spacer()
                }
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Hardip Gajera")
                        .font(.title3)
                        .fontWeight(.heavy)
                    Text("@hardip_gajera")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
            }
            
            HStack {
                VStack(alignment: .leading,spacing: 6) {
                    Text("#Dont_Talk #Just_Act #Dont_say #Just_Show")
                        .foregroundColor(.blue)
                        .font(.footnote)
                        .padding(.vertical,4)
                    
                    HStack(spacing: 12) {
                        HStack(spacing: 0) {
                            Image(systemName: "mappin")
                            Text("Surat, India")
                        }
                        HStack(spacing: 4) {
                            Image(systemName: "person.fill.viewfinder")
                            Text("Born 7 Augast 2002")
                        }
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "calendar")
                        Text("Joined November 2017")
                    }
                    
                    HStack(spacing: 4) {
                        Text("51")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("Following")
                        Spacer().frame(width: 8)
                        Text("400")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("Followers")
                    }
                }
                Spacer()
            }
            .foregroundColor(Color.gray.opacity(0.8))
            .font(.footnote)
        }.padding(.horizontal)
    }
    
    enum ProfileTabs: Int {
        case tweets = 0
        case tweetsNReply = 1
        case media = 2
        case likes = 3
    }
    
    var tabView: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 32) {
                    
                    VStack(spacing: 6) {
                        Text("Tweets")
                            .foregroundColor(selectedTabs == .tweets ? .white : .gray.opacity(0.8))
                            .onTapGesture { changeTab(.tweets) }
                        if selectedTabs == .tweets {
                            highLightCapsule
                                .matchedGeometryEffect(id: "tabAnime", in: tabsUnderlineAnimation)
                        }
                    }
                    
                    VStack(spacing: 6) {
                        Text("Tweets & Replies")
                            .foregroundColor(selectedTabs == .tweetsNReply ? .white : .gray.opacity(0.8))
                            .onTapGesture { changeTab(.tweetsNReply) }
                        if selectedTabs == .tweetsNReply {
                            highLightCapsule
                                .matchedGeometryEffect(id: "tabAnime", in: tabsUnderlineAnimation)
                        }
                    }
                    
                    VStack(spacing: 6) {
                        Text("Media")
                            .foregroundColor(selectedTabs == .media ? .white : .gray.opacity(0.8))
                            .onTapGesture { changeTab(.media) }
                        if selectedTabs == .media {
                            highLightCapsule
                                .matchedGeometryEffect(id: "tabAnime", in: tabsUnderlineAnimation)
                        }
                    }
                    
                    VStack(spacing: 6) {
                        Text("Likes")
                            .foregroundColor(selectedTabs == .likes ? .white : .gray.opacity(0.8))
                            .onTapGesture { changeTab(.likes) }
                        if selectedTabs == .likes {
                            highLightCapsule
                                .matchedGeometryEffect(id: "tabAnime", in: tabsUnderlineAnimation)
                        }
                    }
                }
                .font(.headline)
                .padding(.top,8)
            }
            Divider()
            
            HStack {
                tweetList
                tweetList
                tweetList
                tweetList
            }
            .frame(minHeight: 2500,maxHeight: 10000) // don't know but if we remove this hard core frame this will not work as if it should be.....
            .offset(x: (screenWidth() * 1.5))
            .offset(x: -(screenWidth() * CGFloat(selectedTabs.rawValue)))
        }
    }
    
    var tweetList: some View {
        List {
            ForEach(tweetData) { tweet in
                TweetView(tweet: tweet)
            }
        }
        .listStyle(.plain)
        .disabled(true)
        .frame(width: screenWidth())
    }
    
    var highLightCapsule: some View {
        Capsule()
            .fill(.blue)
            .frame(height: 3)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
    }
    
    func changeTab(_ tab: ProfileTabs) {
        withAnimation {
            self.selectedTabs = tab
        }
    }
    
}

