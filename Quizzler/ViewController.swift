//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionIndex : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
    
    func updateUI() {
        questionLabel.text = allQuestions.list[questionIndex].questionText
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionIndex + 1)/\(allQuestions.list.count)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count))*CGFloat(questionIndex + 1)
    }
    

    func nextQuestion() {
        if questionIndex < (allQuestions.list.count - 1) {
            questionIndex += 1
            updateUI()
        } else {
            createAlert()
        }
    }
    
    
    func checkAnswer() {
        let currentQuestionAnswer = allQuestions.list[questionIndex].answer
        if currentQuestionAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct!")
            score += 1
        } else {
            ProgressHUD.showError("Wrong!")
        }
        nextQuestion()
        
    }
    
    
    func startOver() {
        questionIndex = 0
        score = 0
        updateUI()
    }
    
    func createAlert(){
        let alert = UIAlertController(title: "Awesome!", message: "Your score was \(score)! Care to try again?", preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Start over", style: UIAlertActionStyle.default, handler: {
            (UIAlertAction) in
            self.startOver()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (UIAlertAction) in
            alert.dismiss(animated: true, completion: nil)
            })
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    

    
}
