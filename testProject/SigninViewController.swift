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


class SigninViewController: UIViewController, UITextFieldDelegate, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
            
      self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    
        
      self.mapView.delegate = self
        // TESTING PARSE CONNECTION
        
        /* let testObject2 = PFObject(className: "TestObject")
        testObject2["foo"] = "bar"
        testObject2.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
        testObject2["foo"] = "Janam"
        testObject2.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }*/
        
        
        //Map
        var info1 = CustomPointAnnotation()
        info1.coordinate = CLLocationCoordinate2DMake(8.8583736, 2.2922926)
        info1.title = "Info1"
        info1.subtitle = "Subtitle"
        info1.imageName = "live.gif"
        
       mapView.addAnnotation(info1)
        
       var location = CLLocationCoordinate2DMake(8.8583736, 2.2922926)
          var location2 = CLLocationCoordinate2DMake(8.8573736+0.01, 2.2932926)
        var span = MKCoordinateSpanMake(1, 1)
        var region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
       /*var annotation2 = MKPointAnnotation()
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation2.coordinate = location2
        annotation2.title = "The NEXT"
        annotation.title = "The Eiffle Tower Bro"
        annotation.subtitle = "Janam Maharjan"
        
        mapView.addAnnotation(annotation)
        mapView.addAnnotation(annotation2)

        */
        
        var x = 8.8583736
        var y = 2.2922926
        
        for var i=1;i<5;i++
        {
            x += 0.1
            y += 0.1
            var location3 = CLLocationCoordinate2DMake(x, y)
           var annotation3 = MKPointAnnotation()
            annotation3.coordinate =  location3
            annotation3.title = "Number \(i)"
            mapView.addAnnotation(annotation3)
            
            
            
            userName.delegate = self
            password.delegate = self
            
        }
        
        
      
        
    
    }
    
       func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if !(annotation is CustomPointAnnotation) {
            return nil
        }
        
        let reuseId = "test"
        
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView.canShowCallout = true
        }
        else {
            anView.annotation = annotation
        }
        
        //Set annotation-specific properties **AFTER**
        //the view is dequeued or created...
        
        let cpa = annotation as! CustomPointAnnotation
        anView.image = UIImage(named:cpa.imageName)
        
        return anView
    }
    
        @IBAction func signInTouched(sender: UIButton) {
        
        let signIn = SignIn(user: userName.text!, pass: password.text!)
       
       signIn.signInUser()
        self.dismissViewControllerAnimated(true, completion: nil)
       
        
    }
    

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {
            (placemarks, error) -> Void in
            
            if(error != nil)
            {
                println("Error: " + error.localizedDescription)
                return
            }
            
            if placemarks.count > 0
            {
                let pm = placemarks[0] as! CLPlacemark
                self.displayLocationInfo(pm)
            }
        })
        
    }
    
    func displayLocationInfo(placemark: CLPlacemark)
    {
        self.locationManager.stopUpdatingLocation()
        println(placemark.locality)
        println(placemark.administrativeArea)
        println(placemark.country)
        var loc = placemark.location.coordinate
        println("Latitude: \(loc.latitude)")
        println("Longitude: \(loc.longitude)")
       
        var gameScore = PFObject(className:"geo")
        gameScore["user"] = "TestName"
        let newLoc = PFGeoPoint(latitude: loc.latitude, longitude: loc.longitude)
        gameScore["location"] = newLoc
       
        gameScore.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                println("SUCESSSSSSSS")
            } else {
                println("Error: " )
                return

            }
        }
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error: " + error.localizedDescription)
    }
    
    
    
    
   
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }


}
class CustomPointAnnotation: MKPointAnnotation {
    var imageName: String!
}