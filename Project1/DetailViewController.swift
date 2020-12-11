//
//  DetailViewController.swift
//  Project1
//
//  Created by Frank Solleveld on 09/12/2020.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var listOfPictures: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        guard (listOfPictures != nil) else {
            return title = "A Beautiful Picture"
        }
        setupTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func setupTitle(){
        if let picturesAreSet = listOfPictures, let image = selectedImage {
            let index = listOfPictures?.firstIndex(of: image)
            if let indexIsSet = index {
                title = "Picture \(indexIsSet + 1) out of \(picturesAreSet.count)"
            }
        }
    }
}
