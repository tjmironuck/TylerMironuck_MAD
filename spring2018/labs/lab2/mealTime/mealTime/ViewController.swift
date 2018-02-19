//
//  ViewController.swift
//  mealTime
//
//  Created by Tyler MIRONUCK on 2/18/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var mealsList=Meals()
    var selectedMeal = 0
    var searchController : UISearchController!
    let kfilename = "data1.plist"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pathURL:URL?
        //get path for data file

        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = dirPath[0] //documents directory
        print(docDir)
        
        // URL for our plist
        let dataFileURL = docDir.appendingPathComponent(kfilename)
        print(dataFileURL)
        
        //if the data file exists, use it
        if FileManager.default.fileExists(atPath: dataFileURL.path){
            pathURL = dataFileURL
        }
        else {

        // URL for our plist
        pathURL = Bundle.main.url(forResource: "meals", withExtension: "plist")
        }
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL!)
                //decodes the property list
                mealsList.mealsData = try plistdecoder.decode([String: [String]].self, from: data)
                mealsList.meals = Array(mealsList.mealsData.keys)
            } catch {
                // handle error
                print(error)
            }
        
        // Do any additional setup after loading the view, typically from a nib.
        //search results
        let resultsController = SearchResultsController() //create an instance of our SearchResultsController class
        resultsController.allMeals = mealsList.meals //set the allwords property to our words array
        searchController = UISearchController(searchResultsController: resultsController) //initialize our search controller with the resultsController when it has search results to display
        
        //search bar configuration
        searchController.searchBar.placeholder = "Enter a search term" //place holder text
        //searchController.searchBar.sizeToFit() //sets appropriate size for the search bar
        tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
        
        // Do any additional setup after loading the view, typically from a nib.
        //application instance
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.applicationWillResignActive(_:)), name: NSNotification.Name.UIApplicationWillResignActive, object: app)
    }

    //Required methods for UITableViewDataSource
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsList.meals.count
    }
    
    // Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = mealsList.meals[indexPath.row]
        return cell
    }
    
    //Handles segues to other view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ingredientsegue" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            //sets the data for the destination controller
            detailVC.title = mealsList.meals[indexPath.row]
            detailVC.mealListDetail=mealsList
            detailVC.selectedMeal = indexPath.row
        }
    }
    
    @IBAction func unwindMealSegue (_ segue:UIStoryboardSegue){
        if segue.identifier=="doneMealSegue"{
            let source = segue.source as! AddMealViewController
            //only add a meal if there is text in the textfield
            if ((source.addedMeal.isEmpty) == false){
                //add meal to the array
                mealsList.meals.append(source.addedMeal)
                tableView.reloadData()
                
                //add meal to our data model instance
                mealsList.mealsData.updateValue([], forKey: source.addedMeal)
        /*
                let chosenMeal = mealsList.meals[selectedMeal]
                //add country to our data model instance
                mealsList.mealsData[chosenMeal]?.append(source.addedMeal)
        */
            }
        }
    }
    
    //called when the UIApplicationWillResignActiveNotification notification is posted
    //all notification methods take a single NSNotification instance as their argument
    @objc func applicationWillResignActive(_ notification: NSNotification){
        //get path for data file
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = dirPath[0] //documents directory
        print(docDir)
        
        // URL for our plist
        let dataFileURL = docDir.appendingPathComponent(kfilename)
        print(dataFileURL)
        //creates a property list decoder object
        let plistencoder = PropertyListEncoder()
        plistencoder.outputFormat = .xml
        do {
            let data = try plistencoder.encode(mealsList.mealsData)
            try data.write(to: dataFileURL)
        } catch {
            // handle error
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

