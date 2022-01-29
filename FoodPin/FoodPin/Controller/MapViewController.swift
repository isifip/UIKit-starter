//
//  MapViewController.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 30.01.22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet var mapVIew: MKMapView!
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Convert address to coordinate and annotate it on map
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location) { placemarks, error in
            if let error = error {
                print(error)
                return
            }
            if let placemarks = placemarks {
                // Get first placemark
                let placemark = placemarks[0]
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    // Display the annotation
                    self.mapVIew.showAnnotations([annotation], animated: true)
                    self.mapVIew.selectAnnotation(annotation, animated: true)
                }
            }
        }
    }
    

}
