//
//  MenuVIew.swift
//  BrotherDictionary
//
//  Created by Dinh Tu on 07/09/2022.
//

import SwiftUI
import Firebase

struct MenuView: View {
	@EnvironmentObject var viewModel: AuthModel
    @StateObject var authViewModel = AuthModel()
    var body: some View {
            TabView {
                SearchListView()
                    .tabItem{
                        Label("Search", systemImage: "magnifyingglass")
                    }
                CollectionView()
                    .tabItem{
                        Label("Collection", systemImage: "book")
                    }
                UserSettingView()
                    .tabItem{
                        Label("Setting", systemImage: "gearshape")
                    }
                
                
            }
        }

}
