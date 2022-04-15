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
		
		if(masterMaindViewModel.finished){
			VStack(alignment: .center, spacing: 10) {
				Text("Mastermind Edu")
					.font(.title)
					.foregroundColor(.accentColor)
				Button("Play"){
					masterMaindViewModel.reset()
				}
			}
		} else {
			VStack(alignment: .leading, spacing: 2) {
				InformationView(viewModel: masterMaindViewModel)
				ForEach(masterMaindViewModel.board, id: \.self) { comb in
					RowView(viewModel: RowViewModel(combination: comb.colors, resultsList: comb.result))
				}
				Spacer()
				CombinationView(viewModel: CombinationViewModel(combination: masterMaindViewModel.actualCombination), masterMaindViewModel: masterMaindViewModel)
			}
		}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
