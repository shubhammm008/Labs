//
//  ViewController.swift
//  ApplePie
//
//  Created by Shubham Singh on 22/07/25.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords=["buccaneer","swift","glorious","incadescent","bug","program"]
    let incorrectMovesAllowed=7
    var totalWins=0{
        didSet{
            newRound()
        }
    }
    var totalLosses=0{
        didSet{
            newRound()
        }
    }
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
   
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled=false
        let letterString=sender.configuration!.title!
        let letter=Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    func updateGameState(){
        if currentGame.incorrectMovesRemaining==0{
            totalLosses+=1
        }
        else if currentGame.word==currentGame.formattedWord{
            totalWins+=1
        }
        else{
            updateUI()
        }
    }
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
  
    var currentGame:Game!
    func updateUI(){
        var letters=[String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        let wordWithSpacing=letters.joined(separator: " ")
        correctWordLabel.text=wordWithSpacing
        scoreLabel.text="Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image=UIImage(named:"Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord=listOfWords.removeFirst()
            currentGame=Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }
        else
        {
            enableLetterButtons(false)
        }
    }
    func enableLetterButtons(_ enable:Bool){
        for button in letterButtons{
            button.isEnabled=enable
        }
    }
}

