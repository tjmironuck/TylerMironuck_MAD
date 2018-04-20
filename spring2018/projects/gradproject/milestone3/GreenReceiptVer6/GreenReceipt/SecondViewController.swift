//
//  SecondViewController.swift
//  GreenReceipt
//
//  Created by Tyler MIRONUCK on 4/14/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var addGoogleButton: UIButton!
    @IBOutlet weak var addYahooButton: UIButton!
    @IBOutlet weak var addOutlookButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    @IBAction func logOutButton(_ sender: UIButton) {
        let addalert = UIAlertController(title: "", message: "Are you sure you would like to log out of your email?.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addalert.addAction(cancelAction)
        let addItemAction = UIAlertAction(title: "Log Out", style: .default, handler: {(UIAlertAction)in
            self.addGoogleButton.isEnabled = true
            self.addYahooButton.isEnabled = true
            self.addOutlookButton.isEnabled = true
            self.confirmationMessage.text = ("You have successfully logged out of your email.")
        })
        addalert.addAction(addItemAction)
        present(addalert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var confirmationMessage: UILabel!
    @IBAction func addGoogleEmail(_ sender: UIButton) {
        let addalert = UIAlertController(title: "Sync Email", message: "Enter your Gmail address and Password", preferredStyle: .alert)
        //add textfield to the alert
        addalert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "John.Smith@gmail.com"
        }
        addalert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Password"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addalert.addAction(cancelAction)
        let addItemAction = UIAlertAction(title: "Sync", style: .default, handler: {(UIAlertAction)in
            self.addGoogleButton.isEnabled = false
            self.logOutButton.isEnabled = true
            self.confirmationMessage.text = ("Congratulations!!!\nYour email is now synced. Enjoy having all your receipts in one convenient place.")
        })
        addalert.addAction(addItemAction)
        present(addalert, animated: true, completion: nil)
    }
    @IBAction func addYahooEmaio(_ sender: UIButton) {
        let addalert = UIAlertController(title: "Sync Email", message: "Enter your yahoo email address and password", preferredStyle: .alert)
        //add textfield to the alert
        addalert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "John.Smith@yahoo.com"
        }
        addalert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Password"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addalert.addAction(cancelAction)
        let addItemAction = UIAlertAction(title: "Sync", style: .default, handler: {(UIAlertAction)in
            self.addYahooButton.isEnabled = false
            self.logOutButton.isEnabled = true
            self.confirmationMessage.text = ("Congratulations!!!\nYour email is now synced. Enjoy having all your receipts in one convenient place.")
        })
        addalert.addAction(addItemAction)
        present(addalert, animated: true, completion: nil)
    }
    @IBAction func addOutlookEmail(_ sender: UIButton) {
        let addalert = UIAlertController(title: "Sync Email", message: "Enter your Outlook email address and password.", preferredStyle: .alert)
        //add textfield to the alert
        addalert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "John.Smith@outlook.com"
        }
        addalert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Password"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addalert.addAction(cancelAction)
        let addItemAction = UIAlertAction(title: "Sync", style: .default, handler: {(UIAlertAction)in
            self.addOutlookButton.isEnabled = false
            self.logOutButton.isEnabled = true
            self.confirmationMessage.text = ("Congratulations!!!\nYour email is now synced. Enjoy having all your receipts in one convenient place.")
        })
        addalert.addAction(addItemAction)
        present(addalert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //disable log out button
        self.logOutButton.isEnabled = false
        
        //Personalizing color scheme of title logo
        navigationController?.navigationBar.barTintColor = UIColor(red: 115.0/255.0, green: 115.0/255.0, blue: 115.0/255.0, alpha: 1.0)
        
        //Configuring title logo
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "titlelogo")
        imageView.image = image
        navigationItem.titleView = imageView
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

