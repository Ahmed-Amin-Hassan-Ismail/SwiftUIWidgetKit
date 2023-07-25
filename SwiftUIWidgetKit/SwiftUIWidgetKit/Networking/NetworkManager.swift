//
//  NetworkManager.swift
//  SwiftUIWidgetKit
//
//  Created by Ahmed Amin on 25/07/2023.
//

import Foundation


final class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL: String = "https://jsonplaceholder.typicode.com/"
    
    private init() { }
    
    func fetchRequest<T: Codable>(from endPoint: String) async throws -> T {
        lazy var stringURL = baseURL + endPoint
        
        guard let url = URL(string: stringURL) else {
            
            throw URLError(.badURL)
        }
        
        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            
            let result = try decoder.decode(T.self, from: data)
            
            return result
            
        } catch {
            
            throw URLError(.badServerResponse)
            
        }
    }
}
