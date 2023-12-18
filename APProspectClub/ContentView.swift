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
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .cyan]),
                           startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("PHS Clubs")
                    .foregroundColor(.black)
                    .font(.system(size: 70, weight: .heavy, design: .default))
                    .offset(y: -150)
                
                Image("PHS")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .offset(y: -180)
                    .offset(x: -20)
            }
            .padding()
            .onAppear() {
                self.database.getData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
