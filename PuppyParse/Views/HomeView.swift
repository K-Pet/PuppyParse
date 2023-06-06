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
                List {
                    ForEach(nc.dogs.keys.sorted(), id: \.self) { key in
                        DogCell(breed: key)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("PuppyParse")
            }
        }
        .onAppear {
            nc.fetchDogData(endpoints: ["breeds","list","all"])

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
