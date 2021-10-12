//
//  ViewController.swift
//  cronometro
//
//  Created by user207074 on 10/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iniciar: UIButton!
    @IBOutlet weak var parar: UIButton!
    @IBOutlet weak var marcador: UILabel!
    
    var timer = Timer()
    var count:Int = 0
    var timecounting:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        marcador.text = makeTimeString(horas: 0, min: 0, segundos: 0)
        iniciar.backgroundColor = .green
        iniciar.setTitle("Iniciar", for: .normal)
        iniciar.setTitleColor(.white, for: .normal)
        parar.backgroundColor = .blue
        parar.setTitle("Reset", for: .normal)
        parar.setTitleColor(.white, for: .normal)
    }

    @IBAction func iniciarCronometro(_ sender: Any) {
        if timecounting{
            timecounting = false
            timer.invalidate()
            iniciar.setTitle("Iniciar", for: .normal)
        }
        else{
            timecounting = true
            iniciar.setTitle("Parar", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounter), userInfo: nil, repeats: true)
        }
    }
    @objc func timeCounter(){
        count += 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timestring = makeTimeString(horas: time.0, min: time.1, segundos: time.2)
    
        marcador.text = timestring
    }
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int,Int,Int){
        return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
    }
    func makeTimeString(horas: Int, min: Int, segundos: Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", horas)
        timeString += " : "
        timeString += String(format: "%02d", min)
        timeString += " : "
        timeString += String(format: "%02d", segundos)
        return timeString
    }
    @IBAction func pararCronometro(_ sender: Any) {
        let alert = UIAlertController(title: "¿Quiere reiniciar?", message: "¿Esta seguro de reiniciar?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel,
                                    handler: {(_) in
            
        }))
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default,
                                    handler: {(_) in
            self.count = 0
            self.timer.invalidate()
            self.marcador.text = self.makeTimeString(horas: 0, min: 0, segundos: 0)
            self.iniciar.setTitle("Iniciar", for: .normal)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

