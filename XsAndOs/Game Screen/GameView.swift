//
//  GameView.swift
//  XsAndOs
//
//  Created by Macbook on 12/07/2023.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("End Game") {
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("Xs and Os")
        .inNavigationStack()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
