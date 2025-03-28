//
//  ContentView.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/27/25.
//

import SwiftUI
import SwiftData


struct ProjectLedgerView: View {
    @Environment(\.modelContext) var modelContext
    
    
    @State var projects = [
        Project(id: UUID(), client: "Jenny", artist: "Block", invoiced: false, paid: false),
        
        Project(client: "Atlantic Records", artist: "Aretha Franklin", projectName: "Sings")
    ]
    
    @State private var sheetIsPresented = false
    
    var body: some View {
        
        VStack{
            NavigationStack {
                List {
                    ForEach(projects) {project in
                        NavigationLink(destination: ProjectDetailView(project: project)) {
                            ProjectEntryView(project: project)
                        }
                    }
                }
                .navigationTitle("Projects")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            sheetIsPresented = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .sheet(isPresented: $sheetIsPresented, content: {
                NavigationStack{
                    ProjectDetailView(project: Project())
                }
            })
        }
       
    }
}


#Preview {
    NavigationStack{
        ProjectLedgerView()
            .modelContainer(for: Project.self, inMemory: true)
    }
    
}
