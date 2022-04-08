//
//  ResultsDotView.swift
//  MasterMind_Edu
//
//  Created by Alumne on 1/4/22.
//

import SwiftUI

struct DotView: View {
    @ObservedObject var viewModel: DotViewModel
    
    var body: some View {
        if(viewModel.isButton){
            Rectangle()
                .strokeBorder(.black)
                .background(Rectangle().foregroundColor(viewModel.color))
                .frame(width: viewModel.size.width, height: viewModel.size.height, alignment: .center)
        } else {
            Circle()
                .strokeBorder(.black)
                .background(Circle().foregroundColor(viewModel.color))
                .frame(width: viewModel.size.width, height: viewModel.size.height, alignment: .center)
        }
    }
    
}

struct DotView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = DotViewModel(result: .positioned)
        DotView(viewModel: viewModel)
        
        let viewModel2 = DotViewModel(color: .red)
        DotView(viewModel: viewModel2)
        
        let viewModel3 = DotViewModel(color: .black, isButton: true)
        DotView(viewModel: viewModel3)
    }
}
