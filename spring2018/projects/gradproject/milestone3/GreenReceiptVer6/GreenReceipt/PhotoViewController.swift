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
    var imagePath:String?
    var numReceipt = 0
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
    }
    
    // Save image to the document directory and return path url
    func saveImageToDocumentDirectory(_ chosenImage:UIImage) -> String{
        let directoryPath = NSHomeDirectory().appending("/Documents/")
        if !FileManager.default.fileExists(atPath: directoryPath){
            do {
                try FileManager.default.createDirectory(at: NSURL.fileURL(withPath: directoryPath), withIntermediateDirectories: true, attributes: nil)
            } catch{
                print(error)
            }
        }
        let filename = String(numReceipt) + ".jpg"
        numReceipt += 1
        let filepath = directoryPath.appending(filename)
        let url = NSURL.fileURL(withPath: filepath)
        
        do {
            try UIImageJPEGRepresentation(chosenImage, 1.0)?.write(to: url, options: .atomic)
            return filepath
        } catch {
            print(error)
            print("file cannot be saved at path \(filepath), error: \(error)")
            return filepath
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveSegue"{
            savedPhoto=imageView.image
            imagePath = saveImageToDocumentDirectory(savedPhoto!)
            print(imagePath)
            print(UIImage(contentsOfFile: imagePath!))
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
