//
//  HomeView.swift
//  SwiftUI Example
//
//  Created by hardip gajera on 22/11/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedTab: Tab = .Home
    
    @State private var isShowSideBar: Bool = false
    @GestureState private var dragOffset: CGFloat = 0
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        let sideBarWidth = screenWidth() - 75
        let homeWidth = screenWidth() + sideBarWidth
        
        let sideBarCloseOffset: CGFloat =  -(sideBarWidth / 2)
        
        return NavigationView {
            
            HStack(spacing: 0) {
                SideMenu()
                
                VStack {
                    
                    switch selectedTab {
                    case .Home:
                        FeedView(isShowSideBar: $isShowSideBar)
                            .frame(maxHeight: .infinity)
                    case .Search:
                        Text("Search")
                            .frame(maxHeight: .infinity)
                    case .Notification:
                        Text("Notification")
                            .frame(maxHeight: .infinity)
                    case .Message:
                        Text("Message")
                            .frame(maxHeight: .infinity)
                    }
                    
                    HStack {
                        tabBarItem(.Home)
                        Spacer()
                        tabBarItem(.Search)
                        Spacer()
                        tabBarItem(.Notification)
                        Spacer()
                        tabBarItem(.Message)
                    }
                    .padding()
                    .frame(width: screenWidth())
                    
                }
            }
            .frame(width: homeWidth)
            .frame(maxHeight: .infinity)
            .offset(x: sideBarCloseOffset)
            .offset(x: isShowSideBar ? sideBarWidth : 0)
            .offset(x: dragOffset)
            .animation(.spring(response: 0.4,dampingFraction: 1,blendDuration: 0.5))
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { gestureState, currentState, _ in
                        if gestureState.translation.width > 0 {
                            guard !isShowSideBar else { return }
                            currentState = gestureState.translation.width
                        }
                        
                        if gestureState.translation.width < 0 {
                            guard isShowSideBar else { return }
                            currentState = gestureState.translation.width
                        }
                    })
                    .onEnded({ value in
                        changeShowSideBar(value.translation.width > 0)
                    })
            )
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }
        
    }
    
    func changeShowSideBar(_ show: Bool) {
        guard isShowSideBar != show else { return }
        isShowSideBar = show
    }
    
    enum Tab: Int {
        case Home = 0
        case Search
        case Notification
        case Message
    }
    
    @ViewBuilder
    func tabBarItem(_ tab: Tab) -> some View {
        switch tab {
        case .Home:
            Image(systemName: "house.fill").font(.title3).onTapGesture { self.selectedTab = .Home }
        case .Search:
            Image(systemName: "magnifyingglass").font(.title3).onTapGesture { selectedTab = .Search }
        case .Notification:
            Image(systemName: "bell").font(.title3).onTapGesture { selectedTab = .Notification }
        case .Message:
            Image(systemName: "envelope").font(.title3).onTapGesture { selectedTab = .Message }
        }
    }
    
}



