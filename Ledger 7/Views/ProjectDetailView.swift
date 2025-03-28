//
//  ProjectDetailView.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/27/25.
//

import SwiftUI
import SwiftData

struct ProjectDetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var project: Project
    
    @State private var client = ""
    @State private var artist = ""
    @State private var projectName = ""
    @State private var jobDate = Date.now
    @State private var notes = ""
    @State private var mediaType = MediaType.film
    @State private var invoiced = false
    @State private var paid = false
    @State private var dateDelivered = Date()
    @State private var dateClosed = Date()
    
    @State private var sheetIsPresented = false
    
    
    var body: some View {
        
        Form {
            Section("Project Info"){
                LabeledContent {
                    TextField("", text: $client)
                    
                }   label: {
                    Text("Client").foregroundStyle(.secondary)
                }
                
                LabeledContent {
                    TextField("", text: $artist)
                }   label: {
                    Text("Project").foregroundStyle(.secondary)
                }
                LabeledContent {
                    TextField("", text: $projectName)
                }   label: {
                    Text("Artist").foregroundStyle(.secondary)
                }
                
                DatePicker("Job Date", selection: $jobDate)
                    .foregroundStyle(.secondary)
            }
            .textFieldStyle(.plain)
            
            Section {
                Picker("Media", selection: $mediaType) {
                    ForEach(MediaType.allCases) {type in
                        Text(type.rawValue)
                        
                    }
                    
                }
            }
            
            Section {
                
                NavigationLink {
                    Text("Item View Will Go Here")
                } label: {
                        Text("Items")
                }
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Items")
                }
                .sheet(isPresented: $sheetIsPresented) {
                    //TODO: Item Sheet call
                }
            }
            
            
            Section("Notes") {
                ScrollView {
                    TextEditor(text: $notes)
                }
            }
            .textFieldStyle(.roundedBorder)
            
            Section {
                Toggle(isOn: $invoiced) {
                    if !invoiced {
                        Text("Invoiced")
                    } else {
                        HStack{
                            Text("Invoiced")
                            DatePicker("", selection: $dateDelivered)
                                .datePickerStyle(.automatic)
                        }
                        
                    }
                }
                Toggle(isOn: $paid) {
                    if !paid {
                        Text("Paid")
                    } else {
                        HStack{
                            Text("Paid")
                            DatePicker("", selection: $dateClosed)
                                .datePickerStyle(.automatic)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
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
                    //TODO: Save project action
                } label: {
                    Text("Save")
                }

            }
        }
    }
}

#Preview {
    NavigationStack {
        ProjectDetailView(project: Project())
            .modelContainer(for: Project.self, inMemory: true)
    }
}
