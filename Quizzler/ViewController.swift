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
    }
    

    func nextQuestion() {
        if questionIndex < (allQuestions.list.count - 1) {
            questionIndex += 1
            updateUI()
        } else {
            startOver()
        }
    }
    
    
    func checkAnswer() {
        let currentQuestionAnswer = allQuestions.list[questionIndex].answer
        if currentQuestionAnswer == pickedAnswer {
            print("Correct")
        } else {
            print("Incorrect")
        }
        nextQuestion()
        
    }
    
    
    func startOver() {
       questionIndex = 0
        updateUI()
    }
    

    
}
