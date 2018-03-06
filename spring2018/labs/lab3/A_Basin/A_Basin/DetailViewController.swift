//
//  DetailViewController.swift
//  A_Basin
//
//  Created by Tyler MIRONUCK on 2/26/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageInfoLabel: UITextView!
    var imageName : String?
    
    override func viewWillAppear(_ animated: Bool) {
        if let name = imageName {
            imageView.image = UIImage(named: name)
            switch name {
            case "abasin1":
                imageInfoLabel.text = "Arapahoe Basin was founded in December of 1946 by five pioneers of skiing: Larry Jump, Thor Groswold, Sandy Schauffer, Dick Durrance and Max Dercum. You can find runs named after them on \"Founders' Ridge\" in west Montezuma Bowl."
            case "abasin2":
                imageInfoLabel.text = "Arapahoe Basin has 468 total acres, 339 lift-served acres in The Beavers, and 129 hike-back acres in The Steep Gullies. The hike back trail will lead from the bottom of The Beaves & Steep Gullies terrain to the bottom terminal of the Pallavicini Lift. Hike time is approximately 15-30 minuts, depending on equipment and fitness level."
            case "abasin3":
                imageInfoLabel.text = "Underway at Arapahoe Basin is a massive terrain expansion that will extend lift-serviced terrain ino the Beavers. The over 400-acre expansion will include intermediate terrain, glades, and will incorporate The Steep Gullies into its patrolled area."
            case "abasin4":
                imageInfoLabel.text = "In 1946, visitors paid $1.25 to access the mountain. 72 years later, an adult full day ticket costs $92 until April 30."
            case "abasin5":
                imageInfoLabel.text = "Arapahoe Basin is known for its advanced and expert ski terrain. The East Wall boasts a top elevation of 13,050 feet, one of the highest in-bounds skiable areas in North America."
            case "abasin6":
                imageInfoLabel.text = "Arapahoe Basin is nationally recognized for its efforts to reduce the resort's environmental footprint. The ski area has won National Ski Areas Association (NSAA) awards for waste reduction, visual impacts, and water conservation."
            case "abasin7":
                imageInfoLabel.text = "Celebrate spring on the slope with the annual Shakin' at the Basin summer concert series and Swimsuit Parade."
            case "abasin8":
                imageInfoLabel.text = "If you haven't used the two free ski days for your kids at A-Basin this season, now is the time to let them dress up in there goofiest costumes on the slopes. Kids ages 6 to 12 have two free ski days."
            case "abasin9":
                imageInfoLabel.text = "The tradition of skiing in swimsuits dates back to the 1970s."
            case "abasin10":
                imageInfoLabel.text = "Arapahoe Basin Swimsuit Parade, May 2016."
            case "abasin11":
                imageInfoLabel.text = "Arapahoe Basin's Early Riser parking lot is home to a stretch of prime real estate known as \"The Beach\". The Beach backs up to the three lower mountain chairlifts and is the perfect spot to kick back between runs with family and friends. It's a sceen unique to the Basin, and a guaranteed good time! The Beach often plays home to birthday celebrations, reunions, company parties, and other special events."
            case "abasin12":
                imageInfoLabel.text = "A-Basin is the abbreviation for Arapahoe Basin, sometimes also referred to as just \"The Basin.\"."

            default:
                imageInfoLabel.text = "Something went wrong"
            }
        }
        
    }
    
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        var imageArray = [UIImage]()
        imageArray.append(imageView.image!)
        let shareScreen = UIActivityViewController(activityItems: imageArray, applicationActivities: nil)
        shareScreen.modalPresentationStyle = .popover
        shareScreen.popoverPresentationController?.barButtonItem = sender
        present(shareScreen, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
