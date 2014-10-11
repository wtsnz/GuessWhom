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
        
        
//        var loginView = FBLoginView()
//        loginView.center = self.view.center
//        self.view.addSubview(loginView)
        Comms.login(self)
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // -- CommsDelegate
    func commsDidLogin(loggedIn: Bool) {
        
    }

}

