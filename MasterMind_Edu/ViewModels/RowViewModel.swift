//
//  RowViewModel.swift
//  MasterMind_Edu
//
//  Created by Alumne on 1/4/22.
//

import Foundation
import SwiftUI

final class RowViewModel: ObservableObject, Hashable {
    static func == (lhs: RowViewModel, rhs: RowViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.combination)
        hasher.combine(self.resultsList)
    }
    
    @Published private(set) var combination: [DotViewModel]
    @Published private(set) var resultsList: [[DotViewModel]]
    
    init(combination: [Color], resultsList: [Result]) {
        var tmpCombination = [DotViewModel]()
        combination.forEach(){ color in
            tmpCombination.append(DotViewModel(color: color))
        }
        self.combination = tmpCombination
        
        var tmpResultsList = [[DotViewModel]]()
        var auxId = 0
        var columns: Int = 2
        while(auxId < resultsList.count){
            var dvms = [DotViewModel]()
            (1...columns).forEach{_ in
                if(auxId < resultsList.count){
                    dvms.append(DotViewModel(result: resultsList[auxId]))
                    auxId += 1
                }
            }
            tmpResultsList.append(dvms)
        }
        self.resultsList = tmpResultsList
    }
    
}
