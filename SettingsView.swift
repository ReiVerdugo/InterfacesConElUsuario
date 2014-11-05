//
//  SettingsView.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 05/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class SettingsView: UIViewController {
    
    
    @IBAction func acceptButton(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func cancelButton(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
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
