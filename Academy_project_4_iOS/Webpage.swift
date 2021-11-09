//
//  Webpage.swift
//  Academy_project_4_iOS
//
//  Created by Apple on 2021/11/09.
//

import UIKit
import WebKit

class Webpage: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //초기 로딩 페이지 지정 (예매 페이지)
        loadWebPage("https://www.arthousemomo.co.kr/pages/ti.php")
    }
    
    //입력된 주소의 페이지 로드
    func loadWebPage(_ url:String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }

    @IBAction func btnPageClose(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    @IBAction func btnGoHome(_ sender: UIBarButtonItem) {
        loadWebPage("https://www.arthousemomo.co.kr/")
    }
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
}
