//
//  MarsViewController.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/14/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit

class MarsViewController: UIViewController, TempratureModelDelegate {

    // Link UI labels
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var aveLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    
    // Create a variable of TempratureModel type
    var tempModel = TempratureModel()
    
    // Create a tempratures array
    var tempratures = [Float]()
    
    // Create a timer variable
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Set the TempratureModelDelegate
        tempModel.delegate = self
        
        tempModel.getWeatherOnMars()
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(setLabels), userInfo: nil, repeats: true)
        
    }
    
    // Create a method to set the labels
    @objc func setLabels () {
        
        if tempratures.count == 3 {
            
            // Set dateLabel
            // Create a date variable
            let date = Date()
            let myDateFormat = DateFormatter()
            myDateFormat.dateFormat = "dd / MM / yyyy"
            let dateString = myDateFormat.string(from: date)
            
            dateLabel.text = "Date:  " + dateString
            
            // Set highLabel
            let high = Int(tempModel.tempratures[1])
            highLabel.text = "High:  \(high) C"
            
            // Set aveLabel
            let ave = Int(tempModel.tempratures[0])
            aveLabel.text = "Averege:  \(ave) C"
            
            // Set lowLabel
            let low = Int(tempModel.tempratures[2])
            lowLabel.text = "Low:  \(low) C"
            
            timer?.invalidate()
        }
        else {
            return
        }
    }
    
    func passTempratures (temps:[Float]) {
        
        self.tempratures = temps
    }

}
