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
        ZStack{
            Image("dashbackground").resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .padding(.top, -80)
            VStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                            .padding(.top, 20)
                            .padding(.leading, -180)
                    Text("Learn Swift")
                    .padding(.leading, -180)
                Spacer()

                    }
            VStack {
                List(items, id: \.self) { item in
                    HStack {
                        Text(item)
                            .padding(.leading, 10)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .padding(.trailing, 20)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedItem = item
                        if item == "Apple" {
                            navigate = true
                        }
                    }
                    .alert("No view defined for \(selectedItem ?? "")", isPresented: $showAlert) {
                        Button("OK", role: .cancel) {}
                    }
                    .navigationDestination(isPresented: $navigate) {
                       if let item = selectedItem {
                           clickedButtonAction(item: item)
                       }
                    }
                }
                .frame(height: UIScreen.main.bounds.height / 2 + 100)
                .padding(.top, 250)

            }
            HStack{
                Button(action: {}) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(Color.red))
                        .padding(.top, -180)
                        .padding(.leading, UIScreen.main.bounds.width - 100)
                }
            }
            .background(.cyan)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func clickedButtonAction(item: String) -> some View {
        if item == "Apple" {
            return AnyView(SwiftUIView())
        } else {
            return AnyView(EmptyView())
        }
    }
}

#Preview {
    DashboardView()
}
