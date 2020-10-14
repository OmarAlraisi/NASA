//
//  ViewController.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/7/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Link Button views to change the corners
    @IBOutlet weak var imageLibraryButtonView: UIButton!
    @IBOutlet weak var weatherOnMarsButtonView: UIButton!
    
    var tempModel = TempratureModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Change bottons corners
        imageLibraryButtonView.layer.cornerRadius = 30
        weatherOnMarsButtonView.layer.cornerRadius = 30
    }

}

