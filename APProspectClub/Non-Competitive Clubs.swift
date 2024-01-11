//
//  Non-Competitive Clubs.swift
//  APProspectClub
//
//  Created by Patryk Moczydlowski on 1/9/24.
//

import SwiftUI

struct Non_Competitive_Clubs: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .cyan]),
                           startPoint: .leading, endPoint: .trailing)
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Non-Competitive Clubs")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .heavy, design: .default))
                
                Spacer()
                
                
                
                
            }
            
            
            
            
            
        }
    }
}

struct Non_Competitive_Clubs_Previews: PreviewProvider {
    static var previews: some View {
        Non_Competitive_Clubs()
    }
}
