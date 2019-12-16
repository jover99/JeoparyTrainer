//
//  QuestionsViewController.swift
//  JeopardyTrainerRetake
//
//  Created by Richard Jove on 12/13/19.
//  Copyright © 2019 Richard Jove. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    var clue: Clue!
    var categoryTitle: String!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var showAnswerButton: UIButton!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var getItRightLabel: UILabel!
    
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if clue == nil {
            questionLabel.text = "ERROR: Clue was nil"
        }
        
        if categoryTitle == nil {
            questionLabel.text = "ERROR: categoryTitle was nil"
        }
        
        categoryLabel.text = "Category: \(categoryTitle!)"
        questionLabel.text = clue.question
        answerLabel.text = clue.answer
        
    
    }
    

    @IBAction func showAnswerButtonPressed(_ sender: UIButton) {
        showAnswerButton.isHidden = true
        answerLabel.isHidden = false
        getItRightLabel.isHidden = false
        yesButton.isHidden = false
        noButton.isHidden = false
    }
    @IBAction func yesButtonPressed(_ sender: UIButton) {
    }
    @IBAction func noButtonPressed(_ sender: UIButton) {
    }
    
}
