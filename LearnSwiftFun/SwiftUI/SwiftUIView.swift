//
//  SwiftUIView.swift
//  LearnSwiftFun
//
//  Created by Piyush Rathi on 18/06/25.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image("logo")
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .padding(.top, -100)
                    .border(.red, width: 2)
            Text("LOGIN")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .padding(.top, -10)
            // Login Box
            VStack(spacing: 15) {
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(4)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(4)
                
                Button(action: {
                    // handle login
                    checkInput()
                }) {
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
                }
                .alert(alertMessage, isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
            .padding()
            .background(Color.gray.opacity(0.3))
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(.black, lineWidth: 1)
            )
            .padding(.horizontal, 20)
            .padding(.top, -10)
            .shadow(radius: 5)
        }
        .padding()
    }
    
    func checkInput() {
        if username.isEmpty {
            showAlert = true
            alertMessage = "Username is required"
        } else if password.isEmpty {
            showAlert = true
            alertMessage = "Password is required"
        }
    }
}

#Preview {
    SwiftUIView()
}
