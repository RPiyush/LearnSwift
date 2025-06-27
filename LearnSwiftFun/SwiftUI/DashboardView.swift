//
//  DashboardView.swift
//  LearnSwiftFun
//
//  Created by Piyush Rathi on 20/06/25.
//

import SwiftUI

struct DashboardView: View {
    let items = ["Apple", "Banana", "Orange", "Grapes x"]

    @State private var selectedItem: String? = nil
    @State private var navigate = false
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack(alignment: .top) {
                    Image("dashbackground")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .padding(.top, 0)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        // Top View
                        HStack(alignment: .top) {
                            VStack(spacing: 8) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.16, height: geo.size.width * 0.16)
                                
                                Text("Learn Swift")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .frame(height: geo.size.width * 0.5)
                        
                        List(items, id: \.self) { item in
                            HStack {
                                Text(item)
                                    .padding(.leading, 0)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .padding()
                            }
                            
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedItem = item
                                if item == "Apple" {
                                    navigate = true
                                } else {
                                    showAlert = true
                                }
                            }
                        }
                        .frame(maxWidth: geo.size.width)
                    }
                    
                    // Floating Button
                    HStack() {
                        Spacer()
                        Button(action: { }) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .padding()
                                .background(Circle().fill(.red))
                        }
                    }
                    .frame(maxWidth: geo.size.width)
                    .frame(maxHeight: geo.size.height * 0.55)
                    .padding(.trailing, 50)
                }

                .navigationDestination(isPresented: $navigate) {
                    SwiftUIView()
                }
                
                .alert("No view defined for \(selectedItem ?? "")", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
                
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    DashboardView()
}
