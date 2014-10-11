//
//  ViewController.swift
//  GuessWhom
//
//  Created by Will Townsend on 11/10/14.
//  Copyright (c) 2014 devhaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CommsDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // -- CommsDelegate
  func commsDidLogin(loggedIn: Bool) {
    if (loggedIn) {
      self.performSegueWithIdentifier("LoginSuccessful", sender:self)
    } else {
      var alert = UIAlertController(title: "Login Failed", message: "Facebook Login failed. Please try again", preferredStyle: UIAlertControllerStyle.Alert)
      alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
      self.presentViewController(alert, animated: true, completion: nil)
    }
  }
  
  @IBAction func loginButtonTouchHandler(sender: UIButton) {
      Comms.login(self)
  }
}

