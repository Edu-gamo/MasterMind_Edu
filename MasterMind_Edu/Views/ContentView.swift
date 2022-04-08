//
//  ContentView.swift
//  MasterMind_Edu
//
//  Created by Alumne on 25/3/22.
//

import SwiftUI

struct ContentView: View {
    let masterMaindViewModel = MasterMaindViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            InformationView(viewModel: masterMaindViewModel)
            ForEach(masterMaindViewModel.board, id: \.self) { comb in
                RowView(viewModel: RowViewModel(combination: comb.colors, resultsList: comb.result))
            }
            Spacer()
            CombinationView(viewModel: CombinationViewModel(combination: masterMaindViewModel.actualCombination))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
