//
//  RestaurantDetailHeaderView.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 29.01.22.
//

import UIKit

class RestaurantDetailHeaderView: UIView {

    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var heartButton: UIButton!
    

}
