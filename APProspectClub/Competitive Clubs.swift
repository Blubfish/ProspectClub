//
//  Competitive Clubs.swift
//  APProspectClub
//
//  Created by Patryk Moczydlowski on 1/9/24.
//

import SwiftUI

struct Competitive_Clubs: View {
    @ObservedObject var database = Database()
    var body: some View {
            NavigationStack {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.blue, .cyan]),
                                   startPoint: .leading, endPoint: .trailing)
                    .edgesIgnoringSafeArea(.all)
                    ScrollView{
                        VStack {
                            Text("Competitive Clubs")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .heavy, design: .default))
                            
                            Image("comp")
                                               .resizable()
                                               .aspectRatio(contentMode: .fit)
                                               .frame(width: 150, height: 150)
                            Spacer()
                            ForEach(database.list) { data in
                                if data.Competitve == true{
                                    Spacer(minLength: 25)
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
                                                    .font(.system(size: 20, weight: .light))
                                                    .foregroundColor(Color.white)
                                                    .frame(width: 350)
                                                    .multilineTextAlignment(.center)
                                                Text("Sponsor: " + data.Sponsor)
                                                    .font(.system(size: 20, weight: .bold))
                                                    .foregroundColor(Color.white)
                                                    .padding()
                                                Text("Email: " + data.Email)
                                                    .font(.system(size: 20, weight: .bold))
                                                    .foregroundColor(Color.white)
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
                                    .font(.system(size: 20, weight: .medium, design: .default))
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


