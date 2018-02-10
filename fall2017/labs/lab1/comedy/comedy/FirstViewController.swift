//
//  FirstViewController.swift
//  comedy
//
//  Created by Tyler MIRONUCK on 2/9/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var comedianPicker: UIPickerView!
    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var comedySpecialImage: UIImageView!
    
    let comedianComponent = 0
    let specialComponent = 1

    var comedianSpecials = [String: [String]]()
    var comedians = [String]()
    var specials = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // URL for our plist
        if let pathURL = Bundle.main.url(forResource: "comedianspecials", withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                comedianSpecials = try plistdecoder.decode([String: [String]].self, from: data)
                comedians = Array(comedianSpecials.keys)
                specials = comedianSpecials[comedians[0]]! as [String]
            } catch {
                // handle error
                print(error)
            }
        // Do any additional setup after loading the view, typically from a nib.
        }
        //load comedy special image
        comedySpecialImage.image = UIImage(named: "leatherSpecial" )
    }
    
    //Methods to implement the picker
    //Required for the UIPickerViewDataSource protocol
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == comedianComponent {
            return comedians.count
        } else {
            return specials.count
        }
    }
    
    //Picker Delegate methods
    //returns the title for the row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == comedianComponent {
            return comedians[row]
        } else {
            return specials[row]
        }
    }
    
    //Called when a row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //checks which component was picked
        if component == comedianComponent {
            let selectedComedian = comedians[row] //gets the selected comedian
            specials = comedianSpecials[selectedComedian]! //gets the specials for the selected comedian
            comedianPicker.reloadComponent(specialComponent) //reload the specials component
            comedianPicker.selectRow(0, inComponent: specialComponent, animated: true) //set the special component back to 0
        }
        let comediansrow = pickerView.selectedRow(inComponent: comedianComponent) //gets the selected row for the comedian
        let specialsrow = pickerView.selectedRow(inComponent: specialComponent) //gets the selected row for the special
        choiceLabel.text = "\(comedians[comediansrow])'s special\n \"\(specials[specialsrow])\""
        
        //Changing comedy special image
        let specialString = specials[specialsrow]
        switch (specialString) {
        case "The Leather Special":
            comedySpecialImage.image = UIImage(named: "leatherSpecial" )
        case "Live at the Apollo":
            comedySpecialImage.image = UIImage(named: "liveAtTheApollo" )
        case "Mostly Sex Stuff":
            comedySpecialImage.image = UIImage(named: "mostlySexStuff" )
        case "We Are Miracles":
            comedySpecialImage.image = UIImage(named: "weAreMiracles" )
        case "A Speck of Dust":
            comedySpecialImage.image = UIImage(named: "aSpeckOfDust" )
        case "Jesus is Magic":
            comedySpecialImage.image = UIImage(named: "jesusIsMagic" )
        case "I Walked on the Moon":
            comedySpecialImage.image = UIImage(named: "iWalkedOnTheMoon" )
        case "Standing Up":
            comedySpecialImage.image = UIImage(named: "standingUp" )
        case "The Epitome of Hyperbole":
            comedySpecialImage.image = UIImage(named: "epitomeOfHyperbole" )
        case "Live from Radio City Music Hall":
            comedySpecialImage.image = UIImage(named: "radioCityMusicHall" )
        case "Nunchucks and Flamethrowers":
            comedySpecialImage.image = UIImage(named: "nunchucksAndFlamethrowers" )
        case "Harmful If Swallowed":
            comedySpecialImage.image = UIImage(named: "harmfulIfSwallowed" )
        case "Vicious Circle":
            comedySpecialImage.image = UIImage(named: "viciousCircle" )
        case "Rough Around The Edges":
            comedySpecialImage.image = UIImage(named: "roughAroundTheEdges" )
        case "Isolated Incident":
            comedySpecialImage.image = UIImage(named: "isolatedIncident" )
        case "Troublemaker":
            comedySpecialImage.image = UIImage(named: "troublemaker" )
        case "Why Do I Do This?":
            comedySpecialImage.image = UIImage(named: "whyDoIDoThis" )
        case "Let It Go":
            comedySpecialImage.image = UIImage(named: "letItGo" )
        case "You People Are All The Same":
            comedySpecialImage.image = UIImage(named: "youPeopleAreAllTheSame" )
        case "I'm Sorry You Feel That Way":
            comedySpecialImage.image = UIImage(named: "i'mSorryYouFeelThatWay" )
        case "Walk Your Way Out":
            comedySpecialImage.image = UIImage(named: "walkYourWayOut" )
        case "I'm a Grown Little Man":
            comedySpecialImage.image = UIImage(named: "i'mAGrownLittleMan" )
        case "Seriously Funny":
            comedySpecialImage.image = UIImage(named: "seriouslyFunny" )
        case "Laugh at My Pain":
            comedySpecialImage.image = UIImage(named: "laughAtMyPain" )
        case "Let Me Explain":
            comedySpecialImage.image = UIImage(named: "letMeExplain" )
        case "What Now?":
            comedySpecialImage.image = UIImage(named: "whatNow" )
        
        
            
        default:
            comedySpecialImage.image = UIImage(named: "leatherSpecial" )
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

