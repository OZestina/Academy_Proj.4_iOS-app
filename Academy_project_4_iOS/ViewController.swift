//
//  ViewController.swift
//  Academy_project_4_iOS
//
//  Created by Apple on 2021/11/08.
//

import UIKit
import SQLite3

var loginid = ""
var loginpw = ""

class ViewController: UIViewController {

    @IBOutlet var idtext: UITextField!
    @IBOutlet var passwordtext: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func autologin(_ sender: UIButton) {
        
    }
    
    @IBAction func didAutoLogin(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @IBAction func idfind(_ sender: UIButton) {
        
    }
    
    @IBAction func passwordfind(_ sender: UIButton) {
        
    }
    
    @IBAction func loginbtn(_ sender: UIButton) {
        
        let db = SQLite3DB()
        let userid = idtext.text!
        let userpw = passwordtext.text!

        db.query(id: loginid as NSString, pw: loginpw as NSString)
        
        if userid == loginid && userpw == loginpw {
            
            guard let go = storyboard?.instantiateViewController(withIdentifier: "page3") else {
                return
            }
            self.present(go, animated: true, completion: nil)

        } else {
            let alert = UIAlertController(title: "Error", message: "로그인 실패 다시 입력해주세요", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "확인", style: .default) {
                action in
            print("연결 실패")
            })
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func joinbtn(_ sender: UIButton) {
        guard let go = storyboard?.instantiateViewController(withIdentifier: "page2") else {
            return
        }
        self.present(go, animated: true, completion: nil)
    }
    
}
