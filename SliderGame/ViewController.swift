//
//  ViewController.swift
//  SliderGame
//
//  Created by Y K on 04.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
//    var sliderValue: Int = 0
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    var targetValue = 0
    var score = 0
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    @IBAction  func restart() {
    score = 0
    round = 1
    newRound()
    }
    
    func newRound() {
        targetValue = Int.random(in: 1...100)
        targetLabel.text = "\(targetValue)"
        roundLabel.text = "\(round)"
        scoreLabel.text = "\(score)"
    }
    
    @IBAction  func showAlert() {
        
        let currentValue = lroundf(slider.value)
        var difference = abs(currentValue - targetValue)
        let currentScore1 = 100 - difference
        
//        if currentValue > targetValue {
//            difference = currentValue - targetValue
//        } else if currentValue < targetValue {
//            difference = targetValue - currentValue
//        } else {
//            difference = 0
//        }
        
        let message = "Slider value: \(currentValue)\nDifference: \(difference)"
        
        let alertWindow = UIAlertController(title: "Target: \(targetValue)", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default)
        
        alertWindow.addAction(action)
        present(alertWindow, animated: true)
        
        score += currentScore1
        round += 1
        newRound()
    }
//    @IBAction  func sliderValueChanged(_ slider: UISlider) {
//        sliderValue = lroundf(slider.value)
//    }
}

