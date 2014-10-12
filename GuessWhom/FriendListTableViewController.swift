//
//  FriendListViewController.swift
//  GuessWhom
//
//  Created by Oliver on 11/10/14.
//  Copyright (c) 2014 devhaus. All rights reserved.
//

import Foundation

class FriendListTableViewController: UITableViewController {
  var friends = Array<FBGraphObject>()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "friendCell")
    self.loadFriendsData()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func loadFriendsData() {
    var request = FBRequest.requestForMyFriends()
    request.startWithCompletionHandler { (connect: FBRequestConnection!, responseObject: AnyObject!, error: NSError!) -> Void in

      var resultDictionary = responseObject as NSDictionary
      var data : NSArray = resultDictionary.objectForKey("data") as NSArray
      for i in 0..<data.count {
        let valueDictionary : NSDictionary = data[i] as NSDictionary
        let id = valueDictionary.objectForKey("id") as String
        println("the id value is \(id)")
        println(i)
      }
      self.friends = resultDictionary.objectForKey("data") as Array<FBGraphObject>
      self.tableView.reloadData()
      println("Found \(self.friends.count) friends")
      println(self.friends)
    }
  }
  
  
  // - Table View Delegate
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var identifer: String = "friendCell"
    var cell = tableView.dequeueReusableCellWithIdentifier(identifer) as UITableViewCell
    var personObject = friends[indexPath.row]
    let fullName = personObject.objectForKey("name") as? String
    cell.textLabel!.text = fullName
    
    var friendId = personObject.objectForKey("id") as? String
    var profilePictureString = "https://graph.facebook.com/\(friendId!)/picture"
    let profilePictureUrl = NSURL.URLWithString(profilePictureString)
    var err: NSError?
    var imageData :NSData = NSData.dataWithContentsOfURL(profilePictureUrl,options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)
    var profileImage = UIImage(data:imageData)
    // Set the profile picture into the user object
    if let profile = profileImage as UIImage? {
      personObject["profile_picture"] = profileImage
      cell.imageView!.image = profileImage
    }
    friends[indexPath.row] = personObject
    return cell
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return friends.count
  }
}