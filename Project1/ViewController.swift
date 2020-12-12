//
//  ViewController.swift
//  Project1
//
//  Created by Frank Solleveld on 09/12/2020.
//

import UIKit

class ViewController: UITableViewController {
    // MARK: -- Custom Variables
    var pictures = [String]()

    // MARK: -- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTheApp))
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        pictures = pictures.sorted(by: {$0 < $1})
    }
    
    // MARK: -- Custom Methods
    @objc func shareTheApp() {
        let text: String? = "Visit my website!"
        let url: URL? = URL(string: "https://devfrank.org")
        guard let safeText = text, let safeUrl = url else { return }
        let activityView = UIActivityViewController(activityItems: [safeText, safeUrl], applicationActivities: [])
        activityView.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityView, animated: true)
    }
    
    // MARK: -- Delegate Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.listOfPictures = pictures
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
