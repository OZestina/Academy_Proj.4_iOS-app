//
//  UpdateDeleteController.swift
//  Academy_project_4_iOS
//
//  Created by kwonsoonsun on 2021/11/09.
//

import UIKit
import SQLite3

var id : String = ""

class UpdateDeleteController: UIViewController {

    @IBOutlet var upid: UITextField!
    @IBOutlet var uppw: UITextField!
    @IBOutlet var upnumber: UITextField!
    @IBOutlet var upname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func userup(_ sender: UIButton) {
        let db = SQLite3DB()
        let id = NSString(utf8String: upid.text!)!
        let pw = NSString(utf8String: uppw.text!)!
        let number = NSString(utf8String: upnumber.text!)!
        let name = NSString(utf8String: upname.text!)!
        
        db.userupdate(id: id, pw: pw, phone: number, name: name)
        
    }
    
    @IBAction func userdel(_ sender: UIButton) {
        let db = SQLite3DB()
        let id = NSString(utf8String: upid.text!)!
        
        db.userdelete(id: id)
        
    }
    
    @IBAction func logout(_ sender: UIButton) {
        guard let go = storyboard?.instantiateViewController(withIdentifier: "login") else {
            return
        }
        self.present(go, animated: true, completion: nil)
    }
}
