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
        let userid = NSString(utf8String: joinid.text!)!
        let userpw = NSString(utf8String: joinpassword.text!)!
        let usernum = NSString(utf8String: phonenumber.text!)!
        let username = NSString(utf8String: joinname.text!)!
        
        print(userid)
        print(userpw)
        print(usernum)
        print(username)
        
        if joinid.text != "" && joinpassword.text != "" && phonenumber.text != "" && joinname.text != "" {
            
            let alert = UIAlertController(title: "회원가입 성공", message: "가입해주셔서 감사합니다", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default) {
                action in
                
                guard let go = self.storyboard?.instantiateViewController(withIdentifier: "login") as? ViewController else {
                    return
                }
                self.present(go, animated: true, completion: nil)
                
            })
            self.present(alert, animated: true, completion: nil)
            
            let db = SQLite3DB()
            print("생성된 path는 ", db.path)
            db.insert(id: userid, pw: userpw, phone: usernum, name: username)
            
        } else {
            let alert = UIAlertController(title: "회원가입 실패", message: "다시 입력해주세요", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default) {
                action in
                
            })
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        // 회원 db 생성
//        let db = SQLite3DB()
//        print("생성된 path는 ", db.path)
//        db.createTable()
        
        
    }
    
    
    @IBAction func joinno(_ sender: UIButton) {
        dismiss(animated: , completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
}

class SQLite3DB {
    
    let path: String = {
              let fm = FileManager.default
              return fm.urls(for:.libraryDirectory, in:.userDomainMask).last!
                       .appendingPathComponent("momo.db").path
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
    
    // insert하는 함수
    let sql_insert = "insert into users values (?, ?, ?, ?);"
    func insert(id: NSString, pw: NSString, phone: NSString, name: NSString) {
        let db = openDatabase()
        var con : OpaquePointer? = nil

        if sqlite3_prepare_v2(db, sql_insert, -1, &con, nil) == SQLITE_OK {
            sqlite3_bind_text(con, 1, id.utf8String, -1, nil)
            sqlite3_bind_text(con, 2, pw.utf8String, -1, nil)
            sqlite3_bind_text(con, 3, phone.utf8String, -1, nil)
            sqlite3_bind_text(con, 4, name.utf8String, -1, nil)
            print("sql문 객체화 성공")
            if sqlite3_step(con) == SQLITE_DONE {
                print("회원가입 성공")
            } else {
                print("회원가입 실패")
            }
        } else {
            print("sql문 객체화 실패")
        }
        
        sqlite3_finalize(con)

    }
    
    
    
    let sql_moviequery =  "select * from movie;"
    func moviequery(id : Int32) {

        let db = openDatabase()
        var con : OpaquePointer? = nil
        // sql문 객체화
        if sqlite3_prepare_v2(db, sql_moviequery, -1, &con, nil) == SQLITE_OK {
            print("sql문 객체화 성공")

            while sqlite3_step(con) == SQLITE_ROW {
                print("회원검색 성공")

                let i = sqlite3_column_text(con, 0)
                let id = String(cString: i!)
                
                print("id >> ", id)
            }

        } else {

            print("sql문 객체화 실패")
        }
        // 실행이 성공하면 테이블이 생성되었습니다
        sqlite3_finalize(con)
    }
    
    let sql_query =  "select id, pw from users where id = ? and pw = ?;"
    func query(id: NSString, pw: NSString) -> (String, String) {
        
        print(id)
        print(pw)
        
        let db = openDatabase()
        var con : OpaquePointer? = nil
        
        var usersid = ""
        var userspw = ""
        
        if sqlite3_prepare_v2(db, sql_query, -1, &con, nil) == SQLITE_OK {
            print("sql문 객체화 성공")
            
            sqlite3_bind_text(con, 1, id.utf8String, -1, nil)
            sqlite3_bind_text(con, 2, pw.utf8String, -1, nil)
            
            if sqlite3_step(con) == SQLITE_ROW {
                print("회원검색 성공")

                let i = sqlite3_column_text(con, 0)
                let n = sqlite3_column_text(con, 1)
                usersid = String(cString: i!)
                userspw = String(cString: n!)
                
                print(usersid)
                print(userspw)
                
            }

        } else {

            print("sql문 객체화 실패")
            
        }
        // 실행이 성공하면 테이블이 생성되었습니다
        sqlite3_finalize(con)
        return (usersid, userspw)
    }
    
    let sql_listquery =  "select title, date, imgFile from movie;"
    func listquery() -> String {

        let db = openDatabase()
        var con : OpaquePointer? = nil
        
        var titleid = ""
        var dateid = ""
        var imgid = ""
        
        if sqlite3_prepare_v2(db, sql_listquery, -1, &con, nil) == SQLITE_OK {
            print("sql문 객체화 성공")
            
            while sqlite3_step(con) == SQLITE_ROW {
                print("제목검색 성공")
                
                let i = sqlite3_column_text(con, 1)
                let n = sqlite3_column_text(con, 7)
                let z = sqlite3_column_text(con, 8)
                
                titleid = String(cString: i!)
                dateid = String(cString: n!)
                imgid = String(cString: z!)
                print(titleid)
                print(dateid)
                print(imgid)
            }

        } else {

            print("sql문 객체화 실패")
            
        }
        // 실행이 성공하면 테이블이 생성되었습니다
        
        sqlite3_finalize(con)
        return titleid + dateid + imgid
    }
    
    // 극장 테이블 생성
//    let sql_create =
//    """
//create table movie (
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
    
    // 찜 목록 테이블
//    let sql_create =
//    """
//    create table wish (
//    id varchar,
//    movieId int,
//    title varchar
//    );
//    """
    
//    func createTable() {
//        let db = openDatabase()
//        var con : OpaquePointer? = nil
//        if sqlite3_prepare_v2(db, sql_create, -1, &con, nil) == SQLITE_OK {
//            print("sql문 객체화 성공")
//            if sqlite3_step(con) == SQLITE_DONE {
//                print("테이블 생성 성공")
//            } else {
//                print("테이블 생성 실패")
//            }
//        } else {
//            print("sql문 객체화 실패")
//        }
//        sqlite3_finalize(con)
//    }
    
    
    
    
}
