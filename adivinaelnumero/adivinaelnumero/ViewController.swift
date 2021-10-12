//
//  ViewController.swift
//  adivinaelnumero
//
//  Created by user207074 on 10/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var entrada: UITextField!
    @IBOutlet weak var resultado: UILabel!
    @IBOutlet weak var comprobar: UIButton!
    @IBOutlet weak var resetear: UIButton!
    @IBOutlet weak var indicador: UILabel!
    var contador = 0
    var aleatorio = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entrada.placeholder = "Introduce un numero"
        entrada.delegate = self
        resultado.text = " "
        indicador.text = " "
        comprobar.setTitle("Comprobar", for: .normal)
        comprobar.backgroundColor = .green
        comprobar.setTitleColor(.white, for: .normal)
        resetear.setTitle("Resetear", for: .normal)
        resetear.backgroundColor = .blue
        resetear.setTitleColor(.white, for: .normal)
        aleatorio = Int.random(in: 0..<100)
    }
    
    @IBAction func comprobar(_ sender: Any) {
        let num:Int? = Int(entrada.text!)
        contador += 1
        resultado.text = String(contador)
        print(aleatorio)
        if num == aleatorio{
            entrada.text = ""
            indicador.text = "Correcto"
            contador = 0
            aleatorio = Int.random(in: 0..<100)
            resultado.text = "Has ganado"
        }
        else if num! > aleatorio{
            indicador.text = "Demasiado grande"
        }
        else{
            indicador.text = "Muy pequeño"
        }
    }
    
    @IBAction func resetear(_ sender: Any) {
        contador = 0
        aleatorio = Int.random(in: 0..<100)
        indicador.text = "Nuevo numero generado"
        resultado.text = "Nuevo numero generado"
    }
}

extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        entrada.resignFirstResponder()
    }
}
