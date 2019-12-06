//
//  EventTableViewController.swift
//  Smartprofile Storyboard
//
//  Created by Lei on 11/3/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import UIKit
import CoreData

public class EventTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var eventList = [Event]()
    var filteredEventList = [Event]()
    var sc = UISearchController(searchResultsController: nil)
    
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
    
    override public func viewWillAppear(_ animated: Bool) {
        eventList = Array(events.values).sorted(by: {(e1, e2) -> Bool in return e1.id > e2.id})
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
            return filteredEventList.count
        }
        return events.count
    }

    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        eventList = Array(events.values).sorted(by: {(e1, e2) -> Bool in return e1.id > e2.id})
        var event: Event
        if sc.isActive {
            event = filteredEventList[indexPath.row]
        } else {
            event = eventList[indexPath.row]
        }
        cell.textLabel?.text = event.name
        
        let df = DateFormatter()
        df.dateFormat = "MM/dd/yyyy"
        cell.detailTextLabel?.text = "start: \(df.string(from: event.start!))"

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
            let eventToDelete = eventList[indexPath.row]
            events.removeValue(forKey: eventToDelete.id)
            eventList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    public func updateSearchResults(for searchController: UISearchController) {
        guard let keywords = searchController.searchBar.text else {return}
        filterWithSearch(keywords)
    }

    func filterWithSearch(_ text:String) {
        filteredEventList = eventList.filter({(event) -> Bool in return event.description.lowercased().contains(text.lowercased())})
        
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
        let dst = (segue.destination as? UINavigationController)?.topViewController as? EventDetailViewController
        dst?.eventId = eventList[row!].id
    }
    
    @IBAction func getEventFromURL(_ sender: Any) {
        let keyword = "computer"
        let token = "ZRD2AHUVZZXXZGBVDLQQ"
        let token2 = "NYW4HQIZ3QLW723ZSJJ2"
        let filter_location = "Boston"
        let categories = 101
        let limit = 30
        
        let cdm = CoreDataManager.shared
        let semaphore = DispatchSemaphore(value: 0)
        let urlString = "https://www.eventbriteapi.com/v3/events/search/?token="+token2+"&q="+keyword+"&location.address="+filter_location
        
        guard let url = URL(string: urlString) else {
            print("construct url error")
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            (data, reponse, error) in
            guard let dataResponse = data else {
                print("error in getting back data")
                return
            }
            let jsonResponse = try? JSONSerialization.jsonObject(with: dataResponse, options: [])
            if let dict = jsonResponse as? [String: Any] {
                if let eventsArr = dict["events"] as? [[String: Any]] {
                    var count = 0
                    for event in eventsArr {
                        let eventObj = Event(context: NSManagedObjectContext.current)
                        eventObj.id = cdm.getNextEventId()
//                            Int16(event["id"] as! String) ?? cdm.getNextEventId()
                        if let name = event["name"] as? [ String: String] {
                            eventObj.name = name["text"]
                        }
                        if let start = event["start"] as? [String: String] {
                            eventObj.start = self.stringToData(str: start["lcoal"] ?? "2019-12-02T09:00:00")
                        }
                        events[eventObj.id] = eventObj
                        print ("added [\(eventObj.name!)]")
                        count += 1
                        if count == limit {
                            break
                        }
                    }
                }
            } else {
                print("parsing data error")
            }
            semaphore.signal()
//            self.tableView.reloadData()
        }
        
        task.resume()
        
        semaphore.wait()
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Info", message: "searching events in: \(keyword), \(filter_location)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            self.tableView.reloadData()
        }
        
//        self.tableView.reloadData()
    }
    
    func stringToData(str: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.date(from: str)!
    }
    
}
