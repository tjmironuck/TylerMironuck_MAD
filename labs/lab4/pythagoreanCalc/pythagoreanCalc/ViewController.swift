//
//  ViewController.swift
//  pythagoreanCalc
//
//  Created by Tyler MIRONUCK on 10/19/17.
//  Copyright © 2017 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    
    
    //Define constant for data file
    let filename = "nums.plist"
    
    var user=Variables()
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        aLabel.text=user.aValue
        bLabel.text=user.bValue
        cLabel.text=user.cValue
        
    }
    
    
    override func viewDidLoad() {
        let filePath = docFilePath(filename) //path to data file
        
        //if the data file exists, use it
        if FileManager.default.fileExists(atPath: filePath!){
            let path = filePath
            //load the data of the plist file into a dictionary
            let dataDictionary = NSDictionary(contentsOfFile: path!) as! [String:String]
            //load value for LegA
            if dataDictionary.keys.contains("legA") {
                user.aValue = dataDictionary["legA"]
                aLabel.text=user.aValue
            }
            //load value for LegB
            if dataDictionary.keys.contains("legB") {
                user.bValue = dataDictionary["legB"]
                //bLabel.text=String(format: "%.2f", user.bValue!)
                bLabel.text=user.bValue
            }
            //load value for hypotenuseC
            if dataDictionary.keys.contains("hypotenuseC") {
                user.cValue = dataDictionary["hypotenuseC"]
                cLabel.text=user.cValue
            }

        }
        
        //application instance
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func docFilePath(_ filename: String) -> String?{
        //locate the documents directory
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString //document directory
        //creates the full path to our data file
        return dir.appendingPathComponent(filename)
    }

    //called when the UIApplicationWillResignActiveNotification notification is posted
    //all notification methods take a single NSNotification instance as their argument
    func applicationWillResignActive(_ notification: Notification){
        let filePath = docFilePath(filename)
        let data = NSMutableDictionary()
        //adds
        if user.aValue != nil{
            data.setValue(user.aValue, forKey: "legA")
            
        }
        if user.bValue != nil{
            data.setValue(user.bValue, forKey: "legB")
        }
        if user.cValue != nil{
            data.setValue(user.cValue, forKey: "hypotenuseC")
        }

        //write the contents of the array to our plist file
        data.write(toFile: filePath!, atomically: true)
    }


}

