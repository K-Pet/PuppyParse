//
//  ContentView.swift
//  PuppyParse
//
//  Created by Kobe Petrus on 6/5/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var nc = NetworkCollar()

    var body: some View {
        NavigationView{
            ZStack {
                if nc.isRefreshing {
                    ProgressView()
                } else {
                    List {
                        ForEach(nc.dogs.keys.sorted(), id: \.self) { key in
                            if let values = nc.dogs[key], !values.isEmpty {
                                ForEach(values, id: \.self) { value in
                                    NavigationLink(destination: DogDetailView(breed: key, subBreed: value)) {
                                        DogCell(breed: value + " " + key)
                                    }
                                }
                            } else {
                                NavigationLink(destination: DogDetailView(breed: key, subBreed: nil)) {
                                    DogCell(breed: key)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("PuppyParse")
                }
            }
        }
        .onAppear {
            nc.fetchDogData(endpoints: .breeds)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
