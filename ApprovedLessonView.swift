//
//  ApprovedLessonView.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 10/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class ApprovedLessonView: UIViewController {
    
    var numVidas : Int!

    @IBOutlet weak var numVidasLabel: UILabel!
    
    @IBAction func shareButton(sender: UIButton) {
        var myShareRessult : String = "¡Aprobé la Lección \"Partes de la cámara\" en PerfectPhoto con \(self.numVidas) restantes!"
        
        let activityVC : UIActivityViewController = UIActivityViewController(activityItems: [myShareRessult], applicationActivities: nil)
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numVidasLabel.text = "\(numVidas)"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
