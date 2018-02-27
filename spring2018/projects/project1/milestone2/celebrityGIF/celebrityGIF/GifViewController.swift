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
