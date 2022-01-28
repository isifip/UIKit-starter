//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 28.01.22.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    var restaurantImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never

        restaurantImageView.image = UIImage(named: restaurantImageName)
    }
    
    
}
