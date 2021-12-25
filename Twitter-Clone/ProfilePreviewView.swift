//
//  ProfilePreviewView.swift
//  Twitter-Clone
//
//  Created by hardip gajera on 22/12/21.
//

import SwiftUI

struct ProfilePreviewView: View {
    
    @State private var isDetailShow: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                
                Group {
                    
                    HStack {
                        
                        Image(R.image.men1()!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .cornerRadius(30)
                            .onTapGesture {
                                isDetailShow.toggle()
                            }
                        
                        Spacer()
                        
                        Image(systemName: "person.crop.circle.badge.fill")
                            .font(.title3)
                        
                    }
                    
                    Text("Hardip Gajera")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("@hardip_gajera")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Button {
                        } label: {
                            Label {
                                Text("Following")
                                    .foregroundColor(.gray)
                            } icon: {
                                Text("291")
                            }
                        }
                        
                        Spacer().frame(width: 20)
                        
                        Button {
                        } label: {
                            Label {
                                Text("Followers")
                                    .foregroundColor(.gray)
                            } icon: {
                                Text("300")
                            }
                        }
                    }
                    .font(.caption)
                    .foregroundColor(.primary)
                    .padding(.vertical,4)
                    
                }.padding(.horizontal)
                
                Divider()
                    .shadow(color: .white, radius: 4, x: 0, y: 4)
                
            }
        }
        .overlay(
            NavigationLink(destination: ProfileView(), isActive: $isDetailShow, label: {
                EmptyView()
            })
        )
    }
}

