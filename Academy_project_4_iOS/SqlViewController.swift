//
//  SqlViewController.swift
//  Academy_project_4_iOS
//
//  Created by kwonsoonsun on 2021/11/13.
//

import UIKit
import SQLite3

var userids = ""
var userpws = ""

var userphones = ""
var usernames = ""

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
            //print("연결 성공")
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
    
    let sql_userdelete = "delete from users where id = ?;"
    func userdelete(id : NSString) {
        let db = openDatabase()
        var con : OpaquePointer? = nil
        // sql문 객체화
        if sqlite3_prepare_v2(db, sql_userdelete, -1, &con, nil) == SQLITE_OK {
            sqlite3_bind_text(con, 1, id.utf8String, -1, nil)
            
            print("sql문 객체화 성공")
            if sqlite3_step(con) == SQLITE_DONE {
                print("회원삭제 성공")
            } else {
                print("회원삭제 실패")
            }
        } else {
            print("sql문 객체화 실패")
        }
        // 실행이 성공하면 테이블이 생성되었습니다
        sqlite3_finalize(con)
    }
    
    let sql_userupdate = "update users set pw = ?, phone = ?, name = ? where id = ?;"
    func userupdate(id : NSString, pw : NSString, phone : NSString, name : NSString) {
        let db = openDatabase()
        var con : OpaquePointer? = nil
        // sql문 객체화
        if sqlite3_prepare_v2(db, sql_userupdate, -1, &con, nil) == SQLITE_OK {
            sqlite3_bind_text(con, 4, id.utf8String, -1, nil)
            sqlite3_bind_text(con, 1, pw.utf8String, -1, nil)
            sqlite3_bind_text(con, 2, phone.utf8String, -1, nil)
            sqlite3_bind_text(con, 3, name.utf8String, -1, nil)
            
            print("sql문 객체화 성공")
            if sqlite3_step(con) == SQLITE_DONE {
                print("회원수정 성공")
            } else {
                print("회원수정 실패")
            }
        } else {
            print("sql문 객체화 실패")
        }
        // 실행이 성공하면 테이블이 생성되었습니다
        sqlite3_finalize(con)
    }
    
    
    let sql_moviequery =  "select * from movie order by id;"
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
    
    let sql_idquery =  "select id from users where phone = ? and name = ?;"
    func idquery(phone : NSString, name : NSString) -> String {

        let db = openDatabase()
        var con : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, sql_idquery, -1, &con, nil) == SQLITE_OK {
            print("sql문 객체화 성공")
            
            sqlite3_bind_text(con, 1, phone.utf8String, -1, nil)
            sqlite3_bind_text(con, 2, name.utf8String, -1, nil)
            
            if sqlite3_step(con) == SQLITE_ROW {
                print("회원검색 성공")

                let i = sqlite3_column_text(con, 0)
                userids = String(cString: i!)
                print(userids)
            }

        } else {

            print("sql문 객체화 실패")
            
        }
        // 실행이 성공하면 테이블이 생성되었습니다
        sqlite3_finalize(con)
        return userids
    }
    
    let sql_pwquery =  "select pw from users where id = ? and phone = ? and name = ?;"
    func pwquery(id : NSString, phone : NSString, name : NSString) -> String {

        let db = openDatabase()
        var con : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, sql_pwquery, -1, &con, nil) == SQLITE_OK {
            print("sql문 객체화 성공")
            
            sqlite3_bind_text(con, 1, id.utf8String, -1, nil)
            sqlite3_bind_text(con, 2, phone.utf8String, -1, nil)
            sqlite3_bind_text(con, 3, name.utf8String, -1, nil)
            
            if sqlite3_step(con) == SQLITE_ROW {
                print("회원검색 성공")

                let i = sqlite3_column_text(con, 0)
                userpws = String(cString: i!)
                print(userpws)
            }

        } else {

            print("sql문 객체화 실패")
            
        }
        // 실행이 성공하면 테이블이 생성되었습니다
        sqlite3_finalize(con)
        return userpws
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
    
    //위시리스트 관련 SQL
    
    // 1) 찜하기 등록(create)
    let wish_create = "insert into wish values (?, ?, ?);"
    func wishCreate(id: NSString, movieId: Int32, title: NSString) {
        let db = openDatabase()
        var con : OpaquePointer? = nil

        if sqlite3_prepare_v2(db, wish_create, -1, &con, nil) == SQLITE_OK {
            sqlite3_bind_text(con, 1, id.utf8String, -1, nil)
            sqlite3_bind_int(con, 2, movieId)
            sqlite3_bind_text(con, 3, title.utf8String, -1, nil)
            //print("wish: sql문 객체화 성공")
            if sqlite3_step(con) == SQLITE_DONE {
                //print("찜하기 성공")
            } else {
                print("찜하기 실패")
            }
        } else {
            print("wish: sql문 객체화 실패_찜하기")
        }
        sqlite3_finalize(con)
    }
    
    //2)찜하기 해제(delete)
    let wish_delete = "delete from wish where id = ? and movieId = ?;"
    func wishDelete(_ id: NSString, _ movieId: Int32) {
        let db = openDatabase()
        var con: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, wish_delete, -1, &con, nil) == SQLITE_OK {
            sqlite3_bind_text(con, 1, id.utf8String, -1, nil)
            sqlite3_bind_int(con, 2, movieId)
            if sqlite3_step(con) == SQLITE_DONE {
                //print("찜 해제 성공")
            } else {
                print("찜 해제 실패")
            }
        } else {
            print("wish: sql문 객체화 실패_찜 해제")
        }
        sqlite3_finalize(con)
    }
    
    // 3)찜 리스트 불러오기(select)
    let wish_read = "select * from wish where id = ?;"
    func wishRead(_ id: NSString) -> Array<Array<Any>> {
        let db = openDatabase()
        var con: OpaquePointer? = nil
        //검색 내용 저장용 2차원 배열
        var results: Array<Array<Any>> = []
        if sqlite3_prepare_v2(db, wish_read, -1, &con, nil) == SQLITE_OK {
            sqlite3_bind_text(con, 1, id.utf8String, -1, nil)
            
            while sqlite3_step(con) == SQLITE_ROW {
                let id = String(cString: sqlite3_column_text(con, 0)!)
                let movieId = sqlite3_column_int(con, 1)
                let title = String(cString: sqlite3_column_text(con, 2)!)
                //검색된 행을 배열로 리턴배열에 추가
                let result : Array<Any> = [id, movieId, title]
                results.append(result)
            }
        } else {
            print("wish: sql문 객체화 실패_검색")
        }
        sqlite3_finalize(con)
        //print(results)
        return results
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
//
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
