//
//  AddMealViewController.swift
//  mealTime
//
//  Created by Tyler MIRONUCK on 2/18/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class AddMealViewController: UIViewController {
    @IBOutlet weak var mealTextfield: UITextField!
    
    
    var addedMeal = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneMealSegue"{
            //only add an ingredient if there is text in the textfield
            if ((mealTextfield.text?.isEmpty) == false){
                addedMeal=mealTextfield.text!
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
