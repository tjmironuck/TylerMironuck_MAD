//
//  ViewController.swift
//  midtermMironuck
//
//  Created by Tyler MIRONUCK on 10/19/17.
//  Copyright © 2017 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var milesAmount: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var gallonsLabel: UILabel!
    @IBOutlet weak var gasInCarLabel: UILabel!
    @IBOutlet weak var monthlySwitch: UISwitch!
    
    var time = 0.00
    let milesPerGallon: Float = 24
    var gallonsNeeded = 0.00
   
    @IBAction func changeToMonthly(_ sender: UISwitch) {
        //declare how many work days per month
        let workDays: Float = 20
        var monthlyTime: Float
        var gallonsNeededMonthly: Float
        if monthlySwitch.isOn {
            monthlyTime = Float(time*20)
            //show the computed time
            timeLabel.text=String(format: "%.2f", monthlyTime)+" mins"
            
            //code to calcuate gallons of gas needed
            //gallonsNeeded = amount/milesPerGallon
            //show the computed gallons needed
            gallonsLabel.text = String(format: "%.2f", gallonsNeeded)+" gallons"

            
        }
    }
    
    @IBAction func changeGasAmount(_ sender: UISlider) {
        let gasAmount=sender.value
        gasInCarLabel.text=String(format: "%.2f", gasAmount)+" gallons"
    }
    
    
    @IBAction func commuteButton(_ sender: UIButton) {
        //code to calcuate commute time
        var amount: Float//miles inputed by user
        let speed: Float = 20  //in miles/hour!! (not miles per minute)
        //var time: Float
    
        
        if milesAmount.text!.isEmpty {
            amount = 0.0
        } else {
            amount = Float(milesAmount.text!)!
        }
        
        //commute time in minutes
        time = Double((amount/speed)*Float(60.00))
        //show the computed time
        timeLabel.text=String(format: "%.2f", time)+" mins"
    
        //code to calcuate gallons of gas needed
        //var gallonsNeeded: Float
        //let milesPerGallon: Float = 24
        gallonsNeeded = Double(amount/milesPerGallon)
        //show the computed gallons needed
        gallonsLabel.text = String(format: "%.2f", gallonsNeeded)+" gallons"
        
        
        
        
    }

    
    override func viewDidLoad() {
        milesAmount.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

