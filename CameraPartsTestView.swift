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
    
    
    @IBOutlet weak var circuloAnillo: UIButton!
    
    @IBOutlet weak var circuloDisparador: UIButton!
    
    @IBOutlet weak var circuloModo: UIButton!
    
    @IBOutlet weak var circuloFlash: UIButton!
    
    @IBOutlet weak var circuloCorrea: UIButton!
    
    @IBOutlet weak var xAnillo: UIImageView!
    
    @IBOutlet weak var xDisparador: UIImageView!
    
    @IBOutlet weak var xModo: UIImageView!

    @IBOutlet weak var xFlash: UIImageView!
    
    @IBOutlet weak var xCorrea: UIImageView!
    
    func verificarVidas(vidas:Int) {
        if vidas == 0 {
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
            parteCamara.text = ""
        }
        else {
            xCorrea.hidden = false
            numVidas = numVidas - 1
            self.verificarVidas(numVidas)
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
