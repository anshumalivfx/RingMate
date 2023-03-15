//
//  RegistrationView.swift
//  RingMate
//
//  Created by Anshumali Karna on 25/02/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

struct RegistrationView: View {
    @State var username:String = ""
    @State var password:String = ""
    @State var confirmPassword:String = ""
    @State var image:Image = Image(systemName: "person.circle")
    @State var showImagePicker: Bool = false
    
    @State var alertIsOn = false
    @State var alertError:String = "Unknown"
    
    @State var isLoading:Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            
            Button {
                showImagePicker = true
            } label: {
                image
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
            
            
            
            TextField("Email", text: $username)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $password)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
            SecureField("Confirm Password", text: $confirmPassword)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
            
            Button {
                isLoading = true
                
                if (image == Image(systemName: "person.circle")) {
                    alertIsOn = true
                    alertError = "You're too cute to hide your face, please select a profile picture"
                    isLoading = false
                }
                
                if (username == "") {
                    alertIsOn = true
                    alertError = "Fill your Username"
                    isLoading = false
                }
                
                if (password == "") {
                    alertIsOn = true
                    alertError = "Fill your Password"
                    isLoading = false
                }
                
                if (confirmPassword == "") {
                    alertIsOn = true
                    alertError = "Fill your Confirm Password"
                    isLoading = false
                }
                
                if (confirmPassword != password) {
                    alertIsOn = true
                    alertError = "Password doesn't match"
                    isLoading = false
                }
                
                else {
                    createUser(username: username, password: password) { authdata, error in
                        if let error = error {
                            alertIsOn = true
                            alertError = error.localizedDescription
                        }
                        
                        if let authdata = authdata {
                                // Convert the NSImage to a Data object
                            let imageData = ImageRenderer(content: image)
                            let imageMain = imageData.nsImage
                            guard let imageData = imageMain?.tiffRepresentation else { return }
                                let imageRef = Storage.storage().reference().child("userProfileImages").child("\(authdata.user.uid).jpg")

                                // Upload the image to Firebase Storage
                                imageRef.putData(imageData, metadata: nil) { (metadata, error) in
                                    if let error = error {
                                        print(error.localizedDescription)
                                        return
                                    }
                                    // Get the image download URL
                                    imageRef.downloadURL { (url, error) in
                                        if let error = error {
                                            print(error.localizedDescription)
                                            return
                                        }
                                        guard let url = url else { return }

                                        // Add the email and profile image download URL to FirebaseDatabase
                                        let userRef = Database.database().reference().child("users").child(authdata.user.uid)
                                        let userData = ["email": username, "profileImageUrl": url.absoluteString]
                                        userRef.setValue(userData)
                                    }
                                }
                            
                            self.presentationMode.wrappedValue.dismiss()
                            }
                        
                    }
                }
            } label: {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Register")
                }
            }.buttonStyle(.borderedProminent)
            
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("back to Login")
            }.buttonStyle(.link)
            
            
            
        }
        .alert(isPresented: $alertIsOn, content: {
            Alert(title: Text(alertError))
        })
        .popover(isPresented: $showImagePicker, content: {
            FileView(image: $image)
        })
        .frame(width: 300, height: 500,
               alignment: .center)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}






struct FileView: View {
    @Binding var image:Image
    var body: some View {
        Button("Select File") {
            let openPanel = NSOpenPanel()
            openPanel.prompt = "Select File"
            openPanel.allowsMultipleSelection = false
            openPanel.canChooseDirectories = false
            openPanel.canCreateDirectories = false
            openPanel.canChooseFiles = true
            openPanel.allowedFileTypes = ["png","jpg","jpeg"]
            openPanel.begin { (result) -> Void in
                if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                    let selectedPath = openPanel.url!.path
                    
                    image = Image(nsImage: NSImage(contentsOfFile: selectedPath)!)
                    
                }
            }
        }
    }
}
