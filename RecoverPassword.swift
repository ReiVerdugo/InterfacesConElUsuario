//
//  RecoverPassword.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo and Ramón Marquez on 03/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class RecoverPassword: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func emailFilled(sender: AnyObject) {
    }
    
    @IBAction func acceptButton(sender: AnyObject) {
        if emailTextField.text == ""
        {
            messageLabel.textColor = UIColor.redColor()
            messageLabel.text = "Debe introducir una dirección de correo"
        }
            
        else
        {
            emailTextField.hidden = true
            messageLabel.textColor = UIColor.blackColor()
            messageLabel.text = "¡Gracias! Verifica tu correo"
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
