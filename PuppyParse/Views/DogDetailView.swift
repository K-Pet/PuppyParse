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
            ZStack {
                if breed == "whippet"{
                    Color.pink
                        .ignoresSafeArea()
                } else if breed == "greyhound" && subBreed == "italian"{
                    Color.purple
                        .ignoresSafeArea()
                }
                if nc.isRefreshing {
                    LottieView(name: "127157-moody-dog", loopMode: .loop)
                        .scaleEffect(0.3)
                } else {
                    List {
                        Section {
                            ForEach(nc.pictures, id: \.self) { url in

                                    KFImage(URL(string: url))
                                        .resizable()
                                        .scaledToFit()
                                        .listRowBackground(Color.clear)
                                        .cornerRadius(15)
                                        .shadow(color: .black, radius: 1)
                                        .shadow(color: .black, radius: 1)
                                        .shadow(color: .black, radius: 1)
                                        .shadow(color: .black, radius: 1)
                                
                            }.listRowSeparator(.hidden)
                        } header: {
                            if let subBreed = subBreed {
                                Text("\(subBreed.capitalized)" + " \(breed.capitalized)")
                                    .font(.custom("HelloValentica-Regular", size: 30))
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                    .textCase(nil)
                                    .shadow(color: .black, radius: 1)
                                    .shadow(color: .black, radius: 1)
                                    .shadow(color: .black, radius: 1)
                                    .shadow(color: .black, radius: 1)
                            } else {
                                Text("\(breed.capitalized)")
                                    .font(.custom("HelloValentica-Regular", size: 30))
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.center)
                                    .textCase(nil)
                                    .shadow(color: .black, radius: 1)
                                    .shadow(color: .black, radius: 1)
                                    .shadow(color: .black, radius: 1)
                                    .shadow(color: .black, radius: 1)
                            }                        }
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
