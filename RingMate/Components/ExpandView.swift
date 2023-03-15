//
//  ExpandView.swift
//  WhatsApp Messenger
//
//  Created by Anshumali Karna on 29/12/22.
//

import SwiftUI

struct ExpandView: View {
    @EnvironmentObject var chatData : ChatViewModel
    var user: RecentChats
    var body: some View {
        HStack {
            Divider()
            
            VStack(spacing: 25) {
                Image(user.userImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .padding(.top, 35)
                
                Text(user.userName)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(user.userPhone)
                    .font(.title3)
                    .fontWeight(.light)
                VStack{
                    
                    
                    HStack {
                        Text("About: ")
                            .font(.body)
                            .fontWeight(.regular)
                        Spacer()
                        
                        
                    }
                    Text("No Calls only CrapApp")
                        .font(.caption)
                        .fontWeight(.medium)
                }
                .padding()
                .background(Color.primary.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
                
                HStack {
                    Button {
                        
                    } label: {
                        
                        VStack {
                            if #available(macOS 13.0, *) {
                                Image(systemName: "nosign")
                                    .font(.title2)
                                    .fontWeight(.bold)
                            } else {
                                // Fallback on earlier versions
                            }
                            Text("Block")
                        }
                        .foregroundColor(.red)
                        
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        VStack {
                            if #available(macOS 13.0, *) {
                                Image(systemName: "hand.thumbsdown")
                                    .font(.title2)
                                    .fontWeight(.bold)
                            } else {
                                // Fallback on earlier versions
                            }
                            Text("Report")
                        }
                        .foregroundColor(.red)
                        
                        
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        VStack {
                            Image(systemName: "trash")
                                .font(.title2)
                            Text("Delete")
                        }
                        .foregroundColor(.red)
                        
                    }
                    .buttonStyle(.plain)
                    

                }
                
                Picker(selection: $chatData.pickedSelection) {
                    Text("Media")
                        .tag("Media")
                    
                    Text("Docs")
                        .tag("Docs")
                    Text("Link")
                        .tag("Link")
                } label: {
                    Text("Picker")
                }
                .pickerStyle(.segmented)
                .labelsHidden()
                .padding(.vertical)

                ScrollView {
                    if chatData.pickedSelection == "Media"{
                        
                    }
                    
                    else {
                        withAnimation {
                            Text("No \(chatData.pickedSelection)")
                        }
                        .animation(.linear, value: 10)
                        
                    }
                }
                
                Spacer()
                
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            
        }
    }
}

