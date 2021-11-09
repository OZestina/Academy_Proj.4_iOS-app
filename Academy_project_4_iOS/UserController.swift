//
//  UserController.swift
//  Academy_project_4_iOS
//
//  Created by kwonsoonsun on 2021/11/08.
//

import UIKit

class UserController: UIViewController {

    @IBOutlet var joinid: UITextField!
    @IBOutlet var joinpassword: UITextField!
    @IBOutlet var joinpassword2: UITextField!
    @IBOutlet var phonenumber: UITextField!
    @IBOutlet var joinname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func joingo(_ sender: UIButton) {
        
        let id = joinid.text!
        let pw = joinpassword.text!
        let pw2 = joinpassword2.text!
        let num = phonenumber.text!
        let name = joinname.text!
        
        
        
        guard let go = storyboard?.instantiateViewController(withIdentifier: "main") else {
            return
        }
        self.present(go, animated: true, completion: nil)
        
    }
    
    
    @IBAction func joinno(_ sender: UIButton) {
        guard let go = storyboard?.instantiateViewController(withIdentifier: "main") else {
            return
        }
        self.present(go, animated: true, completion: nil)
    }
}
