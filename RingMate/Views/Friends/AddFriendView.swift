//
//  AddFriendView.swift
//  RingMate
//
//  Created by Anshumali Karna on 15/03/23.
//

import SwiftUI

struct AddFriendView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var tabSelection = 0
    @State var frameHeight: CGFloat = 200
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                    
                }
                .buttonStyle(.plain)
                .padding(.all)
                
                Spacer()
                Text("Add Friends")
                Spacer()
            }
            
            TabView(selection: $tabSelection) {
                SendFriendRequestView()
                    .tabItem {
                        Text("Add New Friend")
                    }
                    .tag(1)
                RecievedFriendRequests()
                    .tabItem {
                        Text("Recieved Friend Requests")
                    }
                    .tag(2)
            }
            
            .tabViewStyle(.automatic)
            
            .animation(.easeInOut(duration: 0.2), value: tabSelection) // 2
                .transition(.slide)
                
        }
        .onChange(of: tabSelection) { newValue in
            switch(tabSelection){
            case 1:
                withAnimation(.easeInOut(duration: 0.2)) {
                    frameHeight = 200
                }
            case 2:
                withAnimation(.easeInOut(duration: 0.5)) {
                    frameHeight = 600
                }
            default:
                withAnimation(.easeInOut(duration: 0.5)) {
                    frameHeight = 200
                }
            }
            
        }
        .frame(width: 500,height: frameHeight)
        
    }
}

struct AddFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendView()
    }
}
