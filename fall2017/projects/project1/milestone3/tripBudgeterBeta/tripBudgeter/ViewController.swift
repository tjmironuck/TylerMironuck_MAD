//
//  ViewController.swift
//  tripBudgeter
//
//  Created by Tyler MIRONUCK on 10/3/17.
//  Copyright © 2017 Tyler MIRONUCK. All rights reserved.
//
//Works Cited:
//https://code.tutsplus.com/tutorials/ios-sdk-passing-data-between-controllers-in-swift--cms-27151


import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var locationControl: UISegmentedControl!
    @IBOutlet weak var budgetSizeLabel: UILabel!
    @IBOutlet weak var dollarSignLeft: UIImageView!
    @IBOutlet weak var dollarSignRight: UIImageView!
    
    @IBOutlet weak var numPeople: UITextField!
    @IBOutlet weak var numNights: UITextField!
    
    @IBAction func myTripButton(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        myVC.stringPassed = destinationString
        myVC.floatPassed = leftOverCash
        myVC.hotelNameStringPassed = hotelNameString
        myVC.hotelAddressStringPassed = hotelAddressString
        myVC.longitudePassed = longitude
        myVC.latitudePassed = latitude
        myVC.pinNamePassed = pinNameString
        myVC.pinSubtitlePassed = pinSubtitle
        if destinationImage == 1 {
            myVC.theImagePassed = #imageLiteral(resourceName: "eiffelTower")
        } else if destinationImage == 2{
            myVC.theImagePassed = #imageLiteral(resourceName: "newYork")
        } else if destinationImage == 3{
            myVC.theImagePassed = #imageLiteral(resourceName: "hollywood")
        } else if destinationImage == 4{
            myVC.theImagePassed = #imageLiteral(resourceName: "chicago")
        }
        navigationController?.pushViewController(myVC, animated: true)

    }
    
    //declare variable to hold user location selection (0 for staying in U.S., 1 for traveling abroad)
    var locationSelection: Int = 0
    
    
    //Declare variable for steps of 500
    let step: Float = 500
    //Declare budgetSize here so that scope extends outside of changeBudget method
    var budgetSize: Float = 0.00
    var flightExpense: Float = 0.00
    var hotelExpense: Float = 0.00
    var totalExpense: Float = 0.00
    var leftOverCash: Float = 0.00
    var longitude: Double = 0.000000
    var latitude: Double = 0.000000
    var pinNameString = ""
    var pinSubtitle = ""
    var hotelNameString = ""
    var hotelAddressString = ""
    var destinationString = ""
    var destinationImage = 0
    
    //Method for budget input
    @IBAction func changeBudget(_ sender: UISlider) {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle=NumberFormatter.Style.currency //set the number style
        
        //calculation for increments of 500 for slider
        let roundedValue = round(sender.value / step) * step
        budgetSize=roundedValue
        //let budgetSize=sender.value
        budgetSizeLabel.text=currencyFormatter.string(from:NSNumber(value: budgetSize))
    }

    //Method for location input
    @IBAction func changeLocation(_ sender: UISegmentedControl) {
        if locationControl.selectedSegmentIndex==0 {
            locationSelection = 0
        }
        else if locationControl.selectedSegmentIndex==1 {
            if budgetSize <= 1500 {
                //creat a UIAlertConroller object
                let alert=UIAlertController(title: "Warning", message: "Please increase your budget if you would like to travel abroad.", preferredStyle: UIAlertControllerStyle.alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                //add the alert action to the alert object
                alert.addAction(cancelAction)
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                    //turn off the "travel abroad" selection if budget is less than 1500
                    self.locationControl.selectedSegmentIndex = UISegmentedControlNoSegment
                })
                alert.addAction(okAction)
                //present alert
                present(alert, animated: true, completion: nil)
            } //end if statement
            else {
                locationSelection = 1
            }
        }
            
    }


    //method for number of people input and number of nights input
    func calculateTrip(){
         //Save user input for number of people going to variable, numberOfPeople
        let numberOfPeople=Int(numPeople.text!) //returns an optional
        //Error checking in case user enters too many or too few of nights
        if numberOfPeople != nil {
            //Error checking in case user enters too many or too few of people
            if numberOfPeople! <= 0 {
                //create a UIAlertController object
                let alert=UIAlertController(title: "Warning", message: "The number of people must be greater than 0", preferredStyle: UIAlertControllerStyle.alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    self.numPeople.text="1"
                    self.calculateTrip()
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            } else if numberOfPeople! >= 3 && locationSelection == 1{
                    //create a UIAlertController object
                    let alert=UIAlertController(title: "Warning", message: "Paris is expensive. Please select 2 people or less.", preferredStyle: UIAlertControllerStyle.alert)
                    //create a UIAlertAction object for the button
                    let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(cancelAction) //adds the alert action to the alert object
                    let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                        self.numPeople.text="2"
                        self.calculateTrip()
                    })
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)

                    
            } else if numberOfPeople! >= 2 && budgetSize == 500 {

                        //create a UIAlertController object
                        let alert=UIAlertController(title: "Warning", message: "Your budget is $500. You can only afford to vacation by yourself", preferredStyle: UIAlertControllerStyle.alert)
                        //create a UIAlertAction object for the button
                        let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                        alert.addAction(cancelAction) //adds the alert action to the alert object
                        let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                            self.numPeople.text="1"
                            self.calculateTrip()
                        })
                        alert.addAction(okAction)
                        present(alert, animated: true, completion: nil)

                } else if numberOfPeople! >= 3 {
                //create a UIAlertController object
                let alert=UIAlertController(title: "Warning", message: "Flights are expensive. Please select 2 people or less.", preferredStyle: UIAlertControllerStyle.alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    self.numPeople.text="2"
                    self.calculateTrip()
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        
        
        }
        
        let numberOfNights=Int(numNights.text!) //returns an optional
        //Error checking in case user enters too many or too few of nights
        if numberOfNights != nil {
            if numberOfNights! <= 0 {
                //create a UIAlertController object
                let alert=UIAlertController(title: "Warning", message: "Wouldn't you like to stay at least one night?", preferredStyle: UIAlertControllerStyle.alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    self.numNights.text="1"
                    self.calculateTrip()
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            } else if numberOfNights! >= 3 && budgetSize == 500 {
                if budgetSize == 500 {
                    //create a UIAlertController object
                    let alert=UIAlertController(title: "Warning", message: "Your budget is 500. You can only afford 2 nights.", preferredStyle: UIAlertControllerStyle.alert)
                    //create a UIAlertAction object for the button
                    let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(cancelAction) //adds the alert action to the alert object
                    let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                        self.numNights.text="2"
                        self.calculateTrip()
                    })
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    
                }

            } else if numberOfNights! >= 4 {
                
                
                //create a UIAlertController object
                let alert=UIAlertController(title: "Warning", message: "Please choose fewer nights.", preferredStyle: UIAlertControllerStyle.alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    self.numNights.text="3"
                    self.calculateTrip()
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                
            }
                
        }
        
        if locationSelection == 1 {
            //Calculating cost to fly
            //For Paris, cheapest flights are $500 per person. So multiply $500 by amount of people traveling
            flightExpense = 500 * Float(numberOfPeople!)
            //Calculating hotel cost for requested number of nights
            if numberOfNights != nil {
                if numberOfPeople! > 2  {
                    //If more than 2 people, you need a two bedroom suite
                    hotelExpense = 210 * Float(numberOfNights!)
                } else {
                    hotelExpense = 138 * Float(numberOfNights!)
                }
            }
            //Calculating total expenses
            totalExpense = flightExpense + hotelExpense
            //Calculating how much cash is left over for entertainment
            leftOverCash = budgetSize - totalExpense
            //Store destination string
            destinationString = "Paris, France"
            hotelNameString = "Hotel Relais Bosquet"
            hotelAddressString = "Info:\nAddress: 19 Rue du Champ de Mars, 75007 Paris, France \nPhone Number: 3314705-2545"
            destinationImage = 1
            longitude = 2.294694
            latitude = 48.858093
            pinNameString = "Eiffel Tower"
            pinSubtitle = "Paris"
        } else {
            //For flights in the US, the lowest flights are on average $300
            flightExpense = 275 * Float(numberOfPeople!)

            //Store destination string
            if budgetSize == 1500 || budgetSize == 2000 {
                destinationString = "New York City, New York"
                hotelNameString = "Hotel Stanford"
                hotelAddressString = "Info:\nAddress: 43 W 32nd St, New York, NY 10001 \nPhone Number: (212)563-1500"
                //Set destination key 1=Paris, 2=New York, 3=LA, 4=Chicago
                destinationImage = 2
                longitude = -73.984607
                latitude = 40.74836
                pinNameString = "Empire State Building"
                pinSubtitle = "New York City"
                
                //Calculating hotel cost for requested number of nights
                if numberOfNights != nil {
                    if numberOfPeople! > 2  {
                        //If more than 2 people, you need a two bedroom suite
                        hotelExpense = 207 * Float(numberOfNights!)
                    } else {
                        hotelExpense = 130 * Float(numberOfNights!)
                    }
                }
                //Calculating total expenses
                totalExpense = flightExpense + hotelExpense
                //Calculating how much cash is left over for entertainment
                leftOverCash = budgetSize - totalExpense


            }
            else if budgetSize == 1000 {
                destinationString = "Los Angeles, California"
                hotelNameString = "Hilton Los Angeles Airport"
                hotelAddressString = "Info:\nAddress: 5711 W Century Blvd, Los Angeles, CA 90045 \nPhone Number: (310)410-4000"
                destinationImage = 3
                longitude = -118.321548
                latitude = 34.1341151
                pinNameString = "Hollywood Sign"
                pinSubtitle = "Los Angeles"
                
                //Calculating hotel cost for requested number of nights
                if numberOfNights != nil {
                    if numberOfPeople! > 2  {
                        //If more than 2 people, you need a two bedroom suite
                        hotelExpense = 216 * Float(numberOfNights!)
                    } else {
                        hotelExpense = 111 * Float(numberOfNights!)
                    }
                }
                //Calculating total expenses
                totalExpense = flightExpense + hotelExpense
                //Calculating how much cash is left over for entertainment
                leftOverCash = budgetSize - totalExpense


            }
            else if budgetSize == 500 {
                destinationString = "Chicago, Illinois"
                hotelNameString = "Wyndham Grand Chicago Riverfront"
                hotelAddressString = "Info:\nAddress: 71 E Upper Wacker Dr, Chicago, IL 60601 \nPhone Number: (312)346-7100"

                destinationImage = 4
                longitude = -87.619392
                latitude = 41.882702
                pinNameString = "Millennium Park"
                pinSubtitle = "Chicago"
                
                //Calculating hotel cost for requested number of nights
                if numberOfNights != nil {
                    if numberOfPeople! > 2  {
                        //If more than 2 people, you need a two bedroom suite
                        hotelExpense = 174 * Float(numberOfNights!)
                    } else {
                        hotelExpense = 103 * Float(numberOfNights!)
                    }
                }
                //Calculating total expenses
                totalExpense = flightExpense + hotelExpense
                //Calculating how much cash is left over for entertainment
                leftOverCash = budgetSize - totalExpense


            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        calculateTrip()
    }

    override func viewDidLoad() {
        numPeople.delegate=self
        numNights.delegate=self
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

