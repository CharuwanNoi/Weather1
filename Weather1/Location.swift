//
//  Location.swift
//  Weather1
//
//  Created by CharuwanRuanmoei on 1/12/16.
//  Copyright © 2016 bananacoding. All rights reserved.
//

import Foundation
import UIKit

class Location: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var latitudeTextField: UITextField!
    @IBOutlet var longitudeTextField: UITextField!
    
    var latitude = String()
    var longitude = String()
    var id: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkTemp(sender: AnyObject) {
        
        latitude = latitudeTextField.text!
        longitude = longitudeTextField.text!
        
        print("** URL !!! ***")
        
        let parser = XMLParserLocation(Url: "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20geo.placefinder%20where%20text=%22\(latitude),\(longitude)%22%20and%20gflags=%22R%22")
//
        let weather: Weather = parser.weather1
        id = weather.woeid
        print(parser.weather1)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showWeather" {
            let controller = segue.destinationViewController as! ViewController
            controller.id = id
            
            
        }

    }
    
}