//
//  ContentView.swift
//  AirportLocator
//
//  Created by Juan Ticante Vicente on 11/03/22.
//

import SwiftUI

struct FinderView: View {
    @StateObject var finderViewModel = FinderViewModel()
   
    fileprivate func listRow(_ todo: Items) -> some View {
        HStack{
            Text(todo.name ?? "Hola")
        }
    }
    
    fileprivate func TodoList() -> some View {
        List {
            ForEach(finderViewModel.airports){ item in
                listRow(item)
            }
        }
        .navigationTitle("Todo List")
        .onAppear {
            finderViewModel.onAppear()
        }
    }
    
    var body: some View {
        TodoList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FinderView()
    }
}
