//
//  ItemListView.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/27/25.
//

import SwiftUI
import SwiftData

struct ItemListView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var project : Project
    
    @State private var sheetIsPresented = false
    @State var selectedItem: Item?
    @State var itemName = ""
    @State var itemType = ItemType.arrangement
    @State var fee = Double("")
    
    var body: some View {
        NavigationStack{
            Group {
                if project.items.isEmpty {
                    ContentUnavailableView("No Items Entered", systemImage: "music.mic")
                } else {
                    List {
                        ForEach(project.items) { item in
                            VStack{
                                ItemEntryView(item: item)
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedItem = item
                                sheetIsPresented = true
                                
                            }
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(project)
                            }
                        }
                        
                    }
                    
                }
            }
            .navigationTitle("Items in \(project.projectName)")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $sheetIsPresented) {
                ItemEditView(item: selectedItem ?? Item(itemName: "No Item"))
            }
        }
    }
}


#Preview {
    ItemListView(project: Project(client: "Hi Brah", items: [
        Item(
            itemName: "Jaws",
            itemType: .arrangement,
            fee: 3000.00
        ),
        Item(
            itemName: "Imperial March",
            itemType: .arrangement,
            fee: 3000.00
        ),
        Item(
            itemName: "Hedwigs Theme",
            itemType: .score,
            fee: 3000.00
        ),
        Item(
            itemName: "Raiders March",
            itemType: .score,
            fee: 3000.00
        ),
    ]))
    .modelContainer(for: Project.self, inMemory: true)
}
