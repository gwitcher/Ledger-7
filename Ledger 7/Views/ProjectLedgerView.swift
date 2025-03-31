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
    
    @Query var projects: [Project]
    
    
    
    @State private var sheetIsPresented = false
    
    var body: some View {
        
        VStack{
            NavigationStack {
                Group {
                    if projects.isEmpty {
                        ContentUnavailableView("Enter your first project", systemImage: "music.note.list" )
                    
                    } else {
                        List {
                            ForEach(projects) {project in
                                NavigationLink(destination: ProjectDetailView(project: project)) {
                                    ProjectEntryView(project: project)
                                }
                                .swipeActions {
                                    Button("Delete", role: .destructive) {
                                        modelContext.delete(project)
                                    }
                                }
                            }
                            
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
        }
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
        .sheet(isPresented: $sheetIsPresented, content: {
            NavigationStack{
                ProjectDetailView(project: Project())
            }
        })
    }
    
    
}


#Preview {
    NavigationStack{
        ProjectLedgerView()
            .modelContainer(for: Project.self, inMemory: true)
    }
    
}
