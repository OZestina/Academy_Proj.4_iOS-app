//
//  ListController.swift
//  Academy_project_4_iOS
//
//  Created by kwonsoonsun on 2021/11/08.
//

import UIKit

class ListController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func logoutbtn(_ sender: UIButton) {
        guard let go = storyboard?.instantiateViewController(withIdentifier: "main") else {
            return
        }
        self.present(go, animated: true, completion: nil)
    }
    
    @IBAction func updelbtn(_ sender: UIButton) {
        guard let go = storyboard?.instantiateViewController(withIdentifier: "page4") else {
            return
        }
        self.present(go, animated: true, completion: nil)
    }
}
