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
        guard (listOfPictures?.count != 0) else { return title = "A Beautiful Picture" }
        if let picturesAreSet = listOfPictures, let image = selectedImage {
            let index = listOfPictures?.firstIndex(of: image)
            if let indexIsKnown = index {
                title = "Picture \(indexIsKnown + 1) out of \(picturesAreSet.count)"
            }
        }
    }
}
