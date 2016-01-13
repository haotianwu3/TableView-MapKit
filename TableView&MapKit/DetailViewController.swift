//
//  DetailViewController.swift
//  TableView&MapKit
//
//  Created by Randolph on 13/1/2016.
//  Copyright © 2016年 September. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


/* detail scene view controller
@IBOutlet weak var distance: UINavigationItem!
@IBOutlet weak var distance: UINavigationItem!
displays its item (the selected master list row) */
class DetailViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var shopName: String?
    var shopLatitude: Double = 0.0
    var shopLongitude: Double = 0.0
    let locationManager = CLLocationManager()
    
    // model to display
    @IBOutlet weak var MapView: MKMapView!
    @IBOutlet weak var distance: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //display user's current location
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.MapView.showsUserLocation = true
        
        
        // display the shop on map
        let shopLocation = CLLocationCoordinate2DMake(shopLatitude, shopLongitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = shopLocation
        annotation.title = self.shopName
        annotation.subtitle = self.distance.title
        MapView.addAnnotation(annotation)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations.last
        let userCenter = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)
        let userRegion = MKCoordinateRegion(center: userCenter, span: MKCoordinateSpanMake(0.0006, 0.0006))
        self.MapView.setRegion(userRegion, animated: true)
        let shopCLLocation: CLLocation = CLLocation(latitude: shopLatitude, longitude: shopLongitude)
        let distanceBetween: CLLocationDistance = (userLocation?.distanceFromLocation(shopCLLocation))!
        self.distance.title = String(format: "%.2f m", distanceBetween)
        
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    }
    
    
}