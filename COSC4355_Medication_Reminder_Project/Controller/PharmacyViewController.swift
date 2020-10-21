//
//  PharmacyViewController.swift
//  COSC4355_Medication_Reminder_Project
//
//  Created by Kevin Terwelp on 10/18/20.
//  Copyright © 2020 Kevin Terwelp. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class PharmacyViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var pharmacyMapView: MKMapView!
    
    var manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showCurrentLocation()
    }
    
    func showCurrentLocation() {
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        let location = locations[0]
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: myLocation, span: span)
        
        self.pharmacyMapView.setRegion(region, animated: true)
        self.pharmacyMapView.showsUserLocation = true
        
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = myLocation
//        annotation.title = "My Location"
//        annotation.subtitle = "Hi"
//
//        self.pharmacyMapView.addAnnotation(annotation)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
