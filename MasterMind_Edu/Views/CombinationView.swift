//
//  CombinationView.swift
//  MasterMind_Edu
//
//  Created by Alumne on 8/4/22.
//

import SwiftUI

struct CombinationView: View {
    @ObservedObject var viewModel: CombinationViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            ForEach(viewModel.combination, id: \.self) { comb in
                DotView(viewModel: comb)
            }
            
            DotView(viewModel: viewModel.checkButton)
            .padding(5)
            .border(.black, width: 3)
        }
    }
}

struct CombinationView_Previews: PreviewProvider {
    static var previews: some View {
        let combination: [Color] = [.green, .red, .blue, .yellow]
        
        let viewModel = CombinationViewModel(combination: combination)
        
        CombinationView(viewModel: viewModel)
    }
}
