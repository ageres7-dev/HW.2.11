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
        characters?.results?.count ?? 0

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "character", for: indexPath) as! CharacterTableViewCell

        let person = (characters?.results?[indexPath.row])!
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
        detailsVC.characterInfo = characters?.results?[indexPath.row]
    }
    
}


extension CharactersTableViewController {
   
    func fetchCharacters(from url:String) {
        NetworkManager.shared.fetchData(from: url) { response in
            self.characters = response
            self.tableView.reloadData()
        }
    }
}
    
