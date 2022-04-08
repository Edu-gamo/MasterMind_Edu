//
//  InformationView.swift
//  MasterMind_Edu
//
//  Created by Alumne on 1/4/22.
//

import SwiftUI

struct InformationView: View {
    @ObservedObject var viewModel: MasterMaindViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Mastermind Game Edu")
                .font(.title)
                .foregroundColor(.accentColor)
            Text("You still have " + "\(viewModel.leftOpportunities)" + " opportunities")
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MasterMaindViewModel()
        InformationView(viewModel: viewModel)
    }
}
