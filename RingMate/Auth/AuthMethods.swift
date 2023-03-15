//
//  AuthMethods.swift
//  RingMate
//
//  Created by Anshumali Karna on 02/03/23.
//

import FirebaseAuth

func createUser(username: String, password: String, completion:@escaping (AuthDataResult?, (any Error)?) -> Void){
    Auth.auth().createUser(withEmail: username, password: password, completion: completion)
}

func loginUser(username: String, password: String, completion:@escaping (AuthDataResult?, (any Error)?) -> Void) {
    Auth.auth().signIn(withEmail: username, password: password, completion: completion)
}

