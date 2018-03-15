//
//  AddRestaurantViewController.swift
//  app
//
//  Created by Tyler MIRONUCK on 3/15/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class AddRestaurantViewController: UIViewController {
    @IBOutlet weak var restaurantTextfield: UITextField!
    @IBOutlet weak var urlTextfield: UITextField!
    
    var addedRestaurant = String()
    var addedURL = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue"{
            //only add a country if there is text in the textfield
            if ((restaurantTextfield.text?.isEmpty) == false){
                addedRestaurant=restaurantTextfield.text!
            }
            if ((urlTextfield.text?.isEmpty) == false){
                addedURL=urlTextfield.text!
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
