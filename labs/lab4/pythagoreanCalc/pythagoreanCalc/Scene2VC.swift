//
//  Scene2VC.swift
//  pythagoreanCalc
//
//  Created by Tyler MIRONUCK on 10/19/17.
//  Copyright © 2017 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class Scene2VC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var aValueInput: UITextField!
    @IBOutlet weak var bValueInput: UITextField!
    @IBOutlet weak var cValueInput: UITextField!
    @IBOutlet weak var solutionLabel: UILabel!
    @IBOutlet weak var hypotenuseLabel: UILabel!
    @IBOutlet weak var legALabel: UILabel!
    @IBOutlet weak var legBLabel: UILabel!
    
    var legA: Float = 0.0
    var legB: Float = 0.0
    var hypotenuse: Float = 0.0
    var temp: Float = 0.0
    var roundedA: Float = 0.0
    var roundedB: Float = 0.0
    var roundedHypotenuse: Float = 0.0
    
    @IBAction func solverButton(_ sender: UIButton) {
        if aValueInput.text!.isEmpty == false && bValueInput.text!.isEmpty == false{
            legA=Float(aValueInput.text!)!
            legB=Float(bValueInput.text!)!
            temp = pow(legA,2) + pow(legB,2)
            hypotenuse = temp.squareRoot()
            roundedHypotenuse=(hypotenuse*100).rounded() / 100
            solutionLabel.text = "Hypotenuse = " + String(format: "%.2f", hypotenuse)
            hypotenuseLabel.text=String(format: "%.2f", hypotenuse)
        }
        if bValueInput.text!.isEmpty == false && cValueInput.text!.isEmpty == false{
            legB=Float(bValueInput.text!)!
            hypotenuse=Float(cValueInput.text!)!
            temp = pow(hypotenuse,2) - pow(legB,2)
            legA = temp.squareRoot()
            roundedA=(legA*100).rounded() / 100
            solutionLabel.text = "Leg A = " + String(format: "%.2f", legA)
            legALabel.text=String(format: "%.2f", legA)
            
        }
        if aValueInput.text!.isEmpty == false && cValueInput.text!.isEmpty == false{
            legA=Float(aValueInput.text!)!
            hypotenuse=Float(cValueInput.text!)!
            temp = pow(hypotenuse,2) - pow(legA,2)
            legB = temp.squareRoot()
            roundedB=(legB*100).rounded() / 100
            solutionLabel.text = "Leg B = " + String(format: "%.2f", legB)
            legBLabel.text=String(format: "%.2f", legB)
        }

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if aValueInput.text!.isEmpty == false {
            legA=Float(aValueInput.text!)!
            roundedA=(legA*100).rounded() / 100
            legALabel.text=String(format: "%.2f", legA)
        }
        if bValueInput.text!.isEmpty == false {
            legB=Float(bValueInput.text!)!
            roundedB=(legB*100).rounded() / 100
            legBLabel.text=String(format: "%.2f", legB)
        }
        if cValueInput.text!.isEmpty == false {
            hypotenuse=Float(cValueInput.text!)!
            roundedHypotenuse=(hypotenuse*100).rounded() / 100
            //if cValueInput.text! <= aValueInput.text! || cValueInput.text! <= bValueInput.text! {
            if hypotenuse <= legA || hypotenuse <= legB {
                //create a UIAlertController object
                let alert=UIAlertController(title: "Warning", message: "The value for the hpyotenuse must be greater than leg A or leg B", preferredStyle: UIAlertControllerStyle.alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    if self.aValueInput.text!.isEmpty == false && self.bValueInput.text!.isEmpty == true {
                        self.cValueInput.text=String(Float(self.aValueInput.text!)!+1)
                        self.hypotenuseLabel.text=String(Float(self.aValueInput.text!)!+1)
                    }
                    if self.aValueInput.text!.isEmpty == true && self.bValueInput.text!.isEmpty == false {
                        self.cValueInput.text=String(Float(self.bValueInput.text!)!+1)
                        self.hypotenuseLabel.text=String(Float(self.bValueInput.text!)!+1)
                    }
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)

            } else {
                hypotenuseLabel.text=String(format: "%.2f", hypotenuse)
            }
            
        }
        
    }

    override func viewDidLoad() {
        aValueInput.delegate=self
        bValueInput.delegate=self
        cValueInput.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneData"{
            let scene1ViewController = segue.destination as! ViewController
            
                scene1ViewController.user.aValue=String(roundedA)
                scene1ViewController.user.bValue=String(roundedB)
                scene1ViewController.user.cValue=String(roundedHypotenuse)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
