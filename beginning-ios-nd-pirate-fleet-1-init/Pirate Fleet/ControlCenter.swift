//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

// Value types for Grid
struct GridLocation {
    let x: Int
    let y: Int
}

// Value types for Ship
struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

// Value types for Mine
struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

// Value types for GameStats
struct gameStats {
    let enemyShipsRemaining: Int
    let guessPenalty: Int
    let humanShipsSunk: Int
    let numberOfHitsOnEnemy: Int
    let numberOfMissesByHuman: Int
    let shipBonus: Int
    let sinkBonus: Int
}

class ControlCenter {
    
    func addShipsAndMines(_ human: Human) {
        
        // Added ships to the board with this code
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: true)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 5, y: 0), isVertical: false)
        let smallShip = Ship(length: 2, location: GridLocation(x: 5, y: 3), isVertical: false)
        let largeShip = Ship(length: 4, location: GridLocation(x: 1, y: 5), isVertical: false)
        let extralargeShip = Ship(length: 5, location: GridLocation(x: 1, y: 1), isVertical: false)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(smallShip)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extralargeShip)
        
        // Added mines to the board with this code
        let firstMine = Mine(location: GridLocation(x: 0, y: 3), explosionText: "Kaboom!")
        let secondMine = Mine(location: GridLocation(x: 4, y: 3), explosionText: "Boom!")
        human.addMineToGrid(firstMine)
        human.addMineToGrid(secondMine)
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
        var finalScore: Int
        let names = [Ship]()
        
        // Count the number of ships from the names array
        let totalShips = names.count
        
        // Enemy ships sunk = total ships - remaining
        let enemyShipsSunk = totalShips - gameStats.enemyShipsRemaining
        
        // Human ships remaining = total ships - human ships sunk
        let humanShipsRemaining = totalShips - gameStats.humanShipsSunk
        
        // The number of guesses
        let numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        
        // Lesson formula: finalScore = (enemyShipSunk * sinkBonus) + (humanShipsRemaining * shipBonus) - (number of Guesses * guessPenalty)
        finalScore = (enemyShipsSunk * gameStats.sinkBonus) + (humanShipsRemaining * gameStats.shipBonus) - (numberOfGuesses * gameStats.guessPenalty)
        
        // Prints the final score
        print("The value of final score is: \(finalScore)")
        
        return finalScore
        
    }
}
