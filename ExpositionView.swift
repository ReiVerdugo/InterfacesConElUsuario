//
//  ExpositionView.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 22/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class ExpositionView: UIViewController {
    
    
    @IBAction func cancelPressed(sender: UIButton) {
        let alert = UIAlertController(title: "Abandonar lección", message: "¿Estás seguro de que deseas salir?", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "Sí", style: .Default, handler: {(alertAction)in
            //Si decide salir de la lección
            self.performSegueWithIdentifier("gotoMain", sender: self)
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: {(alertAction)in
            //Si decide quedarse en la lección
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
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
