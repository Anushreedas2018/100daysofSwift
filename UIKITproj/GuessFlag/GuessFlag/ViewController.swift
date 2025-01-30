//
//  ViewController.swift
//  GuessFlag
//
//  Created by Anushree Das on 09/12/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    var countries = [String] ()
    var correctAnswer = 0
    var score = 0
    var quesNo = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScore))
        countries += ["estonia","france", "germany","ireland", "italy", "poland","russia","spain","uk","us"]
        Button1.layer.borderWidth = 1
        Button2.layer.borderWidth = 1
        Button3.layer.borderWidth = 1
        
        Button1.layer.borderColor = UIColor.lightGray.cgColor
        Button2.layer.borderColor = UIColor.lightGray.cgColor
        Button3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        askQuestion()
    }
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        Button1.setImage(UIImage(named: countries[0]), for: .normal)
        Button2.setImage(UIImage(named: countries[1]), for: .normal)
        Button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        
        let country = countries[correctAnswer].uppercased()
        title = "\(quesNo). Guess the flag of \(country)"
        quesNo += 1
//        title = """
//        Score: \(score) Question no: \(quesNo)
// Guess the flag of \(country)
//"""
        
    }
    func startNewGame(action: UIAlertAction) {
        score = 0
        quesNo = 1
        askQuestion()
        
    }
    @objc func showScore() {
        let scoreAlert = UIAlertController(title: "Your current score is \(score)!", message: nil, preferredStyle: .actionSheet)
        scoreAlert.addAction(UIAlertAction(title:"Continue" , style: .default, handler: nil))
          
          present(scoreAlert, animated: true)
      }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        if quesNo <= 10 {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            let finalAC = UIAlertController(title: "Game Over!", message: "Your final score is \(score)", preferredStyle: .alert)
            finalAC.addAction(UIAlertAction(title: "Start new game", style: .default, handler: startNewGame))
            present(finalAC, animated: true)
        }
    }
    

    
}

