//
//  UserAddViewController.swift
//  Smartprofile Storyboard
//
//  Created by Lei on 11/4/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import UIKit

class UserAddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

    @IBAction func pickImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func registerNewUser(_ sender: Any) {
        let name = nameTextField.text!
        let phone = phoneTextField.text!
        let email = emailTextField.text!
        let street = streetTextField.text!
        let city = cityTextField.text!
        let state = stateTextField.text!
        
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
                self.present(alert, animated: true)
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
