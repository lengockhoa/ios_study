//
//  ViewController.swift
//  Chapter8
//
//  Created by Le NK on 4/17/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    
    // Create the Model Layer
    let questions:[String] = [
        "What is 7+7",
        "What is the capital of Vermont",
        "What is cognac made from",
        ]
    
    let answers:[String] = [
        "14",
        "Montpelier",
        "Grape",
        ]
    
    var currentQuestionIndex:Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentQuestionLabel.text  = questions[currentQuestionIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0
    }

    func animateLabelTransitions(){
        UIView.animate(withDuration: 0.5, animations: {
            self.nextQuestionLabel.alpha = 1
        })
    }
    
    
    @IBAction func showNextQuestion(_ Sender: UIButton){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(_ Sender: UIButton){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }


}

