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
    
    var restaurantIsFavorites = Array(repeating: false, count: 21)
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurantNames, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false, completion: nil)
        
    }
    
    func ConfigureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        let cellIdentifier = "favoritecell"
        let dataSource = UITableViewDiffableDataSource<Section, String>(
            tableView: tableView,
            cellProvider: { tableView, indexPath, restaurantName in
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: cellIdentifier,
                    for: indexPath
                ) as! RestaurantTableViewCell
                cell.nameLabel.text = restaurantName
                cell.locationLabel.text = self.restaurantLocations[indexPath.row]
                cell.typeLabel.text = self.restaurantTypes[indexPath.row]
                cell.thumbnailImageView.image = UIImage(named: self.restaurantNames[indexPath.row])
                cell.accessoryType = self.restaurantIsFavorites[indexPath.row] ? .checkmark : .none
                
                return cell
            }
        )
        return dataSource
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(
            title: nil,
            message: "What do you want to do?",
            preferredStyle: .actionSheet
        )
        // ad dactions to the menu
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        )
        optionMenu.addAction(cancelAction)
        // add "Reserve a table" action
        let reserveActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(
                title: "Not Avaliable yet",
                message: "Sorry, this feature is not avaliable yet. Please retry later",
                preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "Ok",
                                                 style: .default,
                                                 handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        let reverseAction = UIAlertAction(title: "Reserve a table",
                                          style: .default,
                                          handler: reserveActionHandler)
        optionMenu.addAction(reverseAction)
        
        // Mark as favorite action
        let favoriteAction = UIAlertAction(
            title: "Mark as favorite",
            style: .default,
            handler: { (action:UIAlertAction!) in
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = .checkmark
                self.restaurantIsFavorites[indexPath.row] = true
            }
        )
        optionMenu.addAction(favoriteAction)
        
        //Display Menu
        present(optionMenu, animated: true, completion: nil)
        
        // Deselect the row
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
