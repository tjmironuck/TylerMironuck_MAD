//
//  ViewController.swift
//  tripBudgeter
//
//  Created by Tyler MIRONUCK on 10/3/17.
//  Copyright © 2017 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var destinationImage: UIImageView!
    @IBOutlet weak var destinationText: UILabel!
    @IBOutlet weak var locationControl: UISegmentedControl!
    @IBOutlet weak var budgetSizeLabel: UILabel!
    
    @IBOutlet weak var numPeople: UITextField!
    
    
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        if locationControl.selectedSegmentIndex==0 {
            destinationText.text="You can afford a trip to New York!"
            destinationImage.image=UIImage(named: "newYork")
        }
        else if locationControl.selectedSegmentIndex==1 {
            destinationText.text="You can afford a trip to Paris!"
            destinationImage.image=UIImage(named: "eiffelTower")
        }
    }
        
    @IBAction func changeBudget(_ sender: UISlider) {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle=NumberFormatter.Style.currency //set the number style
        let budgetSize=sender.value
        budgetSizeLabel.text=currencyFormatter.string(from:NSNumber(value: budgetSize))
        //budgetSizeLabel.text=String(format: "%.0f", budgetSize)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        numPeople.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

