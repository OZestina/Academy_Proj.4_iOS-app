//
//  MovieDetail.swift
//  Academy_project_4_iOS
//
//  Created by Apple on 2021/11/09.
//

import UIKit

class MovieDetail: UIViewController {

    var filmIdx = -1
    
    @IBOutlet var filmImg: UIImageView!
    @IBOutlet var filmDirector: UILabel!
    @IBOutlet var filmAct: UILabel!
    @IBOutlet var filmRun: UILabel!
    @IBOutlet var filmGenre: UILabel!
    @IBOutlet var filmReleased: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

    }
    

    func receiveIdx(_ idx: Int) {
        filmIdx = idx
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
