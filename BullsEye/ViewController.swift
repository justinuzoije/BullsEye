//
//  ViewController.swift
//  BullsEye
//
//  Created by Justin Uzoije on 2/24/17.
//  Copyright © 2017 Justin Uzoije. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    //This happens everytime the app starts
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Every time you start a new round, it picks a random number between 0 and 99, then adds 1 
    //It picks a number between 1 and 100 and calls it targetValue
    //It makes the slider start in the middle, which is currentValue and is 50
    //It converts the currentValue, the slider's position, into a Float 
    //It hands the Float version of the slider's position to slider.value
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    //This function changes all the labels in the game
    //It changes the target Label to be a string version of the target value (the number to guess this round)
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    
    
    //This function is connected to the interface itself
    //This function controls what the user sees when they click hit me
    //It takes the absolute value of the difference between the value to guess and where the slider is
    //The closer the slider is to the value to guess, the closer the points awarded are to 100
    //This is the number of points the user gets
    //Then it adds the points to the score
    //Then it makes the message You scored x number of points
    //Then it makes the alert to be Hello World, and displays the message
    //Then it makes the action to be showing OK and then closing
    //Then it attaches that alert
    //Then it presents the alert
    //Then it starts a new around and changes all the labels
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        startNewRound()
        updateLabels()
        
    }
    
    @IBAction func doTaxes() {
    
    }
    
    //This function takes in the slider's position, changes it to an int and sets it to current Value
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    


}

