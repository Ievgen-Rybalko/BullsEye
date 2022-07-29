//
//  ViewController.swift
//  BullsEye
//
//  Created by Ievgen Rybalko on 28.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var targetValue = 0

    var currentValue = 0
    
    var score = 0
    
    var round = 0
    
    func startNewRound() {
        round += 1
      targetValue = Int.random(in: 1...100)
        currentValue = lroundf(slider.value)  // = 50
      slider.value = Float(currentValue)
        updateLabels()  // Add this line
    }
    
    func updateLabels() {
      targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
    
    @IBOutlet var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        
        let points : Int
        
        if difference > 10 {
            points = 0
        } else {
            points = 100 - Int(pow(Double(difference), 2))
        }
        
        score += points
        
        let message = "\(currentValue)! You scored \(points) points"

            // let message = "The value of the slider is: \(currentValue)" +
            //          "\nThe target value is: \(targetValue)" +
            //          "\nThe difference is: \(difference)"

          let alert = UIAlertController(
            title: "Hello, World",
            message: message,    // changed
            preferredStyle: .alert)

          let action = UIAlertAction(
            title: "OK",          // changed
            style: .default,
            handler: nil)

          alert.addAction(action)

          present(alert, animated: true, completion: nil)
        
        startNewRound()
    }

    
    @IBAction func sliderMoved(_ slider: UISlider) {
        //print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    
}

