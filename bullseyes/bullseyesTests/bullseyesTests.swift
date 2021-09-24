//
//  bullseyesTests.swift
//  bullseyesTests
//
//  Created by Dhashil Bhiwoo on 23/08/2021.
//

import XCTest
@testable import bullseyes

class bullseyesTests: XCTestCase {
    
    var game: Game!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testNewRound(){
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testScoreExact(){
        let guess = game.target
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score,200)
    }
    
    func testScoreClose(){
        let guess = game.target + 2
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score,98 + 50)
    }
    
    func testRestart(){
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }
    
    func testLeaderboard(){
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardEntries.count,1)
        XCTAssertEqual(game.leaderboardEntries[0].score,100)
        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderboardEntries.count,2)
        XCTAssertEqual(game.leaderboardEntries[0].score,200)
        XCTAssertEqual(game.leaderboardEntries[1].score,100)
    }
    
}
