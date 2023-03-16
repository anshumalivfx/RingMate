//
//  SendFriendRequestView.swift
//  RingMate
//
//  Created by Anshumali Karna on 16/03/23.
//

import SwiftUI

struct SendFriendRequestView: View {
    @State var searchText: String = ""
    var body: some View {
        VStack {
            
            
            HStack {
                TextField("Enter Username", text: $searchText)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal)
            }
            
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "person.fill.badge.plus")
                    Text("Send Friend Request")
                }
            }
            .padding(.all)
        }
    }
}

struct SendFriendRequestView_Previews: PreviewProvider {
    static var previews: some View {
        SendFriendRequestView()
    }
}
