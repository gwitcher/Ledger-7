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
    
    var project: Project
    
    
    
    var body: some View {
        
        NavigationStack {
            ItemListView(project: project)
            ItemDetailView(project: project)
        }
    }
}

#Preview {
    NavigationStack{
        AddItemView(project: Project())
    }
}
