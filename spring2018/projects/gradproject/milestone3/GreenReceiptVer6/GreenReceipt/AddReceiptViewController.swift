//
//  AddReceiptViewController.swift
//  GreenReceipt
//
//  Created by Gabriel Chapel on 4/17/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class AddReceiptViewController: UIViewController {
    
    var savedLocation:String?
    var savedDate:String?
    var savedCost:String?
    var imagePath:String?
    var savedImagePath:String?
    
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var dateTextfield: UITextField!
    @IBOutlet weak var costTextfield: UITextField!
    @IBOutlet weak var receiptImage: UIButton!
    
    @IBAction func takePicture(_ sender: UIButton) {
    }
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        if segue.identifier=="saveSegue"{
            let source = segue.source as! PhotoViewController
            receiptImage.setImage(UIImage(contentsOfFile: source.imagePath!), for: .normal)
            imagePath = source.imagePath
            print(UIImage(contentsOfFile: source.imagePath!))
        }
    }
    
    // Done button
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue"{
            savedLocation = locationTextfield?.text
            savedDate = dateTextfield?.text
            savedCost = costTextfield?.text
            savedImagePath = imagePath
            print("Done Segue One")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
