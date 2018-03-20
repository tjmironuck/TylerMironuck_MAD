//
//  TricksTableViewController.swift
//  snowboardTricks
//
//  Created by Tyler MIRONUCK on 3/19/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit
import RealmSwift

class TricksTableViewController: UITableViewController {
    
    var realm : Realm!  //Realm database instance
    
    var trickList: Results<Trick> {
        get {
            return realm.objects(Trick.self) //returns all Grocery objects from Realm
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        //initialize the realm variable
        do {
            realm = try Realm()
        } catch let error {
            print(error.localizedDescription)
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trickList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = trickList[indexPath.row]
        cell.textLabel!.text = item.name
        cell.accessoryType = item.landed ? .checkmark : .none //set checkmark if you landed trick
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = trickList[indexPath.row]
        try! self.realm.write { //write to realm database
            item.landed = !item.landed
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let item = trickList[indexPath.row]
            try! self.realm.write {
                self.realm.delete(item) //delete from realm database
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    @IBAction func addTrickItem(_ sender: UIBarButtonItem) {
        let addalert = UIAlertController(title: "New Item", message: "Add a new trick!", preferredStyle: .alert)
        //add textfield to the alert
        addalert.addTextField(configurationHandler: {(UITextField) in
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addalert.addAction(cancelAction)
        let addItemAction = UIAlertAction(title: "Add", style: .default, handler: {(UIAlertAction)in
            // adds new item
            let newitem = addalert.textFields![0] //gets textfield
            let newTrickItem = Trick() //create new Grocery instance
            newTrickItem.name = newitem.text! //set name with textfield text
            newTrickItem.landed = false
            
            do {
                try self.realm.write({
                    self.realm.add(newTrickItem) //add to realm database
                    self.tableView.insertRows(at: [IndexPath.init(row: self.trickList.count-1, section:0)], with: .automatic) //inserts new row at the end of the table
                })
            } catch let error{
                print(error.localizedDescription)
            }
        })
        addalert.addAction(addItemAction)
        present(addalert, animated: true, completion: nil)
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
