//
//  ContentView.swift
//  APProspectClub
//
//  Created by Gia Bao Ta on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var database = Database()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world")
        }
        .padding()
        .onAppear() {
            self.database.getData()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

