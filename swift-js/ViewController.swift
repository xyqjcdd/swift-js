//
//  ViewController.swift
//  swift-js
//
//  Created by XYQ on 2016/12/16.
//  Copyright © 2016年 XYQ. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController,UIWebViewDelegate,JSObjectMethods {

    @IBOutlet weak var showHtmlWebView: UIWebView!
    @IBOutlet weak var usernameTextField: UITextField!
    var jsContext : JSContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let htmlUrl = Bundle.main.url(forResource: "login", withExtension: "html");
        showHtmlWebView.loadRequest(URLRequest(url: htmlUrl!));

    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        //不加判断，容易输出：failed to return after waiting 10 seconds. main run loop mode: kCFRunLoopDefaultMode
        //这个错误应该跟调用js有关
        if webView.isLoading{
            return;
        }
        jsContext = showHtmlWebView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as! JSContext;
        
        //将jsobject对象指向自身，名字可以随便起，但是这里的名字要与js里的一致。
        jsContext.setObject(self, forKeyedSubscript: "jsobject" as (NSCopying & NSObjectProtocol)!);

        jsContext.exceptionHandler = { (context,exceptionValue) in
            print("异常信息：\(exceptionValue!)");
        }
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(error);
    }
    
    //更新usernameTextField
    func upAction(_ username: String)
    {
        print("这是带参数的带参数");
//        print("name = \(username)");
        
        //回到主线程，否则会报crash
        DispatchQueue.main.async {
            self.usernameTextField.text = username;
        };
    }
    
    func update(_ test1: String, _ test2: String) {
        print(test1,test2)
    }
    
    func test()
    {
        print("这是不传参数的，js可以调用swift！");
    }
    
    @IBAction func updateAction(_ sender: Any)
    {
        let jsStr = "updateName('\(usernameTextField.text!)')";
        jsContext.evaluateScript(jsStr);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

