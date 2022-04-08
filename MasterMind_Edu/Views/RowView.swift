//
//  RowView.swift
//  MasterMind_Edu
//
//  Created by Alumne on 1/4/22.
//

import SwiftUI

struct RowView: View {
    @ObservedObject var viewModel: RowViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            ForEach(viewModel.combination, id: \.self) { comb in
                DotView(viewModel: comb)
            }
            
            HStack(alignment: .center, spacing: 2) {
                VStack(alignment: .leading, spacing: 2) {
                    ForEach(viewModel.resultsList, id: \.self) { row in
                        HStack(alignment: .center, spacing: 2) {
                            ForEach(row, id: \.self) { result in
                                DotView(viewModel: result)
                            }
                        }
                    }
                }
            }
            .padding(5)
            .border(.black, width: 1)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        let resultsList: [Result] = [.exist,.positioned,.positioned]
        let combination: [Color] = [.green, .red, .blue, .yellow]
        
        let viewModel = RowViewModel(combination: combination, resultsList: resultsList)
        
        RowView(viewModel: viewModel)
    }
}
