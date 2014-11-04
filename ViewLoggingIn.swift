//
//  ViewLoggingIn.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo and Ramon Marquez on 03/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class ViewLoggingIn: UIViewController {

    
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
        if usernameTextField.text == ""
        {
            messageLabel.text = "Debe introducir un nombre de usuario"
        }
        if passwordTextField.text == ""
        {
            messageLabel2.text = "Debe introducir una contraseña"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
