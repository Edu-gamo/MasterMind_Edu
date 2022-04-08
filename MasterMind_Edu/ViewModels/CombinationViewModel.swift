//
//  CombinationViewModel.swift
//  MasterMind_Edu
//
//  Created by Alumne on 8/4/22.
//

import Foundation
import SwiftUI

final class CombinationViewModel: ObservableObject, Hashable {
    static func == (lhs: CombinationViewModel, rhs: CombinationViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.combination)
        hasher.combine(self.checkButton)
    }
    
    @Published private(set) var combination: [DotViewModel]
    @Published private(set) var checkButton: DotViewModel
    
    init(combination: [Color]) {
        var tmpCombination = [DotViewModel]()
        combination.forEach(){ color in
            tmpCombination.append(DotViewModel(color: color, isButton: true))
        }
        self.combination = tmpCombination
        self.checkButton = DotViewModel(color: .black, isButton: true)
    }
    
    
    
}
