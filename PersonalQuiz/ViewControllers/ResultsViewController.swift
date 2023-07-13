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
    var questionAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(questionAnswers)
    }
    

    
    //MARK: Actions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

//MARK: Private methods
extension ResultsViewController {
    
    private func rere() {
        
    }// функция подсчета количества встречающихся животных в массиве ответов
    
    private func rerer() {
        
    }// функция вычленения наиболее часто встречающихся ответов


    
}
