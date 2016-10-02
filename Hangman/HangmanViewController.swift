//
//  HangmanViewController.swift
//  Hangman
//
//  Created by Lucy Fox on 10/2/16.
//  Copyright © 2016 Lucy Fox. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    @IBOutlet weak var userGuess: UITextField!
    @IBOutlet weak var guessesLeftNum: UILabel!
    @IBOutlet weak var word: UILabel!
    
    let words = ["autumn", "leaves", "cider", "pumpkin", "halloween", "candy", "football", "haunted", "chilly", "colorful"]
    var currentIndex = Int(arc4random_uniform(UInt32(10)))
    
    var guesses = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        renderWord(currentWord: words[currentIndex])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func renderWord(currentWord: String){
        var result = ""
        for character in currentWord.characters {
            if guesses.contains(String(character)){
                result = result + String(character)
            }else {
                result = result + " _ "
            }
        }
        word.text = result
    }

    @IBAction func textFieldChanged(_ sender: UITextField) {
        if let guess = userGuess.text?.lowercased() {
            guesses.append(guess)
            //something in here to subtract from guesses
            renderWord(currentWord: words[currentIndex])
        }
        userGuess.text = ""
    }
    
}
