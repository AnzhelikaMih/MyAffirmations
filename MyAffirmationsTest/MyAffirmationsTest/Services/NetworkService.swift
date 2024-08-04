//
//  NetworkService.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 3.08.24.
//

import Foundation

protocol NetworkServiceProtocol {
    func loadData(completion: @escaping (AffirmationsModel?) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func loadData(completion: @escaping (AffirmationsModel?) -> Void) {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/AnzhelikaMih/API-flights/main/AffirmationsAPI.json")
        else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do {
                let phrasesListData = try JSONDecoder().decode(AffirmationsModel.self, from: data)
                DispatchQueue.main.async {
                    completion(phrasesListData)
                }
            } catch {
                print("JSON decoding error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}
