//
//  ListViewController.swift
//  Academy_project_4_iOS
//
//  Created by kwonsoonsun on 2021/11/13.
//

import UIKit
import SQLite3

//var movies : Array<Array<Any>> = []

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var Ttableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.Ttableview.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = movies[(indexPath as NSIndexPath).row][1] as? String
        cell.imageView?.image = UIImage(named: movies[(indexPath as NSIndexPath).row][7] as! String)
        
        return cell


    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail" {
            print("sgDetail눌림")
            let cell = sender as! UITableViewCell
            let indexPath = self.Ttableview.indexPath(for: cell)
            
            let movieView = segue.destination as! MovieDetail
            movieView.receiveIdx((indexPath! as NSIndexPath).row)
            

        }
    }


    @IBAction func btnUpDel(_ sender: UIButton) {

    }

    @IBAction func logout(_ sender: UIButton) {
        guard let go = storyboard?.instantiateViewController(withIdentifier: "login") else {
            return
        }
        self.present(go, animated: true, completion: nil)
    }

}
