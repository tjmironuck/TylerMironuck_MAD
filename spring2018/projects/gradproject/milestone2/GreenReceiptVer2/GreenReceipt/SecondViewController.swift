//
//  SecondViewController.swift
//  GreenReceipt
//
//  Created by Tyler MIRONUCK on 4/14/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var confirmationMessage: UILabel!
    
    @IBAction func addGoogleEmail(_ sender: Any) {
        let addalert = UIAlertController(title: "Sync Email", message: "Enter your Gmail address", preferredStyle: .alert)
        //add textfield to the alert
        addalert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "John.Smith@gmail.com"
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addalert.addAction(cancelAction)
        let addItemAction = UIAlertAction(title: "Sync", style: .default, handler: {(UIAlertAction)in
            self.confirmationMessage.text = ("Congratulations!!!\nYour email is synced. Enjoy having all your receipts in one convenient place.")
        })
        addalert.addAction(addItemAction)
        present(addalert, animated: true, completion: nil)
    }
    
    @IBAction func addYahooEmail(_ sender: Any) {
        let addalert = UIAlertController(title: "Sync Email", message: "Enter your yahoo email address", preferredStyle: .alert)
        //add textfield to the alert
        addalert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "John.Smith@yahoo.com"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addalert.addAction(cancelAction)
        let addItemAction = UIAlertAction(title: "Sync", style: .default, handler: {(UIAlertAction)in
            self.confirmationMessage.text = ("Congratulations!!!\nYour email is synced. Enjoy having all your receipts in one convenient place.")
        })
        addalert.addAction(addItemAction)
        present(addalert, animated: true, completion: nil)
    }
    @IBAction func addOutlookEmail(_ sender: UIButton) {
        let addalert = UIAlertController(title: "Sync Email", message: "Enter your Outlook email address", preferredStyle: .alert)
        //add textfield to the alert
        addalert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "John.Smith@outlook.com"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addalert.addAction(cancelAction)
        let addItemAction = UIAlertAction(title: "Sync", style: .default, handler: {(UIAlertAction)in
            self.confirmationMessage.text = ("Congratulations!!!\nYour email is synced. Enjoy having all your receipts in one convenient place.")
        })
        addalert.addAction(addItemAction)
        present(addalert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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

