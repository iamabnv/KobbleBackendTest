//
//  EscapeRoomTest.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 7/30/23.
//

import SwiftUI

struct CrypticHunt: Identifiable {
    var id = UUID()
    var gameTitle: String
    var stageNumber: String
    var stage: String
    var answer: String
}

struct EscapeRoomTest: View {
    @State private var crypticHunts: [CrypticHunt] = []
    
    var body: some View {
        NavigationView {
            if !crypticHunts.isEmpty {
                GameView(game: Game(stages: crypticHunts))
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        if let fileURL = Bundle.main.url(forResource: "TestEscapeRoomData", withExtension: "csv") {
            do {
                let contents = try String(contentsOf: fileURL)
                let rows = contents.components(separatedBy: "\n")
                for row in rows.dropFirst() { // dropFirst is used to skip the header row
                    let columns = parseCSVRow(row)
                    if columns.count == 4 {
                        let crypticHunt = CrypticHunt(
                            gameTitle: columns[0],
                            stageNumber: columns[1],
                            stage: columns[2],
                            answer: columns[3]
                        )
                        crypticHunts.append(crypticHunt)
                    }
                }
            } catch {
                print("Failed to parse CSV: \(error)")
            }
        }
    }
    
    func parseCSVRow(_ row: String) -> [String] {
        var result = [String]()
        var value = ""
        var insideQuotes = false
        
        for character in row {
            if character == "," {
                if insideQuotes {
                    value.append(character)
                } else {
                    result.append(value)
                    value.removeAll()
                }
            } else if character == "\"" {
                insideQuotes.toggle()
            } else {
                value.append(character)
            }
        }
        result.append(value)
        return result
    }
}

struct EscapeRoomTest_Previews: PreviewProvider {
    static var previews: some View {
        EscapeRoomTest()
    }
}
