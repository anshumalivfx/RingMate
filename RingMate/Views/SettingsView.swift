//
//  SettingsView.swift
//  WhatsApp Messenger
//
//  Created by Anshumali Karna on 28/12/22.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = true
    var body: some View {
        Button {
            do {
                try Auth.auth().signOut()
                isLoggedIn = false
            } catch let error as NSError {
                NSLog("Error Signing in %@", error)
            }
        } label: {
            Text("Logout")
        }

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
