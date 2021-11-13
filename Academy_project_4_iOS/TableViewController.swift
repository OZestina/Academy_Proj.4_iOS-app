//
//  TableViewController.swift
//  Academy_project_4_iOS
//
//  Created by Apple on 2021/11/13.
//

import UIKit

var movies : Array<Array<Any>> = []

class TableViewController: UITableViewController {

    @IBOutlet var Ttableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let db = SQLite3DB()
        movies = db.moviequery()
        wishes = db.wishRead(id as NSString)
        
        //테이블뷰 높이 설정
        self.tableView.rowHeight = 200.0
        //        self.Ttableview.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = movies[(indexPath as NSIndexPath).row][1] as? String
        cell.imageView?.image = UIImage(named: movies[(indexPath as NSIndexPath).row][7] as! String)
        
        return cell


    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail" {
            //print("sgDetail눌림")
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
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
