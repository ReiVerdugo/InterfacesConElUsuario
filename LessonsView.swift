//
//  LessonsView.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 09/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class LessonsView: UIViewController {
    
    
    @IBAction func introLessonPressed(sender: UIButton) {
        performSegueWithIdentifier("gotoLesson0", sender: self)
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
