//
//  CameraPartsView.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 09/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class CameraPartsView: UIViewController {

    @IBAction func cancelPressed(sender: UIBarButtonItem) {
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
