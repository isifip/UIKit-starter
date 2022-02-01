//
//  WalkthroughViewController.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 01.02.22.
//

import UIKit

class WalkthroughViewController: UIViewController {

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet var skipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
