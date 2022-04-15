//
//  CombinationView.swift
//  MasterMind_Edu
//
//  Created by Alumne on 8/4/22.
//

import SwiftUI

struct CombinationView: View {
    @ObservedObject var viewModel: CombinationViewModel
    @ObservedObject var masterMaindViewModel: MasterMaindViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
			var index = 0
            ForEach(viewModel.combination, id: \.self) { comb in
                DotView(viewModel: comb).gesture(
					DragGesture(minimumDistance: 0, coordinateSpace: .global)
						.onEnded { _ in
							masterMaindViewModel.changeActualCombinationColor(index)
						}
				)
				index = index + 1
            }
            
            DotView(viewModel: viewModel.checkButton)
            .padding(5)
            .border(.black, width: 3)
			.gesture(
				DragGesture(minimumDistance: 0, coordinateSpace: .global)
					.onEnded { _ in
						masterMaindViewModel.check()
					}
			)
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
