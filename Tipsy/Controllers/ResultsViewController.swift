//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by  Maksim Stogniy on 05.03.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var amount: String?
    var people: Int?
    var tip: Double?
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = amount
        var tipString = "with \(Int(tip! * 100))% tip."
        if tip == 0.0 {
            tipString = "without any tip."
        }
        settingsLabel.text = "Split between \(people!) people, \(tipString)"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
