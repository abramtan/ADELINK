//
//  ViewController.swift
//  ADELINK
//
//  Created by Abram Tan on 21/1/22.
//

import UIKit
import WebKit

class HomeViewController: UIViewController, WKNavigationDelegate {
    
//    var SOARWebView: WKWebView!
    @IBOutlet weak var IGWebView: WKWebView!
    
//    override func loadView() {
//        SOARWebView = WKWebView()
//        SOARWebView.navigationDelegate = self
//        view = SOARWebView
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlSOARIG = URL(string: "https://www.instagram.com/sutdsoar")!
        IGWebView.load(URLRequest(url: urlSOARIG))
    }
    
    

}
