//
//  ContentView.swift
//  RingMate
//
//  Created by Anshumali Karna on 25/02/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var username:String = ""
    var body: some View {
        LoginPageView()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
