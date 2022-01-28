//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 27.01.22.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    // We use lazy because without its initial value cannot be
    // retrieved until after the instance initialization completes
    lazy var dataSource = configureDataSource()
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "Cafe Deadend", isFavorite: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "Homei", isFavorite: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "Teakha", isFavorite: false),
        Restaurant(name: "Cafe Loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "Cafe Loisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "Petite Oyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "For Kee Restaurant", isFavorite: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "Po's Atelier", isFavorite: false),
        Restaurant(name: "Bourke Street Bakery", type: "Chocolate", location: "Sydney", image: "Bourke Street Bakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "Haigh's Chocolate", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "Palomino Espresso", isFavorite: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "Upstate", isFavorite: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "Traif", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "Graham Avenue Meats", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "Waffle & Wolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "Five Leaves", isFavorite: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "Barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "Donostia", isFavorite: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "Royal Oak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "CASK Pub and Kitchen", isFavorite: false)
    ]
    
    //MARK: --> View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
        
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurants, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
    }
    
    //MARK: --> UITableView diffable Data Source
    func configureDataSource() -> RestaurantDiffableDataSource {

        let cellIdentifier = "favoritecell"

        let dataSource = RestaurantDiffableDataSource(
            tableView: tableView,
            cellProvider: {  tableView, indexPath, restaurant in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell

                cell.nameLabel.text = restaurant.name
                cell.locationLabel.text = restaurant.location
                cell.typeLabel.text = restaurant.type
                cell.thumbnailImageView.image = UIImage(named: restaurant.image)
                cell.favoriteIcon.isHidden = restaurant.isFavorite ? false : true

                return cell
            }
        )

        return dataSource
    }
    
    //MARK: --> UITableViewDelegate Protocol
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
        let favoriteActionTitle = self.restaurants[indexPath.row].isFavorite ? "Remove from favorites" : "Mark as favorite"
        let favoriteAction = UIAlertAction(
            title: favoriteActionTitle,
            style: .default,
            handler: { (action:UIAlertAction!) in
                let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
                
                cell.favoriteIcon.isHidden = self.restaurants[indexPath.row].isFavorite
                
                self.restaurants[indexPath.row].isFavorite = self.restaurants[indexPath.row].isFavorite ? false : true
                
            }
        )
        optionMenu.addAction(favoriteAction)
        
        //Display Menu
        present(optionMenu, animated: true, completion: nil)
        
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        // Deselect the row
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // selected restaurant
        guard let restaurant = self.dataSource.itemIdentifier(for: indexPath) else {
            return UISwipeActionsConfiguration()
        }
        // delete action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, sourceView, completionHandler in
            var snapshot = self.dataSource.snapshot()
            snapshot.deleteItems([restaurant])
            self.dataSource.apply(snapshot, animatingDifferences: true)
            // Call completion handel to dismiss the action button
            completionHandler(true)
        }
        // Share action
        let shareAction = UIContextualAction(style: .normal, title: "Share") { action, sourceView, completionHandler in
            let defaultText = "Just checking in at \(restaurant.name)"
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(named: restaurant.image) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
        
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        // Configure both actions as swipe action
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
    }
    
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//    }
}
