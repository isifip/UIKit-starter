//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 29.01.22.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
    
    @IBOutlet var mapView: MKMapView! {
        didSet {
            mapView.layer.cornerRadius = 20
            mapView.clipsToBounds = true
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
