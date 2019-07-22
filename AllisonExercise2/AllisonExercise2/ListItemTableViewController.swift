//
//  ListItemTableViewController.swift
//  AllisonExercise2
//
//  Created by Allison Schneider on 7/17/19.
//  Copyright © 2019 Allison Schneider. All rights reserved.
//

import UIKit

class ListItemTableViewController: UITableViewController {

    // Properties
    var headerTitle = ""
    var headerDollarH = ""
    var headerDollarJ = ""
    var listItems = [ListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadListItems()
        
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ListItemTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ListItemTableViewCell
        let listItem = listItems[indexPath.row]
        let idText = "ID: \( String(listItem.id) )"
        let codeText = "Code: \(listItem.code)"
        let descriptionText = "Description: \(listItem.description)"
        // Print ID, Code and Description on separate lines.
        cell.listItemLabel.text = "\(idText) \n\(codeText) \n\(descriptionText)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        let headerText = "\(self.headerTitle) \n$h: \(self.headerDollarH) \n$j: \(self.headerDollarJ)"
        label.numberOfLines = 0 // Enable dynamic sizing of the header.
        label.text = headerText
        label.backgroundColor = #colorLiteral(red: 0.6592411399, green: 0.8610165715, blue: 0.927321732, alpha: 1)
        return label
    }
    
    public func getRequest(completion: @escaping (APIData) -> Void) {
        
        guard let url = URL(string: "http://echidna:52773/csp/simon/ex2") else {return}
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let data = data {
                do {
                    let apiData = try JSONDecoder().decode(APIData.self, from: data)
                    completion(apiData)
                } catch let error {
                    print(error)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
        task.resume()
    }
    
    func loadListItems() {
        
        self.getRequest() { (output) in
            self.headerTitle = output.title
            self.headerDollarH = output.dollarh
            self.headerDollarJ = output.dollarj
            self.listItems = output.list
        }
        
    }

}
