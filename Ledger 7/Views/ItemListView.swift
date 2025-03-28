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
    
    @State var sampleItems: [Item] = [
        Item(itemName: "Goldrush", itemType: "Overdub", fee: 200.00),
        Item(itemName: "Chicken Sisters Ep 3", itemType: "Score", fee: 15000.00),
        Item(itemName: "Martha My Dead", itemType: "Arrangement", fee: 500.00)
    ]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(sampleItems) { item in
                    NavigationLink {
                        ItemDetailView()
                    } label: {
                        HStack{
                            VStack(alignment: .leading){
                                Text(item.itemName)
                                    .font(.subheadline)
                                    .bold()
                                    .lineLimit(1)
                                Text(item.itemType)
                                    .font(.footnote)
                                    .opacity(0.7)
                                    .lineLimit(1)
                            }
                            
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("$\(item.fee, specifier: "%.2f")")
                            }
                            .fontWeight(.bold)
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
    ItemListView()
        .modelContainer(for: Project.self, inMemory: true)
}
