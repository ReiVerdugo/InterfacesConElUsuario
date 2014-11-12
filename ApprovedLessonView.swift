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
    
    @IBOutlet weak var vida1: UIImageView!
    
    @IBOutlet weak var vida2: UIImageView!
    
    @IBOutlet weak var silverBadge: UIImageView!
    
    @IBOutlet weak var bronzeBadge: UIImageView!

    @IBOutlet weak var numVidasLabel: UILabel!
    
    @IBAction func shareButton(sender: UIButton) {
        var myShareRessult : String = "¡Aprobé la Lección \"Partes de la cámara\" en PerfectPhoto con \(self.numVidas) vidas restantes!"
        
        let activityVC : UIActivityViewController = UIActivityViewController(activityItems: [myShareRessult], applicationActivities: nil)
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
    
    func verificarVidas(vidas : Int) {
        if vidas == 2 {
            vida1.hidden = false
            silverBadge.hidden = false
        } else if vidas == 1 {
            vida1.hidden = false
            vida2.hidden = false
            bronzeBadge.hidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numVidasLabel.text = "\(numVidas)"
        verificarVidas(self.numVidas)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
