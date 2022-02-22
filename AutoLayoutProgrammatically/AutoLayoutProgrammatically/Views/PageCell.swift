//
//  PageCell.swift
//  AutoLayoutProgrammatically
//
//  Created by Irakli Sokhaneishvili on 21.02.22.
//

import UIKit

class PageCell: UICollectionViewCell {
    
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
//        attributedText.append(NSAttributedString(
//            string: "\n\n\nAre you ready for loads and load os fun? Don't wait any longer! We hope to see you in our stores soon.",
//            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    //MARK: --> Image and Text Layout
    private func setupLayout() {
        
        let topImageContainerView: UIView = {
            let container = UIView()
            container.translatesAutoresizingMaskIntoConstraints = false
            addSubview(container)
            
            container.addSubview(BlobImageView)
            
            return container
        }()
        
        let topImageContainerViewConstraints = [
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            
            BlobImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            BlobImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            BlobImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5)
            
        ]
        
        descriptionTextView.backgroundColor = .clear
        addSubview(descriptionTextView)
        let descriptionTextViewConstraints = [
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]

        NSLayoutConstraint.activate(descriptionTextViewConstraints)
        NSLayoutConstraint.activate(topImageContainerViewConstraints)
        
    }
    
}
