//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 28.01.22.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantTypeLabel: UILabel!
    @IBOutlet weak var restaurantLocationLabel: UILabel!
    @IBOutlet weak var restaurantStackViewHeader: UIStackView! {
        didSet {
            restaurantStackViewHeader.layer.cornerRadius = 20
            restaurantStackViewHeader.clipsToBounds = true
        }
    }
    
    var restaurant: Restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never

        restaurantNameLabel.text = restaurant.name
        restaurantTypeLabel.text = restaurant.type
        restaurantLocationLabel.text = restaurant.location
        restaurantImageView.image = UIImage(named: restaurant.image)
        
    }
    
    
}
