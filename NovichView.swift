//
//  NovichView.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 09/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class NovichView: UIViewController {
    
    @IBOutlet weak var numFollowers: UILabel!
    
    @IBOutlet weak var button: UILabel!
    
    @IBAction func buttonPressed(sender: UIButton) {
        if button.text == "Unfollow"
        {
            button.text = "Follow"
            numFollowers.text = "41"
        }
        else if button.text == "Follow"
        {
            button.text = "Unfollow"
            numFollowers.text = "42"
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
