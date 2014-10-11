//
//  Comms.swift
//  GuessWhom
//
//  Created by Oliver on 11/10/14.
//  Copyright (c) 2014 devhaus. All rights reserved.
//

import Foundation

protocol CommsDelegate {
  func commsDidLogin(loggedIn: Bool)
}

class Comms {
  class func login<T:CommsDelegate>(delegate: T) {
    var permissionsArray = ["user_about_me", "user_relationships", "user_birthday", "user_location"]
    PFFacebookUtils.logInWithPermissions(permissionsArray, block: { (user: PFUser!, error: NSError!) -> Void in
      if let test = user {
        if test.isNew {
          println("User signed up and logged in through Facebook!")
        } else {
          println("User logged in through Facebook!")
        }
        delegate.commsDidLogin(true)
      } else {
        if let test = error {
          println("An error occured")
        } else {
          println("The user cancelled the Facbook login")
        }
      }
    })
  }
}