//
//  MasterMindViewModel.swift
//  MasterMind_Edu
//
//  Created by Alumne on 25/3/22.
//

import Foundation
import SwiftUI

class MasterMaindViewModel: ObservableObject {
    
    public private(set) var board = [Combination]() //Cantidad de combinaciones probadas
    //public private(set) var board = [RowViewModel]() //Cantidad de combinaciones probadas
    public private(set) var secretLength: Int = 4 //Cantidad de elementos de la combinacion secreta, por defecto 4
    
    @Published private(set) var maxTries: Int = 12 //Numero maximo de intentos
    @Published private(set) var leftOpportunities: Int = 12 //Numero de intentos restantes
    
    public static let validColors: [Color] = [.red, .green, .blue, .white] //Lista de colores validos
    private var secret: [Color]
    public private(set) var finished: Bool = false
    public private(set) var win: Bool = false
    
    public private(set) var actualCombination: [Color]
    
    init(_ secret: [Color]? = nil) {
        self.secret = secret ?? MasterMaindViewModel.generateRandomCombination(self.secretLength)
        if(secret != nil) {
            self.secretLength = secret!.count //Si se le ha pasado una combinacion secreta predefinida, se obtiene la cantidad de elementos que contiene
        }
        actualCombination = MasterMaindViewModel.generateDefaultCombination(self.secretLength)
        
        generateRandomBoard()
    }
    
    //Si se inicializa con un valor numerico se genera una combinacion aleatoria con la cantidad de elementos especificada
    init(_ secretLength: Int) {
        self.secret = MasterMaindViewModel.generateRandomCombination(secretLength)
        self.secretLength = secretLength
        actualCombination = MasterMaindViewModel.generateDefaultCombination(self.secretLength)
    }
    
    func check(_ combination: [Color] = actualCombination) {
        if(combination.count != secretLength || board.count > maxTries) {
            //Si la cantidad de elementos a comparar no coincide con la de la combinacion secreta o se ha superado el limite de intentos, se devuleve valor nulo
            finished = true
			return
        }
        
        var res: [Result] = []
        var tmpCombination: [Color?] = combination.map { $0 }
        
        for(index, color) in self.secret.enumerated() {
            guard color != combination[index] else {
                res.append(.positioned)
                tmpCombination[index] = nil
                continue
            }
            
            guard let colorIndex = tmpCombination.firstIndex(of: color) else {
                continue
            }
            
            res.append(.exist)
            tmpCombination[colorIndex] = nil
        }
        
        //Cada combinacion probada se añade al board siempre que no se hayan superado el numero maximo de intentos
        board.append(Combination(colors: combination, result: res))
        //board.append(Combination(colors: combination, result: res))
        leftOpportunities -= 1
        
        if(leftOpportunities == 0 || checkResults(res)){
            finished = true
        }
    }
    
    func checkResults(_ results: [Result]) -> Bool {
        results.forEach(){ result in
            if(result != .positioned){
                return false
            }
        }
		
		if(results.count != secret.count){
			return false
		}
		
		self.win = true
        return true
    }
    
    func reset() {
		self.board = [Combination]()
        self.secret = MasterMaindViewModel.generateRandomCombination(self.secretLength)
        self.actualCombination = MasterMaindViewModel.generateDefaultCombination(self.secretLength)
		self.leftOpportunities = self.maxTries
		self.finished = false
		self.win = false
    }
    
    func changeActualCombinationColor(_ index: Int) {
        var tmpColor = self.actualCombination[index]
		
		for(i, color) in self.validColors.enumerated() {
            guard color != tmpColor else {
                continue
            }
			if(i = (self.validColors.count - 1)){
				self.actualCombination[index] = self.validColors[0]
			}else{
				self.actualCombination[index] = self.validColors[i + 1]
			}
        }
		
		self.actualCombination[index]
    }
    
    public func generateRandomBoard() {
        //var resultsList: [Result] = [.exist,.positioned,.exist]
        var combination: [Color] = [.green, .red, .blue, .yellow]
        //board.append(Combination(colors: combination, result: resultsList))
        check(combination)
        
        //resultsList = [.exist,.positioned,.exist]
        combination = [.green, .red, .blue, .yellow]
        //board.append(Combination(colors: combination, result: resultsList))
        check(combination)
        
        //resultsList = [.exist,.exist,.exist]
        combination = [.red, .red, .blue, .yellow]
        //board.append(Combination(colors: combination, result: resultsList))
        check(combination)
        
        //resultsList = [.positioned,.exist,.exist,.positioned]
        combination = [.blue, .red, .green, .yellow]
        //board.append(Combination(colors: combination, result: resultsList))
        check(combination)
        
        //resultsList = [.exist,.positioned,.positioned,.exist]
        combination = [.yellow, .blue, .green, .red]
        //board.append(Combination(colors: combination, result: resultsList))
        check(combination)
    }
    
}

private extension MasterMaindViewModel {
    static func generateRandomCombination(_ secretLength: Int) -> [Color] {
        var combination = [Color]()
        
        //Se genera una combinacion secreta aleatoria a con la cantidad de elementos especificada
        (1...secretLength).forEach { _ in
            //Los colores aleatorios obtenidos se generan dependiendo de la lista de colores validos
            combination.append(self.validColors[Int.random(in: (0...(validColors.count - 1)))])
        }
        
        return combination
    }
    
    static func generateDefaultCombination(_ secretLength: Int) -> [Color] {
        var combination = [Color]()
        
        (1...secretLength).forEach { _ in
            combination.append(self.validColors[0])
        }
        
        return combination
    }
}
