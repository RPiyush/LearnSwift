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
                    NavigationLink(destination: clickedButtonAction(item: item)) {
                        HStack {
                            Text(item)
                                .padding(.leading, 10)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    .simultaneousGesture(TapGesture().onEnded({
                        if item != "Apple" {
                            showAlert = true
                            selectedItem = item
                        }
                    }))
                    .alert("No view defined for \(selectedItem ?? "")", isPresented: $showAlert) {
                        Button("OK", role: .cancel) {}
                    }
                }
                .navigationTitle("Fruits")
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
            }.background(.cyan)
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
