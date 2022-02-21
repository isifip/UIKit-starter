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
        
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(
            string: "Join us today in our fun and games!",
            attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor(named: "PrimaryForeground") as Any]
        )
        attributedText.append(NSAttributedString(
            string: "\n\n\nAre you ready for loads and load os fun? Don't wait any longer! We hope to see you in our stores soon.",
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(descriptionTextView)
        
        
        setupLayout()
        setupButtonControls()
        
    }
    
    private func setupButtonControls() {
        view.addSubview(previousButton)
        previousButton.backgroundColor = .red
        
        let previousButtonConstraints = [
            previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            previousButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            previousButton.heightAnchor.constraint(equalToConstant: 50)
            
        ]
        
        NSLayoutConstraint.activate(previousButtonConstraints)
        
    }
    
    private func setupLayout() {
        
        let topImageContainerView: UIView = {
            let container = UIView()
            container.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(container)
            
            container.addSubview(BlobImageView)
            
            return container
        }()
        
        let topImageContainerViewConstraints = [
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            BlobImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            BlobImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            BlobImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5)
            
        ]
        let descriptionTextViewConstraints = [
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]

        NSLayoutConstraint.activate(descriptionTextViewConstraints)
        NSLayoutConstraint.activate(topImageContainerViewConstraints)
        
    }

}

