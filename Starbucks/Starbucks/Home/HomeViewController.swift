//
//  ViewController.swift
//  Starbucks
//
//  Created by Irakli Sokhaneishvili on 23.02.22.
//

import UIKit

class HomeViewController: StarBucksViewController {
    
    let headerView = HomeHeaderView()
    var headerViewTopConstraint: NSLayoutConstraint?
    
    let tiles = [
        "Star balance",
        "Bonus stars",
        "Try these",
        "Welcome back",
        "Uplifting"
    ]

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


//MARK: --> Animating ScrollView
//extension HomeViewController: UITableViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let y = scrollView.contentOffset.y
//
//        let swipingDown = y <= 0
//        let shouldSnap = y > 30
//        let labelHeight = headerView.greeting.frame.height + 16
//
//        UIView.animate(withDuration: 0.3) {
//            self.headerView.greeting.alpha = swipingDown ? 1.0 : 0.0
//        }
//
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: []) {
//            self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
//            self.view.layoutIfNeeded()
//        }
//
//    }
//}


//MARK: --> Header
extension HomeViewController {
    func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .purple
    }
    
    func layout() {
        view.addSubview(headerView)
        
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

