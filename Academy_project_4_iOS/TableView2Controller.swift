//
//  TableView2Controller.swift
//  Academy_project_4_iOS
//
//  Created by kwonsoonsun on 2021/11/13.
//

import UIKit

var movies : Array<Array<Any>> = [[1, "아네트", "레오카락스", "아담 드라이버, 마리옹 꼬띠아르", "141분", "드라마, 뮤지컬, 로맨스", "2021.10.27", "movie1.jpg"], [2, "러브어페어", "엠마누엘 무레", "에밀리 드켄", "122분", "기타", "2021.11.11", "movie2.jpg"], [3, "첫눈이 사라졌다", "마우고시카 슈모프스카, 마셀 엔그레르트", "알렉 엇가프, 마야 오스타쉐브스카, 아가타 쿠레샤", "115분", "판타지", "2021.10.20", "movie3.jpg"], [4, "쁘띠마망", "셀린 시아마", "조세핀 산스, 가브리엘 산스", "72분", "드라마, 판타지", "2021.10.07", "movie4.jpg"], [5, "파리의 별빛 아래", "클로스 드렉셀", "까뜨린느 프로, 마하마두 야파, 도", "86분", "드라마", "2021.05.05", "movie5.jpg"], [6, "퍼스트 카우", "켈리 라이카트", "존 마가로, 오리온 리", "122분", "드라마,서부극(웨스턴)", "2021.11.04", "movie6.jpg"]]

class TableView2Controller: UITableViewController {

    @IBOutlet var Ttableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
            let cell = sender as! UITableViewCell
            let indexPath = self.Ttableview.indexPath(for: cell)

    }
}

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
