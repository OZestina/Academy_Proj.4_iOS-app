//
//  ViewController.swift
//  Academy_project_4_iOS
//
//  Created by Apple on 2021/11/08.
//

import UIKit

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
        
        let id = idtext.text!
        let pw = passwordtext.text!
        
        if id == "" && pw == ""{
            guard let go = storyboard?.instantiateViewController(withIdentifier: "page3") else {
                return
            }
            self.present(go, animated: true, completion: nil)
        } else {
            print("연결 실패")
        }
        
    }
    
    @IBAction func joinbtn(_ sender: UIButton) {
        guard let go = storyboard?.instantiateViewController(withIdentifier: "page2") else {
            return
        }
        self.present(go, animated: true, completion: nil)
    }
    
}

