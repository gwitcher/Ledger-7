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
    
    @State var sampleItems: [Item] = [
        Item(itemName: "Goldrush", itemType: .arrangement, fee: 200.00),
        Item(itemName: "Chicken Sisters Ep 3", itemType: .overdub, fee: 15000.00),
        Item(itemName: "Martha My Dead", itemType: .session, fee: 500.00)
    ]
    
    var body: some View {
        NavigationStack{
            Group {
                if project.items.isEmpty {
                    ContentUnavailableView("No Items Entered", systemImage: "music.mic")
                } else {
                    List {
                        ForEach(project.items) { item in
                            Text(item.itemName)
                        }
                            
                        }
                        
                    }
                    
                }
                    .navigationTitle("Items in Project")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }


#Preview {
    ItemListView(project: Project(client: "Hi Brah"))
        .modelContainer(for: Project.self, inMemory: true)
}
