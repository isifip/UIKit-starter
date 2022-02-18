//
//  TitleCollectionViewCell.swift
//  NetflixClone
//
//  Created by Irakli Sokhaneishvili on 18.02.22.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"

    private let posterImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        
        return imageview
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(posterImageView)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        posterImageView.frame = contentView.bounds
    }
    
    
    
    
    
    public func configure(with model: String) {
        print(model)
    }
}
