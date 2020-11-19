//
//  character.swift
//  HW.2.10
//
//  Created by Сергей on 14.11.2020.
//


struct Response {
    let info: Info
    let results: [Result]
    
    init(responseData: [String: Any]) {
        let infoData = responseData["info"] as! [String: Any]
        info = Info(infoData: infoData)
        
        let resultsData = responseData["results"] as! [[String: Any]]
        results = resultsData.compactMap { Result(resultData: $0)}
    }
    
    static func getResponse(from value: Any) -> Response? {
        guard let responseData = value as? [String: Any] else { return nil }
        return Response(responseData: responseData)
    }
}

// MARK: - Info
struct Info {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
    
    init(infoData: [String: Any]) {
        count = infoData["count"] as! Int
        pages = infoData["pages"] as! Int
        next = infoData["next"] as! String
        prev = infoData["prev"] as? String
    }
}

// MARK: - Result
struct Result {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    init(resultData: [String: Any]) {
        id = resultData["id"] as! Int
        name = resultData["name"] as! String
        status = resultData["status"] as! String
        species = resultData["species"] as! String
        type = resultData["type"] as! String
        gender = resultData["gender"] as! String
        
        let originData = resultData["origin"] as! [String: Any]
        origin = Location(locationData: originData)
        
        let locationData = resultData["location"] as! [String: Any]
        location = Location(locationData: locationData)
        
        image = resultData["image"] as! String
        episode = resultData["episode"] as! [String]
        url = resultData["url"] as! String
        created = resultData["created"] as! String
    }
}


// MARK: - Location
struct Location {
    let name: String
    let url: String
    
    init(locationData: [String: Any]) {
        name = locationData["name"] as! String
        url = locationData["url"] as! String
    }
}
