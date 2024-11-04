//
//  SecondViewController.swift
//  timer
//
//  Created by Yekaterina Proskuryakova on 04.11.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    var startDate: Date?
    var endDate: Date?
    var timer: Timer?
    var currentDisplayDate: Date?
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy, EEE HH:mm"
        
        if let startDate = startDate, let endDate = endDate {
            label.text = dateFormatter.string(from: startDate)
            startDateLabel.text = dateFormatter.string(from: startDate)
            endDateLabel.text = dateFormatter.string(from: endDate)
        }
    }
    
    @IBAction func startTimer(_ sender: Any) {
        guard !isTimerRunning, let startDate = startDate, let endDate = endDate else { return }
        
        isTimerRunning = true
        currentDisplayDate = startDate
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self, let currentDisplayDate = self.currentDisplayDate else { return }
            
            if currentDisplayDate >= endDate {
                self.stopTimer()
                return
            }
            
            self.currentDisplayDate = currentDisplayDate.addingTimeInterval(3600)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy, EEE HH:mm"
            self.label.text = dateFormatter.string(from: self.currentDisplayDate!)
        }
    }
    
    @IBAction func restartTimer(_ sender: Any) {
        stopTimer()
        if let startDate = startDate {
            currentDisplayDate = startDate
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy, EEE HH:mm"
            label.text = dateFormatter.string(from: startDate)
        }
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        stopTimer()
    }
    
    private func stopTimer() {
        isTimerRunning = false
        timer?.invalidate()
        timer = nil
    }
}
