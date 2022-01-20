//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    //MARK: - IB Outlets
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var textLabel: UILabel!

    //MARK: - Public Properties
    var answersChosen: [Answer] = []

    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)

        let animal = whatAnimalIs()
        updateLabels(with: animal)
    }

    //MARK: - Private Methods
    private func whatAnimalIs() -> Animal {
        var animalsScores = [
            Animal.dog: 0,
            Animal.cat: 0,
            Animal.rabbit: 0,
            Animal.turtle: 0
        ]

        for answer in answersChosen {
            switch answer.animal {
            case .dog: animalsScores[.dog]? += 1
            case .cat: animalsScores[.cat]? += 1
            case .rabbit: animalsScores[.rabbit]? += 1
            case .turtle: animalsScores[.turtle]? += 1
            }
        }

        let resultAnimal = animalsScores.max { left, right in left.value < right.value }

        return resultAnimal?.key ?? .dog
    }

    private func updateLabels(with animal: Animal) {
        headerLabel.text = "Вы — \(animal.rawValue)"
        textLabel.text = animal.definition
    }
}
