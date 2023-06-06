//
//  NetworkCollar.swift
//  PuppyParse
//
//  Created by Kobe Petrus on 6/5/23.
//

import Foundation

final class NetworkCollar: ObservableObject {
    
    @Published var dogs: [String: [String]] = [:]
    
    //takes in api endpoints and makes api call that returns data
    func fetchDogData(endpoints: [String]) {
        var baseURLString = "https://dog.ceo/api/"
        //for each endpoint add to the end of the base url string in order and add a slash for all becides last endpoint
        for endpoint in endpoints {
            if endpoint != endpoints.last{
                baseURLString = baseURLString + endpoint + "/"
            } else {
                baseURLString = baseURLString + endpoint
            }
        }
        
        if let url = URL(string: baseURLString) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in

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
                    print(dogs)
                    self?.dogs = dogs
                } catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }
        
    }

}
