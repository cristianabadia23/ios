//
//  ViewController.swift
//  primeraapp
//
//  Created by user207074 on 9/29/21.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var boton2: UIButton!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0"
    }
    @IBAction func pulsado(_ sender: Any) {
        counter+=1
        label.text = String(counter)
    }
    @IBAction func restar(_ sender: Any) {
        counter-=1
        label.text = String(counter)
    }
}
