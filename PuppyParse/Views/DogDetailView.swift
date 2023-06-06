//
//  DogDetailView.swift
//  PuppyParse
//
//  Created by Kobe Petrus on 6/5/23.
//

import SwiftUI
import Kingfisher

struct DogDetailView: View {
    
    @StateObject private var nc = NetworkCollar()
    let breed : String
    let subBreed : String?
    
    
    var body: some View {
        VStack {
            if let subBreed = subBreed {
                Text("\(subBreed.capitalized)" + " \(breed.capitalized)")
                    .font(.custom("HelloValentica-Regular", size: 30))
            } else {
                Text("\(breed.capitalized)")
                    .font(.custom("HelloValentica-Regular", size: 30))
            }
            ZStack {
                if breed == "whippet"{
                    Color.pink
                        .ignoresSafeArea()
                } else if breed == "greyhound" && subBreed == "italian"{
                    Color.purple
                        .ignoresSafeArea()
                }
                if nc.isRefreshing {
                    ProgressView()
                } else {
                    List {
                        ForEach(nc.pictures, id: \.self) { url in

                                KFImage(URL(string: url))
                                    .resizable()
                                    .scaledToFit()
                                    .listRowBackground(Color.clear)
                                    .cornerRadius(15)
                            
                        }.listRowSeparator(.hidden)
                    }
                    .scrollContentBackground(.hidden)
                    
                }
            }
            .onAppear{
                if let subBreed = subBreed {
                    nc.fetchDogPictures(endpoints: .random15ImagesSubBreed(breed: breed, subBreed: subBreed))
                } else {
                    nc.fetchDogPictures(endpoints: .random15ImagesBreed(breed: breed))
                }
                
            }
        }
        }
    }


struct DogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DogDetailView(breed: "greyhound", subBreed: "italian")
    }
}
