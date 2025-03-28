//
//  ItemDetailView.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/27/25.
//

import SwiftUI
import SwiftData

struct ItemDetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var itemName = ""
    @State var itemType = ItemType.session
    @State var fee = 0.0
    
    var body: some View {
        
        Form {
            Section("Item Info") {
                LabeledContent {
                    TextField("", text: $itemName)
                    
                }   label: {
                    Text("Item Name").foregroundStyle(.secondary)
                }
                
                Picker("Type", selection: $itemType) {
                    ForEach(ItemType.allCases) {type in
                        Text(type.rawValue)
                    }
                }
                
                LabeledContent {
                    TextField("Fee:", value: $fee, format: .currency(code: "USD"))
                } label: {
                    Text("Fee")
                }
                .keyboardType(.decimalPad)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    //TODO: save item action
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ItemDetailView()
            .modelContainer(for: Project.self, inMemory: true)
    }
}
