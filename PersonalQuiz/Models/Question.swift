//
//  File.swift
//  PersonalQuiz
//
//  Created by Кирилл Шалеников on 30.05.2023.
//

struct Question {
    let title: String
    let type: ResponseType
    let answers: [Answer]
}

enum ResponseType {
    case single
    case multiple
    case range
}

struct Answer {
    let title: String
    let type: AnimalType
    
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case tiger = "🐯"
    case cow = "🐮"
    
    var definition: String {
        switch self {
        case .dog:
            return "You like to have a lot of freinds. You always ready to help them and you are very loyal"
        case .cat:
            return "You like walking by oneself. Your mind is very introvertive, sometimes laziness gets better of you"
        case .tiger:
            return "You feel yourself like a hunter. Sometimes people scares you, but, of course, you are very respective and powerful"
        case .cow:
            return "You like to eat green food and to spend time with friends in nature, but you dont't like any activities"
        }
    }
}

extension Question {
    
    static func getQuestions() -> [Question] {
       [
        Question(
            title: "What food do you like?",
            type: .single,
            answers: [
                Answer(title: "Bones", type: .dog),
                Answer(title: "Meat", type: .tiger),
                Answer(title: "Milk", type: .cat),
                Answer(title: "Grass", type: .cow)
            ]
        ),
        Question(
            title: "What do you like to do most of all",
            type: .multiple,
            answers: [
                Answer(title: "Play", type: .dog),
                Answer(title: "Hunt", type: .tiger),
                Answer(title: "Sleep", type: .cat),
                Answer(title: "Walk", type: .cow)
                ]
        ),
        Question(
            title: "Do you like trips on the car",
            type: .range,
            answers: [
                Answer(title: "Love", type: .dog),
                Answer(title: "Hate", type: .tiger),
                Answer(title: "Nervous", type: .cat),
                Answer(title: "Don't notice", type: .cow)
            ]
        )
        ]
    }
    
    
    
}





