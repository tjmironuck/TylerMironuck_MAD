//
//  ViewController.swift
//  gifPractice
//
//  Created by Tyler MIRONUCK on 2/27/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var GifView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GifView.loadGif(name: "clooney")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

