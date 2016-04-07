//
//  WebContentVC.swift
//  blinks
//
//  Created by Leandro Tami on 4/7/16.
//  Copyright © 2016 Lateral View. All rights reserved.
//

import UIKit

class WebContentVC: UIViewController, UIWebViewDelegate
{
    
    @IBOutlet weak var webView: UIWebView!
    
    var thread: Thread!
    
    override func viewWillAppear(animated: Bool)
    {
        let request = NSURLRequest(URL: thread.URL)
        self.webView.loadRequest(request)
    }
    
    // MARK: UIWebViewDelegate
    
    func webViewDidFinishLoad(webView: UIWebView)
    {
        self.title = self.webView.stringByEvaluatingJavaScriptFromString("document.title")
        
    }
    
}
