//
//  SideMenu.swift
//  Twitter-Clone
//
//  Created by hardip gajera on 22/12/21.
//

import SwiftUI

struct SideMenu: View {
    
    @State private var isProfileShown: Bool = false
    
    var body: some View {
        HStack {
            VStack {
                
                ProfilePreviewView()
                
                ScrollView {
                    
                    VStack(alignment: .leading,spacing: 32) {
                        
                        Spacer().frame(height: 1)
                        
                        Group {
                            SideBarTab(name: "Profile", image: "person.crop.circle.fill")
                                .onTapGesture {
                                    isProfileShown.toggle()
                                }
                            
                            SideBarTab(name: "Lists", image: "list.bullet.rectangle.portrait")
                            
                            SideBarTab(name: "Topics", image: "chart.bar.doc.horizontal")
                            
                            SideBarTab(name: "Bookmarks", image: "bookmark")
                            
                            SideBarTab(name: "Moments", image: "bolt")
                            
                            SideBarTab(name: "Purchases", image: "cart")
                            
                            SideBarTab(name: "Monetization", image: "coloncurrencysign.circle")
                        }
                        
                        Group {
                            Divider()
                            
                            SideBarTab(name: "Twitter for Professionals", image: "brain.head.profile")
                            
                            Divider()
                            
                            SideBarTab(name: "Twitter Ads", image: "arrow.up.forward.app")
                            
                            Divider()
                            
                            SideBarTab(name: "Settings and privacy")
                            
                            SideBarTab(name: "Help Center")
                        }
                        
                    }.offset(y: -10)
                    
                }
                
                HStack {
                    Button {} label: {
                        Image(systemName: "lightbulb")
                    }
                    Spacer()
                    Button {} label: {
                        Image(systemName: "qrcode")
                    }
                }
                .padding()
                .foregroundColor(.primary)
                
            }
            
            Divider()
                .edgesIgnoringSafeArea(.all)
        }
        .frame(width: screenWidth() - 75)
        .overlay(
            NavigationLink(destination: ProfileView(), isActive: $isProfileShown, label: {
                EmptyView()
            })
        )
    }
    
    @ViewBuilder
    func SideBarTab( name: String, image: String? = nil) -> some View {
        HStack {
            Label {
                Text(name)
                    .font(.headline)
                    .padding(.horizontal, 4)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            } icon: {
                if let image = image {
                    Image(systemName: image)
                }
            }
            Spacer()
        }.padding(.horizontal)
    }
    
    
}



