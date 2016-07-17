//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    var dictionarySteveBillFacts: [String: [String]] = [:]
    var currentPerson: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }

    
    @IBAction func steveButtonTapped(sender: AnyObject) {
        if self.currentPerson == "Steve Jobs" {
            if let scoreString = self.scoreLabel.text {
                if var scoreInt = Int(scoreString) {
                    scoreInt += 1
                    self.scoreLabel.text = String(scoreInt)
                    
                }
            }
        }
        showFact()
    }
    
    @IBAction func billButtonTapped(sender: AnyObject) {
        if self.currentPerson == "Bill Gates" {
            if let scoreString = self.scoreLabel.text {
                if var scoreInt = Int(scoreString) {
                    scoreInt += 1
                    self.scoreLabel.text = String(scoreInt)
                   
                }
            }
        }
        showFact()
    }
    
    func createFacts() {
        self.dictionarySteveBillFacts = [
            "Steve Jobs" : [
                "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font",
                "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
                "He was a pescetarian, meaning he ate no meat except for fish."
            ],
            "Bill Gates" : [
                "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                "He scored 1590 (out of 1600) on his SATs.",
                "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
            ]
        ]
    }
    
    func showFact() {
        let randomFact = getRandomFact()
        print(randomFact)
        if let randomFact = randomFact {
            self.currentPerson = randomFact.0
            self.factLabel.text = randomFact.1
        }
    }
    
    func getRandomFact() -> (String, String)? {
        let person = self.randomPerson()
        if let facts = self.dictionarySteveBillFacts[person] {
            let number = self.randomNumberFromZeroTo(facts.count)
            return (person, facts[number])
        }
        return nil
    }
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
}
