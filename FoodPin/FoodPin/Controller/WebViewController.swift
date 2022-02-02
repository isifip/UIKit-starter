//
//  WebViewController.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 02.02.22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    var targetURL = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: targetURL) {
            let request = URLRequest(url: url)
            webView.load(request)
        }

        // Do any additional setup after loading the view.
    }
    
}
