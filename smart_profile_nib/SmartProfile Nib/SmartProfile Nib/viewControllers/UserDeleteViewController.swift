//
//  UserDeleteViewController.swift
//  SmartProfile Nib
//
//  Created by Lei on 10/27/19.
//  Copyright © 2019 Lei. All rights reserved.
//

import UIKit

class UserDeleteViewController: UIViewController {

    @IBOutlet weak var userId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func deleteUserAction(_ sender: Any) {
        let id = userId.text!
        let alert = UIAlertController(title: "Warning", message: "sure to delete user \(id)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: {action in users.removeValue(forKey: Int(id)!)}))
        self.present(alert, animated: true)
        
        userId.text = "" // clear input
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
