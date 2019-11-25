//
//  AppDelegate.swift
//  EmptyApp
//
//  Created by rab on 10/15/17.
//  Copyright © 2017 rab. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var users = [Int: User]()
    var events = [Int: Event]()

    let userService = UserService()
    let eventService = EventService()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = UIColor.lightGray
            window.rootViewController = UIViewController()
            window.makeKeyAndVisible()
            
            initialoizeWithSampleData(users: &users, events: &events)
            
            let userButton: UIButton = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 50))
            userButton.backgroundColor = .black
            userButton.setTitle("USER", for: .normal)
            userButton.addTarget(self, action: #selector(userButtonAction), for: .touchUpInside)
            userButton.layer.cornerRadius = 25.0
            
            let eventButton: UIButton = UIButton(frame: CGRect(x: 100, y: 700, width: 200, height: 50))
            eventButton.backgroundColor = .black
            eventButton.setTitle("EVENT", for: .normal)
            eventButton.addTarget(self, action: #selector(eventButtonAction), for: .touchUpInside)
            eventButton.layer.cornerRadius = 25.0
            
            window.addSubview(userButton)
            window.addSubview(eventButton)
        }

        return true
    }
    
    @objc func userButtonAction(sender: UIButton) {
        
        let userView: UIView = UIView(frame: (window?.bounds)!)
        userView.backgroundColor = .systemGray
        window?.addSubview(userView)
        let closeButton: UIButton = UIButton(frame: CGRect(x: 100, y: 800, width: 200, height: 50))
        closeButton.setTitle("Close", for: .normal)
        closeButton.backgroundColor = .systemRed
        closeButton.layer.cornerRadius = 25.0
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        let viewUsers: UIButton = UIButton(frame: CGRect(x: 70, y: 600, width: 120, height: 50))
        viewUsers.setTitle("View All", for: .normal)
        viewUsers.backgroundColor = .black
        viewUsers.layer.cornerRadius = 10.0
        viewUsers.addTarget(self, action: #selector(viewAllUsers), for: .touchUpInside)
        
        let deleteUser: UIButton = UIButton(frame: CGRect(x: 70, y: 660, width: 120, height: 50))
        deleteUser.setTitle("Delete User", for: .normal)
        deleteUser.backgroundColor = .red
        deleteUser.layer.cornerRadius = 10.0
        deleteUser.addTarget(self, action: #selector(deleteUserAction), for: .touchUpInside)
        
        let updateUser: UIButton = UIButton(frame: CGRect(x: 210, y: 600, width: 120, height: 50))
        updateUser.setTitle("Update User", for: .normal)
        updateUser.backgroundColor = .black
        updateUser.layer.cornerRadius = 10.0
        updateUser.addTarget(self, action: #selector(updateUserAction), for: .touchUpInside)
        
        let addUser: UIButton = UIButton(frame: CGRect(x: 210, y: 660, width: 120, height: 50))
        addUser.setTitle("Add User", for: .normal)
        addUser.layer.cornerRadius = 10.0
        addUser.backgroundColor = .black
        addUser.addTarget(self, action: #selector(addUserAction), for: .touchUpInside)
        
        userView.addSubview(addUser)
        userView.addSubview(updateUser)
        userView.addSubview(deleteUser)
        userView.addSubview(closeButton)
        userView.addSubview(viewUsers)

    }
    
    @objc func eventButtonAction(sender: UIButton) {
        let eventView: UIView = UIView(frame: (window?.bounds)!)
        eventView.backgroundColor = .systemGray
        window?.addSubview(eventView)
        let closeButton: UIButton = UIButton(frame: CGRect(x: 100, y: 800, width: 200, height: 50))
        closeButton.setTitle("Close", for: .normal)
        closeButton.backgroundColor = .systemRed
        closeButton.layer.cornerRadius = 25.0
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        let viewEvents: UIButton = UIButton(frame: CGRect(x: 70, y: 600, width: 120, height: 50))
        viewEvents.setTitle("View All", for: .normal)
        viewEvents.backgroundColor = .black
        viewEvents.layer.cornerRadius = 10.0
        viewEvents.addTarget(self, action: #selector(viewAllEvents), for: .touchUpInside)
        
        let deleteEvent: UIButton = UIButton(frame: CGRect(x: 70, y: 660, width: 120, height: 50))
        deleteEvent.setTitle("Delete Event", for: .normal)
        deleteEvent.backgroundColor = .red
        deleteEvent.layer.cornerRadius = 10.0
        deleteEvent.addTarget(self, action: #selector(deleteEventAction), for: .touchUpInside)
        
        let updateEvent: UIButton = UIButton(frame: CGRect(x: 210, y: 600, width: 120, height: 50))
        updateEvent.setTitle("Update Event", for: .normal)
        updateEvent.backgroundColor = .black
        updateEvent.layer.cornerRadius = 10.0
        updateEvent.addTarget(self, action: #selector(updateEventAction), for: .touchUpInside)
        
        let addEvent: UIButton = UIButton(frame: CGRect(x: 210, y: 660, width: 120, height: 50))
        addEvent.setTitle("Add Event", for: .normal)
        addEvent.layer.cornerRadius = 10.0
        addEvent.backgroundColor = .black
        addEvent.addTarget(self, action: #selector(addEventAction), for: .touchUpInside)
        
        let searchEvent: UIButton = UIButton(frame: CGRect(x: 100, y: 720, width: 200, height: 50))
        searchEvent.setTitle("Search Event", for: .normal)
        searchEvent.backgroundColor = .black
        searchEvent.layer.cornerRadius = 10.0
        searchEvent.addTarget(self, action: #selector(searchEventAction), for: .touchUpInside)
        
        eventView.addSubview(addEvent)
        eventView.addSubview(updateEvent)
        eventView.addSubview(deleteEvent)
        eventView.addSubview(closeButton)
        eventView.addSubview(viewEvents)
        eventView.addSubview(searchEvent)
    
    }
    
    @objc func close(sender: UIButton) {
        sender.superview?.removeFromSuperview()
    }
    
    @objc func viewAllUsers(sender: UIButton) {
        let superView = sender.superview
        let userInfo: UITextView = UITextView(frame: CGRect(x: 50, y: 70, width: 300, height: 500))
        userInfo.isSelectable = false
        userInfo.isEditable = false
        userInfo.backgroundColor = .darkGray
        userInfo.font = UIFont.systemFont(ofSize: 15)
        userInfo.text = userService.allUsersInfoString(users: users)
        superView?.addSubview(userInfo)
    }
    
    @objc func viewAllEvents(sender: UIButton) {
        let superView = sender.superview
        let eventInfo: UITextView = UITextView(frame: CGRect(x: 50, y: 70, width: 300, height: 500))
        eventInfo.isSelectable = false
        eventInfo.isEditable = false
        eventInfo.backgroundColor = .darkGray
        eventInfo.font = UIFont.systemFont(ofSize: 15)
        eventInfo.text = eventService.allEventsInfoString(events: events)
        superView?.addSubview(eventInfo)
    }
    // MARK: anout users
    @objc func addUserAction(sender: UIButton) {
        let parent = sender.superview
        let formStartY = 150
        let userNameLabel = UILabel(frame: CGRect(x: 80, y: formStartY, width: 70, height: 30))
        userNameLabel.text = "name*:"
        let userNameText = UITextField(frame: CGRect(x: 140, y: formStartY, width: 200, height: 30))
        userNameText.placeholder = "enter user name"
        userNameText.backgroundColor = .white
        userNameText.tag = 1
        
        let userEmailLabel = UILabel(frame: CGRect(x: 80, y: formStartY+40, width: 70, height: 30))
        userEmailLabel.text = "email*:"
        let userEmailText = UITextField(frame: CGRect(x: 140, y: formStartY+40, width: 200, height: 30))
        userEmailText.placeholder = "enter email"
        userEmailText.backgroundColor = .white
        userEmailText.tag = 2
        
        let userPhoneLabel = UILabel(frame: CGRect(x: 80, y: formStartY+80, width: 70, height: 30))
        userPhoneLabel.text = "phone:"
        let userPhoneText = UITextField(frame: CGRect(x: 140, y: formStartY+80, width: 200, height: 30))
        userPhoneText.placeholder = "XXX-XXX-XXXX"
        userPhoneText.backgroundColor = .white
        userPhoneText.tag = 3
        
        let addressStreetLabel = UILabel(frame: CGRect(x: 80, y: formStartY+120, width: 70, height: 30))
        addressStreetLabel.text = "street:"
        let addressStreetText = UITextField(frame: CGRect(x: 140, y: formStartY+120, width: 200, height: 30))
        addressStreetText.placeholder = "enter street"
        addressStreetText.backgroundColor = .white
        addressStreetText.tag = 4
        
        let addressCityLabel = UILabel(frame: CGRect(x: 80, y: formStartY+160, width: 70, height: 30))
        addressCityLabel.text = "city:"
        let addressCityText = UITextField(frame: CGRect(x: 140, y: formStartY+160, width: 200, height: 30))
        addressCityText.placeholder = "enter city"
        addressCityText.backgroundColor = .white
        addressCityText.tag = 5
        
        let addressStateLabel = UILabel(frame: CGRect(x: 80, y: formStartY+200, width: 70, height: 30))
        addressStateLabel.text = "state:"
        let addressStateText = UITextField(frame: CGRect(x: 140, y: formStartY+200, width: 200, height: 30))
        addressStateText.placeholder = "enter state"
        addressStateText.backgroundColor = .white
        addressStateText.tag = 6
        
        let submitButton = UIButton(frame: CGRect(x: 250, y: formStartY+250, width: 60, height: 30))
        submitButton.setTitle("submit", for: .normal)
        submitButton.layer.cornerRadius = 10.0
        submitButton.backgroundColor = .black
        submitButton.addTarget(self, action: #selector(submitUserInfoAction), for: .touchUpInside)
        
        parent?.addSubview(addressCityLabel)
        parent?.addSubview(addressCityText)
        parent?.addSubview(addressStreetLabel)
        parent?.addSubview(addressStreetText)
        parent?.addSubview(addressStateLabel)
        parent?.addSubview(addressStateText)
        parent?.addSubview(userEmailLabel)
        parent?.addSubview(userEmailText)
        parent?.addSubview(userPhoneLabel)
        parent?.addSubview(userPhoneText)
        parent?.addSubview(userNameText)
        parent?.addSubview(userNameLabel)
        parent?.addSubview(submitButton)
    }
    
    @objc func updateUserAction(sender: UIButton) {
        let parent = sender.superview
        let userIdLabel = UILabel(frame: CGRect(x: 80, y: 110, width: 70, height: 30))
        userIdLabel.text = "UserID:"
        let userIdText = UITextField(frame: CGRect(x: 140, y: 110, width: 150, height: 30))
        userIdText.backgroundColor = .white
        userIdText.placeholder = "enter user id"
        userIdText.tag = 7
        
        let formStartY = 150
        let userNameLabel = UILabel(frame: CGRect(x: 80, y: formStartY, width: 70, height: 30))
        userNameLabel.text = "name*:"
        let userNameText = UITextField(frame: CGRect(x: 140, y: formStartY, width: 200, height: 30))
        userNameText.placeholder = "enter user name"
        userNameText.backgroundColor = .white
        userNameText.tag = 1
        
        let userEmailLabel = UILabel(frame: CGRect(x: 80, y: formStartY+40, width: 70, height: 30))
        userEmailLabel.text = "email*:"
        let userEmailText = UITextField(frame: CGRect(x: 140, y: formStartY+40, width: 200, height: 30))
        userEmailText.placeholder = "enter email"
        userEmailText.backgroundColor = .white
        userEmailText.tag = 2
        
        let userPhoneLabel = UILabel(frame: CGRect(x: 80, y: formStartY+80, width: 70, height: 30))
        userPhoneLabel.text = "phone:"
        let userPhoneText = UITextField(frame: CGRect(x: 140, y: formStartY+80, width: 200, height: 30))
        userPhoneText.placeholder = "XXX-XXX-XXXX"
        userPhoneText.backgroundColor = .white
        userPhoneText.tag = 3
        
        let addressStreetLabel = UILabel(frame: CGRect(x: 80, y: formStartY+120, width: 70, height: 30))
        addressStreetLabel.text = "street:"
        let addressStreetText = UITextField(frame: CGRect(x: 140, y: formStartY+120, width: 200, height: 30))
        addressStreetText.placeholder = "enter street"
        addressStreetText.backgroundColor = .white
        addressStreetText.tag = 4
        
        let addressCityLabel = UILabel(frame: CGRect(x: 80, y: formStartY+160, width: 70, height: 30))
        addressCityLabel.text = "city:"
        let addressCityText = UITextField(frame: CGRect(x: 140, y: formStartY+160, width: 200, height: 30))
        addressCityText.placeholder = "enter city"
        addressCityText.backgroundColor = .white
        addressCityText.tag = 5
        
        let addressStateLabel = UILabel(frame: CGRect(x: 80, y: formStartY+200, width: 70, height: 30))
        addressStateLabel.text = "state:"
        let addressStateText = UITextField(frame: CGRect(x: 140, y: formStartY+200, width: 200, height: 30))
        addressStateText.placeholder = "enter state"
        addressStateText.backgroundColor = .white
        addressStateText.tag = 6
        
        let submitButton = UIButton(frame: CGRect(x: 250, y: formStartY+250, width: 60, height: 30))
        submitButton.setTitle("submit", for: .normal)
        submitButton.layer.cornerRadius = 10.0
        submitButton.backgroundColor = .black
        submitButton.addTarget(self, action: #selector(submitUpdateUserAction), for: .touchUpInside)
        
        parent?.addSubview(userIdLabel)
        parent?.addSubview(userIdText)
        parent?.addSubview(addressCityLabel)
        parent?.addSubview(addressCityText)
        parent?.addSubview(addressStreetLabel)
        parent?.addSubview(addressStreetText)
        parent?.addSubview(addressStateLabel)
        parent?.addSubview(addressStateText)
        parent?.addSubview(userEmailLabel)
        parent?.addSubview(userEmailText)
        parent?.addSubview(userPhoneLabel)
        parent?.addSubview(userPhoneText)
        parent?.addSubview(userNameText)
        parent?.addSubview(userNameLabel)
        parent?.addSubview(submitButton)
    }
    
    @objc func submitUserInfoAction(sender: UIButton) {
        let parent = sender.superview
        let name = (parent?.viewWithTag(1)! as! UITextField).text!
        let email = (parent?.viewWithTag(2)! as! UITextField).text!
        let phone = (parent?.viewWithTag(3)! as! UITextField).text!
        let street = (parent?.viewWithTag(4)! as! UITextField).text!
        let city = (parent?.viewWithTag(5)! as! UITextField).text!
        let state = (parent?.viewWithTag(6)! as! UITextField).text!
        
        if name == "" || email == "" {
            let alert = UIAlertController(title: "Missing", message: "One or more required filed is missing", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
            return
        }
        
        if !validateEmail(email: email) {
            let alert = UIAlertController(title: "Error", message: "Email format error", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
            return
            
        }
        
        if phone != "" {
            if !validatePhone(phone: phone) {
                let alert = UIAlertController(title: "Error", message: "Phone format error", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
                return
            }
        }
        
        print("create user")
        let user = User(name: name, phone: phone, email: email, address: Address(street: street, city: city, state: state))
        users[user.id] = user
        let alert = UIAlertController(title: "Success", message: "user created", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
    }
    
    @objc func submitUpdateUserAction(sender: UIButton) {
        let parent = sender.superview
        let id = (parent?.viewWithTag(7)! as! UITextField).text!
        let name = (parent?.viewWithTag(1)! as! UITextField).text!
        let email = (parent?.viewWithTag(2)! as! UITextField).text!
        let phone = (parent?.viewWithTag(3)! as! UITextField).text!
        let street = (parent?.viewWithTag(4)! as! UITextField).text!
        let city = (parent?.viewWithTag(5)! as! UITextField).text!
        let state = (parent?.viewWithTag(6)! as! UITextField).text!
        
        if id == "" {
            return
        }
        
        guard let user = users[Int(id)!] else {
            let alert = UIAlertController(title: "Error", message: "user not exist", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
            return
        }
        
        if name == "" || email == "" {
            let alert = UIAlertController(title: "Missing", message: "One or more required filed is missing", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
            return
        }
        
        if !validateEmail(email: email) {
            let alert = UIAlertController(title: "Error", message: "Email format error", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
            return
            
        }
        
        if phone != "" {
            if !validatePhone(phone: phone) {
                let alert = UIAlertController(title: "Error", message: "Phone format error", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
                return
            }
        }
        
        user.setName(newName: name)
        user.setEmail(newEmail: email)
        user.setPhone(newPhone: phone)
        user.setAddress(newAddress: Address(street: street, city: city, state: state))
        
        let alert = UIAlertController(title: "Success", message: "update sucessful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
    }
    
    @objc func deleteUserAction(sender: UIButton) {
        let parent = sender.superview
        let userIdLabel = UILabel(frame: CGRect(x: 80, y: 110, width: 70, height: 30))
        userIdLabel.text = "UserID:"
        let userIdText = UITextField(frame: CGRect(x: 140, y: 110, width: 150, height: 30))
        userIdText.backgroundColor = .white
        userIdText.placeholder = "enter user id"
        userIdText.tag = 7
        
        let deletebutton = UIButton(frame: CGRect(x: 250, y: 160, width: 60, height: 30))
        deletebutton.setTitle("delete", for: .normal)
        deletebutton.layer.cornerRadius = 10.0
        deletebutton.backgroundColor = .red
        deletebutton.addTarget(self, action: #selector(deleteUserButtonAction), for: .touchUpInside)
        
        parent?.addSubview(deletebutton)
        parent?.addSubview(userIdLabel)
        parent?.addSubview(userIdText)
        
    }
    
    @objc func deleteUserButtonAction(sender: UIButton) {
        let parent = sender.superview
        let userId = (parent?.viewWithTag(7)! as! UITextField).text!
        let alert = UIAlertController(title: "Warning", message: "sure to delete user \(userId)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: {action in self.users.removeValue(forKey: Int(userId)!)}))
        UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
        
//        let successAlert = UIAlertController(title: "Success", message: "user \(userId) successfully deleted", preferredStyle: .alert)
//        successAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        UIApplication.shared.delegate?.window??.rootViewController?.present(successAlert, animated: true)
    }
    
    // MARK: about events
    @objc func addEventAction(sender: UIButton) {
        let parent = sender.superview
        let formStartY = 120
        let eventNameLabel = UILabel(frame: CGRect(x: 80, y: formStartY, width: 70, height: 30))
        eventNameLabel.text = "name*:"
        let eventNameText = UITextField(frame: CGRect(x: 140, y: formStartY, width: 200, height: 30))
        eventNameText.placeholder = "enter event name"
        eventNameText.backgroundColor = .white
        eventNameText.tag = 1
        
        let addressStreetLabel = UILabel(frame: CGRect(x: 80, y: formStartY+40, width: 70, height: 30))
        addressStreetLabel.text = "street:"
        let addressStreetText = UITextField(frame: CGRect(x: 140, y: formStartY+40, width: 200, height: 30))
        addressStreetText.placeholder = "enter street"
        addressStreetText.backgroundColor = .white
        addressStreetText.tag = 2
        
        let addressCityLabel = UILabel(frame: CGRect(x: 80, y: formStartY+80, width: 70, height: 30))
        addressCityLabel.text = "city:"
        let addressCityText = UITextField(frame: CGRect(x: 140, y: formStartY+80, width: 200, height: 30))
        addressCityText.placeholder = "enter city"
        addressCityText.backgroundColor = .white
        addressCityText.tag = 3
        
        let addressStateLabel = UILabel(frame: CGRect(x: 80, y: formStartY+120, width: 70, height: 30))
        addressStateLabel.text = "state:"
        let addressStateText = UITextField(frame: CGRect(x: 140, y: formStartY+120, width: 200, height: 30))
        addressStateText.placeholder = "enter state"
        addressStateText.backgroundColor = .white
        addressStateText.tag = 4
        
        let descriptionLabel = UILabel(frame: CGRect(x: 80, y: formStartY+160, width: 100, height: 30))
        descriptionLabel.text = "description:"
        let descriptionTextField = UITextField(frame: CGRect(x: 140, y: formStartY+200, width: 200, height: 30))
        descriptionTextField.placeholder = "enter description"
        descriptionTextField.backgroundColor = .white
        descriptionTextField.tag = 5
        
        let startDateLabel = UILabel(frame: CGRect(x: 80, y: formStartY+240, width: 100, height: 30))
        startDateLabel.text = "start*:"
        let startDateText = UITextField(frame: CGRect(x: 140, y: formStartY+240, width: 200, height: 30))
        startDateText.placeholder = "MM/dd/yyyy"
        startDateText.backgroundColor = .white
        startDateText.tag = 6
        
        let endDateLabel = UILabel(frame: CGRect(x: 80, y: formStartY+280, width: 100, height: 30))
        endDateLabel.text = "end*:"
        let endDateText = UITextField(frame: CGRect(x: 140, y: formStartY+280, width: 200, height: 30))
        endDateText.placeholder = "MM/dd/yyyy"
        endDateText.backgroundColor = .white
        endDateText.tag = 7
        
        let submitButton = UIButton(frame: CGRect(x: 250, y: formStartY+400, width: 60, height: 30))
        submitButton.setTitle("submit", for: .normal)
        submitButton.layer.cornerRadius = 10.0
        submitButton.backgroundColor = .black
        submitButton.addTarget(self, action: #selector(submitEventInfoAction(sender:)), for: .touchUpInside)
        
        
        parent?.addSubview(eventNameLabel)
        parent?.addSubview(eventNameText)
        parent?.addSubview(addressStreetLabel)
        parent?.addSubview(addressStreetText)
        parent?.addSubview(addressCityLabel)
        parent?.addSubview(addressCityText)
        parent?.addSubview(addressStateLabel)
        parent?.addSubview(addressStateText)
        parent?.addSubview(descriptionLabel)
        parent?.addSubview(descriptionTextField)
        parent?.addSubview(submitButton)
        parent?.addSubview(startDateLabel)
        parent?.addSubview(startDateText)
        parent?.addSubview(endDateLabel)
        parent?.addSubview(endDateText)
    }
    
    @objc func submitEventInfoAction(sender: UIButton) {
        let parent = sender.superview
        let name = (parent?.viewWithTag(1)! as! UITextField).text!
        let street = (parent?.viewWithTag(2)! as! UITextField).text!
        let city = (parent?.viewWithTag(3)! as! UITextField).text!
        let state = (parent?.viewWithTag(4)! as! UITextField).text!
        let description = (parent?.viewWithTag(5)! as! UITextField).text!
        let startString = (parent?.viewWithTag(6)! as! UITextField).text!
        let endString = (parent?.viewWithTag(7)! as! UITextField).text!
        
        if name == "" || startString == "" || endString == "" {
            let alert = UIAlertController(title: "Missing", message: "One or more required filed is missing", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
            return
        }
        
        guard let startDate = transformStringToDate(dateString: startString) else {
            let alert = UIAlertController(title: "Error", message: "start date format error", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
            return
        }
        
        guard let endDate = transformStringToDate(dateString: endString) else {
            let alert = UIAlertController(title: "Error", message: "end date format error", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
            return
        }
        
        let event = Event(name: name, address: Address(street: street, city: city, state: state), description: description, start: startDate, end: endDate)
        events[event.id] = event
        let alert = UIAlertController(title: "Success", message: "successfully created event", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
        return
    }
    
    @objc func updateEventAction(sender: UIButton) {
        let parent = sender.superview
        
        let eventIdLabel = UILabel(frame: CGRect(x: 80, y: 80, width: 80, height: 30))
        eventIdLabel.text = "event id:"
        let eventIdText = UITextField(frame: CGRect(x: 160, y: 80, width: 100, height: 30))
        eventIdText.backgroundColor = .white
        eventIdText.placeholder = "enter ID"
        eventIdText.tag = 8
        let formStartY = 120
        let eventNameLabel = UILabel(frame: CGRect(x: 80, y: formStartY, width: 70, height: 30))
        eventNameLabel.text = "name*:"
        let eventNameText = UITextField(frame: CGRect(x: 140, y: formStartY, width: 200, height: 30))
        eventNameText.placeholder = "enter event name"
        eventNameText.backgroundColor = .white
        eventNameText.tag = 1
        
        let addressStreetLabel = UILabel(frame: CGRect(x: 80, y: formStartY+40, width: 70, height: 30))
        addressStreetLabel.text = "street:"
        let addressStreetText = UITextField(frame: CGRect(x: 140, y: formStartY+40, width: 200, height: 30))
        addressStreetText.placeholder = "enter street"
        addressStreetText.backgroundColor = .white
        addressStreetText.tag = 2
        
        let addressCityLabel = UILabel(frame: CGRect(x: 80, y: formStartY+80, width: 70, height: 30))
        addressCityLabel.text = "city:"
        let addressCityText = UITextField(frame: CGRect(x: 140, y: formStartY+80, width: 200, height: 30))
        addressCityText.placeholder = "enter city"
        addressCityText.backgroundColor = .white
        addressCityText.tag = 3
        
        let addressStateLabel = UILabel(frame: CGRect(x: 80, y: formStartY+120, width: 70, height: 30))
        addressStateLabel.text = "state:"
        let addressStateText = UITextField(frame: CGRect(x: 140, y: formStartY+120, width: 200, height: 30))
        addressStateText.placeholder = "enter state"
        addressStateText.backgroundColor = .white
        addressStateText.tag = 4
        
        let descriptionLabel = UILabel(frame: CGRect(x: 80, y: formStartY+160, width: 100, height: 30))
        descriptionLabel.text = "description:"
        let descriptionTextField = UITextField(frame: CGRect(x: 140, y: formStartY+200, width: 200, height: 30))
        descriptionTextField.placeholder = "enter description"
        descriptionTextField.backgroundColor = .white
        descriptionTextField.tag = 5
        
        let startDateLabel = UILabel(frame: CGRect(x: 80, y: formStartY+240, width: 100, height: 30))
        startDateLabel.text = "start*:"
        let startDateText = UITextField(frame: CGRect(x: 140, y: formStartY+240, width: 200, height: 30))
        startDateText.placeholder = "MM/dd/yyyy"
        startDateText.backgroundColor = .white
        startDateText.tag = 6
        
        let endDateLabel = UILabel(frame: CGRect(x: 80, y: formStartY+280, width: 100, height: 30))
        endDateLabel.text = "end*:"
        let endDateText = UITextField(frame: CGRect(x: 140, y: formStartY+280, width: 200, height: 30))
        endDateText.placeholder = "MM/dd/yyyy"
        endDateText.backgroundColor = .white
        endDateText.tag = 7
        
        let submitButton = UIButton(frame: CGRect(x: 250, y: formStartY+400, width: 60, height: 30))
        submitButton.setTitle("update", for: .normal)
        submitButton.layer.cornerRadius = 10.0
        submitButton.backgroundColor = .black
        submitButton.addTarget(self, action: #selector(submitUpdateEventInfoAction), for: .touchUpInside)
        
        
        parent?.addSubview(eventNameLabel)
        parent?.addSubview(eventNameText)
        parent?.addSubview(addressStreetLabel)
        parent?.addSubview(addressStreetText)
        parent?.addSubview(addressCityLabel)
        parent?.addSubview(addressCityText)
        parent?.addSubview(addressStateLabel)
        parent?.addSubview(addressStateText)
        parent?.addSubview(descriptionLabel)
        parent?.addSubview(descriptionTextField)
        parent?.addSubview(submitButton)
        parent?.addSubview(startDateLabel)
        parent?.addSubview(startDateText)
        parent?.addSubview(endDateLabel)
        parent?.addSubview(endDateText)
        parent?.addSubview(eventIdLabel)
        parent?.addSubview(eventIdText)
    }
    
    @objc func submitUpdateEventInfoAction(sender: UIButton) {
        let parent = sender.superview
        let name = (parent?.viewWithTag(1)! as! UITextField).text!
        let street = (parent?.viewWithTag(2)! as! UITextField).text!
        let city = (parent?.viewWithTag(3)! as! UITextField).text!
        let state = (parent?.viewWithTag(4)! as! UITextField).text!
        let description = (parent?.viewWithTag(5)! as! UITextField).text!
        let startString = (parent?.viewWithTag(6)! as! UITextField).text!
        let endString = (parent?.viewWithTag(7)! as! UITextField).text!
        let eventIdString = (parent?.viewWithTag(8)! as! UITextField).text!
        
//        print(name + street + city + state + description + startString + endString)
        
        if eventIdString == "" || name == "" || endString == "" || startString == "" {
            let alert = UIAlertController(title: "Missing", message: "One or more required field is missing", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
            return
        }
        
        guard let event = events[Int(eventIdString)!] else {
            let alert = UIAlertController(title: "Error", message: "no event found", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
            return
        }
        
        event.setName(newName: name)
        event.setAddress(newAddress: Address(street: street, city: city, state: state))
        event.setDescription(description: description)
        event.setStartDate(newStart: transformStringToDate(dateString: startString)!)
        event.setEndDate(newEnd: transformStringToDate(dateString: endString)!)
        let alert = UIAlertController(title: "Success", message: "successfully updated event", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
    }
    
    @objc func deleteEventAction(sender: UIButton) {
        let parent = sender.superview
        let eventIdLabel = UILabel(frame: CGRect(x: 80, y: 110, width: 70, height: 30))
        eventIdLabel.text = "Event ID:"
        let eventIdText = UITextField(frame: CGRect(x: 155, y: 110, width: 150, height: 30))
        eventIdText.backgroundColor = .white
        eventIdText.placeholder = "enter user id"
        eventIdText.tag = 7
        
        let deletebutton = UIButton(frame: CGRect(x: 250, y: 160, width: 60, height: 30))
        deletebutton.setTitle("delete", for: .normal)
        deletebutton.layer.cornerRadius = 10.0
        deletebutton.backgroundColor = .red
        deletebutton.addTarget(self, action: #selector(deleteEventButtonAction), for: .touchUpInside)
        
        parent?.addSubview(deletebutton)
        parent?.addSubview(eventIdText)
        parent?.addSubview(eventIdLabel)
    }
    
    @objc func deleteEventButtonAction(sender: UIButton) {
        let parent = sender.superview
        let eventId = (parent?.viewWithTag(7)! as! UITextField).text!
        let alert = UIAlertController(title: "Warning", message: "sure to delete this event  \(eventId)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: {action in self.events.removeValue(forKey: Int(eventId)!)}))
        UIApplication.shared.delegate?.window??.rootViewController?.present(alert, animated: true)
    }
    
    @objc func searchEventAction(sender: UIButton) {
        let parent = sender.superview
        let keywordLabel = UILabel(frame: CGRect(x: 80, y: 110, width: 70, height: 30))
        keywordLabel.text = "keyword:"
        let keywordText = UITextField(frame: CGRect(x: 155, y: 110, width: 150, height: 30))
        keywordText.backgroundColor = .white
        keywordText.placeholder = "enter keyword"
        keywordText.tag = 7
        
        let searchButton = UIButton(frame: CGRect(x: 250, y: 160, width: 60, height: 30))
        searchButton.setTitle("search", for: .normal)
        searchButton.layer.cornerRadius = 10.0
        searchButton.backgroundColor = .red
        searchButton.addTarget(self, action: #selector(searchEventButtonAction), for: .touchUpInside)
        
        parent?.addSubview(keywordLabel)
        parent?.addSubview(keywordText)
        parent?.addSubview(searchButton)
    }
    
    @objc func searchEventButtonAction(sender: UIButton) {
        let parent = sender.superview
        let resView = UITextView(frame: CGRect(x: 80, y: 200, width: 300, height: 380))
        resView.backgroundColor = .darkGray
        resView.isSelectable = false
        resView.isEditable = false
        let keyword = (parent?.viewWithTag(7)! as! UITextField).text!
        var res = ""
        for event in events.values {
            let str = event.description
            if str.contains(keyword) {
                res = res + str + "\n"
            }
        }
        resView.text = res
        
        parent?.addSubview(resView)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

