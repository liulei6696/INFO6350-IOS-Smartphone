//
//  EventAddViewController.swift
//  Smartprofile Storyboard
//
//  Created by Lei on 11/4/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import UIKit

class EventAddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButtonAction(_ sender: Any) {
        let name = nameTextField.text!
        let description = descriptionTextView.text!
        let street = streetTextField.text!
        let city = cityTextField.text!
        let state = stateTextField.text!
        
        let start = startTextField.text!
        let end = endTextField.text!
        
        if name == "" || end == "" || start == ""{
            return
        }
        let event = Event(name: name, address: Address(street: street, city: city, state: state), description: description, start: transformStringToDate(dateString: start)!, end: transformStringToDate(dateString: end)!)
        events[event.id] = event
        
        let alert = UIAlertController(title: "Success", message: "create sucessful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func datePicker(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleStartDatePicker), for: .valueChanged)
    }
    
    @objc func handleStartDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        startTextField.text = dateFormatter.string(from: sender.date)
    }
    
    
    @IBAction func endDatePicker(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleEndDatePicker), for: .valueChanged)
    }
    
    @objc func handleEndDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        endTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func pickImageAction(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = pickedImage
        }
    }
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
