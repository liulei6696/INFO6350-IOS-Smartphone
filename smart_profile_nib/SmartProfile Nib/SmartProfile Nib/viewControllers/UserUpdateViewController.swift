//
//  UserUpdateViewController.swift
//  SmartProfile Nib
//
//  Created by Lei on 10/27/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import UIKit

class UserUpdateViewController: UIViewController {

    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var skillTextField: UITextField!
    @IBOutlet weak var interestTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func updateAction(_ sender: Any) {
        let id = userIdTextField.text!
        let name = nameTextField.text!
        let phone = phoneTextField.text!
        let street = streetTextField.text!
        let city = cityTextField.text!
        let state = stateTextField.text!
        
        if id == "" {
            return
        }
        
        guard let user = users[Int(id)!] else {
            let alert = UIAlertController(title: "Error", message: "user not exist", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
            return
        }
        
        if phone != "" {
            if !isPhoneNumValid(phone) {
                let alert = UIAlertController(title: "Error", message: "phone format error", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
                return
            }
        }
        
        if name != "" {
            user.name = name
        }
        if phone != "" {
            user.phone = phone
        }
        if street != "" && city != "" && state != "" {
            user.address?.street = street
            user.address?.state = state
            user.address?.city = city
        }
        
        let alert = UIAlertController(title: "Success", message: "update sucessful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    @IBAction func addSkillAction(_ sender: Any) {
        let skill = skillTextField.text!
        let id = userIdTextField.text!
        if skill == "" {
            return
        }
        guard let user = users[Int(id)!] else {
            return
        }
        user.skills.append(skill)
        skillTextField.text = "" // clear input
    }
    
    
    @IBAction func addInterestAction(_ sender: Any) {
        let interest = interestTextField.text!
        let id = userIdTextField.text!
        if interest == "" {
            return
        }
        guard let user = users[Int(id)!] else {
            return
        }
        user.interests.append(interest)
        interestTextField.text = "" // clear input
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
