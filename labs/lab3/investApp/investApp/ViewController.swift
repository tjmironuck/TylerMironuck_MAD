//
//  ViewController.swift
//  investApp
//
//  Created by Tyler MIRONUCK on 10/2/17.
//  Copyright © 2017 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var principal: UITextField!
    @IBOutlet weak var rate: UITextField!
    @IBOutlet weak var compoundFrequency: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var investmentValue: UILabel!

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateInvestmentValue() {
        var principalAmount:Float //principal amount
        var ratePercent:Float //rate percentage
        var compoundNum:Float //number of times compounded per year
        var years:Float //Number of years
        
        if principal.text!.isEmpty {
            principalAmount = 0.0
        } else {
            principalAmount = Float(principal.text!)!
        }
        if rate.text!.isEmpty {
            ratePercent = 0.0
        } else {
            ratePercent = Float(rate.text!)!/100
        }
        if compoundFrequency.text!.isEmpty {
            compoundNum = 0.0
        } else {
            compoundNum = Float(compoundFrequency.text!)!
        }
        if time.text!.isEmpty {
            years = 0.0
        } else {
            years = Float(time.text!)!
        }
        
        if principalAmount <= 0.0 {
            //creat a UIAlertConroller object
            let alert=UIAlertController(title: "Warning", message: "The principal amount must be greater than 0", preferredStyle: UIAlertControllerStyle.alert)
            //create a UIAlertAction object for the button
            let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
            //add the alert action to the alert object
            alert.addAction(cancelAction)
            let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                    self.principal.text="1"
                    self.updateInvestmentValue()
            })
            alert.addAction(okAction)
            //present alert
            present(alert, animated: true, completion: nil)
        } //end if statement
        
        
        //var amount:Float //Final Value of investment
        let amount=(Double(principalAmount))*pow(Double(1+(ratePercent/compoundNum)), Double(compoundNum*years))
        
        //format result as currency
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle=NumberFormatter.Style.currency //set the number style
        investmentValue.text=currencyFormatter.string(from: NSNumber(value: amount)) //returns a formatted string
        investmentValue.textColor = UIColor.green
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateInvestmentValue()
    }
    
    override func viewDidLoad() {
        principal.delegate=self
        rate.delegate=self
        compoundFrequency.delegate=self
        time.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTapGestureRecognized(_ sender: Any) {
        principal.resignFirstResponder()
        rate.resignFirstResponder()
        compoundFrequency.resignFirstResponder()
        time.resignFirstResponder()
    }
}

