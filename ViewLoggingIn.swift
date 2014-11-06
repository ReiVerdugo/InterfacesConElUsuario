//
//  ViewLoggingIn.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo and Ramon Marquez on 03/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class ViewLoggingIn: UIViewController, FBLoginViewDelegate {

    @IBOutlet var fbLoginView : FBLoginView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var forgotPasswButton: UIButton!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var messageLabel2: UILabel!
    
    @IBAction func usernameFilled(sender: UITextField) {
    }
    
    @IBAction func passwordFilled(sender: UITextField) {
    }
    
    @IBAction func acceptButton(sender: AnyObject) {
        
        messageLabel.text = ""
        messageLabel2.text = ""
        
        if usernameTextField.text == ""
        {
            messageLabel.text = "Debe introducir un nombre de usuario"
        }
        if passwordTextField.text == ""
        {
            messageLabel2.text = "Debe introducir una contraseña"
        }
        if (passwordTextField.text != "") && (usernameTextField.text != "")
        {
            performSegueWithIdentifier("successLogin", sender: self)
            
        }
    }
    
    // Métodos del Facebook Delegate
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
        performSegueWithIdentifier("successLogin", sender: self)
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser){
        println("User Name: \(user.name)")
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    
    // Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
