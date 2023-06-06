//
//  DogCell.swift
//  PuppyParse
//
//  Created by Kobe Petrus on 6/5/23.
//
import SwiftUI

struct DogCell: View {
    let breed: String
    let subBreed: String?
    @State private var isStarred: Bool = false

    var body: some View {
        ZStack {
            ZStack{
                Image("dog_paw")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 200)
                    .cornerRadius(15)
                    .background(Color.tan).cornerRadius(20)

                if let subBreed = subBreed {
                    Text("\(subBreed.capitalized)" + " \(breed.capitalized)")
                        .font(.custom("HelloValentica-Regular", size: 30))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                } else {
                    Text("\(breed.capitalized)")
                        .font(.custom("HelloValentica-Regular", size: 30))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                }
                Image(systemName: isStarred ? "star.fill" : "star")
                    .onTapGesture {
                        self.isStarred.toggle()
                        
                    }
                    .offset(x: 175, y: 75)

            }
        }
    }
}

struct DogCell_Previews: PreviewProvider {
    static var previews: some View {
        DogCell(breed: "greyhound", subBreed: "italian")
            .previewLayout(.sizeThatFits)
    }
}

