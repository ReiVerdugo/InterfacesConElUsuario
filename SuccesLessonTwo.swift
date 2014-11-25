//
//  SuccesLessonTwo.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 25/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class SuccesLessonTwo: UIViewController {

    @IBOutlet weak var bronzeBadge: UIImageView!
    
    @IBAction func shareButton(sender: UIButton) {
        var myShareRessult : String = "¡Aprobé la Lección \"Exposición\" en PerfectPhoto con 1 vidas restante!"
        var imagen : UIImage = bronzeBadge.image!
        
        let activityVC : UIActivityViewController = UIActivityViewController(activityItems: [myShareRessult, imagen], applicationActivities: nil)
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
}
