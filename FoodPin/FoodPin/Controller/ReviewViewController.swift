//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 30.01.22.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: restaurant.image)
        // Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        for rateButton in rateButtons {
            rateButton.alpha = 0
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.0) {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[1].alpha = 1.0
            self.rateButtons[2].alpha = 1.0
            self.rateButtons[3].alpha = 1.0
            self.rateButtons[4].alpha = 1.0
        }
    }

}
