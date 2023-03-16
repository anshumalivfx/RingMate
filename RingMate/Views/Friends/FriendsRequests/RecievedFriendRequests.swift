//
//  RecievedFriendRequests.swift
//  RingMate
//
//  Created by Anshumali Karna on 15/03/23.
//

import SwiftUI

struct RecievedFriendRequests: View {
    var body: some View {
        VStack {
            List {
                RecievedFriendRequestsCard()
            }
        }
    }
}

struct RecievedFriendRequests_Previews: PreviewProvider {
    static var previews: some View {
        RecievedFriendRequests()
    }
}
