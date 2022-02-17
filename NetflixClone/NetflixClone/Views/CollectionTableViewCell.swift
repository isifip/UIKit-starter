//
//  CollectionTableViewCell.swift
//  NetflixClone
//
//  Created by Irakli Sokhaneishvili on 17.02.22.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    static let identifier = "CollectionTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemIndigo
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
