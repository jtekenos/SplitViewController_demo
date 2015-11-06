//
//  MenuDetailViewController.swift
//  SplitViewController_demo
//
//  Created by Jess on 2015-11-05.
//  Copyright © 2015 Jess. All rights reserved.
//

import UIKit

class MenuDetailViewController: UIViewController {
  
  var pageOption = PageOption(displayName: "Home", url: "https://support.google.com")

  @IBOutlet weak var lbl_title: UILabel!
  @IBOutlet weak var webView: UIWebView!
  
    override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view
      self.lbl_title.text = "You are now Browsing: \(pageOption.displayName)"
      let requestUrl = pageOption.url
      let requestNSURL = NSURL(string: requestUrl)
      let request = NSURLRequest(URL: requestNSURL!)
      webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
