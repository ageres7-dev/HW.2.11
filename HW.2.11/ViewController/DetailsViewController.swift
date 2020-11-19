//
//  DetailsViewController.swift
//  HW.2.10
//
//  Created by Сергей on 15.11.2020.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var characterPhoto: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var infoLabels: [UILabel]!
    
    var characterInfo: Result!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = characterInfo.name
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        fetchImage()
        setInfoLabels()
        
    }
    
    override func viewDidLayoutSubviews() {
        characterPhoto.layer.cornerRadius = characterPhoto.frame.width / 2
    }
    
    private func setInfoLabels() {
        infoLabels.forEach { (label) in

            switch label.tag {
            case 0: label.text = "Status: \(characterInfo.status ?? "" )"
            case 1: label.text = "Species: \(characterInfo.species ?? "" )"
            case 2: label.text = "Type: \(characterInfo.type ?? "" )"
            case 3: label.text = "Gender: \(characterInfo.gender ?? "" )"
            case 4: label.text = "Origin location:\n\(String(describing: characterInfo.origin?.name) )"
            default: label.text =
                "Last known location endpoint:\n\(characterInfo.location?.name ?? "" )"
            }
        }
    }
    
    
     private func fetchImage() {
        
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.characterInfo.image) else { return }
            DispatchQueue.main.async {
                self.characterPhoto.image = UIImage(data: imageData)
                self.activityIndicator.stopAnimating()
            }
        }
     }
    
}
