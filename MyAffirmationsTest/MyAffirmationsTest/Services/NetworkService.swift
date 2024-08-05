//
//  NetworkService.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 3.08.24.
//

import Foundation

// MARK: - NetworkServiceProtocol
protocol NetworkServiceProtocol {
    func loadData(completion: @escaping (AffirmationModel?) -> Void)
}

// MARK: - NetworkService
final class NetworkService: NetworkServiceProtocol {
    
    // MARK: - Methods
    func loadData(completion: @escaping (AffirmationModel?) -> Void) {
        
        guard let url = URL(string: NetworkConstants.baseURL)
        else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = NetworkConstants.httpMethod
        
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
                let phrasesListData = try JSONDecoder().decode(AffirmationModel.self, from: data)
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
