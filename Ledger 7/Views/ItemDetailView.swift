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
    
    var project: Project
    
    @State var itemName = ""
    @State var itemType = ItemType.arrangement
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
        
        NavigationStack {
            Form {
                Section("Item Info") {
                    LabeledContent {
                        TextField("Item Name", text: $itemName)
                    }   label: {
                        Text("").foregroundStyle(.secondary)
                            .textContentType(.name)
                    }
                    
                    Picker(" Type", selection: $itemType) {
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
            
            Button {
                
                let newItem = Item(itemName: itemName, itemType: itemType, fee: fee ?? 0.00)
                
                itemName = ""
                itemType = ItemType.session
                fee = nil
                
                project.items.append(newItem)
                guard let _ = try? modelContext.save() else{
                    print("😡 ERROR: Cannot save")
                    return
                }
            } label: {
                Image(systemName: "plus.circle")
                Text("Add Item")
            }
            .buttonStyle(.borderedProminent)
            .disabled(itemName.isEmpty)
            
            
            
            Spacer()
        }
        
    }
}




#Preview {
    NavigationStack {
        ItemDetailView(project: Project())
            .modelContainer(for: Project.self, inMemory: true)
    }
}
