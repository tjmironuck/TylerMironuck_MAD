//
//  GIFViewController.swift
//  gifs
//
//  Created by Tyler MIRONUCK on 3/11/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class GIFViewController: UIViewController {
    @IBOutlet weak var GifView: UIImageView!
    
    var urlDictionary = [String : String]()
    var chosenURL : String?
    var imageName : String?
    
    var urlList=Urls()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URL for our plist
        if let pathURL = Bundle.main.url(forResource: "gifURLs", withExtension: "plist"){
            
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                urlList.urlData = try plistdecoder.decode([String: String].self, from: data)
                urlList.urls = Array(urlList.urlData.keys)
                //print(urlList.urlData)
            } catch {
                // handle error
                print(error)
            }
        }
        
        if let urlCheck = urlList.urlData[imageName!] {
            chosenURL = urlCheck
            //print(chosenURL!)
        }
        
        GifView.loadGif(name: imageName!)
        //print(imageName!)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        
        print(chosenURL!)
       
        //let imagePath = URL(string: "http://gifimage.net/wp-content/uploads/2017/11/george-clooney-gif-5.gif")
        let imagePath = URL(string: chosenURL!)
        let animatedGif = try? Data(contentsOf: imagePath!)
        let sharingItems: Array = [animatedGif]
        print(sharingItems)
        
        
        let shareScreen = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        shareScreen.modalPresentationStyle = .popover
        shareScreen.popoverPresentationController?.barButtonItem = sender
        present(shareScreen, animated: true, completion: nil)
 
        
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
