//
//  Support.swift
//  SplitViewController_demo
//
//  Created by Jess on 2015-11-05.
//  Copyright © 2015 Jess. All rights reserved.
//

import UIKit

extension UISplitViewController: UISplitViewControllerDelegate {
  struct ios7Support {
    static var modeButtonItem: UIBarButtonItem?
  }
  
  var backBarButtonItem: UIBarButtonItem? {
    get {
      if respondsToSelector(Selector("displayModeButtonItem")) == true {
        let button: UIBarButtonItem = displayModeButtonItem()
        return button
      } else {
        return ios7Support.modeButtonItem
      }
    }
    set {
      ios7Support.modeButtonItem = newValue
    }
  }
  // simple trick, without swizzling :-)
  
  func displayModeButtonItem(_: Bool = true)->UIBarButtonItem? {
    return backBarButtonItem
  }
  
  public func splitViewController(svc: UISplitViewController, willHideViewController aViewController: UIViewController, withBarButtonItem barButtonItem: UIBarButtonItem, forPopoverController pc: UIPopoverController) {
    if (!svc.respondsToSelector(Selector("displayModeButtonItem"))) {
      if let detailView = svc.viewControllers[svc.viewControllers.count-1] as? UINavigationController {
        svc.backBarButtonItem = barButtonItem
        detailView.topViewController!.navigationItem.leftBarButtonItem = barButtonItem
      }
    }
  }
  
  
  public func splitViewController(svc: UISplitViewController, willShowViewController aViewController: UIViewController, invalidatingBarButtonItem barButtonItem: UIBarButtonItem) {
    if (!svc.respondsToSelector(Selector("displayModeButtonItem"))) {
      if let detailView = svc.viewControllers[svc.viewControllers.count-1] as? UINavigationController {
        svc.backBarButtonItem = nil
        detailView.topViewController!.navigationItem.leftBarButtonItem = nil
      }
    }
  }
  
  // MARK: - user defined imlementation of UISplitViewControllerDelegate
  
//  public func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
//    if let navController = primaryViewController as? UINavigationController {
//      if let controller = navController.topViewController as? MenuTableTableViewController {
//        return controller.collapseDetailViewController
//      }
//    }
//    return true
//  }
}
