//
//  FriendListViewController.swift
//  GuessWhom
//
//  Created by Oliver on 11/10/14.
//  Copyright (c) 2014 devhaus. All rights reserved.
//

import Foundation

class FriendListTableViewController: UITableViewController {

  override func viewDidLoad() {
    self.loadFriendsData()
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func loadFriendsData() {
    var request = FBRequest.requestForMyFriends()
    request.startWithCompletionHandler { (connect: FBRequestConnection!, responseObject: AnyObject!, error: NSError!) -> Void in

      if let jsonResult = responseObject as? FBGraphObject {

        println(jsonResult)
      }
    }
  }

}