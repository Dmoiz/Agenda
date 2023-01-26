//
//  Network.swift
//  Agenda
//
//  Created by Diego Moreno on 12/1/23.
//

import SwiftUI

class NetworkHelper {
    
    enum RequestType: String {
        case POST
        case GET
    }
    
    // Singleton
    static let shared = NetworkHelper()

    // Comunicación con la Api
    private func requestApi(request: URLRequest, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        task.resume()
    }

    // Comunicación con la función requestApi, capa repository
    func requestProvider(url: String, type: RequestType = .POST, params: [String: Any]? = nil, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: url)
        guard let urlNotNil = url else { return }
        var request = URLRequest(url: urlNotNil)
        request.httpMethod = type.rawValue
        
        if let dictionary = params {
            let data = try! JSONSerialization.data(withJSONObject: dictionary, options: [])
            request.httpBody = data // Data que se envía en el cuerpo de la solicitud
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        requestApi(request: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, response, error)
            }
        }
    }
}
