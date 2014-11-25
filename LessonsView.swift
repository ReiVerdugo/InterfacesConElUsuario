//
//  LessonsView.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 09/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class LessonsView: UIViewController {
    
    var introCompleted : Bool = false

    
    @IBAction func introLessonPressed(sender: UIButton) {
        performSegueWithIdentifier("gotoLesson0", sender: self)
    }

    @IBAction func expoLessonPressed(sender: UIButton) {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let intro = appDelegate.introCompleted
        if intro {
            performSegueWithIdentifier("gotoLesson1", sender: self)
        } else {
            let alert = UIAlertController(title: "Atención", message: "Debes completar la lección de Introducción primero.", preferredStyle: .Alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: .Default, handler: {(alertAction)in
                //
                alert.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
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
