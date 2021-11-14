//
//  FinePage.swift
//  Academy_project_4_iOS
//
//  Created by kwonsoonsun on 2021/11/14.
//

import UIKit
import SQLite3

class FinePage: UIViewController {

    @IBOutlet var finid: UITextField!
    @IBOutlet var finpw: UITextField!
    
    @IBOutlet var finnumber: UITextField!
    @IBOutlet var finname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func findid(_ sender: UIButton) {
        let db = SQLite3DB()
        
        let num = finnumber.text!
        let name = finname.text!
        
        var res = db.idquery(phone: NSString(string: num), name: NSString(string: name))
        
        
        
        
        
        
    }
    
    @IBAction func findpw(_ sender: UIButton) {
        
    }
    
}
