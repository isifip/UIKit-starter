//
//  ViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by Irakli Sokhaneishvili on 21.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: --> Properties
    let BlobImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Blob")
        
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Join us today in our fun and games!"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        
        return textView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        view.addSubview(BlobImageView)
        view.addSubview(descriptionTextView)

        setUpLayout()
        
    }
    
    private func setUpLayout() {
        let BlobImageViewConstraints = [
            BlobImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            BlobImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            BlobImageView.widthAnchor.constraint(equalToConstant: 200),
            BlobImageView.heightAnchor.constraint(equalToConstant: 200)
        ]
        let descriptionTextViewConstraints = [
            descriptionTextView.topAnchor.constraint(equalTo: BlobImageView.bottomAnchor, constant: 100),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]

        NSLayoutConstraint.activate(BlobImageViewConstraints)
        NSLayoutConstraint.activate(descriptionTextViewConstraints)
        
    }

}

