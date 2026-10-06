//
//  ContentView.swift
//  TV Story Board
//
//  Created by Sayat Amanzhol on 22.06.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab(Constants.homeString, systemImage: Constants.homeIconString){
                HomeView()
            }
            Tab(Constants.upcomingString, systemImage: Constants.upcomingIconString){
                UpcomingView()
            }
            Tab(Constants.searchString, systemImage: Constants.searchIconString){
                SearchView()
            }
            Tab(Constants.downloadString, systemImage: Constants.downloadIconString){
                DownloadView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
