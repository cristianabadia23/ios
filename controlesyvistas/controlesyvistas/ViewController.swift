//
//  ViewController.swift
//  controlesyvistas
//
//  Created by user207074 on 9/29/21.
//

import UIKit

class ViewController: UIViewController {
    // Outlets
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var picketviuw: UIPickerView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var segmen: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var myswitch: UISwitch!
    
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    //Variables
    private let picketValues = ["batman","superman","spider-man","wolverine","iron man"]
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Ha seleccionado " + picketValues[pageControl.currentPage]
        boton.setTitle("Pulsame", for:.normal)
        boton.backgroundColor = .black
        boton.setTitleColor(.white, for: .normal)
        picketviuw.dataSource = self
        picketviuw.delegate = self
        pageControl.numberOfPages = picketValues.count
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .gray
        segmen.removeAllSegments()
        for(index,value) in picketValues.enumerated(){
            segmen.insertSegment(withTitle: value, at: index, animated: true)
        }
        slider.minimumValue = 1
        slider.value = 1
        slider.maximumValue = Float(picketValues.count)
        stepper.minimumValue = 1
        stepper.maximumValue = Double(picketValues.count)
        progress.progress = 0.0
        indicator.startAnimating()
    }

    //actions
    
    @IBAction func botonPulsar(_ sender: Any) {
        if boton.backgroundColor == .black{
            boton.backgroundColor = .white
            boton.setTitleColor(.black, for: .normal)
        }
        else{
            boton.backgroundColor = .black
            boton.setTitleColor(.white, for:.normal)
        }
    }
    @IBAction func pageControlPulsar(_ sender: Any) {
        picketviuw.selectRow(
            pageControl.currentPage,
            inComponent: 0,
            animated:true
            )
        label.text = "Ha seleccionado " + picketValues[pageControl.currentPage]
    }
    @IBAction func segmenPulsar(_ sender: Any) {
        picketviuw.selectRow(segmen.selectedSegmentIndex, inComponent: 0, animated: true)
        label.text = "Ha seleccionado " + picketValues[segmen.selectedSegmentIndex]
        pageControl.currentPage = segmen.selectedSegmentIndex
    }
    @IBAction func sliderPulsar(_ sender: Any) {
        var progreso:Float = 0
        var value = 0
        switch slider.value{
            case 1..<2:
                value = 0
            progreso = 0.2
            case 2..<3:
                value = 1
                progreso = 0.4
            case 3..<4:
                value = 2
                progreso = 0.6
            case 4..<5:
                value = 3
                progreso = 0.8
            default:
                value = 4
            progreso = 1.0
        }
        progress.progress = Float(progreso)
        label.text = "Ha seleccionado " + picketValues[value]
        pageControl.currentPage = value
        segmen.selectedSegmentIndex = value
        picketviuw.selectRow(value, inComponent: 0, animated: true)
    }
    
    @IBAction func stepperAction(_ sender: Any) {
        let value = stepper.value
        slider.value = Float(value)
        print("pulsado")
    }
    @IBAction func stepperPulsado(_ sender: Any) {
        let value = stepper.value
        slider.value = Float(value)
        print("pulsado")
    }
    @IBAction func switchAction(_ sender: Any) {
        if myswitch.isOn{
            picketviuw.isHidden = false
            indicator.startAnimating()
        }
        else{
            picketviuw.isHidden = true
            indicator.stopAnimating()
        }
    }
}

extension ViewController:UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picketValues.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picketValues[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = "Ha seleccionado " + picketValues[row]
        pageControl.currentPage = row
    }
    
}

