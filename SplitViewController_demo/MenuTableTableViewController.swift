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
    PageOption(displayName: "Weather", url: "https://weather.gc.ca"),
    PageOption(displayName: "Twitter", url: "https://twitter.com"),
    PageOption(displayName: "BCIT", url: "https://learn.bcit.ca")
  
  ]
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

      let pageOption = pages[indexPath.row]
      cell.textLabel!.text = pageOption.displayName

      return cell
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
      
      if segue.identifier == "show_detail_segue_id" {
        var menuDetailViewController: MenuDetailViewController!
        
        if let menuTableViewController = segue.destinationViewController as? UINavigationController {
          
          menuDetailViewController = menuTableViewController.topViewController as! MenuDetailViewController
          menuDetailViewController.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
          menuDetailViewController.navigationItem.leftItemsSupplementBackButton = true
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
