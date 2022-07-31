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
    
    func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    @IBOutlet var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        
        let thumbImageNormal = UIImage(named: "target_40")!
        slider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = UIImage(
          named: "target_highlighted_40")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        // no images for slider tracker ---> commented
        
//        let insets = UIEdgeInsets(
//          top: 0,
//          left: 14,
//          bottom: 0,
//          right: 14)


//        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
//        let trackLeftResizable = trackLeftImage.resizableImage(
//          withCapInsets: insets)
//        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
//
//        let trackRightImage = UIImage(named: "SliderTrackRight")!
//        let trackRightResizable = trackRightImage.resizableImage(
//          withCapInsets: insets)
//        slider.setMaximumTrackImage(trackRightResizable, for: .normal)

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func startAgainButton(_ sender: UIButton) {
        startNewGame()
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        
        let points : Int
        
        if difference > 10 {
            points = 0
        } else if difference != 0 {
            points = 100 - Int(pow(Double(difference), 2))
        } else {
            points = 200
        }
        
        score += points
     
        // add these lines
          let title: String
          if difference == 0 {
            title = "Perfect! +100 pts!"
          } else if difference < 5 {
            title = "You almost had it!"
          } else if difference < 10 {
            title = "Pretty good!"
          } else {
            title = "Not even close..."
          }
        
        let message = "\(targetValue) => \(currentValue)! You scored \(points) points"

            // let message = "The value of the slider is: \(currentValue)" +
            //          "\nThe target value is: \(targetValue)" +
            //          "\nThe difference is: \(difference)"

          let alert = UIAlertController(
            title: title,
            message: message,    // changed
            preferredStyle: .alert)

          let action = UIAlertAction(
            title: "OK",          // changed
            style: .default,
            handler: { _ in
                  self.startNewRound()
                })

          alert.addAction(action)

          present(alert, animated: true, completion: nil)
        
    }

    
    @IBAction func sliderMoved(_ slider: UISlider) {
        //print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    
}

