//
//  RecievedFriendRequestsCard.swift
//  RingMate
//
//  Created by Anshumali Karna on 16/03/23.
//

import SwiftUI

struct RecievedFriendRequestsCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 100)
                .backgroundStyle(.primary)
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                    .clipShape(Circle())
                VStack {
                    Text("Friend Name")
                        .foregroundColor(.black)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        
                }.buttonStyle(.plain)
                
                Button {
                    
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                }.buttonStyle(.plain)

            }.padding()
        }
    }
}

struct RecievedFriendRequestsCard_Previews: PreviewProvider {
    static var previews: some View {
        RecievedFriendRequestsCard()
    }
}
