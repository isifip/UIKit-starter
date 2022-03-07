//
//  HistoryViewModel.swift
//  Starbucks
//
//  Created by Irakli Sokhaneishvili on 07.03.22.
//

import Foundation

struct HistoryViewModel {
    
    // Output for display
    var sections = [HistorySection]()
    
    // Input
    var transactions: [Transaction]? {
        didSet {
            guard let txs = transactions else { return }
            
            // filter by month - hard coded
            let firstMonth = "Jul"
            let secondMonth = "Jun"
            let thirdMonth = "May"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            
            let firstMontTransactions = txs.filter {
                let dateString = dateFormatter.string(from: $0.date)
                return dateString.starts(with: firstMonth)
            }
            
            let secondMontTransactions = txs.filter {
                let dateString = dateFormatter.string(from: $0.date)
                return dateString.starts(with: secondMonth)
            }
            
            let thirdMontTransactions = txs.filter {
                let dateString = dateFormatter.string(from: $0.date)
                return dateString.starts(with: thirdMonth)
            }
            
            // Create sections
            
            let firstMonthSection = HistorySection(title: "July", transactions: firstMontTransactions)
            let secondMonthSection = HistorySection(title: "Jun", transactions: secondMontTransactions)
            let thirdMonthSection = HistorySection(title: "May", transactions: thirdMontTransactions)
            
            // Collect for display
            sections = [HistorySection]()
            sections.append(firstMonthSection)
            sections.append(secondMonthSection)
            sections.append(thirdMonthSection)
        }
    }
}
