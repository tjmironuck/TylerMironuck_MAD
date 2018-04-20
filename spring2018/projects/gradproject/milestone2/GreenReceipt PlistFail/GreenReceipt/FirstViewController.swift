//
//  FirstViewController.swift
//  GreenReceipt
//
//  Created by Tyler MIRONUCK on 4/14/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

extension FirstViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

class FirstViewController: UITableViewController {
    //DELETE THE FOLLOING LINE OF CODE AFTER TESTING**********************************************
    var words = [String]()
    //********************************************************************************************
    var dataList = Receipts()
    //holds the receipts that the user is searching for
    var filteredReceipts = [String]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Personalizing color scheme of title logo
        //navigationController?.navigationBar.barTintColor = UIColor(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = UIColor(red: 115.0/255.0, green: 115.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        
        //Changing the back arrow color
        navigationController?.navigationBar.tintColor = UIColor.white
        
        //Personalizing color scheme of tab bar
        tabBarController?.tabBar.barTintColor = UIColor(red: 115.0/255.0, green: 115.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        //tabBarController?.tabBar.barTintColor = UIColor.black
        
        //Personalizing color scheme of "selected" tab bar icon text
        tabBarController?.tabBar.tintColor = UIColor(red: 0.0/255.0, green: 249.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        //Personalizing color scheme of "unselected" tab bar icon text
        tabBarController?.tabBar.unselectedItemTintColor = UIColor.white
        
        
        //Personalizing title logo
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "titlelogo")
        imageView.image = image
        navigationItem.titleView = imageView
      
        // URL for our plist
        /**********************UNCOMMENT THIS SECTION WHEN DONE TESTING**********************
        if let pathURL = Bundle.main.url(forResource: "receipts", withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                dataList.receiptsData = try plistdecoder.decode([[String:String]].self, from: data)
                let receiptDict = dataList.receiptsData[0]
                print(receiptDict)
                dataList.receiptStore = Array(receiptDict.values)
                print(dataList.receiptStore)
            } catch {
                // handle error
                print(error)
            }
        }
        *///**********************************************************************************
        
        //************DELETE THIS PART AFTER YOU ARE DONE TESTING WITH SEARCHING************
        // URL for our plist
        if let pathURL = Bundle.main.url(forResource: "qwordswithoutu1", withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                words = try plistdecoder.decode([String].self, from: data)
                print(words)
            } catch {
                // handle error
                print(error)
            }
        }

        //*************************************************************************************
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search receipts"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        //enables large titles
        //navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //Required methods for UITableViewDataSource
    
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return dataList.receiptsData.count
        //DELETE THE FOLLOING LINE OF CODE AFTER TESTING**********************************************
        return words.count
    }
    
    // Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure the cell
        /*
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        let receipt = dataList.receiptsData[indexPath.row]
        cell.textLabel!.text = receipt["date"]!
        let image = receipt["logo"]!
        cell.imageView?.image=UIImage(named: image)
        cell.detailTextLabel?.text = receipt["amount"]!
        return cell
        */
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = words[indexPath.row]
        return cell
        
    }
    /*
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75.0;//Choose your custom row height
    }
    /*
    //Handles segues to other view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "receiptSegue" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            //sets the data for the destination controller
            let receipt = dataList.receiptsData[indexPath.row]
            let store = receipt["store"]!
            let receiptLogo = receipt["receiptLogo"]!
            let date = receipt["date"]!
            let amount = receipt["amount"]!
            //detailVC.title = store
            detailVC.store = store
            detailVC.logo = receiptLogo
            detailVC.date = date
            detailVC.amount = amount
            
            
 
        } //for detail disclosure
 
    }
    */
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        filteredReceipts.removeAll(keepingCapacity: true) //removes all elements
        if searchText.isEmpty == false {
            //closure that will be called for each word to see if it matches the search string
            let searchfilter: (String) -> Bool = { name in
                //look for the search string as a substring of the word
                let range = name.range(of: searchText, options: .caseInsensitive)
                return range != nil //returns true if the value matches and false if there’s no match
            } //end closure
            //let matches = dataList.celebrities.filter(searchfilter)
            //filteredNames.append(contentsOf: matches)
            
            let matches = words.filter(searchfilter)
            filteredReceipts.append(contentsOf: matches)
        }
        tableView.reloadData()
 
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

