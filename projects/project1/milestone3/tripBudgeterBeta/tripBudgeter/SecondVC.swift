//
//  SecondVC.swift
//  tripBudgeter
//
//  Created by Tyler MIRONUCK on 10/16/17.
//  Copyright © 2017 Tyler MIRONUCK. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SecondVC: UIViewController {
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var imagePassed: UIImageView!
    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var hotelLabel: UITextView!
    @IBOutlet weak var entertainmentLabel: UITextView!
       
    @IBOutlet weak var mapView: MKMapView!
    
    var stringPassed = ""
    var hotelNameStringPassed = ""
    var hotelAddressStringPassed = ""
    var pinNamePassed = ""
    var pinSubtitlePassed = ""
    var longitudePassed = 0.000000
    var latitudePassed = 0.000000
    var floatPassed = Float()
    var theImagePassed = UIImage()
    
    override func viewDidLoad() {
        destinationLabel.text = stringPassed
        hotelNameLabel.text = hotelNameStringPassed
        hotelLabel.text = hotelAddressStringPassed
        entertainmentLabel.text = "You have $\(floatPassed) to spend on entertainment while you are there. May I suggest visiting the \(pinNamePassed)? The location is shown on the map below:"
        
        let location = CLLocationCoordinate2D(
            latitude: latitudePassed,
            longitude: longitudePassed
        )
        let span = MKCoordinateSpanMake(0.05, 0.05) //defines the area spanned by a map region
        let region = MKCoordinateRegion(center: location, span: span) //region of the map to be displayed
        mapView.setRegion(region, animated: true) //animates changing the currently visible region
        let annotation = MKPointAnnotation() //create an annotation
        annotation.coordinate=location //sets the coordinates of the annotation
        annotation.title=pinNamePassed //sets the title of the annotation
        annotation.subtitle=pinSubtitlePassed //sets the subtitle of the annotation
        mapView.addAnnotation(annotation) //adds the annotation to the map view
        mapView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        mapView.layer.borderWidth = 3
        
        imagePassed.image = theImagePassed
        //Place a border around image
        imagePassed.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        imagePassed.layer.borderWidth = 3
        
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
