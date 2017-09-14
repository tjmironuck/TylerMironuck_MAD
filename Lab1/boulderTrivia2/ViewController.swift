//
//  ViewController.swift
//  boulderTrivia2
//
//  Created by Tyler MIRONUCK on 9/10/17.
//  Copyright © 2017 Tyler Mironuck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var factImage: UIImageView!
    @IBOutlet weak var factLabel: UILabel!

    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            factImage.image=UIImage(named: "flatiron")
            let text = "Boulder's Third Flatiron towers 1,400 feet high, a few hundred feet higher than the Empire State Building and has been climbed by people without using their hands, on roller skates, naked and in 8 minutes (by separate climbers)."
            factLabel.text = text
        }
        else if sender.tag == 2 {
            factImage.image=UIImage(named: "the_sink")
            let text = "Robert Redford was a janitor at The Sink restaurant in Boulder before moving on to become famous!"
            factLabel.text = text
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

