//
//  UserDetailViewController.swift
//  Smartprofile Storyboard
//
//  Created by Lei on 11/4/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    var userId: Int16?
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var idTextView: UITextView!
    @IBOutlet weak var phoneTextView: UITextView!
    @IBOutlet weak var emailTextView: UITextView!
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var interestsTextView: UITextView!
    @IBOutlet weak var skillsTextView: UITextView!
    @IBOutlet weak var subscriptionsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let curUser = users[userId ?? 555 ] else { return }
        navigationBar.title = curUser.name
        idTextView.text = String(curUser.id)
        phoneTextView.text = curUser.phone ?? "empty"
        emailTextView.text = curUser.email
        addressTextView.text = curUser.address?.description ?? "empty"
        interestsTextView.text = curUser.interests?.joined(separator: ", ")
        skillsTextView.text = curUser.skills?.joined(separator: ", ")
        subscriptionsTextView.text = curUser.subscriptions?.map({(i) in "\(i)"}).joined(separator: ", ")
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let dst = segue.destination as? SkillTableViewController
        dst?.skills = users[userId!]?.skills ?? [String]()
    }
    

}
