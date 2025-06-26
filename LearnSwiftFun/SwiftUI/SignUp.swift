//
//  SignUp.swift
//  LearnSwiftFun
//
//  Created by Piyush Rathi on 26/06/25.
//

import SwiftUI

struct SignUp: View {
    @State var fname: String = ""
    @State var lname: String = ""

    @State var username: String = ""
    @State var password: String = ""
    @State var cpassword: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Image("logo").resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
            Text("Create a new account")
            VStack(spacing: 30) {
                TextField("First Name", text: $fname)
                    .padding()
                    .background(.white)
                    .cornerRadius(4)
                TextField("Last Name", text: $lname)
                    .padding()
                    .background(.white)
                    .cornerRadius(4)
                TextField("Username", text: $username)
                    .padding()
                    .background(.white)
                    .cornerRadius(4)
                TextField("Password", text: $password)
                    .padding()
                    .background(.white)
                    .cornerRadius(4)
                TextField("Confirm Password", text: $cpassword)
                    .padding()
                    .background(.white)
                    .cornerRadius(4)
                
                Button(action: {
                    
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                        .fontWeight(.bold)
                }
            }
            .padding()
            .background(.gray.opacity(0.2))
            .padding(.horizontal, 20)
            .padding(.top, -10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    SignUp()
}
