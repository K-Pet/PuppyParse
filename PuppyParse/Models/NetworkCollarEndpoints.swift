//
//  NetworkCollarEndpoints.swift
//  PuppyParse
//
//  Created by Kobe Petrus on 6/5/23.
//

import Foundation

enum Endpoints {
    case breeds
    case random15ImagesBreed(breed: String)
    case random15ImagesSubBreed(breed: String, subBreed: String)
    case randomImageBreed(breed: String)
    case randomImageSubBreed(breed: String, subBreed: String)

    var url: String {
        switch self {
        case .breeds:
            return "https://dog.ceo/api/breeds/list/all"
        case .random15ImagesBreed(let breed):
            return "https://dog.ceo/api/breed/\(breed)/images/random/15"
        case .random15ImagesSubBreed(let breed, let subBreed):
            return "https://dog.ceo/api/breed/\(breed)/\(subBreed)/images/random/15"
        case .randomImageBreed(let breed):
            return "https://dog.ceo/api/breed/\(breed)/images/random"
        case .randomImageSubBreed(breed: let breed, subBreed: let subBreed):
            return "https://dog.ceo/api/breed/\(breed)/\(subBreed)/images/random"
        }
    }
}
