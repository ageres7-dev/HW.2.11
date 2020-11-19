//
//  CharactersTableViewController.swift
//  HW.2.10
//
//  Created by Сергей on 14.11.2020.
//

import UIKit



class CharactersTableViewController: UITableViewController {
    
    private var characters: Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacters(from: StatusCharacter.alive.rawValue)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters?.results.count ?? 0

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "character", for: indexPath) as! CharacterTableViewCell
// переделать
        let person = (characters?.results[indexPath.row])!
        cell.configure(with: person)
        return cell
    }
    
    @IBAction func actionSegmentedControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0: fetchCharacters(from: StatusCharacter.alive.rawValue)
        case 1: fetchCharacters(from: StatusCharacter.dead.rawValue)
        default: fetchCharacters(from: StatusCharacter.unknown.rawValue)
        }
    }
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as! DetailsViewController
        guard let indexPath = tableView.indexPathForSelectedRow else
        { return }
        detailsVC.characterInfo = characters?.results[indexPath.row]
    }
    
}


extension CharactersTableViewController {
   
    func fetchCharacters(from url:String) {
        NetworkManager.shared.fetchData(from: url) { response in
            self.characters = response
            self.tableView.reloadData()
        }
    }
    
  /*
    func fetchCharacters(from url:String) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    self.characters = Response.getResponse(from: value)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    */
    
}
    
    
    
    /*
    
    private func fetchCharacters(from url:String) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                
                case .success(let value):
                    
                
                    
    
                    
//                   let tet = Info.getResult(from: value)!
//                    print(tet)
                    
                    
//                    guard let value = value as? [String: Any] else { return }
//                    guard let info = value["info"] as? [String: Any] else { return }
//                    print(info)
                    
                  
//                    print(Character.getResult(from: value)!)
//                    self.characters = Character.getResult(from: value)!
//                        ?? Character(results: [])
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        
        */
        
        
        
        /*
        URLSession.shared.dataTask(with: url) { [self] (data, _, error) in
            
            if let error = error {
                print(error)
            }
            guard let data = data else { return }
            do {
                self.characters = try JSONDecoder().decode(Character.self, from: data)
                print(data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
        */

    

