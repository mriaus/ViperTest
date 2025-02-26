//
//  ContentView.swift
//  ViperTest
//
//  Created by Marcos on 17/2/25.
//

import SwiftUI

struct ContentView: View {
    let router = NotesRouter()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
