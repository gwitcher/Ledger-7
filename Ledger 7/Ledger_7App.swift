//
//  Ledger_7App.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/27/25.
//

import SwiftUI

@main
struct Ledger_7App: App {
    var body: some Scene {
        WindowGroup {
            ProjectLedgerView()
                .modelContainer(for: Project.self, inMemory: true)
        }
    }
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
