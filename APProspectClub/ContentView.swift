//
//  ContentView.swift
//  APProspectClub
//
//  Created by Gia Bao Ta on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            LinearGradient(colors: [Color.cyan.opacity(0.7),Color.purple.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            Circle()
                .frame(width:300)
                .foregroundColor(Color.blue.opacity(0.3))
                .blur(radius: 10)
                .offset(x:-100, y: -100)
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .frame(width: 500, height:500)
                .foregroundColor(LinearGradient(colors: [Color.pruple.opacity(0.5)], startPoint: .top, endPoint: .leading))
                
            
            Text("PHS Clubs")
                .foregroundColor(.black)
                .font(.system(size: 70, weight: .heavy, design: .default))
                .offset(y:-150)
            
            Image("PHS")
                .resizable()
                .frame(width: 200, height: 200)
                .offset(y:-180)
                .offset(x:-20)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
