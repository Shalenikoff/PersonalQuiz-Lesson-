//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Кирилл Шалеников on 07.07.2023.
//

import UIKit

class ResultsViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet var resultOfAsnwersLabel: UILabel!
    @IBOutlet var descriptionResultLabel: UILabel!
    
    //MARK: Lifecycle
    var questionAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printResultsOfAnswers()
        setHidesBackButton(true, animated: false)
    }
    
    //MARK: Actions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

//MARK: Private methods
extension ResultsViewController {
    
    private func rerer() {
        
    }
    
    private func setHidesBackButton (_ hidesBackButton: Bool, animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    private func printResultsOfAnswers () {
        for answers in questionAnswers {
            print("The answer is \(answers.title). The type of animal is \(answers.type).")
        }
    }
    
}
