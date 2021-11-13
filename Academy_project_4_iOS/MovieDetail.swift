//
//  MovieDetail.swift
//  Academy_project_4_iOS
//
//  Created by Apple on 2021/11/09.
//

import UIKit

class MovieDetail: UIViewController {

    var filmIdx = -1
    
    @IBOutlet var filmTitle: UILabel!
    @IBOutlet var filmImg: UIImageView!
    @IBOutlet var filmDirector: UILabel!
    @IBOutlet var filmAct: UILabel!
    @IBOutlet var filmRun: UILabel!
    @IBOutlet var filmGenre: UILabel!
    @IBOutlet var filmReleased: UILabel!
    
    @IBOutlet var btnWish: UIButton!
    @IBOutlet var btnWishDelete: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmTitle.text = movies[filmIdx][1] as? String
        filmImg.image = UIImage(named: movies[filmIdx][7] as! String)
        filmDirector.text = movies[filmIdx][2] as? String
        filmAct.text = movies[filmIdx][3] as? String
        filmRun.text = movies[filmIdx][4] as? String
        filmGenre.text = movies[filmIdx][5] as? String
        filmReleased.text = movies[filmIdx][6] as? String
        
        btnWish.isHidden = false
        btnWishDelete.isHidden = true
        
        let filmId = movies[filmIdx][0] as! Int32
        if wishes.count > 0 {
            for wish in wishes {
                let movieIdx: Int32 = wish[1] as! Int32
                if filmId == movieIdx {
                    btnWish.isHidden = true
                    btnWishDelete.isHidden = false
                }
            }
        }
    }

    func receiveIdx(_ idx: Int) {
        filmIdx = idx
    }
    
    @IBAction func createWish(_ sender: UIButton) {
        let db = SQLite3DB()
        db.wishCreate(id: id as NSString, movieId: movies[filmIdx][0] as! Int32, title: movies[filmIdx][1] as! NSString)
        wishes = db.wishRead(id as NSString)
        //버튼 숨김/보이기 처리
        btnWish.isHidden = true
        btnWishDelete.isHidden = false
    }
    @IBAction func deleteWish(_ sender: UIButton) {
        let db = SQLite3DB()
        db.wishDelete(id as NSString, movies[filmIdx][0] as! Int32)
        wishes = db.wishRead(id as NSString)
        //버튼 숨김/보이기 처리
        btnWish.isHidden = false
        btnWishDelete.isHidden = true
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
