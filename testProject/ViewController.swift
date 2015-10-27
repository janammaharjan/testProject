//
//  ViewController.swift
//  testProject
//
//  Created by user on 27/10/15.
//  Copyright (c) 2015 user. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationInfo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var location = CLLocationCoordinate2DMake(8.8583736, 2.2922926)
          var location2 = CLLocationCoordinate2DMake(8.8673736, 2.2932926)
        var span = MKCoordinateSpanMake(1, 1)
        var region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        var annotation2 = MKPointAnnotation()
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation2.coordinate = location2
        annotation2.title = "The NEXT"
        annotation.title = "The Eiffle Tower Bro"
        annotation.subtitle = "Janam Maharjan"
        
        mapView.addAnnotation(annotation)
        mapView.addAnnotation(annotation2)
  
            }

    @IBAction func updateLocation(sender: AnyObject) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

