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
    

    
    var filteredClub : [Clubs]{
        guard !searchTerm.isEmpty else {return database.list}
        return database.list.filter {$0.ClubName.localizedCaseInsensitiveContains(searchTerm)}
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .cyan]),
                               startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack {
                        Spacer()
                        Text("PHS Clubs")
                            .foregroundColor(.white)
                            .font(.system(size: 70, weight: .heavy, design: .default))
                        
                        
                        Image("PHS")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 6)
                        Spacer(minLength: 75)
                            ForEach(filteredClub) { data in
                                NavigationLink{
                                    ZStack {
                                        LinearGradient(gradient: Gradient(colors: [.blue, .cyan]),
                                                       startPoint: .leading, endPoint: .trailing)
                                        .edgesIgnoringSafeArea(.all)
                                        VStack{
                                            Text(data.ClubName)
                                                .font(.system(size: 40, weight: .bold))
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.center)
                                                .padding()
                                            Text(data.ClubDescription)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.center)
                                            Text(data.Sponser)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.white)
                                                .padding()
                                        }
                                    }
                                }
                                label: {
                                    Text(data.ClubName)
                                }
                                
                            }.listRowBackground(Color.blue)
                                .foregroundColor(Color.white)
                                .font(.system(size: 20, weight: .heavy, design: .default))
                            

                        }
                    }
                    .padding()
                    .onAppear() {
                        self.database.getData()
                    }
                    .searchable(text: $searchTerm, prompt: "Search Clubs")
                    .foregroundColor(.black)
                }
            }
        }
            
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

