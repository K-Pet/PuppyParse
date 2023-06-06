//
//  DogData.swift
//  PuppyParse
//
//  Created by Kobe Petrus on 6/5/23.
//

import SwiftUI

struct DogList: Decodable {
    let status: String
    let message: [String: [String]]
}
