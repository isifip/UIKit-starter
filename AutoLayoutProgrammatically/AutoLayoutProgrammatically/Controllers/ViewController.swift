//
//  ViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by Irakli Sokhaneishvili on 21.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        //image.clipsToBounds = true
        image.image = UIImage(named: "Blob")
        
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)
        //imageView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        let imageViewConstraints = [
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ]

        NSLayoutConstraint.activate(imageViewConstraints)
        
        
    }
    
    

}

