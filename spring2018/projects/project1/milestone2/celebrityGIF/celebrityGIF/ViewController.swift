//
//  ViewController.swift
//  celebrityGIF
//
//  Created by Tyler MIRONUCK on 2/27/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var celebrityList=Celebrities()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // URL for our plist
        if let pathURL = Bundle.main.url(forResource: "celebrities", withExtension: "plist"){
       
        //creates a property list decoder object
        let plistdecoder = PropertyListDecoder()
        do {
            let data = try Data(contentsOf: pathURL)
            //decodes the property list
            celebrityList.celebritiesData = try plistdecoder.decode([String: [String]].self, from: data)
            celebrityList.celebrities = Array(celebrityList.celebritiesData.keys)
        } catch {
            // handle error
            print(error)
        }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Required methods for UITableViewDataSource
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celebrityList.celebrities.count
    }
    
    // Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = celebrityList.celebrities[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

