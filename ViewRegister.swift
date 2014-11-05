//
//  ViewRegister.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo and Ramon Marquez on 03/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class ViewRegister: UIViewController {
    
    // Declaramos los objetos presentes en la ventana de registro
    
    // Campos de texto
    @IBOutlet weak var usrnameTextfield: UITextField!
    
    @IBOutlet weak var passwrdTextfield: UITextField!
    
    @IBOutlet weak var confirmpasswordTextfield: UITextField!
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    // Etiquetas
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var usrnameAllert: UILabel!
    
    @IBOutlet weak var passwordAllert: UILabel!
    
    @IBOutlet weak var confirmAllert: UILabel!
    
    @IBOutlet weak var emailAllert: UILabel!
    
    // Los siguientes métodos hacen que el teclado desaparezca
    // al presionar return en cada campo de texto.
    
    @IBAction func usrnameFilled(sender: UITextField) {
    }
    
    @IBAction func passwrdFilled(sender: UITextField) {
    }
    
    @IBAction func confirmPasswordFilled(sender: UITextField) {
    }
    
    @IBAction func emailFilled(sender: UITextField) {
    }
    
    // Acción para verificar las credenciales
    @IBAction func verifyCredentials(sender: UIButton) {
        
        // Hacemos desaparecer cualquier alerta
        // activada por alguna acción anterior
        usrnameAllert.textColor = UIColor.whiteColor()
        passwordAllert.textColor = UIColor.whiteColor()
        confirmAllert.textColor = UIColor.whiteColor()
        emailAllert.textColor = UIColor.whiteColor()
        
        
        // Verificamos si algún campo de texto quedó vacío
        if (usrnameTextfield.text == "") || (passwrdTextfield.text == "")
        || (confirmpasswordTextfield.text == "") || (emailTextfield.text == "")
        {
            label.text = "Todos los campos son obligatorios"
            if (usrnameTextfield.text == "")
            {
                usrnameAllert.textColor = UIColor.redColor()
            }
            if (passwrdTextfield.text == "")
            {
                passwordAllert.textColor = UIColor.redColor()
            }
            if (confirmpasswordTextfield.text == "")
            {
                confirmAllert.textColor = UIColor.redColor()
            }
            if (emailTextfield.text == "")
            {
                emailAllert.textColor = UIColor.redColor()
            }

        }
        
        else if passwrdTextfield.text != confirmpasswordTextfield.text
        {
            label.text = "Las contraseñas no coinciden."
            passwordAllert.textColor = UIColor.redColor()
            confirmAllert.textColor = UIColor.redColor()
            passwrdTextfield.text = ""
            confirmpasswordTextfield.text = ""
        }
        
        else
        {
           performSegueWithIdentifier("SuccesReg", sender: self)
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
