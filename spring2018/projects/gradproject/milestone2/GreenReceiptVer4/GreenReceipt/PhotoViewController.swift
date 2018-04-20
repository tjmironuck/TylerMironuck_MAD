//
//  PhotoViewController.swift
//  GreenReceipt
//
//  Created by Gabriel Chapel on 4/17/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var capturedPhoto:UIImage?
    var savedPhoto:UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveSegue"{
            savedPhoto=imageView.image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let availableImage = capturedPhoto{
            imageView.image = availableImage
        }
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
