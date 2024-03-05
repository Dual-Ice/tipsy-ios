//
//  ViewController.swift
//  Tipsy
//
//  Update by Maksim Stogniy on 05.03.2024.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var pct: Double = 0.1
    var numberOfPeople: Int = 2
    var amountString = ""
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        billTextField.endEditing(true)
    }
    
    func deselectAllButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        deselectAllButtons()
        sender.isSelected = true
        let title  = sender.currentTitle?.dropLast() ?? "0"
        pct = Double(title)! / 100
        billTextField.endEditing(true)
    }
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill == "" {
            return
        }
        
        let result = Double(bill)! * (1 + pct) / Double(numberOfPeople)
        amountString = String(format: "%.2f", result)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.people = numberOfPeople
            destinationVC.amount = amountString
            destinationVC.tip = pct
        }
    }
    
}

