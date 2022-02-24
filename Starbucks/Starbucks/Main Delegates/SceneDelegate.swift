//
//  SceneDelegate.swift
//  Starbucks
//
//  Created by Irakli Sokhaneishvili on 23.02.22.
//

import UIKit

class StarBucksViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }
    
    func commonInit() {
        
    }
    
    func setTabBarItem(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}


class ScanViewController: StarBucksViewController {
    override func viewDidLoad() {
        title = "Scan"
        view.backgroundColor = .systemIndigo
    }
    override func commonInit() {
        setTabBarItem(imageName: "qrcode", title: "Scan")
    }
}

class OrderViewController: StarBucksViewController {
    override func viewDidLoad() {
        title = "Order"
        view.backgroundColor = .systemRed
    }
    
    override func commonInit() {
        setTabBarItem(imageName: "arrow.up.bin.fill", title: "Order")
    }
}

class GiftViewController: StarBucksViewController {
    override func viewDidLoad() {
        title = "Scan"
        view.backgroundColor = .systemCyan
    }
    override func commonInit() {
        setTabBarItem(imageName: "gift.fill", title: "Gift")
    }
}

class StoreViewController: StarBucksViewController {
    override func viewDidLoad() {
        title = "Stores"
        view.backgroundColor = .systemPink
    }
    
    override func commonInit() {
        setTabBarItem(imageName: "location.fill", title: "Stores")
    }
}



class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let homeVC = HomeViewController()
        let scanVC = ScanViewController()
        let orderVC = OrderViewController()
        let giftVC = GiftViewController()
        let storeVC = StoreViewController()
        
        
        let scanNC = UINavigationController(rootViewController: scanVC)
        let orderNC = UINavigationController(rootViewController: orderVC)
        let giftNC = UINavigationController(rootViewController: giftVC)
        let storeNC = UINavigationController(rootViewController: storeVC)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeVC, scanNC, orderNC, giftNC, storeNC]
        
        window?.rootViewController = tabBarController
        
        tabBarController.tabBar.tintColor = .lightGreen
        tabBarController.tabBar.isTranslucent = false
        
    }

}

