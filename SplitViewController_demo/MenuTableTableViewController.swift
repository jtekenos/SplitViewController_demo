//
//  MenuTableTableViewController.swift
//  SplitViewController_demo
//
//  Created by Jess on 2015-11-05.
//  Copyright © 2015 Jess. All rights reserved.
//

import UIKit

//the pages we will be using for the table of splitview
struct PageOption {
  let displayName: String
  let url: String
}

class MenuTableTableViewController: UITableViewController {
  
  //collection of pages to display
  let pages = [
    PageOption(displayName: "Google", url: "https://google.com"),
    PageOption(displayName: "Apple", url: "https://apple.com"),
    PageOption(displayName: "iOS Developer Library", url: "https://developer.apple.com/library/ios/navigation/"),
    PageOption(displayName: "Twitter", url: "https://twitter.com"),
    PageOption(displayName: "BCIT", url: "https://learn.bcit.ca")
  ]
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //return the number of pages
      return pages.count
    }

    //returns the cells that populate the table list with the display name of the PageOption
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("pageSelectCell", forIndexPath: indexPath)
      //set the names of the rows in the left panel
      let pageOption = pages[indexPath.row]
      cell.textLabel!.text = pageOption.displayName
      return cell
    }
  
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
      
      if segue.identifier == "segueIdentifier" {
        var menuDetailViewController: MenuDetailViewController!
        if let menuTableViewController = segue.destinationViewController as? UINavigationController {
          menuDetailViewController = menuTableViewController.topViewController as! MenuDetailViewController
        } else {
          menuDetailViewController = segue.destinationViewController as! MenuDetailViewController
        }
        if let selectedPageOption = tableView.indexPathForSelectedRow {
          let pageOption = pages[selectedPageOption.row]
          menuDetailViewController.pageOption = pageOption
        }
      }
      
    }


}
