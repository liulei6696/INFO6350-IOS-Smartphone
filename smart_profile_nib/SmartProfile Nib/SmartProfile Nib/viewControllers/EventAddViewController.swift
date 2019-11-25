//
//  EventAddViewController.swift
//  SmartProfile Nib
//
//  Created by Lei on 10/27/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import UIKit

class EventAddViewController: UIViewController {

    @IBOutlet weak var nameTextView: UITextField!
    @IBOutlet weak var streetTextView: UITextField!
    @IBOutlet weak var cityTextView: UITextField!
    @IBOutlet weak var stateTextView: UITextField!
    @IBOutlet weak var descriptionTextView: UITextField!
    @IBOutlet weak var startDateTextView: UITextField!
    @IBOutlet weak var endDateTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitAction(_ sender: Any) {
        let name = nameTextView.text!
        let street = streetTextView.text!
        let city = cityTextView.text!
        let state = stateTextView.text!
        let description = descriptionTextView.text!
        let start = startDateTextView.text!
        let end = endDateTextView.text!
        
        if name == "" || end == "" || start == ""{
            return
        }
        let event = Event(name: name, address: Address(street: street, city: city, state: state), description: description, start: transformStringToDate(dateString: start)!, end: transformStringToDate(dateString: end)!)
        events[event.id] = event
        
        let alert = UIAlertController(title: "Success", message: "create sucessful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
