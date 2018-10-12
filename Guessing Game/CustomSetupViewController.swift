//
//  customSetupViewController.swift
//  Guessing Game
//
//  Created by Carter West on 10/11/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import UIKit

class CustomSetupViewController: UIViewController {
    
    
    
    //Custom IBOutlets
    @IBOutlet weak var customMaximumNumber: UITextField!
    @IBOutlet weak var customNumberOfGuesses: UITextField!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let guessingGameViewController = segue.destination as? ViewController else { return }
        
        switch segue.identifier {
        case "CustomSetupToGuessingGame":
            guessingGameViewController.numberOfGuesses = Int(customNumberOfGuesses.text!)!
            guessingGameViewController.maximumNumber = Int(customMaximumNumber.text!)!
        default:
            break
        }
    }
}
