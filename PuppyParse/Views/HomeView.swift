//
//  ContentView.swift
//  PuppyParse
//
//  Created by Kobe Petrus on 6/5/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var nc = NetworkCollar()
    @State private var searchText = ""


    var body: some View {
        NavigationView{
            VStack {
                Text("Puppy Parse")
                    .font(.custom("HelloValentica-Regular", size: 40))
                    .padding()
                
                ZStack {
                    if nc.isRefreshing {
                        LottieView(name: "127157-moody-dog", loopMode: .loop)
                            .scaleEffect(0.3)
                    } else {
                        List {
                            ForEach(searchResults, id: \.0) { (key, values) in
                                if !values.isEmpty {
                                    ForEach(values, id: \.self) { value in
                                        ZStack {
                                            NavigationLink(destination: DogDetailView(breed: key, subBreed: value)) {
                                                EmptyView()
                                            }
                                            .opacity(0.0)
                                            
                                            DogCell(breed: key.capitalized, subBreed: value.capitalized)
                                        }
                                    }
                                } else {
                                    ZStack {
                                        NavigationLink(destination: DogDetailView(breed: key, subBreed: nil)) {
                                            EmptyView()
                                        }
                                        .opacity(0.0)
                                        
                                        DogCell(breed: key.capitalized, subBreed: nil)
                                    }
                                }
                            }.listRowSeparator(.hidden)
                        }
                        
                        .listStyle(.plain)
                        .searchable(text: $searchText)
                    }
                }
            }
        }
        .onAppear {
            nc.fetchDogData(endpoints: .breeds)
        }
    }
    
    var searchResults: [(String, [String])] {
        if searchText.isEmpty {
            return Array(nc.dogs)
        } else {
            let lowercaseSearchText = searchText.localizedLowercase
            return Array(nc.dogs).compactMap { key, values in
                let matchingSubBreeds = values.filter { $0.localizedLowercase.contains(lowercaseSearchText) }
                if key.localizedLowercase.contains(lowercaseSearchText) || !matchingSubBreeds.isEmpty {
                    return (key, matchingSubBreeds)
                } else {
                    return nil
                }
            }
        }
    }

}




struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}

extension Color {
    static let tan = Color(red: 210 / 255, green: 180 / 255, blue: 140 / 255)
}
