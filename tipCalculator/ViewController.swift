//
//  ViewController.swift
//  tipCalculator
//
//  Created by Tibrewala, Preeti on 3/12/17.
//  Copyright © 2017 Tibrewala, Preeti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var noOfGuests: UITextField!
    @IBOutlet weak var amountPerGuest: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool)     {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let percentageIndex = defaults.integer(forKey: "selectedPercent")
        tipControl.selectedSegmentIndex = percentageIndex
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String(format: "$%0.2f", total)
        let noGuests = Double(noOfGuests.text!) ?? 1
        let amountPerPerson = (total/noGuests)
        amountPerGuest.text = String(format: "$%0.2f", amountPerPerson)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func caluculateTip2(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String(format: "$%0.2f", total)
        let noGuests = Double(noOfGuests.text!) ?? 1
        let amountPerPerson = (total/noGuests)
        amountPerGuest.text = String(format: "$%0.2f", amountPerPerson)
    }
    
    @IBAction func recalculateTip(_ sender: Any) {
        caluculateTip2(true)
    }
}

