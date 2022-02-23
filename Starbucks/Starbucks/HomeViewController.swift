//
//  ViewController.swift
//  Starbucks
//
//  Created by Irakli Sokhaneishvili on 23.02.22.
//

import UIKit

class HomeViewController: StarBucksViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        setTabBarItem(imageName: "house.fill", title: "Home")
        
    }

    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good afternoon, Irakli"
    }

}

