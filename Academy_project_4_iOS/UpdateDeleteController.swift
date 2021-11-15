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
        
        let alert = UIAlertController(title: "확인 결과", message: "수정 되었습니다", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "확인", style: .default) {
            action in
        print("수정 확인")
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func userdel(_ sender: UIButton) {
        let db = SQLite3DB()
        let id = NSString(utf8String: upid.text!)!
        
        db.userdelete(id: id)
        
        let alert = UIAlertController(title: "확인 결과", message: "삭제 되었습니다", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "확인", style: .default) {
            action in
        print("삭제 확인")
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func logout(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
