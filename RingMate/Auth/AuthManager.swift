//
//  AuthManager.swift
//  RingMate
//
//  Created by Anshumali Karna on 03/03/23.
//

import FirebaseAuth
import Combine

class AuthManager: ObservableObject {
    @Published var currentUser: User?

    private var handle: AuthStateDidChangeListenerHandle?

    init() {
        handle = Auth.auth().addStateDidChangeListener { _, user in
            self.currentUser = user
        }
    }

    deinit {
        Auth.auth().removeStateDidChangeListener(handle!)
    }

    func signIn(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }
}
