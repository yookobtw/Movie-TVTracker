//
//  UpcommingView.swift
//  TV Story Board
//
//  Created by Sayat Amanzhol on 24.09.2026.
//

import SwiftUI

struct UpcommingView: View {
    let viewModel = ViewModel()
    
    var body: some View {
        switch viewModel.upcommingStatus {
        case .notStarted {
            
        }
        case .fetching {
            
        }
        case .success {
            
        }
        case .failed {
            
        }
        }
        
        VerticalListView(titles: viewModel.upcommingMovies)
    }
}

#Preview {
    UpcommingView()
}
