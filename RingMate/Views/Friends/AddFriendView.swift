//
//  AddFriendView.swift
//  RingMate
//
//  Created by Anshumali Karna on 15/03/23.
//

import SwiftUI

struct AddFriendView: View {
    @State var searchText: String = ""
    @Environment(\.presentationMode) var presentationMode
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
        .frame(width: 500)
    }
}

struct AddFriendView_Previews: PreviewProvider {
    static var previews: some View {
        AddFriendView()
    }
}
