//
//  NewMessageView.swift
//  RingMate
//
//  Created by Anshumali Karna on 15/03/23.
//

import SwiftUI

struct NewMessageView: View {
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
                Text("New Message")
                Spacer()
            }
            TextField(" 🔎 Search", text: $searchText)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)
            
            List {
                Text("Hello")
            }
            
        }
        .frame(width: 450, height: 600)
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
    }
}
