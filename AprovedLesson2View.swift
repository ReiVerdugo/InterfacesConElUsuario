//
//  AprovedLesson2View.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 24/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class AprovedLesson2View: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var original : UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = original
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
