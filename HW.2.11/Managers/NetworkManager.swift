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
        
//        func fetchCharacters(from url:String) {
            AF.request(urlString)
                .validate()
                .responseJSON { dataResponse in
                    switch dataResponse.result {
                    case .success(let value):
//                        self.characters = Response.getResponse(from: value)
                        let response = Response.getResponse(from: value)
                        DispatchQueue.main.async {
//                            self.tableView.reloadData()
                            complition(response)
                        }
                        
                    case .failure(let error):
                        print(error)
                    }
                }
//        }
        
        
        
        /*
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let character = try JSONDecoder().decode(Character.self, from: data)
                DispatchQueue.main.async {
                    complition(character)
                }
            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
            
        }.resume()
        
        */
        
        
    }
}







class ImageManager {
    static let shared = ImageManager()
    private init() {}
    
    //не смог понять в чем проблема
    func fetchImage(url: String) -> Data? {
        var result: Data?
        guard let url = URL(string: url) else { return nil }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print(error)
                return
            }
            result = data
        }
        return result
    }
    
}




