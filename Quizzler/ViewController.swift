//
//  ViewController.swift
//  Quizzler
//
//  Created by Abuzar Manzoor on 25/08/2017.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionNumber: Int = 0
    var score : Int = 0
    
    
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        }else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber += 1
        nextQuestion()
        
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score:  \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        if questionNumber <= 12 {
        questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else{
            score = 0
            let alert = UIAlertController(title: "Awesome", message: "You have finished all the questions, Do you want to restart?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in self.startOver()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
         
        }
    }
    
    
    func checkAnswer() {
       
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
            score += 1
            ProgressHUD.showSuccess("correct")
            
        }else {
            ProgressHUD.showError("Wrong")
        }
    }
    
    func startOver() {
           questionNumber = 0
        nextQuestion()
    }
    

    
}
