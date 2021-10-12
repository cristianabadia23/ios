//
//  ViewController.swift
//  generarPrimo
//
//  Created by user207074 on 10/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var entrada: UITextField!
    @IBOutlet weak var resultado: UILabel!
    @IBOutlet weak var boton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        titulo.text = "Generador de numeros primos"
        entrada.placeholder = "Introduce un numero"
        entrada.delegate = self
        boton.setTitle("Generar", for: .normal)
        boton.backgroundColor = .black
        resultado.text = " "
        for family in UIFont.familyNames{
            print(family)
            for name in UIFont.fontNames(forFamilyName: family){
                print(name)
            }
        }
    }
    func generarNum(num:Int) -> Int{
        var cont1 = 0, cont2 = 2,resultado = 0
        while cont1 != num{
            if isPrime(num: cont2){
                cont1 += 1
                resultado = cont2
            }
            cont2+=1
        }
        return resultado
    }
    
    func isPrime(num:Int) -> Bool{
        var cont = 0
        for i in 2..<num {
            if num%i == 0{
                cont+=1
            }
        }
        if cont == 0{
            return true
        }
        return false
    }
    
    @IBAction func generarPrimo(_ sender: Any) {
        let num:Int? = Int(entrada.text!)
        if num! > 0{
            resultado.text = String(generarNum(num: num!))
        }
        else{
            resultado.text = "Numero no valido"
        }
    }
}
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        entrada.resignFirstResponder()
    }
}
