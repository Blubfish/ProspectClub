//
//  Non-Competitive Clubs.swift
//  APProspectClub
//
//  Created by Patryk Moczydlowski on 1/9/24.
//

import SwiftUI

struct Non_Competitive_Clubs: View {
    @ObservedObject var database = Database()
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .cyan]),
                               startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack {
                        Text("Non-Competitive Clubs")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .heavy, design: .default))
                        
                        Spacer()
                        ForEach(database.list) { data in
                            if data.Competitve == false{
                                NavigationLink{
                                    ZStack {
                                        LinearGradient(gradient: Gradient(colors: [.blue, .cyan]),
                                                       startPoint: .leading, endPoint: .trailing)
                                        .edgesIgnoringSafeArea(.all)
                                        VStack{
                                            Text(data.Name)
                                                .font(.system(size: 40, weight: .bold))
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.center)
                                                .padding()
                                            Text(data.Description)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.center)
                                            Text(data.Sponsor)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.white)
                                                .padding()
                                        }
                                    }
                                }
                            label: {
                                Text(data.Name)
                            }
                        }
                            }
                                .listRowBackground(Color.blue)
                                .foregroundColor(Color.white)
                                .font(.system(size: 20, weight: .heavy, design: .default))
                        }
                    }
                    .padding()
                    .onAppear() {
                        self.database.getData()
                    }
        }
        .accentColor(.white)
    }
    .onAppear() {
        self.database.getData()
    }
    }
}

struct Non_Competitive_Clubs_Previews: PreviewProvider {
    static var previews: some View {
        Non_Competitive_Clubs()
    }
}
