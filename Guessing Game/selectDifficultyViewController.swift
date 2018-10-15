//
//  selectDifficultyViewController.swift
//  Guessing Game
//
//  Created by Carter West on 10/10/18.
//  Copyright © 2018 Carter West. All rights reserved.
//

import UIKit

class SelectDifficultyViewController: UIViewController {
    
    //function that will get the segue ready to perform by setting variables so that the guessing game will function according to difficulty
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //guard let that states guessingGameViewController as the segue for the select difficulty storyboard view. 
        guard let guessingGameViewController = segue.destination as? ViewController else { return }
        
        switch segue.identifier {
        case "EasyToGuessingGame":
            // max 50
            guessingGameViewController.maximumNumber = 50
            
        case "MediumToGuessingGame":
            // max 100
            guessingGameViewController.maximumNumber = 100
            break
        case "HardToGuessingGame":
            // max 500
            guessingGameViewController.maximumNumber = 500
        default:
            break
        }
    }
    
    
}
