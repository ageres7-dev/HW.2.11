//
//  NetworkManager.swift
//  HW.2.10
//
//  Created by Сергей on 16.11.2020.
//

import Foundation
import Alamofire

enum StatusCharacter: String {
    case alive = "https://rickandmortyapi.com/api/character/?status=alive"
    case dead = "https://rickandmortyapi.com/api/character/?status=dead"
    case unknown =  "https://rickandmortyapi.com/api/character/?status=unknown"
}






class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from urlString: String, with complition: @escaping (Response?) -> Void) {
        
        AF.request(urlString)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let response = Response.getResponse(from: value)
                    DispatchQueue.main.async {
                        complition(response)
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}


class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}
