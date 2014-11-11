//
//  CameraPartsTestView.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 10/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class CameraPartsTestView: UIViewController {
    
    var numVidas : Int = 3
    
    @IBOutlet weak var parteCamara: UILabel!
    
    // Vidas Descontadas
    
    @IBOutlet weak var vida3: UIImageView!
    
    @IBOutlet weak var vida2: UIImageView!
    
    @IBOutlet weak var vida1: UIImageView!
    
    // Circulos para esconder o mostrar
    
    @IBOutlet weak var circuloAnillo: UIButton!
    
    @IBOutlet weak var circuloDisparador: UIButton!
    
    @IBOutlet weak var circuloModo: UIButton!
    
    @IBOutlet weak var circuloFlash: UIButton!
    
    @IBOutlet weak var circuloCorrea: UIButton!
    
    // Marcas incorrectas para esconder o mostrar
    
    @IBOutlet weak var xAnillo: UIImageView!
    
    @IBOutlet weak var xDisparador: UIImageView!
    
    @IBOutlet weak var xModo: UIImageView!

    @IBOutlet weak var xFlash: UIImageView!
    
    @IBOutlet weak var xCorrea: UIImageView!
    
    // Checkmarks para esconder o mostrar
    
    @IBOutlet weak var checkmarkAnillo: UIImageView!
    
    @IBOutlet weak var checkmarkDisparador: UIImageView!
    
    @IBOutlet weak var checkmarkModo: UIImageView!
    
    @IBOutlet weak var checkmarkFlash: UIImageView!
    
    @IBOutlet weak var checkmarkCorrea: UIImageView!
    
    
    
    func verificarVidas(vidas:Int) {
        if vidas == 2 {
            vida3.hidden = false
        }
        if vidas == 1 {
            vida2.hidden = false
        }
        if vidas == 0 {
            vida1.hidden = false
            performSegueWithIdentifier("gotoFail", sender: self)
        }
    }
    
    @IBAction func anilloPresionado(sender: UIButton) {
        if parteCamara.text == "Anillo de Enfoque"{
            circuloAnillo.hidden = true
            xAnillo.hidden = true
            xDisparador.hidden = true
            xModo.hidden = true
            xFlash.hidden = true
            xCorrea.hidden = true
            checkmarkAnillo.hidden = false
            parteCamara.text = "Disparador"
        }
        else {
            xAnillo.hidden = false
            numVidas = numVidas - 1
            self.verificarVidas(numVidas)
        }
    }
    
    @IBAction func disparadorPresionado(sender: UIButton) {
        if parteCamara.text == "Disparador"{
            circuloDisparador.hidden = true
            xAnillo.hidden = true
            xDisparador.hidden = true
            xModo.hidden = true
            xFlash.hidden = true
            xCorrea.hidden = true
            checkmarkDisparador.hidden = false
            parteCamara.text = "Selector de Modo"
        }
        else {
            xDisparador.hidden = false
            numVidas = numVidas - 1
            self.verificarVidas(numVidas)
        }
    }
    
    @IBAction func modoPresionado(sender: UIButton) {
        if parteCamara.text == "Selector de Modo"{
            circuloModo.hidden = true
            xAnillo.hidden = true
            xDisparador.hidden = true
            xModo.hidden = true
            xFlash.hidden = true
            xCorrea.hidden = true
            checkmarkModo.hidden = false
            parteCamara.text = "Zapata para Flash"
        }
        else {
            xModo.hidden = false
            numVidas = numVidas - 1
            self.verificarVidas(numVidas)
        }
    }
    
    @IBAction func flashPresionado(sender: UIButton) {
        if parteCamara.text == "Zapata para Flash"{
            circuloFlash.hidden = true
            xAnillo.hidden = true
            xDisparador.hidden = true
            xModo.hidden = true
            xFlash.hidden = true
            xCorrea.hidden = true
            checkmarkFlash.hidden = false
            parteCamara.text = "Enganche para Correa"
        }
        else {
            xFlash.hidden = false
            numVidas = numVidas - 1
            self.verificarVidas(numVidas)
        }
    }
    
    @IBAction func correaPresionado(sender: AnyObject) {
        if parteCamara.text == "Enganche para Correa"{
            circuloCorrea.hidden = true
            xAnillo.hidden = true
            xDisparador.hidden = true
            xModo.hidden = true
            xFlash.hidden = true
            xCorrea.hidden = true
            checkmarkCorrea.hidden = false
            parteCamara.text = ""
            self.performSegueWithIdentifier("gotoSuccess", sender: self)
        }
        else {
            xCorrea.hidden = false
            numVidas = numVidas - 1
            self.verificarVidas(numVidas)
        }
    }
    
    @IBAction func cancelPresionado(sender: UIButton) {
        let alert = UIAlertController(title: "¿Estás seguro de que deseas salir?", message: "Perderás todo tu progreso.", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "Sí", style: .Default, handler: {(alertAction)in
            //Si decide salir de la lección
            self.performSegueWithIdentifier("Main", sender: self)
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: {(alertAction)in
            //Si decide quedarse en la lección
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "gotoSuccess") {
            let controller : ApprovedLessonView = segue.destinationViewController as ApprovedLessonView
            controller.numVidas = self.numVidas
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
