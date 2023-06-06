//
//  SplashScreenView.swift
//  PuppyParse
//
//  Created by Kobe Petrus on 6/6/23.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var pawSize = 0.1
    @State private var textSize = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive{
            HomeView()
        } else {
            VStack{
                ZStack{
                    Image("dog_paw")
                        .scaleEffect(pawSize)
                    Text("PuppyParse")
                        .font(.custom("HelloValentica-Regular", size: 30))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                        .shadow(color: .black, radius: 1)
                        .scaleEffect(textSize)
                }
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 2)){
                        self.pawSize = 0.3
                        self.textSize = 1.5
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation {
                        self.isActive = true
                    }
                }
        }
        
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
