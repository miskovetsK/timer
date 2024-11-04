//
//  ViewController.swift
//  timer
//
//  Created by Yekaterina Proskuryakova on 04.11.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondVC" {
            if let vc = segue.destination as? SecondViewController {
                vc.startDate = startDatePicker.date
                vc.endDate = endDatePicker.date
            }
        }
    }
}

