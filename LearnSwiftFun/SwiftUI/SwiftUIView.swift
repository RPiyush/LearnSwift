//
//  SwiftUIView.swift
//  LearnSwiftFun
//
//  Created by Piyush Rathi on 18/06/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
                   Text("Hello from SwiftUI ViewController!")
                .font(.title).padding()
            
                   Image(systemName: "star.fill")
                       .font(.largeTitle)
                       .foregroundColor(.yellow)
               }
               .padding()
    }
}

#Preview {
    SwiftUIView()
}
