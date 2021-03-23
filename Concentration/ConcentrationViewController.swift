//
//  ConcentrationViewController.swift
//  Concentration
//
//  Created by Katerina Temjanoska on 3/18/21.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private weak var scoreCountLabel: UILabel!
    @IBOutlet private weak var newGameButton: UIButton!
    @IBOutlet private var cardButtons: [UIButton]!
    
    private var visibleCardButtons: [UIButton]! {
        return cardButtons?.filter { !$0.superview!.isHidden}
    }
    //MARK: - Properties
    
    private lazy var game = Concentration(numberOfPairsOfCards: (visibleCardButtons.count + 1) / 2)
    private var cardsColor = UIColor.white
    private var emojiChoices: [String] = []
    private var emoji: [Int: String] = [:]
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseTheme()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateViewFromModel()
    }
    //MARK: - IBActions
    
    @IBAction func didTapCard(_ sender: UIButton) {
        game.flipCount += 1
        flipCountLabel.text = "Flip: \(game.flipCount)"
        guard let cardNumber = visibleCardButtons.firstIndex(of: sender) else {
            print("chosen card was not in card buttons")
            return
        }
            game.chooseCard(at: cardNumber)
            scoreCountLabel.text = "Score: \(game.score)"
            updateViewFromModel()
    }
    
    @IBAction func didTapNewGame(_ sender: UIButton) {
        game.flipCount = 0
        flipCountLabel.text = "Flips: 0"
        game.score = 0
        scoreCountLabel.text = "Score: 0"
        emojiChoices += emoji.values
        emoji = [:]
        for index in visibleCardButtons.indices {
            let button = visibleCardButtons[index]
            button.setTitle("", for: UIControl.State.normal)
            game.cards[index].isFaceUp = false
            game.cards[index].isMatched = false
            game.indexOfOneAndOnlyFaceUpCard = nil
        }
        game.shuffleCards()
        chooseTheme()
        updateViewFromModel()
    }
    
    //MARK: - Private
    
    private func updateViewFromModel() {
        for index in visibleCardButtons.indices {
            let button = visibleCardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.isEnabled = false
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 0) : cardsColor
                button.isEnabled = true
            }
        }
    }
        
    private func chooseTheme() {
        guard let theme = Theme.allCases.randomElement() else { return }
        emojiChoices = theme.icons
        cardsColor = theme.cardColor
        view.backgroundColor = theme.backgroundColor
        for index in visibleCardButtons.indices {
            let button = visibleCardButtons[index]
            button.backgroundColor = cardsColor
        }
        newGameButton.setTitleColor(cardsColor, for: UIControl.State.normal)
        flipCountLabel.textColor = cardsColor
        scoreCountLabel.textColor = cardsColor
    }
    
    private func emoji(for card: Card) -> String {
        game.alreadyChosenCard = Array(emoji.keys)
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}
