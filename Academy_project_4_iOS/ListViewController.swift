//
//  ListViewController.swift
//  Academy_project_4_iOS
//
//  Created by kwonsoonsun on 2021/11/13.
//

import UIKit
import SQLite3



class ListViewController: UIViewController {
    
    @IBOutlet var Ttableview: UITableView!
    
//    let db = SQLite3DB()
//    var list = db.listquery()
//    list.append(<#T##String#>)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 6
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "sgDetail" {
//            let cell = sender as! UITableViewCell
//            let indexPath = self.Ttableview.indexPath(for: cell)
//
//    }
//}
    
    
    @IBAction func btnUpDel(_ sender: UIButton) {
        
    }
    
    @IBAction func logout(_ sender: UIButton) {
        guard let go = storyboard?.instantiateViewController(withIdentifier: "login") else {
            return
        }
        self.present(go, animated: true, completion: nil)
    }
    
}
