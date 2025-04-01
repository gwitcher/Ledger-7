//
//  Ledger_7App.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/27/25.
//

import SwiftUI
import SwiftData

@main
struct Ledger_7App: App {
    let container: ModelContainer
    
    var body: some Scene {	
        WindowGroup {
            ProjectLedgerView()
//                .modelContainer(for: Project.self)
        }
        .modelContainer(container)
    }
    
    init() {
        let schema = Schema([Project.self])
        let config  = ModelConfiguration("MyLedger", schema: schema)
        do{
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure the container")
        }
        
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
