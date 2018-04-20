//
//  DetailViewController.swift
//  GreenReceipt
//
//  Created by Tyler MIRONUCK on 4/15/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    
    //var store = [String]()
    //var date = [String]()
    //var amount = [String]()
    
    var store: String?
    var logo: String?
    var date: String?
    var amount: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "titlelogo")
        imageView.image = image
        navigationItem.titleView = imageView
        
        print(store!)
        print(date!)
        print(amount!)
        storeLabel?.text = store
        dateLabel?.text = date
        amountLabel?.text = amount
        logoView?.image=UIImage(named: logo!)
        */

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
