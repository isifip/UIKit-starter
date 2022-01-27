//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 27.01.22.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    enum Section {
        case all
    }
    // We use lazy because without its initial value cannot be
    // retrieved until after the instance initialization completes
    lazy var dataSource = ConfigureDataSource()
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurantNames, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: false, completion: nil)
        
    }
    
    func ConfigureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        let cellIdentifier = "datacell"
        let dataSource = UITableViewDiffableDataSource<Section, String>(
            tableView: tableView,
            cellProvider: { tableView, indexPath, restaurantName in
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: cellIdentifier,
                    for: indexPath
                )
                cell.textLabel?.text = restaurantName
                cell.imageView?.image = UIImage(named: "restaurant")
                
                return cell
            }
        )
        return dataSource
    }
    
}
