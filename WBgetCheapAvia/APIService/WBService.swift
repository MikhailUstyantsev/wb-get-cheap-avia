//
//  APIService.swift
//  WBgetCheapAvia
//
//  Created by Mikhail Ustyantsev on 18.09.2023.
//

import Foundation

final class WBService {

    static let instance = WBService()
    
    func getCheapFlights(completion: @escaping (Result<Flights, Error>) -> Void) {
        guard let url = URL(string: "https://vmeste.wildberries.ru/stream/api/avia-service/v1/suggests/getCheap") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "startLocationCode": "LED"
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            print("Error serializing parameters: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            guard response.statusCode == 200 else {
                print("HTTP response error: \(response.statusCode)")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Flights.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
                print("Error parsing JSON: \(error)")
            }
        }
        
        task.resume()
    }

    
}
