//
//  ViewController.swift
//  PersonalQuiz
//
//  Created by Кирилл Шалеников on 22.05.2023.
//

import UIKit

class QuestionViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    
    private let questions = Question.getQuestions()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: Actions
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func multipleButtonPressed() {
        
    }
    
    @IBAction func rangedButtonPressed() {
    }
    
}

