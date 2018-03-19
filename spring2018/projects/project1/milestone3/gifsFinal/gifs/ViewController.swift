//
//  ViewController.swift
//  gifs
//
//  Created by Tyler MIRONUCK on 3/11/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

extension ViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

class ViewController: UITableViewController {
    
    var celebrityList=Celebrities()
    //var searchController : UISearchController!
    var filteredNames = [String]()
    let searchController = UISearchController(searchResultsController: nil)

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
        //print(celebrityList.celebrities)
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search celebrities"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    /*
        // Do any additional setup after loading the view, typically from a nib.
        //search results
        let resultsController = SearchResultsController() //create an instance of our SearchResultsController class
        resultsController.allNames = celebrityList.celebrities //set the allNames property to our celebrities array
        searchController = UISearchController(searchResultsController: resultsController) //initialize our search controller with the resultsController when it has search results to display
        
        //search bar configuration
        searchController.searchBar.placeholder = "Enter a search term" //place holder text
        //searchController.searchBar.sizeToFit() //sets appropriate size for the search bar
        tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
 */
    }
    
    //Required methods for UITableViewDataSource
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredNames.count
        }
        return celebrityList.celebrities.count
    }
    
    // Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        if isFiltering() {
            cell.textLabel?.text = filteredNames[indexPath.row]
        } else {
            cell.textLabel?.text = celebrityList.celebrities[indexPath.row]
        }
    
        return cell
    }

    //Handles segues to other view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "collectionSegue" {
            //let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            //if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
            if let indexPath = tableView.indexPathForSelectedRow {
            let chosenName : String
            if isFiltering() {
                chosenName = filteredNames[indexPath.row]
                print(chosenName)
                //detailVC.selectedCelebrity = chosenName
            } else {
                chosenName = celebrityList.celebrities[indexPath.row]
            }
            //sets the data for the destination controller
            let detailVC = segue.destination as! CollectionViewController
            detailVC.title = celebrityList.celebrities[indexPath.row]
            detailVC.celebrityListDetail=celebrityList
            detailVC.selectedCelebrity = chosenName
            }
        }
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredNames.removeAll(keepingCapacity: true) //removes all elements
        if searchText.isEmpty == false {
            //closure that will be called for each word to see if it matches the search string
            let searchfilter: (String) -> Bool = { name in
                //look for the search string as a substring of the word
                let range = name.range(of: searchText, options: .caseInsensitive)
                return range != nil //returns true if the value matches and false if there’s no match
            } //end closure
            let matches = celebrityList.celebrities.filter(searchfilter)
            filteredNames.append(contentsOf: matches)
        
        }
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

