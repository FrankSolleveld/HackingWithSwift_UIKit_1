//
//  DetailViewController.swift
//  Project1
//
//  Created by Frank Solleveld on 09/12/2020.
//

/*
 CHALLENGE TIME
 - Add the image name to your shared items. activityItems is an array - you can add strings and other things freely.
 - Go back to project 1 and add a bar button item to the main view controller that recommends the app.
 - Go back to project 2 and add a right bar button item that shows their score when tapped.
 */

import UIKit

class DetailViewController: UIViewController {

    // MARK: -- IBOutlets
    @IBOutlet var imageView: UIImageView!
    
    // MARK: -- Custom Variables
    var selectedImage: String?
    var listOfPictures: [String]?
    
    // MARK: -- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
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
    
    // MARK: -- Custom Methods
    func setupTitle(){
        guard (listOfPictures?.count != 0) else { return title = "A Beautiful Picture" }
        if let picturesAreSet = listOfPictures, let image = selectedImage {
            let index = listOfPictures?.firstIndex(of: image)
            if let indexIsKnown = index {
                title = "Picture \(indexIsKnown + 1) out of \(picturesAreSet.count)"
            }
        }
    }
    
    @objc func shareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 1) else {
            print("No Image Found.")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
