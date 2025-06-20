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
                }) {
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue)
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
}

#Preview {
    SwiftUIView()
}
