//
//  UserTableViewController.swift
//  Smartprofile Storyboard
//
//  Created by Lei on 11/3/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import UIKit

public class UserTableViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    var usersList = [User]()
    var filteredUserList = [User]()
    var sc = UISearchController(searchResultsController: nil)
//    var isFiltering = {sc.isActive && !is}
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        sc.searchBar.delegate = self
        sc.searchResultsUpdater = self
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "enter keywords"
        navigationItem.searchController = sc
        
        self.definesPresentationContext = true
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    // MARK: - Table view data source

    override public func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if sc.isActive {
            return filteredUserList.count
        }
        return users.count
    }

    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        usersList = Array(users.values).sorted(by: {(u1, u2) -> Bool in return u1.id > u2.id})
        var user: User
        if sc.isActive {
            user = filteredUserList[indexPath.row]
        } else {
            user = usersList[indexPath.row]
        }
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = "email: "+user.email
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let userToBeDeleted = usersList[indexPath.row]
            users.removeValue(forKey: userToBeDeleted.id)
            usersList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    public func updateSearchResults(for searchController: UISearchController) {
        guard let keywords = searchController.searchBar.text else {return}
        filterWithSearch(keywords)
    }
    
    func filterWithSearch(_ text: String) {
        filteredUserList = usersList.filter({(user) -> Bool in return user.description.lowercased().contains(text.lowercased())})
        tableView.reloadData()
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let row = self.tableView.indexPathForSelectedRow?.row
        let dst = (segue.destination as? UINavigationController)?.topViewController as? UserDetailViewController
        dst?.userId = usersList[row!].id
    }
}
