//
//  ResultsView.swift
//  MasterMind_Edu
//
//  Created by Alumne on 1/4/22.
//

import SwiftUI

struct ResultsView: View {
    //var board: [RowViewModel]
    let masterMaindViewModel = MasterMaindViewModel()
    var combination: CombinationViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            InformationView(viewModel: masterMaindViewModel)
            ForEach(masterMaindViewModel.board, id: \.self) { comb in
                RowView(viewModel: RowViewModel(combination: comb.colors, resultsList: comb.result))
            }
            /*ForEach(board, id: \.self) { row in
                RowView(viewModel: row)
            }*/
            Spacer()
            CombinationView(viewModel: combination)
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        /*var resultsList: [Result] = [.exist,.positioned,.exist]
        let combination: [Color] = [.green, .red, .blue, .yellow]
        
        let viewModel1 = RowViewModel(combination: combination, resultsList: resultsList)
        
        var resultsList: [Result] = [.exist,.exist,.exist]
        let combination: [Color] = [.red, .red, .blue, .yellow]
        
        let viewModel2 = RowViewModel(combination: combination, resultsList: resultsList)
        
        var resultsList: [Result] = [.positioned,.exist,.exist,.positioned]
        let combination: [Color] = [.blue, .red, .green, .yellow]
        
        let viewModel3 = RowViewModel(combination: combination, resultsList: resultsList)
        
        var resultsList: [Result] = [.exist,.positioned,.positioned,.exist]
        let combination: [Color] = [.yellow, .blue, .green, .red]
        
        let viewModel4 = RowViewModel(combination: combination, resultsList: resultsList)*/
        
        let combination: [Color] = [.yellow, .blue, .green, .red]
        let comb = CombinationViewModel(combination: combination)
        
        ResultsView(/*board: [viewModel1,viewModel2,viewModel3,viewModel4],*/ combination: comb)
    }
}
