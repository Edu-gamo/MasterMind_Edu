//
//  Combination.swift
//  MasterMind_Edu
//
//  Created by Alumne on 25/3/22.
//

import Foundation
import SwiftUI

enum Result {
    case exist, positioned
}

struct Combination: Hashable {
    let colors: [Color]
    let result: [Result]
}
