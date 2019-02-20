//
//  ViewController.swift
//  ioswebview
//
//  Created by Atul Sharma on 2/14/19.
//  Copyright © 2019 Atul Sharma. All rights reserved.
//
/*
 webView.loadHTMLString("<strong>So long and thanks for all the fish!</strong>", baseURL: nil)
 */
import UIKit
import WebKit
class ViewController: UIViewController, WKNavigationDelegate{
    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        let url = URL(string: "http://18.233.148.141:3000")!
        webView.load(URLRequest(url: url))
        
        // 2
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage)
    {
        print(message.body)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
        /*webView.evaluateJavaScript("navigator.userAgent", completionHandler: { result, error in
            if let userAgent = result as? String {
                print(userAgent)
            }
        })
 
        
         let _config = WKWebViewConfiguration()
         let js = "document.addEventListener('click', function(){ window.webkit.messageHandlers.clickListener.postMessage('My hovercraft is full of eels!'); })"
         let script = WKUserScript(source: js, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
         */
       
    }
    @IBOutlet weak var webView1: WKWebView!
    
    var refreshControl:UIRefreshControl?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
        webView1.goBack()
    }
    
    
    func webViewDidStartLoad(_ webView: WKWebView)
    {
        activityIndicator.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: WKWebView)
    {
        activityIndicator.stopAnimating()
    }
    
    
    @IBAction func refreshButton(_ sender: Any) {
        webView1.reload()
    }
}

