//
//  RestaurantDiffableDataSource.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 28.01.22.
//

import UIKit

enum Section {
    case all
}

class RestaurantDiffableDataSource: UITableViewDiffableDataSource<Section, Restaurant> {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
}
