//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Sam WU on 2021-05-12.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var celsiusLabel: UILabel!
    
    
    @IBOutlet weak var fahrenheitLabel: UILabel!
    
    var currentCelsiusTempearture : Double = 0
    var currentFahrenheitTempature : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentFahrenheitTempature = toFahrenheit(celsius: currentCelsiusTempearture)
//        currentFahrenheitTempature = toFahrenheit(currentCelsiusTempearture)
        updateTemperatureLabels()
    }

    @IBAction func temperatureChanged(_ sender: UIStepper) {
        currentCelsiusTempearture = sender.value
        currentFahrenheitTempature = toFahrenheit(celsius: currentCelsiusTempearture)
        updateTemperatureLabels()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        currentCelsiusTempearture = Double(sender.value)
        currentFahrenheitTempature = toFahrenheit(celsius: currentCelsiusTempearture)
        updateTemperatureLabels()
    }
    
    func toCelsius(fahrenheit : Double) -> Double {
        return (fahrenheit - 32) * (5/9)
    }
    
    func toFahrenheit(celsius : Double) -> Double {
        return celsius * (9/5) + 32
    }
    
    func updateTemperatureLabels() {
        celsiusLabel.text = "\(currentCelsiusTempearture) ℃"
        fahrenheitLabel.text = "\(currentFahrenheitTempature) ℉"
    }
    
}

