//
//  ViewController.swift
//  Academy_project_4_iOS
//
//  Created by Apple on 2021/11/08.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    @IBOutlet var idtext: UITextField!
    @IBOutlet var passwordtext: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let db = SQLite3DB()
//        movies = db.moviequery()
        
    }
 
    @IBAction func idfind(_ sender: UIButton) {
        guard let go = storyboard?.instantiateViewController(withIdentifier: "findV") else {
            return
        }
        self.present(go, animated: true, completion: nil)
    }
    
    @IBAction func passwordfind(_ sender: UIButton) {
        guard let go = storyboard?.instantiateViewController(withIdentifier: "findV") else {
            return
        }
        self.present(go, animated: true, completion: nil)
    }
    
    
    
    @IBAction func loginbtn(_ sender: UIButton) {
                
        let db = SQLite3DB()
        let userid = idtext.text!
        let userpw = passwordtext.text!
        
        print(db.path)
        
        var result = db.query(id: NSString(string: userid), pw: NSString(string: userpw))
        
        if userid == "" || userpw == "" {
            
            let alert = UIAlertController(title: "Error", message: "입력을 안했습니다 입력해주세요", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "확인", style: .default) {
                action in
            print("연결 실패")
            })
            self.present(alert, animated: true, completion: nil)
            
        } else if result.0 == userid && result.1 == userpw {
            
            print("성공")
            
            //로그인한 id 저장
            id = userid
            
            guard let go = storyboard?.instantiateViewController(withIdentifier: "tab") else {
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
        
        
//    @IBAction func joinbtn(_ sender: UIButton) {
//        guard let go = storyboard?.instantiateViewController(withIdentifier: "page2") else {
//            return
//        }
//        self.present(go, animated: true, completion: nil)
//    }
    
}

