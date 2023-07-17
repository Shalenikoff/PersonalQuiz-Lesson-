//
//  ViewController.swift
//  PersonalQuiz
//
//  Created by Кирилл Шалеников on 22.05.2023.
//

import UIKit

class QuestionViewController: UIViewController {

    //MARK: Outlets
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionProgressView: UIProgressView!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.maximumValue = answerCount
            rangedSlider.value = answerCount / 2
        }
    }
    
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0 // свойство которое будет у нас обозначать индекс вопроса из модели
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
        }
    private var answersChosen: [Answer] = []
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultsViewController = segue.destination as? ResultsViewController else { return }
        resultsViewController.questionAnswers = answersChosen
    }

    //MARK: Actions
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let answer = currentAnswers[buttonIndex]
        answersChosen.append(answer)
        nextQuestion()
    }
    
    @IBAction func multipleButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
}

//MARK: Private methods
extension QuestionViewController {
    private func updateUI() {
        // Hide stacks
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set cuerrent question for questionLabel
        questionLabel.text = currentQuestion.title
        
        // Calculate position of progressView
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress for progressView
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Set navigation title
        title = "Question № \(questionIndex + 1) of \(questions.count)"
        
        // ShowCurrentAnswers
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .range:
            showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView?.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
   private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView?.isHidden = false

        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }

    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView?.isHidden = false

        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    }
    
    private func nextQuestion() {
           questionIndex += 1
           
           if questionIndex < questions.count {
               updateUI()
               return
           }
           performSegue(withIdentifier: "showResult", sender: nil)
       }
}

