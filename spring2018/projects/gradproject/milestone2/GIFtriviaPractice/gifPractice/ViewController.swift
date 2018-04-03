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
    
    let gifsArray = ["deniro2", "deniro3", "deniro4", "deniro5", "deniro6", "deniro7", "deniro8", "deniro9", "deniro10", "deniro11", "deniro12", "deniro13", "deniro14", "deniro15", "deniro16", "deniro17", "deniro18"]
    
    var currentGIF = 0
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake
        {
            print("SHAKE")
            GifView.loadGif(name: gifsArray[currentGIF])
        }
        
        if (currentGIF == gifsArray.count-1){
            currentGIF = 0
        }
        else{
            currentGIF += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GifView.loadGif(name: "deniro1")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

