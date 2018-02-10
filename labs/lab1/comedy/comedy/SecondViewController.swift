//
//  SecondViewController.swift
//  comedy
//
//  Created by Tyler MIRONUCK on 2/9/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var comedianPicker: UIPickerView!
    
    var chosenComedian: String = ""
    
    let popularComedians = ["Dave Chappelle", "Louis C.K.", "Amy Schumer", "Jerry Seinfeld", "Kevin Hart", "Chris Rock", "Jim Gaffigan", "Patton Oswalt", "Bill Cosby", "Aziz Ansari", "Eddie Murphy", "Sarah Silverman", "Joan Rivers", "Robin Williams", "Jon Stewart", "Jay Leno", "Jeff Ross", "Wanda Sykes", "Judd Apatow", "Dane Cook", "Steve Martin", "Margaret Cho", "Daniel Tosh", "Tracy Morgan"]
    
    //Methods to implement the picker
    //Required for the UIPickerViewDataSource protocol
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //number of components
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return popularComedians.count //returns number of rows of data
    }
    
    //Picker Delegate methods
    //returns the title for the row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return popularComedians[row]
    }
    
    //Called when a row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenComedian = popularComedians[row]
    }
    
    @IBAction func gotoYouTube(_ sender: Any) {
        //check to see if there's an app installed to handle this URL scheme
        if(UIApplication.shared.canOpenURL(URL(string: "youtube://")!)){
            //open the app with this URL scheme
            UIApplication.shared.open(URL(string: "youtube://")!, options: [:], completionHandler: nil)
        }else {
            switch (chosenComedian) {
            case "Dave Chappelle":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=dave+chappelle")!, options: [:], completionHandler: nil)
            case "Louis C.K.":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=louis+c.+k.")!, options: [:], completionHandler: nil)
            case "Amy Schumer":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=amy+schumer")!, options: [:], completionHandler: nil)
            case "Jerry Seinfeld":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=jerry+seinfeld")!, options: [:], completionHandler: nil)
            case "Kevin Hart":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=kevin+hart")!, options: [:], completionHandler: nil)
            case "Chris Rock":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=chris+rock")!, options: [:], completionHandler: nil)
            case "Jim Gaffigan":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=jim+gaffigan")!, options: [:], completionHandler: nil)
            case "Patton Oswalt":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Patton+Oswalt")!, options: [:], completionHandler: nil)
            case "Bill Cosby":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Bill+Cosby")!, options: [:], completionHandler: nil)
            case "Aziz Ansari":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Aziz+Ansari")!, options: [:], completionHandler: nil)
            case "Eddie Murphy":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Eddie+Murphy")!, options: [:], completionHandler: nil)
            case "Sarah Silverman":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Sarah+Silverman")!, options: [:], completionHandler: nil)
            case "Joan Rivers":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Joan+Rivers")!, options: [:], completionHandler: nil)
            case "Robin Williams":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Robin+Williams")!, options: [:], completionHandler: nil)
            case "Jon Stewart":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Jon+Stewart")!, options: [:], completionHandler: nil)
            case "Jay Leno":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Jay+Leno")!, options: [:], completionHandler: nil)
            case "Jeff Ross":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Jeff+Ross")!, options: [:], completionHandler: nil)
            case "Wanda Sykes":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Wanda+Sykes")!, options: [:], completionHandler: nil)
            case "Judd Apatow":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Judd+Apatow")!, options: [:], completionHandler: nil)
            case "Dane Cook":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Dane+Cook")!, options: [:], completionHandler: nil)
            case "Steve Martin":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Steve+Martin")!, options: [:], completionHandler: nil)
            case "Margaret Cho":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Margaret+Cho")!, options: [:], completionHandler: nil)
            case "Daniel Tosh":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Daniel+Tosh")!, options: [:], completionHandler: nil)
            case "Tracy Morgan":
                UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=Tracy+Morgan")!, options: [:], completionHandler: nil)
            default:
               UIApplication.shared.open(URL(string: "https://www.youtube.com/results?search_query=stand+up+comedians")!, options: [:], completionHandler: nil)
            }
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

