//
//  GifViewController.swift
//  celebrityGIF
//
//  Created by Tyler MIRONUCK on 2/27/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class GifViewController: UIViewController {
    @IBOutlet weak var GifView: UIImageView!
    /************Attempting to copy gif**************************
    @IBAction func copyGIF(_ sender: Any) {
        var copy_gif = GifView.image
        var pasteBoard = UIPasteboard.general
        pasteBoard.image = copy_gif
    }
    */////////
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        var imageArray = [UIImage]()
        //imageArray.append(GifView!)
        
        //let data = NSData(contentsOf"http://gifimage.net/wp-content/uploads/2017/11/george-clooney-gif-5.gif")
        /*
        let string: String = "http://gifimage.net/wp-content/uploads/2017/11/george-clooney-gif-5.gif"
        let url = Foundation.URL(string: "http://gifimage.net/wp-content/uploads/2017/11/george-clooney-gif-5.gif")
        let sharingItems = [url]
        
        let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        navigationController?.present(activityViewController, animated: true) {
            // ...
        }
        */
        
        let imagePath = URL(string: "http://gifimage.net/wp-content/uploads/2017/11/george-clooney-gif-5.gif")
        let animatedGif = try? Data(contentsOf: imagePath!)
        let sharingItems: Array = [animatedGif]
        print(sharingItems)
        
        
        let shareScreen = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        shareScreen.modalPresentationStyle = .popover
        shareScreen.popoverPresentationController?.barButtonItem = sender
        present(shareScreen, animated: true, completion: nil)
 
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
         GifView.loadGif(name: "clooney")
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
