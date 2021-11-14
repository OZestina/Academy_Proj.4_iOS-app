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
        
        userids = res
        
            let alert = UIAlertController(title: "확인 결과", message: "아이디는 " + userids + "입니다", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "확인", style: .default) {
                action in
            print("아이디 확인")
            })
            self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func findpw(_ sender: UIButton) {
        let db = SQLite3DB()
        
        let id = finid.text!
        let num = finnumber.text!
        let name = finname.text!
        
        var res = db.pwquery(id: NSString(string: id), phone: NSString(string: num), name: NSString(string: name))
        
        userpws = res
        
            let alert = UIAlertController(title: "확인 결과", message: "비밀번호는 " + userpws + "입니다", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "확인", style: .default) {
                action in
            print("비밀번호 확인")
            })
            self.present(alert, animated: true, completion: nil)
    }
    
}
