//
//  ViewController.swift
//  favorites_class
//
//  Created by Tyler MIRONUCK on 10/3/17.
//  Copyright © 2017 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var user = Favorite()

    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        
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

