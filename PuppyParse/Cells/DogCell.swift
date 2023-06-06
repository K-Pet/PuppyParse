//
//  DogCell.swift
//  PuppyParse
//
//  Created by Kobe Petrus on 6/5/23.
//

import SwiftUI

struct DogCell: View {
    let breed : String
        
    var body: some View {
        Text("\(breed)")
            .fontWeight(.semibold)
    }
}

