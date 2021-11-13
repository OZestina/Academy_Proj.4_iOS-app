//
//  WishTableViewController.swift
//  Academy_project_4_iOS
//
//  Created by Apple on 2021/11/10.
//

import UIKit

var wishes : Array<Array<Any>> = []

class WishTableViewController: UITableViewController {

    @IBOutlet var wishTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //navigation controller에 edit 버튼 생성
//        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return wishes.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishCell", for: indexPath)
        cell.textLabel?.text = wishes[(indexPath as NSIndexPath).row][2] as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { return true }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let db = SQLite3DB()
            let index = (indexPath as NSIndexPath).row
            db.wishDelete(wishes[index][0] as! NSString, wishes[index][1] as! Int32)
            wishes = db.wishRead(id as NSString)
            //delete effect
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert { }
    }

    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "찜 해제"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wishTableView.reloadData()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgWishToDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.wishTableView.indexPath(for: cell)
            let idx = wishes[(indexPath! as NSIndexPath).row][1]
            let movieDetail = segue.destination as! MovieDetail
            movieDetail.receiveIdx(idx as! Int)
        }
        
    }

}
