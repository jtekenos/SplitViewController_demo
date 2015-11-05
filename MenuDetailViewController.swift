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

  @IBOutlet weak var lbl_Link: UILabel!
  @IBOutlet weak var lbl_title: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

      self.lbl_title.text = "Selected: \(pageOption.displayName)"
      self.lbl_Link.text = pageOption.url
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
