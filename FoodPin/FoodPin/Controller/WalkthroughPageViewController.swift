//
//  WalkthroughPageViewController.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 01.02.22.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController {

    let pageHeadings = [
        "Create your own food guide",
        "Show your the location",
        "Discover greate restaurants"
    ]
    
    let pageSubHeadings = [
        "Pin your favorite restaurants and create your own food guide",
        "Search and locate your favorite restaurants on map",
        "Find restaurants shared by your friends and other foodies"
    ]
    
    let pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the data source to itself
        dataSource = self
        
        // Create the efirst walkthrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }

}

extension WalkthroughPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        return contentViewController(at: index)
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        // Create a new view controller and pass suitable data
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }
}
