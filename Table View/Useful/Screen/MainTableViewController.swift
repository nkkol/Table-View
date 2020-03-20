//
//  MainTableViewController.swift
//  Table View
//
//  Created by Inna Litvinenko on 3/21/20.
//  Copyright © 2020 Inna Litvinenko. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var companies : [String] = []
    var colors : [UIColor] = []

        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var api = ApiClient (responseType: .success, companiesNames: [])
        api.fetchCompanies()
        companies = api.companiesNames

        for _ in companies.count {
            colors.append(.random())
        }
        
        
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        let company = companies[indexPath.row]
        cell.cellLabel.text = company
        let color = colors[indexPath.row]
        cell.cellView.backgroundColor = color
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        let share = shareAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete, share])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") {(action, view, completion) in
            self.companies.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        return action
    }
    
    func shareAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Share") {(action, view, completion) in
            let toShare = UIActivityViewController(activityItems: [self.companies[indexPath.row]], applicationActivities: [])
            self.present(toShare, animated: true)
        }
        action.backgroundColor = UIColor.gray
        return action
    }


}

extension Int: Sequence {
    public func makeIterator() -> CountableRange<Int>.Iterator {
        return (0..<self).makeIterator()
    }
}
