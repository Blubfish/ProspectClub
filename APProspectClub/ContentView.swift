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
    
    var filteredClub: [Clubs] {
        guard !searchTerm.isEmpty else {return database.list}
        return database.list.filter {$0.Name.localizedCaseInsensitiveContains(searchTerm)}
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
                        NavigationLink(destination: {
                            Non_Competitive_Clubs()
                        }, label: {
                            Text("Non Competitive Clubs")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .padding(.horizontal, 10)
                                .background(.blue)
                                .cornerRadius(10)
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                        })
                        NavigationLink(destination: {
                            Competitive_Clubs()
                        }, label: {
                            Text("Competitive Clubs")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .padding(.horizontal, 10)
                                .background(.blue)
                                .cornerRadius(10)
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                        })
                        ForEach(self.filteredClub) { data in
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
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.center)
                                            Text(data.Sponsor)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.white)
                                                .padding()
                                            if data.Competitve == true{
                                                Text("Competitive")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .foregroundColor(Color.white)
                                                    .padding()
                                            }else{
                                                Text("Non-Competitive")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .foregroundColor(Color.white)
                                                    .padding()
                                            }
                                            
                                        }
                                    }
                                }
                                label: {
                                    Text(data.Name)
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
                    .searchable(text: $searchTerm, prompt: "Search Clubs")
                    .foregroundColor(.white)
                }
        }
        .accentColor(.white)
    }
}
