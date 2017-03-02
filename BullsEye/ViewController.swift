//
//  ViewController.swift
//  BullsEye
//
//  Created by Justin Uzoije on 2/24/17.
//  Copyright © 2017 Justin Uzoije. All rights reserved.
//

import UIKit

//There are IBOutlets for all the labels in the game
//Variables are initialized to zero
class ViewController: UIViewController {
    var currentValue = 0  //This is the slider's position
    var targetValue = 0   //This is the location the player has to move the slider to as close as possible
    var score = 0         //This is the player's score
    var round = 0         //This is the round number
    @IBOutlet weak var slider: UISlider!        //This is the IBOutlet for the slider
    @IBOutlet weak var targetLabel: UILabel!    //This is the IBOutlet for the label showing the number on the slider they have to reach
    @IBOutlet weak var scoreLabel: UILabel!     //This is the IBOutlet for the label showing the player their score
    @IBOutlet weak var roundLabel: UILabel!     //This is the IBOutlet for the label shwoing what round it is


    //This happens everytime the app starts
    //A new game
    //All the values of the labels are updated
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
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
        round += 1
    }
    
    //This function changes all the labels in the game
    //It changes the targetLabel's text to a be a string of the targetValue
    //It changes the scoreLabel's text to be a string of the score's value
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    
    //This function resets the score and round to 0 and then updates these values on the screen
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    
    
    //This function is connected to the interface itself
    //This function controls what the user sees when they click hit me
    //It takes the absolute value of the difference between the value to guess and where the slider is
    //The closer the slider is to the value to guess, the closer the points awarded are to 100
    //This is the number of points the user gets
    //Then it adds the points to the score
    //Then it makes the message You scored x number of points
    //Then it makes the alert's title change depending on how well the player did
    //Then it makes the action to be showing OK and then closing
    //Then it attaches that alert
    //Then it presents the alert
    //Then it starts a new around and changes all the labels
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You scored \(points) points"
    
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: { action in
                                                self.startNewRound()
                                                self.updateLabels()
                                            })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //This function is connected to the Start Over button
    //It causes a new game to start, and then updates all the labels on the screen to show the new data
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    
    
    
    
    
    @IBAction func doTaxes() {
    
    }
    
    //This function takes in the slider's position, changes it to an int and sets it to current Value
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    


}

