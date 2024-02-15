//
//  ContentView.swift
//  APProspectClub
//
//  Created by Gia Bao Ta on 12/14/23.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

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
                        Text("PHS CLUBS")
                            .foregroundColor(.white)
                            .font(.system(size: 50, weight: .heavy, design: .default))
                        Image("home")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 205, height: 205)
                            .multilineTextAlignment(.center)
                            .offset(x:-13)
                            .shadow(radius: 6)
                           
                        Spacer(minLength: 75)
                        NavigationLink(destination: {
                            Non_Competitive_Clubs()
                        }, label: {
                            Text("Non Competitive Clubs")
                                .foregroundColor(.white)
                                .frame(width: 220, height: 20)
                                .padding(.vertical)
                                .padding(.horizontal, 10)
                                .background(.blue)
                                .cornerRadius(10)
                                .font(.system(size: 20, weight: .bold))
                                .multilineTextAlignment(.center)
                                .buttonStyle(GrowingButton())
                        })
                        NavigationLink(destination: {
                            Competitive_Clubs()
                        }, label: {
                            Text("Competitive Clubs")
                                .foregroundColor(.white)
                                .frame(width: 220, height: 20)
                                .padding(.vertical)
                                .padding(.horizontal, 10)
                                .background(.blue)
                                .cornerRadius(10)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color.teal)
                                .multilineTextAlignment(.center)
                                .buttonStyle(GrowingButton())
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
                                                .font(.system(size: 20, weight: .light))
                                                .foregroundColor(Color.white)
                                                .frame(width: 350)
                                                .multilineTextAlignment(.center)
                                            Text(data.Sponsor)
                                                .font(.system(size: 20, weight: .light))
                                            Text("Sponsor: " + data.Sponsor)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.white)
                                                .padding()
                                            Text("Email: " + data.Email)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.white)
                                            if data.Competitve == true{
                                                Text("Competitive")
                                                    .font(.system(size: 20, weight: .medium))
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
