//
//  ViewController.swift
//  myEducation
//
//  Created by Tyler MIRONUCK on 9/20/17.
//  Copyright © 2017 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var schoolImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    
    @IBAction func changeInfo(_ sender: Any) {
        updateImage()
        updateCaps()
    }
    
    @IBAction func updateFont(_ sender: UISwitch) {
        updateCaps()
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize=sender.value
        fontSizeLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
    
    func updateImage() {
        if imageControl.selectedSegmentIndex==0 {
            titleLabel.text="University of Missouri at Columbia"
            schoolImage.image=UIImage(named: "mizzou")
        }
        else if imageControl.selectedSegmentIndex==1 {
            titleLabel.text="University of Colorado at Boulder"
            schoolImage.image=UIImage(named: "cuBoulder")
        }
    }
    
    
    func updateCaps() {
        if capitalSwitch.isOn {
            titleLabel.text=titleLabel.text?.uppercased()
            titleLabel.textColor = UIColor.red
        } else {
            titleLabel.text=titleLabel.text?.lowercased()
            titleLabel.textColor = UIColor.green
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

