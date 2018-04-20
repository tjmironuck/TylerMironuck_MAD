//
//  AddReceiptViewController.swift
//  GreenReceipt
//
//  Created by Gabriel Chapel on 4/17/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class AddReceiptViewController: UIViewController {
        
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var dateTextfield: UITextField!
    @IBOutlet weak var costTextfield: UITextField!
    @IBOutlet weak var receiptImage: UIButton!
    
    @IBAction func takePicture(_ sender: UIButton) {
    }
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        if segue.identifier=="saveSegue"{
            let source = segue.source as! PhotoViewController
            
            receiptImage.setImage(source.savedPhoto, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
