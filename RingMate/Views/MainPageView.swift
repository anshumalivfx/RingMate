//
//  MainPageView.swift
//  RingMate
//
//  Created by Anshumali Karna on 03/03/23.
//

import SwiftUI

import SwiftUI

var screen = NSScreen.main!.visibleFrame
struct MainPageView: View {
    @StateObject var chatData = ChatViewModel()
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                TabButton(image: "message", title: "Chats", selectedTab: $chatData.selectedTab)
                TabButton(image: "circle.dashed.inset.filled", title: "Status", selectedTab: $chatData.selectedTab)
                TabButton(image: "person.3", title: "Community", selectedTab: $chatData.selectedTab)
                
                Spacer()
                
                TabButton(image: "gear", title: "Settings", selectedTab: $chatData.selectedTab)
            }
            .padding()
            .padding(.top, 35)
            .background(BlurView())
            
            ZStack {
                switch chatData.selectedTab {
                case "Chats": NavigationView {
                    ChatsView()
                }
                .background(.thinMaterial)
                

                case "Status": StatusView()
                case "Community": CommunityView()
                case "Settings": SettingsView()
                default:
                    Text("Default")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
            .ignoresSafeArea(.all, edges: .all)
            .frame(width: screen.width / 1.2, height: screen.height - 60)
            .environmentObject(chatData)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}


#if os(macOS)
extension View {
    func navigationBarTitle(_ title: Text) -> some View {
        return self
    }
}
#endif
