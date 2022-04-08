//
//  MasterMind_EduTests.swift
//  MasterMind_EduTests
//
//  Created by Alumne on 25/3/22.
//

import XCTest
import SwiftUI
@testable import MasterMind_Edu

class MasterMind_EduTests: XCTestCase {

    func testGivenTheMatchIsCreated_ThenNoCombinationShouldBePresent() {
        let mastermind = MasterMaindViewModel()
        
        XCTAssertEqual(0, mastermind.board.count)
    }
    
    func testGivenANumber_TheSecretCombinationShouldHaveThatLength() {
        let mastermind = MasterMaindViewModel(7)
        
        XCTAssertEqual(7, mastermind.secretLength)
    }
    
    func testGivenASecretCombination_TheSecretCombinationCountShouldBeThatValue() {
        let secret: [Color] = [.blue, .blue, .blue, .blue, .blue, .blue, .blue, .blue, .blue]
        let mastermind = MasterMaindViewModel(secret)
        
        XCTAssertEqual(9, mastermind.secretLength)
    }
    
    func testGivenACombinationWithDiferentLengthFromTheSecret_WhenCheckedShouldReturnANullValue() {
        var secret: [Color] = [.blue, .blue, .blue, .blue, .blue, .blue, .blue, .blue, .blue]
        var mastermind = MasterMaindViewModel(secret)
        
        let combination: [Color] = [.red, .red, .red, .red]
        
        XCTAssert(mastermind.check(combination) == nil)
        
        secret = [.blue, .blue]
        mastermind = MasterMaindViewModel(secret)
        
        XCTAssert(mastermind.check(combination) == nil)
        
        mastermind = MasterMaindViewModel(8)
        
        XCTAssert(mastermind.check(combination) == nil)
        
        mastermind = MasterMaindViewModel(4)
        
        XCTAssert(mastermind.check(combination) != nil)
        
    }
    
    func testGivenACombinationWithNoColorsInSecret_WhenChecked_ShouldReturnEmptyResults() {
        let secret: [Color] = [.blue, .blue, .blue, .blue]
        let mastermind = MasterMaindViewModel(secret)
        
        let combination: [Color] = [.red, .red, .red, .red]
        
        XCTAssert(mastermind.check(combination)!.result.isEmpty)
    }
    
    func testGivenACombination_WhenCheckedAnExistingColorWithWrongPosition_ThenShouldReturnExists() {
        let secret: [Color] = [.red, .green, .blue, .blue]
        let mastermind = MasterMaindViewModel(secret)
        
        let combination: [Color] = [.white, .blue, .white, .white]
        
        let combinationCheck = mastermind.check(combination)
        
        XCTAssertEqual(1, combinationCheck!.result.count)
        XCTAssertTrue(combinationCheck!.result.contains(.exist))
    }
    
    func testGivenACombination_WhenCheckedTwoExistingColorsInWrongPosition_ThenShouldReturnTwoExists() {
        let secret: [Color] = [.red, .green, .blue, .blue]
        let mastermind = MasterMaindViewModel(secret)
        
        let combination: [Color] = [.blue, .blue, .white, .white]
        
        let combinationCheck = mastermind.check(combination)
        let expectedResult: [Result] = [.exist, .exist]
        
        XCTAssertEqual(2, combinationCheck!.result.count)
        XCTAssertEqual(expectedResult, combinationCheck!.result)
    }
    
    func testGivenACombination_WhenCheckedFourExistingColorsInWrongPosition_ThenShouldReturnFourExists() {
        let secret: [Color] = [.red, .green, .blue, .white]
        let mastermind = MasterMaindViewModel(secret)
        
        let combination: [Color] = [.green, .blue, .white, .red]
        
        let combinationCheck = mastermind.check(combination)
        let expectedResult: [Result] = [.exist, .exist, .exist, .exist]
        
        XCTAssertEqual(4, combinationCheck!.result.count)
        XCTAssertEqual(expectedResult, combinationCheck!.result)
    }
    
    func testGivenACombination_WhenCheckedAnExistingColorInACorrectPosition_ThenShouldReturnOnePositioned() {
        let secret: [Color] = [.red, .blue, .blue, .blue]
        let mastermind = MasterMaindViewModel(secret)
        
        let combination: [Color] = [.red, .white, .white, .white]
        
        let combinationCheck = mastermind.check(combination)
        let expectedResult: [Result] = [.positioned]
        
        XCTAssertEqual(1, combinationCheck!.result.count)
        XCTAssertEqual(expectedResult, combinationCheck!.result)
    }
    
    func testGivenACombination_WhenCheckedTwoExistingColorInACorrectPosition_ThenShouldReturnTwoPositioned() {
        let secret: [Color] = [.red, .blue, .blue, .blue]
        let mastermind = MasterMaindViewModel(secret)
        
        let combination: [Color] = [.red, .blue, .white, .white]
        
        let combinationCheck = mastermind.check(combination)
        let expectedResult: [Result] = [.positioned, .positioned]
        
        XCTAssertEqual(2, combinationCheck!.result.count)
        XCTAssertEqual(expectedResult, combinationCheck!.result)
    }
    
    func testGivenACombination_WhenCheckedFourExistingColorWithTwoInACorrectPosition_ThenShouldReturnTwoPositionedAndTwoExists() {
        let secret: [Color] = [.red, .blue, .green, .white]
        let mastermind = MasterMaindViewModel(secret)
        
        let combination: [Color] = [.red, .blue, .white, .green]
        
        let combinationCheck = mastermind.check(combination)
        let expectedResult: [Result] = [.positioned, .positioned, .exist, .exist]
        
        XCTAssertEqual(4, combinationCheck!.result.count)
        XCTAssertEqual(expectedResult, combinationCheck!.result)
    }
    
    func testGivenACombination_WhenCheckedFourExistingColorWithCorrectPosition_ThenShouldReturnFourPositioned() {
        let secret: [Color] = [.red, .blue, .green, .white]
        let mastermind = MasterMaindViewModel(secret)
        
        let combination: [Color] = [.red, .blue, .green, .white]
        
        let combinationCheck = mastermind.check(combination)
        let expectedResult: [Result] = [.positioned, .positioned, .positioned, .positioned]
        
        XCTAssertEqual(4, combinationCheck!.result.count)
        XCTAssertEqual(expectedResult, combinationCheck!.result)
    }
    
    func testGivenACombination_WhenCheckedFourExistingColorWithOneCorrectPositionAndTwoDuplicatedColors_ThenShouldReturnOnePositionedAndOneExist() {
        let secret: [Color] = [.red, .blue, .green, .white]
        let mastermind = MasterMaindViewModel(secret)
        
        let combination: [Color] = [.red, .red, .blue, .blue]
        
        let combinationCheck = mastermind.check(combination)
        let expectedResult: [Result] = [.positioned, .exist]
        
        XCTAssertEqual(2, combinationCheck!.result.count)
        XCTAssertEqual(expectedResult, combinationCheck!.result)
    }

}
