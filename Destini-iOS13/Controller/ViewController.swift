//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var storyBrain = StoryBrain()
    
    
    private lazy var bacgroundView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = Resources.Images.backgroundImage
        return view
    }()
    
    private lazy var choice1Button: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.titleLabel?.numberOfLines = 0
        button.setBackgroundImage(Resources.Images.choice1Button, for: .normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var choice2Button: UIButton = {
        let button = UIButton()
        button.tag = 2
        button.titleLabel?.numberOfLines = 0
        button.setBackgroundImage(Resources.Images.choice2Button, for: .normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var storyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica-Bold", size: 25)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        layoutViews()
        updateUI()
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        let currentChoise = sender.tag
        let story = storyBrain.getCurrentStory()
        switch currentChoise {
        case 1: storyBrain.acceptUserAnswer(currentChoise: story.choice1Destination)
        case 2: storyBrain.acceptUserAnswer(currentChoise: story.choice2Destination)
        default:
            break
        }
        updateUI()
    }
    
    private func updateUI() {
        let story = storyBrain.getCurrentStory()
        storyLabel.text = story.title
        choice1Button.setTitle(story.choice1, for: .normal)
        choice2Button.setTitle(story.choice2, for: .normal)
    }
}

private extension ViewController {
    func addViews() {
        view.addSubview(bacgroundView)
        view.addSubview(choice1Button)
        view.addSubview(choice2Button)
        view.addSubview(storyLabel)
    }
    
    func layoutViews() {
        bacgroundView.translatesAutoresizingMaskIntoConstraints = false
        choice1Button.translatesAutoresizingMaskIntoConstraints = false
        choice2Button.translatesAutoresizingMaskIntoConstraints = false
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bacgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            bacgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bacgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bacgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            choice1Button.bottomAnchor.constraint(equalTo: choice2Button.topAnchor, constant: -20),
            choice1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            choice1Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            choice1Button.heightAnchor.constraint(equalToConstant: 75),
            
            choice2Button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            choice2Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            choice2Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            choice2Button.heightAnchor.constraint(equalToConstant: 75),
            
            storyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
        ])
    }
}

