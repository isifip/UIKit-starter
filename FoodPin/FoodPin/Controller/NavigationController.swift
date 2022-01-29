//
//  NavigationController.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 29.01.22.
//

import UIKit

class NavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }

}
