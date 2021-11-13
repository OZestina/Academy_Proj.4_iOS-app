//
//  testViewController.swift
//  Academy_project_4_iOS
//
//  Created by kwonsoonsun on 2021/11/13.
//

import UIKit

class testViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func testbtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "testtt", sender: sender)
        
    }
}
