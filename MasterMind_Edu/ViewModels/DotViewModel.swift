//
//  ResultDotViewModel.swift
//  MasterMind_Edu
//
//  Created by Alumne on 1/4/22.
//

import Foundation
import SwiftUI

final class DotViewModel: ObservableObject, Hashable {
    static func == (lhs: DotViewModel, rhs: DotViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.color)
        hasher.combine(self.size.width)
        hasher.combine(self.size.height)
        hasher.combine(self.isButton)
    }
    
    @Published private(set) var color: Color = .white
    @Published private(set) var size: CGSize
    @Published private(set) var isButton: Bool
    
    init(result: Result, size: CGSize) {
        self.isButton = false
        self.size = size
        
        if result == .exist {
            color = .white
        } else {
            color = .black
        }
    }
    init(result: Result) {
        self.isButton = false
        self.size = CGSize(width: 20, height: 20)
        
        if result == .exist {
            color = .white
        } else {
            color = .black
        }
    }
    
    init(color: Color, size: CGSize, isButton: Bool = false) {
        self.isButton = isButton
        self.size = size
        self.color = color
    }
    init(color: Color, isButton: Bool = false) {
        self.isButton = isButton
        self.size = CGSize(width: 50, height: 50)
        self.color = color
    }
    
}
