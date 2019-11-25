//
//  EventDetailViewController.swift
//  Smartprofile Storyboard
//
//  Created by Lei on 11/4/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    var eventId: Int?
    
    @IBOutlet weak var idTextView: UITextView!
    @IBOutlet weak var nameTextView: UITextView!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var startTextView: UITextView!
    @IBOutlet weak var endtextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let event = events[eventId!] else {return }
        navigationItem.title = event.name
        idTextView.text = String(event.id)
        nameTextView.text = event.name
        descTextView.text = event.eventDescription
        addressTextView.text = event.address.description
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        startTextView.text = dateFormatter.string(from: event.start)
        endtextView.text = dateFormatter.string(from: event.end)
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
