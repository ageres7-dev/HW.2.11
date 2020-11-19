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





/*
struct Character: Decodable {
    var info: Info?
    var results: [Results]?
    
    init(characterData: [String: Any]) {
        results = characterData["results"] as? [Results]
        info = characterData["info"] as? Info
     
    }
    
    init(results: [Results]?, info: Info) {
        self.results = results
        self.info = info
    }
    
    static func getResult(from value: Any) -> [Character]? {
        guard let resultsData = value as? [[String: Any]] else { return nil }
//        print(resultsData)
//        return  Character(characterData: resultsData)
        return resultsData.compactMap { Character(characterData: $0) }
    }
    
}

struct Results: Decodable {
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin?
    let location: Location?
    let image: String?
    
    init(name: String, status: String, species: String, type: String, gender: String, origin: Origin, location: Location, image: String ) {
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
    }
    
    init(resultData: [String: Any]) {
//        resultData[
        
        name = resultData["name"] as? String
        status = resultData["status"] as? String
        species = resultData["species"] as? String
        type = resultData["type"] as? String
        gender = resultData["gender"] as? String
        origin = resultData["origin"] as? Origin
        location = resultData["location"] as? Location
        image = resultData["image"] as? String
    }
    
    static func getResult(from value: Any) -> [Results]? {
        guard let allData = value as? [[String: Any]] else { return nil }
        
        guard let characters = value as? [String: Any] else { return nil }
        let results = characters["results"] as? [[String: Any]]
        
        
        
//        let results = resultsData["results"] as? [[String: Any]]
        return results!.compactMap { Results(resultData: $0) }
    }

}

struct Info: Decodable {
    var count: Int? = 0
    var pages: Int? = 0
    var next: String? = ""
    var prev: String? = ""
    
    init(infoData: [String: Any]) {
        count = infoData["count"] as? Int
        pages = infoData["pages"] as? Int
        next = infoData["next"] as? String
        prev = infoData["prev"] as? String
        
    }
    init() {}
    
    
    static func getResult(from value: Any) -> Info? {
        guard let value = value as? [String: Any] else { return nil }
        guard let info = value["info"] as? [String: Any] else { return nil }
        return  Info(infoData: info)
    }
}

struct Origin: Decodable {
    let name: String?
//    init(originData: [String: Any]) {
//        name = originData["name"] as? String
//    }
}

struct Location: Decodable {
    let name: String?
    let type: String?
    let dimension: String?
    
//    init(locationData: [String: Any]) {
//        name = locationData["name"] as? String
//        type = locationData["type"] as? String
//        dimension = locationData["dimension"] as? String
//    }
}
*/
