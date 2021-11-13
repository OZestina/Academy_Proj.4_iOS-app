//
//  SqlViewController.swift
//  Academy_project_4_iOS
//
//  Created by kwonsoonsun on 2021/11/13.
//

import UIKit
import SQLite3

class SqlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
    func moviequery() -> Array<Array<Any>> {

        let db = openDatabase()
        var con : OpaquePointer? = nil
        
        var results : Array<Array<Any>> = []
        
        // sql문 객체화
        if sqlite3_prepare_v2(db, sql_moviequery, -1, &con, nil) == SQLITE_OK {
            print("sql문 객체화 성공")

            while sqlite3_step(con) == SQLITE_ROW {
//                print("aaa-------- 성공")

                let id = sqlite3_column_int(con, 0)
                let title1 = sqlite3_column_text(con, 1)
                let director1 = sqlite3_column_text(con, 2)
                let actor1 = sqlite3_column_text(con, 3)
                let time1 = sqlite3_column_text(con, 4)
                let genre1 = sqlite3_column_text(con, 5)
                let date1 = sqlite3_column_text(con, 6)
                let imgFile1 = sqlite3_column_text(con, 7)
                
                
                let title = String(cString: title1!)
                let director = String(cString: director1!)
                let actor = String(cString: actor1!)
                let time = String(cString: time1!)
                let genre = String(cString: genre1!)
                let date = String(cString: date1!)
                let imgFile = String(cString: imgFile1!)
                
                let result : Array<Any> = [id, title, director, actor, time, genre, date, imgFile]
                
                results.append(result)
//                print(results)
                
            }

        } else {

            print("sql문 객체화 실패")
        }
        // 실행이 성공하면 테이블이 생성되었습니다
        sqlite3_finalize(con)
        return results
        
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
