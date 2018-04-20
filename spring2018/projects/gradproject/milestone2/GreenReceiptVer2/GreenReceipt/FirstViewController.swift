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
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

extension FirstViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

class FirstViewController: UITableViewController {
    //dataList to hold data from property list
    var dataList = Receipts()
    //Property to hold all the receipts
    var receipts = [Receipt]()
    //Property to hold the receipts the user is searching for
    var filteredReceipts = [Receipt]()
    let searchController = UISearchController(searchResultsController: nil)
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //**************************Personalizing color scheme of app**********************************************
        //Personalizing color scheme of title logo
        //navigationController?.navigationBar.barTintColor = UIColor(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        navigationController?.navigationBar.barTintColor = UIColor(red: 115.0/255.0, green: 115.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        
        //Changing colore of scope bar and cancel button
        searchController.searchBar.tintColor = UIColor(red: 0.0/255.0, green: 249.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        //searchController.searchBar.tintColor = UIColor.white
        

        //Changing the back arrow color
        navigationController?.navigationBar.tintColor = UIColor.white
        
        //Personalizing color scheme of tab bar
        tabBarController?.tabBar.barTintColor = UIColor(red: 115.0/255.0, green: 115.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        //tabBarController?.tabBar.barTintColor = UIColor.black
        
        //Personalizing color scheme of "selected" tab bar icon text
        tabBarController?.tabBar.tintColor = UIColor(red: 0.0/255.0, green: 249.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        //Personalizing color scheme of "unselected" tab bar icon text
        tabBarController?.tabBar.unselectedItemTintColor = UIColor.white
        //*********************************************************************************************************
        
        //Configuring title logo
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "titlelogo")
        imageView.image = image
        navigationItem.titleView = imageView
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Receipts"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.barStyle = .black
        
        
        // Setup the Scope Bar
        searchController.searchBar.scopeButtonTitles = ["All", "Retail", "Restaurants", "Other"]
        searchController.searchBar.delegate = self
        
        receipts = [
            Receipt(category:"Retail", name:"Macy's", logo:"macys.png", date:"03/27/2018", amount:"$46.12", receiptLogo:"macysReceiptlogo.png"),
            Receipt(category:"Retail", name:"The Home Depot", logo:"homedepot.png", date:"03/18/2018", amount:"$21.35", receiptLogo:"homedepotReceiptlogo.png"),
            Receipt(category:"Retail", name:"Target", logo:"target.png", date:"03/11/2018", amount:"$35.12", receiptLogo:"targetReceiptlogo.png"),
            Receipt(category:"Restaurants", name:"Starbucks", logo:"starbucks.png", date:"02/26/2018", amount:"$5.76", receiptLogo:"starbucksReceiptlogo.png"),
            Receipt(category:"Restaurants", name:"The Cheesecake Factory", logo:"cheesecakefactory.png", date:"02/27/2017", amount:"$53.57", receiptLogo:"cheesecakeReceiptlogo.png"),
            Receipt(category:"Retail", name:"Whole Foods", logo:"wholefoods.png", date:"02/24/2018", amount:"$86.10", receiptLogo:"wholefoodsReceiptlogo.png"),
            Receipt(category:"Retail", name:"Best Buy", logo:"bestbuy.png", date:"02/17/2018", amount:"$42.11", receiptLogo:"bestbuyReceiptlogo.png"),
            Receipt(category:"Retail", name:"Costco", logo:"costco.png", date:"02/13/2018", amount:"$159.13", receiptLogo:"costcoReceiptlogo.png"),
            Receipt(category:"Retail", name:"Bath & Body Works", logo:"bathbodyworks.png", date:"02/07/2018", amount:"$13.55", receiptLogo:"bathbodyworksReceiptlogo.png"),
            Receipt(category:"Retail", name:"Express", logo:"express.png", date:"02/04/2018", amount:"$136.02", receiptLogo:"expressReceiptlogo.png"),
            Receipt(category:"Retail", name:"Kohl's", logo:"kohls.png", date:"02/01/2018", amount:"$33.98", receiptLogo:"kohlsReceiptlogo.png"),
            Receipt(category:"Other", name:"Conoco Gas Station", logo:"conoco.png", date:"01/28/2018", amount:"$39.23", receiptLogo:"conocoReceiptlogo.png"),
            Receipt(category:"Retail", name:"Gap", logo:"gap.png", date:"01/28/2018", amount:"$65.88", receiptLogo:"gapReceiptlogo.png"),
            Receipt(category:"Retail", name:"Staples", logo:"staples.png", date:"01/13/2018", amount:"$17.94", receiptLogo:"staplesReceiptlogo.png"),
            Receipt(category:"Retail", name:"Target", logo:"target.png", date:"01/9/2018", amount:"$29.12", receiptLogo:"targetReceiptlogo.png"),
            Receipt(category:"Retail", name:"Target", logo:"target.png", date:"01/02/2018", amount:"$11.93", receiptLogo:"targetReceiptlogo.png"),
            Receipt(category:"Retail", name:"The Home Depot", logo:"homedepot.png", date:"12/27/2017", amount:"$56.04", receiptLogo:"homedepotReceiptlogo.png"),
            Receipt(category:"Retail", name:"Whole Foods", logo:"wholefoods.png", date:"12/27/2017", amount:"$98.16", receiptLogo:"wholefoodsReceiptlogo.png"),
            Receipt(category:"Restaurants", name:"Starbucks", logo:"starbucks.png", date:"12/27/2017", amount:"$4.57", receiptLogo:"starbucksReceiptlogo.png"),]
      
        // URL for our plist
        if let pathURL = Bundle.main.url(forResource: "receipts", withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                dataList.receiptsData = try plistdecoder.decode([[String:String]].self, from: data)
            } catch {
                // handle error
                print(error)
            }
        }
        
        //enables large titles
        //navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //Required methods for UITableViewDataSource
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredReceipts.count
        }
        return receipts.count
        //return dataList.receiptsData.count
    }
    
    // Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        /*THIS CODE IS FOR USING THE PROPERTY LIST RECEIPTS.PLIST
        let receipt = dataList.receiptsData[indexPath.row]
        cell.textLabel!.text = receipt["date"]!
        let image = receipt["logo"]!
        cell.imageView?.image=UIImage(named: image)
        cell.detailTextLabel?.text = receipt["amount"]!
        return cell
         */
        let receipt: Receipt
        if isFiltering() {
            receipt = filteredReceipts[indexPath.row]
        } else {
            receipt = receipts[indexPath.row]
        }
        let image = receipt.logo
        cell.imageView?.image=UIImage(named: image)
        cell.textLabel!.text = receipt.date
        cell.detailTextLabel!.text = receipt.amount
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75.0;//Choose your custom row height
    }
    
    //Handles segues to other view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "receiptSegue" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            //sets the data for the destination controller
            /************THIS CODE IS FOR USING PROPERTY LIST**************
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
            */
            let receipt: Receipt
            if isFiltering(){
                receipt = filteredReceipts[indexPath.row]
            } else{
                receipt = receipts[indexPath.row]
            }
            //Sending each member of the struct individually to the DetailViewController
            //detailVC.store = receipt.name
            //detailVC.date = receipt.date
            //detailVC.amount = receipt.amount
 
            //Sending the entire struct to the DetailViewController
            detailVC.detailReceipt = receipt
            
        } //for detail disclosure
        
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredReceipts = receipts.filter({( receipt : Receipt) -> Bool in
            let doesCategoryMatch = (scope == "All") || (receipt.category == scope)
            
            if searchBarIsEmpty() {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && receipt.name.lowercased().contains(searchText.lowercased())
            }
        })
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

