//
//  ViewController.swift
//  NetflixClone
//
//  Created by Irakli Sokhaneishvili on 17.02.22.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        //MARK: --> TabBar Icons
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        //MARK: --> TabBar Names
        vc1.tabBarItem.title = "Home"
        vc2.tabBarItem.title = "Coming Soon"
        vc3.tabBarItem.title = "Top Search"
        vc4.tabBarItem.title = "Download"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }

}

