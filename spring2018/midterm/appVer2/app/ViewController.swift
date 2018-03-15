//
//  ViewController.swift
//  app
//
//  Created by Tyler MIRONUCK on 3/15/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dataList = Restaurants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URL for our plist
        if let pathURL = Bundle.main.url(forResource: "restaurants", withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                dataList.restaurantsData = try plistdecoder.decode([[String:String]].self, from: data)
            } catch {
                // handle error
                print(error)
            }
        }
        
        //enables large titles
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //Required methods for UITableViewDataSource
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.restaurantsData.count
    }
    
    // Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        let restaurant = dataList.restaurantsData[indexPath.row]
        cell.textLabel!.text = restaurant["name"]!
        return cell
    }
    
    //Handles segues to other view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            //sets the data for the destination controller
            let restaurant = dataList.restaurantsData[indexPath.row]
            let url = restaurant["url"]!
            let name = restaurant["name"]!
            print(name)
            //detailVC.detailItem = url as AnyObject?
            detailVC.detailItem = url
            detailVC.title = name
            //detailVC.url = url
            
    
        } //for detail disclosure
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

