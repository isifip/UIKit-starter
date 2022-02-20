//
//  DownloadsViewController.swift
//  NetflixClone
//
//  Created by Irakli Sokhaneishvili on 17.02.22.
//

import UIKit

class DownloadsViewController: UIViewController {

    private var titles = [TitleItem]()
    
    private let DownloadedTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        title = "Downloads"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        
        DownloadedTable.delegate = self
        DownloadedTable.dataSource = self
    }

}


extension DownloadsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        
        let title = titles[indexPath.row]
        
        cell.configure(with: TitleViewModel(titleName: title.originalName ?? title.originalTitle ?? "Unknown title name", posterURL: title.posterPath ?? ""))
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
