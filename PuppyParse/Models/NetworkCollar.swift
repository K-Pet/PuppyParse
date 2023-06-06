//
//  NetworkCollar.swift
//  PuppyParse
//
//  Created by Kobe Petrus on 6/5/23.
//

import Foundation

final class NetworkCollar: ObservableObject {
    @Published var pictures: [String] = []
    @Published var dogs: [String: [String]] = [:]
    @Published private(set) var isRefreshing = false
    
    //takes in api endpoints and makes api call that returns data
    func fetchDogData(endpoints: Endpoints) {
        
        isRefreshing = true
        
        if let url = URL(string: endpoints.url) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                
                DispatchQueue.main.async {
                    // Handle any errors
                    if let error = error {
                        print("❌ Network error: \(error.localizedDescription)")
                    }
                    
                    // Make sure we have data
                    guard let data = data else {
                        print("❌ Data is nil")
                        return
                    }
                    
                    let decoder = JSONDecoder()
                    do {
                        // Try to parse the response into our custom model
                        let response = try decoder.decode(DogList.self, from: data)
                        let dogs = response.message
                        self?.dogs = dogs
                    } catch {
                        print(error.localizedDescription)
                    }
                    do {
                        // Try to parse the response into our custom model
                        let response = try decoder.decode(DogPhotos.self, from: data)
                        let pictures = response.message
                        self?.pictures = pictures
                    } catch {
                        print(error.localizedDescription)
                    }
                    self?.isRefreshing = false
                }
                
            }.resume()
        }
        
    }

}

