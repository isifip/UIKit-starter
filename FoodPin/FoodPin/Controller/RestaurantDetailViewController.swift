//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 28.01.22.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeaderView!
    
    var restaurant: Restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        // Nav bar appearance
        navigationController?.navigationBar.prefersLargeTitles = false
        
        
        // Configure header View
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.headerImageView.image = UIImage(named: restaurant.image)
        
        let heartImage = restaurant.isFavorite ? "heart.fill" : "heart"
        headerView.heartButton.tintColor = restaurant.isFavorite ? .systemYellow : .white
        headerView.heartButton.setImage(UIImage(systemName: heartImage), for: .normal)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            destinationController.restaurant = restaurant
        }
    }
    
}

extension RestaurantDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: RestaurantDetailTextCell.self),
                for: indexPath) as! RestaurantDetailTextCell
            cell.descriptionLabel.text = restaurant.description
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: RestaurantDetailTwoColumnCell.self),
                for: indexPath) as! RestaurantDetailTwoColumnCell
            cell.column1TitleLabel.text = "Address"
            cell.column1TextLabel.text = restaurant.location
            cell.column2TitleLabel.text = "Phone"
            cell.column2TextLabel.text = restaurant.phone
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: RestaurantDetailMapCell.self),
                for: indexPath) as! RestaurantDetailMapCell
            cell.configure(location: restaurant.location)
            cell.selectionStyle = .none
            return cell
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
        }
        
    }
}
