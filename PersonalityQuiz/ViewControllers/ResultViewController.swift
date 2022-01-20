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
        navigationItem.hidesBackButton = true

        let animal = whatAnimalIs()
        updateLabels(with: animal)
    }

    //MARK: - Private Methods
    private func whatAnimalIs() -> Animal {
        var animalsScores: [Animal: Int] = [:]

        for answer in answersChosen {
            if let _ = animalsScores[answer.animal] {
                animalsScores[answer.animal]? += 1
            } else {
                animalsScores[answer.animal] = 1
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
