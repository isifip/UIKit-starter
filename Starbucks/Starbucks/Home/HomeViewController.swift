//
//  ViewController.swift
//  Starbucks
//
//  Created by Irakli Sokhaneishvili on 23.02.22.
//

import UIKit

class HomeViewController: StarBucksViewController {
    
    let headerView = HomeHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        setTabBarItem(imageName: "house.fill", title: "Home")
        
        style()
        layout()
        
    }

    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good afternoon, Irakli"
    }

}

extension HomeViewController {
    func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

