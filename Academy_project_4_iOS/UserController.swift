//
//  UserController.swift
//  Academy_project_4_iOS
//
//  Created by kwonsoonsun on 2021/11/08.
//

import UIKit
import SQLite3

class UserController: UIViewController {

    @IBOutlet var joinid: UITextField!
    @IBOutlet var joinpassword: UITextField!
    @IBOutlet var joinpassword2: UITextField!
    @IBOutlet var phonenumber: UITextField!
    @IBOutlet var joinname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func joingo(_ sender: UIButton) {
        
        let id = joinid.text!
        let pw = joinpassword.text!
        let pw2 = joinpassword2.text!
        let num = phonenumber.text!
        let name = joinname.text!
        
        
        
        guard let go = storyboard?.instantiateViewController(withIdentifier: "main") else {
            return
        }
        self.present(go, animated: true, completion: nil)
        
        // 회원 db 생성
//        let db = SQLite3DB()
//        print("생성된 path는 ", db.path)
//        db.createTable()
        
        
    }
    
    
    @IBAction func joinno(_ sender: UIButton) {
        guard let go = storyboard?.instantiateViewController(withIdentifier: "main") else {
            return
        }
        self.present(go, animated: true, completion: nil)
    }
}

class SQLite3DB {
    let path: String = {
              let fm = FileManager.default
              return fm.urls(for:.libraryDirectory, in:.userDomainMask).last!
                       .appendingPathComponent("user.db").path
        }()
    
    func openDatabase() -> OpaquePointer? {
        var con : OpaquePointer? = nil
        if sqlite3_open(path, &con) == SQLITE_OK {
            print("연결 성공")
        } else {
            print("연결 실패")
        }
        return con
    }
    
    
    // 극장 테이블 생성
//    let sql_create =
//    """
//create table users (
//id int primary key not null,
//title varchar(100) not null,
//director varchar(100) not null,
//actor varchar(100) not null,
//time varchar(100) not null,
//genre varchar(100) not null,
//date varchar(100) not null,
//imgFile varchar(100) not null
//);
//"""
    
    // 회원 테이블 생성
//    let sql_create =
//    """
//create table users (
//id char(255) primary key not null,
//pw char(255) not null,
//phone char(255) not null,
//name char(255) not null
//);
//"""
    
    func createTable() {
        let db = openDatabase()
        var con : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, sql_create, -1, &con, nil) == SQLITE_OK {
            print("sql문 객체화 성공")
            if sqlite3_step(con) == SQLITE_DONE {
                print("테이블 생성 성공")
            } else {
                print("테이블 생성 실패")
            }
        } else {
            print("sql문 객체화 실패")
        }
        sqlite3_finalize(con)
    }
    
}
