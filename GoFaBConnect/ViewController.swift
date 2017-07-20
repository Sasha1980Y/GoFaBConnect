//
//  ViewController.swift
//  GoFaBConnect
//
//  Created by AlexanderYakovenko on 7/20/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit
import GoogleSignIn
import Google



class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    
    @IBOutlet weak var labelMessage: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var error: NSError?
        GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil {
            print(error)
            return
        }
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        let googleSignButton = GIDSignInButton()
        googleSignButton.center = view.center
        view.addSubview(googleSignButton)
        
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print(user.profile.email)
        print(user.profile.imageURL(withDimension: 400))
    }
    
    /*
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        if (error == nil) {
            print("OK")
        } else {
            labelMessage.text = error.localizedDescription
        }
    }
    */
    

}

