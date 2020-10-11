//
//  ImageLibraryViewController.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/7/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit

class ImageLibraryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    // Add UI elements
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButtonView: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // Create a model variable
    var model = Model()
    
    // Create a variable to hold the images
    var feed = [Images]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set model delegate to self
        model.delegate = self
        
        // Set tableView delegate and dataScource to self
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set search button corners
        searchButtonView.layer.cornerRadius = 10
    }
    
    @IBAction func searchButton(_ sender: Any) {
        
        // Set the Keyword for search
        Constants.SEARCH_KEYWORD = searchTextField.text!
        
        // Call the model method
        model.getImageCollecttion()
    }
    
    func getFeed(feed: [Images]) {
        self.feed = feed
        tableView.reloadData()
    }
    
    // MARK: - Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageTableViewCell
        
        // Configure it
        cell.configureCell(image: feed[indexPath.row])
        
        // Return it
        return cell
    }
    
}
