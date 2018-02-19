//
//  DetailViewController.swift
//  mealTime
//
//  Created by Tyler MIRONUCK on 2/18/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    var ingredients = [String]()
    var selectedMeal = 0
    
    var mealListDetail = Meals()
    
    override func viewWillAppear(_ animated: Bool) {
        mealListDetail.meals = Array(mealListDetail.mealsData.keys)
        let chosenMeal = mealListDetail.meals[selectedMeal]
        ingredients = mealListDetail.mealsData[chosenMeal]! as [String]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return ingredients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)

        cell.textLabel?.text = ingredients[indexPath.row]

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the ingredient from the array
            ingredients.remove(at: indexPath.row)
            let chosenMeal = mealListDetail.meals[selectedMeal]
            //delete from the data model instance
            mealListDetail.mealsData[chosenMeal]?.remove(at: indexPath.row)
            //delete the row from the table
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        if segue.identifier=="doneSegue"{
            let source = segue.source as! AddIngredientViewController
            //only add an ingredient if there is text in the textfield
            if ((source.addedIngredient.isEmpty) == false){
                //add ingredient to the array
                ingredients.append(source.addedIngredient)
                tableView.reloadData()
                
                let chosenMeal = mealListDetail.meals[selectedMeal]
                //add ingredient to our data model instance
                mealListDetail.mealsData[chosenMeal]?.append(source.addedIngredient)
                
            }
        }
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
