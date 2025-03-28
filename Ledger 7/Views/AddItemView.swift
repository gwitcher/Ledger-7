//
//  AddItemView.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/27/25.
//

import SwiftUI
import SwiftData

struct AddItemView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ItemListView()
            ItemDetailView()
  
            Button {
                //TODO: add item to item array
            } label: {
                Image(systemName: "plus.circle")
                Text("Add Item")
            }
            .buttonStyle(.borderedProminent)
        }
        
    }
}

#Preview {
    NavigationStack{
        AddItemView()
    }
}
