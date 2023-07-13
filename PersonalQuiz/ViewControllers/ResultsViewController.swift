//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Кирилл Шалеников on 07.07.2023.
//

import UIKit

class ResultsViewController: UIViewController {

    var questionAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(questionAnswers)
    }
    

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
   

}
