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
    @State private var mediaType = MediaType.lesson
    @State private var invoiced = false
    @State private var paid = false
    @State private var dateDelivered = Date()
    @State private var dateClosed = Date()
    
    @State private var sheetIsPresented = false
    
    
    
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Project Info"){
                    LabeledContent {
                        TextField("", text: $client)
                        
                    }   label: {
                        Text("Client").foregroundStyle(.secondary)
                    }
                    
                    LabeledContent {
                        TextField("", text: $projectName)
                    }   label: {
                        Text("Project").foregroundStyle(.secondary)
                    }
                    LabeledContent {
                        TextField("", text: $artist)
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
                        ItemListView(project: project)
                    } label: {
                        Text("Items: \(project.items.count)")
                    }
                    HStack {
                        
                        Button {
                            sheetIsPresented = true
                        } label: {
                            NavigationStack {
                                HStack{
                                    Image(systemName: "plus.circle.fill")
                                    Text("Add Items")
                                }
                            }
                        }
                    }
                    .sheet(isPresented: $sheetIsPresented) {
                        ItemDetailView(project: project)
                    }
                }
                
                
                Section("Notes") {
                    ScrollView {
                        TextField("", text: $notes, axis: .vertical)
                    }
                }
                .textFieldStyle(.plain)
                
                Section {
                    Toggle(isOn: $invoiced) {
                        if !invoiced {
                            Text("Invoiced")
                        } else {
                            HStack{
                                Text("Invoiced")
                                DatePicker("", selection: $dateDelivered, displayedComponents: [.date])
                                    .datePickerStyle(.automatic)
                                    .padding(.horizontal)
                            }
                            
                        }
                    }
                    Toggle(isOn: $paid) {
                        if !paid {
                            Text("Paid")
                        } else {
                            HStack{
                                Text("Paid")
                                DatePicker("", selection: $dateClosed, displayedComponents: [.date])
                                    .datePickerStyle(.automatic)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            client = project.client
            artist = project.artist
            projectName = project.projectName
            jobDate = project.jobDate
            notes = project.notes
            mediaType = project.mediaType
            invoiced = project.invoiced
            paid = project.paid
            dateDelivered = project.dateDelivered
            dateClosed = project.dateClosed
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
                    project.client = client
                    project.artist = artist
                    project.projectName = projectName
                    project.jobDate = jobDate
                    project.notes = notes
                    project.mediaType = mediaType
                    project.invoiced = invoiced
                    project.paid = paid
                    project.dateDelivered = dateDelivered
                    project.dateClosed = dateClosed
                    
                    modelContext.insert(project)
                    guard let _ = try? modelContext.save() else{
                        print("😡 ERROR: Cannot save")
                        return
                    }
                    dismiss()
                    
                } label: {
                    Text("Done")
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
