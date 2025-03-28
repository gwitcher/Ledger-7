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
    @State var fee = Double("")
    @FocusState private var isFocused: Bool

        private let currencyNumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency

            return formatter
        }()

        private let decimalNumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.usesGroupingSeparator = false

            return formatter
        }()
    
    var body: some View {
        
        Form {
            Section("Item Info") {
                LabeledContent {
                    TextField("Item Name", text: $itemName)
                    
                }   label: {
                    Text("").foregroundStyle(.secondary)
                        .textContentType(.name)
                }
                
                Picker("  Type", selection: $itemType) {
                    ForEach(ItemType.allCases) {type in
                        Text(type.rawValue)
                    }
                }
                
                LabeledContent {
                    TextField("$ Fee", value: $fee, formatter: isFocused ? decimalNumberFormatter : currencyNumberFormatter)
                                .keyboardType(.decimalPad)
                                .focused($isFocused)
                   
                } label: {
                    Text("")
                }
                .keyboardType(.decimalPad)
            }
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
        .navigationBarBackButtonHidden()
        .frame(height: 220)
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
                    Text("Done")
                }
            }
        }
        
        Spacer()
    }
}

#Preview {
    NavigationStack {
        ItemDetailView()
            .modelContainer(for: Project.self, inMemory: true)
    }
}
