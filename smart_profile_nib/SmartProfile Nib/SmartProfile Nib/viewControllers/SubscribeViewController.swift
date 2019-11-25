//
//  SubscribeViewController.swift
//  SmartProfile Nib
//
//  Created by Lei on 10/27/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import UIKit

class SubscribeViewController: UIViewController {

    @IBOutlet weak var userIdTextView: UITextField!
    @IBOutlet weak var eventIdTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func subscribeAction(_ sender: Any) {
        let userId = userIdTextView.text!
        let eventId = eventIdTextView.text!
        if userId == "" || eventId == "" {
            return
        }
        guard let user = users[Int(userId)!] else {
            return
        }
        guard let event = events[Int(eventId)!] else {
            return
        }
        user.subscriptions.append(event.id)
        let alert = UIAlertController(title: "Success", message: "subscribed to event", preferredStyle: .alert)
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
