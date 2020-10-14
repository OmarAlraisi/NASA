//
//  TempratureModel.swift
//  NASA
//
//  Created by Omar Al Raisi on 10/13/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

protocol TempratureModelDelegate {
    func passTempratures(temps:[Float])
}

class TempratureModel {
    
    // Create a variable to hold the keys
    var keys = [String]()
    
    // Create a delegate
    var delegate:TempratureModelDelegate?
    
    // Create an array to hold tempratures
    var tempratures = [Float]()
    /*
     Index 0: Average Temprature
     Index 1: High Temprature
     Index 2: Low Temprature
    */
    
    // Create a method to get the weather
    func getWeatherOnMars () {
        
        // Create a URL
        let url = URL(string: Constants.MARS_API)
        
        // Validate it
        guard url != nil else {
            return
        }
        
        // Create a session
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check for error and data
            guard error == nil && data != nil else {
                return
            }
            
            do{
                
                // Create a JSON decoder
                let decoder = JSONDecoder()
                
                // Decode the keys
                let keysResponse = try decoder.decode(SolKeys.self, from: data!)
       
                // Assign keys from the response to keys
                self.keys = keysResponse.sol_keys
                
                // Call getJSONObject
                self.getJSONObject(data: data!)
                
                // Call delegate method
                self.delegate?.passTempratures(temps: self.tempratures)
            } catch {
                return
            }
        }
        
        // Resume the data task
        dataTask.resume()
    }
    
    // Create a method the get today's tempratures from the JSON
    func getJSONObject (data: Data) {
        
        do{
            
            // Create Serialization JSON
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : AnyObject]
            
            // Create a JSON for today
            let today = jsonObject[self.keys[self.keys.count-1]]
            
            // Check if it exists
            guard today != nil else {
                return
            }
            
            // Create a JSON for Air Tempratures
            let airTemp = today!["AT"] as! [String : AnyObject]
            
            // Extract average temprature
            let averageTemp:Float = Float(airTemp["av"]! as! NSNumber)
            tempratures.append(averageTemp)
            
            // Extract low temprature
            let lowTemp:Float = Float(airTemp["mn"]! as! NSNumber)
            tempratures.append(lowTemp)
            
            // Extract high temprature
            let highTemp = Float(airTemp["mx"]! as! NSNumber)
            tempratures.append(highTemp)
        } catch{
            return
        }
    }
}
