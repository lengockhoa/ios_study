//
//  ViewController.swift
//  DuoiHinhBatChu
//
//  Created by Le NK on 4/14/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerContainer: UIView!
    @IBOutlet weak var hintContainer: UIView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var imageQuestion: UIImageView!
    
    var answers:[String] = ["BAOCAO",
                            "HOGA",
                            "HACLAO",
                            "EPCUNG",
                            "THANGTHUNG",
                            "CAOHOC",
                            "OTO",
                            "BATLOI",
                            "CACAO",
                            "LONGDATHU",
                            "TOITAM",
                            "THIENTAI",
                            "PHUCHAU",
                            "BANKINH",
                            "BAODONG",
                            "BAOHAM",
                            "BAOLA",
                            "BATCOC",
                            "BOLAO",
                            "CAITO",
                            "CANNHAC",
                            "CAOBIET",
                            "CHINCHAN",
                            "DACUOI",
                            "DAOLON",
                            "DAONGU",
                            "DATA",
                            "DOCNHATVONHI",
                            "GAUQUAN",
                            "HOCLECH",
                            "HUTCHANKHONG",
                            "LACA",
                            "LANCAN",
                            "LANGBEN",
                            "NHONHO",
                            "OTRONG",
                            "QUAIBI",
                            "TAOBAO",
                            "TAOBON",
                            "TATYEU",
                            "THICHY",
                            "THOIHAN",
                            "TIEUCHAY",
                            "TRANHCODONG",
                            "VATTU",
                            "VUAPHALUOI",
                            ]
    
    override func loadView() {
        super.loadView()
        self.getNewQuestion()
    }
    
    var ranNum = 0
    var index = 0
    var score = 0
    
    @IBAction func getNewQuestion(){
        self.ranNum = Int(arc4random_uniform(UInt32(answers.count)))
        self.removeHintContainerView()
        self.removeAnswerContainerView()
        self.getNewBlankAnswer()
        self.showScore()
        
        imageQuestion.image = UIImage(named: answers[ranNum].lowercased() + ".png")
        imageQuestion.layer.borderWidth = 8.0
        imageQuestion.layer.borderColor = UIColor.green.cgColor
        
        let hint = mixWord(answers[self.ranNum])
        for (index,ch) in hint.characters.enumerated(){
            var button = UIButton()
            if hint.characters.count <= 7 {
                button = UIButton(frame: CGRect(x: (280-hint.characters.count*40)/2 + 40 * index, y: 20, width: 40, height: 40))
            }
            if hint.characters.count > 7 && hint.characters.count <= 14 {
                if index < 7 {
                    button = UIButton(frame: CGRect(x: 40 * index, y: 0, width: 40, height: 40))
                }
                if index >= 7 && index < 14  {
                    button = UIButton(frame: CGRect(x: (280-(hint.characters.count-7)*40)/2 + 40 * (index-7), y: 40, width: 40, height: 40))
                }
            }
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            button.setBackgroundImage(UIImage(named: "buttonHint"), for: .normal)
            button.setTitle("\(ch)", for: .normal)
            
            self.hintContainer.addSubview(button)
            button.addTarget(self, action: #selector(ViewController.showAnswer(_:)), for: .touchUpInside)
        }
    }
    
    
    @IBOutlet weak var answerTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var hintTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageQuestionWidth: NSLayoutConstraint!
    @IBOutlet weak var imageQuestionHeight: NSLayoutConstraint!
    @IBOutlet weak var answerContainerLeading: NSLayoutConstraint!
    @IBOutlet weak var answerContainerTop: NSLayoutConstraint!
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        let viewWidth = self.view.frame.size.height
        let viewHeight = self.view.frame.size.width
        
        if UIInterfaceOrientationIsLandscape(toInterfaceOrientation) {
            answerTopConstraint.constant = 2
            hintTopConstraint.constant = 2
            imageQuestionWidth.constant = (-viewWidth / 2.0)
            imageQuestionHeight.constant = viewHeight - (viewWidth / 2.0)
            answerContainerLeading.constant = viewWidth / 2.0
            answerContainerTop.constant = (-viewHeight + 200)
        } else { // else portrait
            answerTopConstraint.constant = 50
            hintTopConstraint.constant = 50
            imageQuestionWidth.constant = 0
            imageQuestionHeight.constant = 0
            answerContainerLeading.constant = (viewWidth - 280)/2.0
        }
    }
    
    func getNewBlankAnswer(){
        let ans = answers[self.ranNum]
        for (index,_) in ans.characters.enumerated(){
            var button = UIButton()
            if ans.characters.count <= 7 {
                button = UIButton(frame: CGRect(x: (280-ans.characters.count*40)/2 + 40 * index, y: 20, width: 40, height: 40))
            }
            if ans.characters.count > 7 && ans.characters.count <= 14 {
                if index < 7 {
                    button = UIButton(frame: CGRect(x: 40 * index, y: 0, width: 40, height: 40))
                }
                if index >= 7 && index < 14  {
                    button = UIButton(frame: CGRect(x: (280-(ans.characters.count-7)*40)/2 + 40 * (index-7), y: 40, width: 40, height: 40))
                }
            }
            button.tag = index
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            button.setBackgroundImage(UIImage(named: "buttonAns"), for: .normal)
            
            self.answerContainer.addSubview(button)
        }
    }
    
    func showScore(){
        self.scoreLabel.text = String(score)
    }
    func increaseScore(){
        score = score + 1
        self.showScore()
    }
    func decreaseScore(_ n: Int){
        score = score - n
        self.showScore()
    }
    
    func removeHintContainerView(){
        let subViews = self.hintContainer.subviews
        for subview in subViews{
            if (subview is UIButton) {
                subview.removeFromSuperview()
            }
        }
    }
    
    func removeAnswerContainerView(){
        let subViews = self.answerContainer.subviews
        for subview in subViews{
            if (subview is UIButton) {
                subview.removeFromSuperview()
            }
        }
        index = 0
    }
    
    @IBAction func showNextLetter(){
        let answer = Array(answers[self.ranNum].characters)
        var button = UIButton()
        if answer.count <= 7 {
            button = UIButton(frame: CGRect(x: (280-answer.count*40)/2 + 40 * index, y: 20, width: 40, height: 40))
        }
        if answer.count > 7 && answer.count <= 14 {
            if index < 7 {
                button = UIButton(frame: CGRect(x: 40 * index, y: 0, width: 40, height: 40))
            }
            if index >= 7 && index < 14  {
                button = UIButton(frame: CGRect(x: (280-(answer.count-7)*40)/2 + 40 * (index-7), y: 40, width: 40, height: 40))
            }
        }
        
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.backgroundColor = UIColor.red
        button.setTitle("\(answer[index])", for: .normal)
        
        self.answerContainer.addSubview(button)
        index = index + 1
        self.decreaseScore(1)
        if index == answer.count{
            self.showCongratulation(answers[self.ranNum])
        }
    }
    
    func showAnswer(_ sender: UIButton){
        let titleLabel = sender.titleLabel?.text ?? "Unknown"
        let answer = Array(answers[self.ranNum].characters)
        if titleLabel == String(answer[index]){
            var button = UIButton()
            if answer.count <= 7 {
                button = UIButton(frame: CGRect(x: (280-answer.count*40)/2 + 40 * index, y: 20, width: 40, height: 40))
            }
            if answer.count > 7 && answer.count <= 14 {
                if index < 7 {
                    button = UIButton(frame: CGRect(x: 40 * index, y: 0, width: 40, height: 40))
                }
                if index >= 7 && index < 14  {
                    button = UIButton(frame: CGRect(x: (280-(answer.count-7)*40)/2 + 40 * (index-7), y: 40, width: 40, height: 40))
                }
            }
            
            
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            button.setBackgroundImage(UIImage(named: "buttonAns"), for: .normal)
            button.setTitle("\(answer[index])", for: .normal)
            
            self.answerContainer.addSubview(button)
            index = index + 1
            self.increaseScore()
        } else {
            self.decreaseScore(5)
        }
        if index == answer.count{
            self.showCongratulation(answers[self.ranNum])
        }
    }
    
    func showCongratulation(_ message: String){
        let alertController = UIAlertController(title: "Answer", message: "\(message)", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        self.getNewQuestion()
        self.removeAnswerContainerView()
        self.getNewBlankAnswer()
    }
    
    func mixWord(_ word: String) -> String{
        var res = ""
        var strArr = Array(word.characters)
        strArr = Array(Set(strArr))
        let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)
        for _ in 1...(14-strArr.count){
            let letNum = Int(arc4random_uniform(UInt32(letters.count)))
            strArr.append(letters[letNum])
        }
        while strArr.count > 0 {
            let indexNum = Int(arc4random_uniform(UInt32(strArr.count)))
            res = res + String(strArr[indexNum])
            strArr.remove(at: indexNum)
        }
        return res
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

