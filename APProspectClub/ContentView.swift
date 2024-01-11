//
//  ContentView.swift
//  APProspectClub
//
//  Created by Gia Bao Ta on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var database = Database()
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .cyan]),
                               startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("PHS Clubs")
                        .foregroundColor(.white)
                        .font(.system(size: 70, weight: .heavy, design: .default))
                        .offset(y: -150)
                    
                    Rectangle()
                        .frame(width: 100, height: 100)
                        
                    
                    Image("PHS")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 4)
                        .offset(y: -180)
                        .offset(x: -20)
                }
                .padding()
                .onAppear() {
                    self.database.getData()
                }
            }
        } .searchable(text: $searchTerm, prompt: "Search Clubs")
            .foregroundColor(.black)
            
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
