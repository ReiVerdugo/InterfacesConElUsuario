//
//  CameraPartsView.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 09/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class CameraPartsView: UIViewController {
    
    var anillo      : Bool = false
    var enganche    : Bool = false
    var zapata      : Bool = false
    var selector    : Bool = false
    var disparo     : Bool = false
    
    
    @IBAction func anilloEnfoque(sender: UIButton) {
        let alert = UIAlertController(title: "Anillo de enfoque", message: "Permite regular la distancia al objetivo, para conseguir una imagen nítida o enfocada.", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: {(alertAction)in
            //
            alert.dismissViewControllerAnimated(true, completion: nil)
            }))
        anillo = true
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func engancheCorrea(sender: UIButton) {
        let alert = UIAlertController(title: "Enganche para Correa", message: "Permite que enganchemos una correa a la cámara.", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: {(alertAction)in
            //
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        enganche = true
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func zapataFlash(sender: UIButton) {
        let alert = UIAlertController(title: "Zapata para Flash", message: "Estructura que permite conectar físicamente una unidad externa de flash.", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: {(alertAction)in
            //
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        zapata = true
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func selectorModo(sender: UIButton) {
        let alert = UIAlertController(title: "Selector de Modo", message: "Ruleta en la que se selecciona el modo de operación de la cámara.", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: {(alertAction)in
            //
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        selector = true
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func disparador(sender: UIButton) {
        let alert = UIAlertController(title: "Disparador", message: "Al ejecutar este botón se obtiene la imagen capturada.", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: {(alertAction)in
            //
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        disparo = true
        self.presentViewController(alert, animated: true, completion: nil)
    }
    

    @IBAction func cancelPressed(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Abandonar lección", message: "¿Estás seguro de que deseas salir?", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "Sí", style: .Default, handler: {(alertAction)in
            //Si decide salir de la lección
            self.performSegueWithIdentifier("gotoMain", sender: self)
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: {(alertAction)in
            //Si decide quedarse en la lección
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func readyButtonPressed(sender: UIButton) {
        let alert = UIAlertController(title: "Atención", message: "Debes presionar todos los componentes disponibles.", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "Aceptar", style: .Default, handler: {(alertAction)in
            //
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        if !(anillo && enganche && zapata && selector && disparo)
        {
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            self.performSegueWithIdentifier("gotoTest", sender: self)
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
