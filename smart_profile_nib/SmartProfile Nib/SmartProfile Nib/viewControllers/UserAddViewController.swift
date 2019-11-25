//
//  UserAddViewController.swift
//  SmartProfile Nib
//
//  Created by Lei on 10/27/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import UIKit

class UserAddViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var streetField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func regitserNewUserAction(_ sender: Any) {
        let name = nameField.text!
        let email = emailField.text!
        let phone = phoneField.text!
        let street = streetField.text!
        let city = cityField.text!
        let state = stateField.text!
        
        if name == "" || email == "" {
            let alert = UIAlertController(title: "Missing", message: "one or more requiered field is missing", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if !isEmailValid(email) {
            let alert = UIAlertController(title: "Error", message: "Email format error", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        if phone != "" {
            if !isPhoneNumValid(phone) {
                let alert = UIAlertController(title: "Error", message: "Phone format error", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
                return
            }
        }
        
        let user = User(name: name, phone: phone, email: email, address: Address(street: street, city: city, state: state))
        users[user.id] = user
        let alert = UIAlertController(title: "Success", message: "user created", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
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
