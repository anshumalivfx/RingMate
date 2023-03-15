//
//  LoginPageView.swift
//  RingMate
//
//  Created by Anshumali Karna on 25/02/23.
//

import SwiftUI

struct LoginPageView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var showReg: Bool = false
    @State var alertIsOn: Bool = false
    @State var alertError: String = ""
    @State var isLoading:Bool = false
    @State var loginSuccess: Bool = false
    @State var mainPage: Bool = false
    @AppStorage("isLoggedIn") var isLoggedIn = false
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $password)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
                
            
            Button {
                isLoading = true
                loginUser(username: username, password: password) { authdata, error in
                    if let error = error  {
                        alertIsOn = true
                        alertError = error.localizedDescription
                        isLoading = false
                    }
                    if let authdata = authdata {
                        isLoggedIn = true
                        isLoading = false
                    }
                }
            } label: {
                if isLoading {
                    ProgressView()
                }
                else {
                    Text("Login")
                }
                
                
            }.buttonStyle(.borderedProminent)
            
            
            Button {
                showReg = true
            } label: {
                Text("Register")
            }.buttonStyle(.link)


        }
        .alert(isPresented: $alertIsOn, content: {
            Alert(title: Text(alertError))
        })
        .sheet(isPresented: $showReg, content: {
            RegistrationView()
        })
        .frame(width: 300, height: 500,
                alignment: .center)
        
        .background(BlurView())
        
        
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
