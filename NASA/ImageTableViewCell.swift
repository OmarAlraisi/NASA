//
//  ImageTableViewCell.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/11/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    // Connect UI Elements
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageDescription: UILabel!
    
    func configureCell (image : Images) {
        
        // Remove old image
        imageImageView.image = nil
        
        // Set the imageTitle
        imageTitle.text = image.title
        
        // Set imageDescription
        imageDescription.text = image.description
        
        // Set imageImageView
        // Cheack if there is an image link
        guard image.href != nil else {
            return
        }
        // Check if the image exists in the cache
        let cache = CacheManager()
        let myImage = cache.retrieveData(image.href!)
        if myImage != nil {
            
            imageImageView.image = UIImage(data: myImage!)
        }
        // Download Image
        else {
            
            // Create a URL
            let url = URL(string: image.href!)
            
            // Validate it
            guard url != nil else {
                return
            }
            
            // Create a session
            let session = URLSession.shared
            
            // Create a data task
            let dataTask = session.dataTask(with: url!) { (data, response, error) in
                
                // Check for errors and data
                guard error == nil && data != nil else {
                    return
                }
                
                // Add image data to the cache
                cache.storeData(image.href!, data!)
                // Set the imageImageView
                DispatchQueue.main.async {
                    self.imageImageView.image = UIImage(data: data!)
                }
            }
            
            // Resume data task
            dataTask.resume()
        }
    }

}
