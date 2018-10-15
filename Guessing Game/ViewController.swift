//
//  ViewController.swift
//  Guessing Game
//
//  Created by Carter West on 10/8/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    

    //Mark: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        restart() //Call this function to initialize all important variables based on the difficulty chosen
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
       }
    
   
    //Mark IBOutlets
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessRemainingLabel: UILabel!
    @IBOutlet weak var feedBackLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!
    
   
    
    
    
    
    //Mark: Functions
    
func setupUIForRestart() {
        guessTextField.isEnabled = false
        guessButton.isHidden = true
        playAgainButton.isHidden = false
    }
    
    //This function will load at the start of the application and when you press the play again button.
    
    func restart() {
        // new random number
        randomNumber = Int.random(in: minimumNumber...maximumNumber) //Sets up a new random number everytime the function is called
        // reset guesses remaining
        guessesRemaining = numberOfGuesses
        guessRemainingLabel.text = "\(guessesRemaining) Guesses Remaining"
        // clear text field
        guessTextField.text = ""
        // show text field
        guessTextField.isEnabled = true
        // hide play again button
        playAgainButton.isHidden = true
        // show guess button
        guessButton.isHidden = false
        // reset feedback label
        feedBackLabel.text = "You guessed..."
        instructionLabel.text = "Please enter a number between \(minimumNumber) and \(maximumNumber)"
        }

    
    //Mark: IBActions
    
    @IBAction func guessButton(_ sender: Any) { //This function contains everything that will happen once the guess button is pressed
        
       let userInput = guessTextField.text!
        
        guard let guess = Int(userInput) else {
        feedBackLabel.text = "You didnt give me a number big chief 😹"
            return
        
        }
        
        guard guess >= 1 && guess <= maximumNumber else { //input validaation for guess range, with 1 as a default minimum number.
            feedBackLabel.text = "Please enter a number \(minimumNumber)-\(maximumNumber) chief 😺"
            return
        }
        
        if guess == randomNumber { //These if else statements decide what happens if the guess the user entered is equal to, less than, or greater than the randomly generated number. 
            feedBackLabel.text = "You win 😄"
            setupUIForRestart()
            } else if guess < randomNumber {
                feedBackLabel.text = "You guessed \(guessTextField.text!). Guess higher 👆"
                guessesRemaining -= 1
                guessTextField.text = ""
            
            } else {
                feedBackLabel.text = "You guessed \(guessTextField.text!). Guess lower 👇"
                guessesRemaining -= 1
                guessTextField.text = ""
            }
        
        if guessesRemaining == 0 { //Once the user runs out of guesses, they lose and the game will be setup for restart.
            feedBackLabel.text = "You lose chief 😭. The correct number was \(randomNumber)."
            setupUIForRestart()
           
            }
        
        guessRemainingLabel.text = "\(String(guessesRemaining)) Guesses Remaining."
       }
    
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        restart()
    }
    
    
    @IBAction func clearTextButton(_ sender: Any) {
        guessTextField.text = ""
    }
    
    //Mark: Properties
    var minimumNumber = 1
    var maximumNumber = 100
    var randomNumber = 0
    var guessesRemaining = 5
    var numberOfGuesses = 5
    
    
    
    
    
    
    
}


