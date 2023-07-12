//
//  ContentView.swift
//  XsAndOs
//
//  Created by Macbook on 12/07/2023.
//

import SwiftUI

struct StartView: View {
    @State private var gameType: GameType = .undertermined
    @State private var yourName = ""
    @State private var opponentName = ""
    @FocusState private var focus: Bool
    @State private var startGame = false
    var body: some View {
        VStack {
            Picker("Select Game", selection: $gameType) {
                Text("Select Game Type").tag(GameType.undertermined)
                Text("Two Sharing device").tag(GameType.single)
                Text("Challenge your device").tag(GameType.bot)
                Text("Challenge a friend").tag(GameType.peer)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))
            .accentColor(.primary)
            Text(gameType.description)
                .padding()
            VStack {
                switch gameType {
                case .single:
                    VStack {
                        TextField("Your Name", text: $yourName)
                        TextField("Opponent Name", text: $opponentName)
                    }
                case .bot:
                    TextField("Your Name", text: $yourName)
                case .peer:
                    EmptyView()
                case .undertermined:
                    EmptyView()
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($focus)
            .frame(width: 350)
            if gameType != .peer {
                Button("Start Game") {
                    focus = false
                    startGame.toggle()
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    gameType == .undertermined ||
                    gameType == .bot && yourName.isEmpty ||
                    gameType == .single &&
                    (yourName.isEmpty || opponentName.isEmpty)
                )
                Image("LaunchScreen")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Xs and Os")
        .fullScreenCover(isPresented: $startGame, content: {
            GameView()
        })
        .inNavigationStack()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
