//
//  GameRound.swift
//  Right on target
//
//  Created by SERGEY SHLYAKHIN on 29.07.2021.
//

import Foundation

protocol GameRoundProtocol {
    // количество заработанных за раунд очков
    var score: Int { get }
    // загаданное значение
    var currentSecretValue: Int { get }
    // подсчет заработанных за раунд очков
    func calculateScoreWith(with value: Int)
}

class GameRound: GameRoundProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    init(secretValue: Int) {
        currentSecretValue = secretValue
    }
    func calculateScoreWith(with value: Int) {
        if value > currentSecretValue {
            score = 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score = 50 - currentSecretValue + value
        } else {
            score = 50
        }
    }
}
