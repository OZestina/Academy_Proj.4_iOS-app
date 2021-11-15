//
//  UserController.swift
//  Academy_project_4_iOS
//
//  Created by kwonsoonsun on 2021/11/08.
//

import UIKit
import SQLite3

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
        let userid = NSString(utf8String: joinid.text!)!
        let userpw = NSString(utf8String: joinpassword.text!)!
        let usernum = NSString(utf8String: phonenumber.text!)!
        let username = NSString(utf8String: joinname.text!)!
        
        print(userid)
        print(userpw)
        print(usernum)
        print(username)
        
        if joinid.text != "" && joinpassword.text != "" && phonenumber.text != "" && joinname.text != "" {
            
            let alert = UIAlertController(title: "회원가입 성공", message: "가입해주셔서 감사합니다", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default) {
                action in
                
                self.dismiss(animated: true, completion: nil)
                
            })
            self.present(alert, animated: true, completion: nil)
            
            let db = SQLite3DB()
            print("생성된 path는 ", db.path)
            db.insert(id: userid, pw: userpw, phone: usernum, name: username)
            
        } else {
            let alert = UIAlertController(title: "회원가입 실패", message: "다시 입력해주세요", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default) {
                action in
                
            })
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        // 회원 db 생성
//        let db = SQLite3DB()
//        print("생성된 path는 ", db.path)
//        db.createTable()
        
        
    }
    @IBAction func btnclick(_ sender: UIButton) {
        let userpw = joinpassword.text!
        let userpw2 = joinpassword2.text!
        
        print(userpw)
        print(userpw2)
        
        if userpw == userpw2 {
            let alert = UIAlertController(title: "비밀번호 같음", message: "계속 진행해주세요", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default) {
                action in
                
            })
            
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "비밀번호 다름", message: "비밀번호를 다시 설정해주세요", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default) {
                action in
                
            })
            
            self.present(alert, animated: true, completion: nil)
        }
}
    
    @IBAction func joinno(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

