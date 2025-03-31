//
//  Project.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/27/25.
//

import SwiftUI
import SwiftData
import SwiftUIFontIcon

@Model
class Project {
    var id: UUID = UUID()
    var client: String
    var artist: String
    var projectName: String
    var jobDate: Date
    var notes: String
    var dateOpened: Date
    var invoiced: Bool
    var dateDelivered: Date
    var paid: Bool
    var dateClosed: Date
    @Relationship(deleteRule: .cascade)
    var items: [Item]
    var mediaType: MediaType
    var status: Status
    
    
    init(
        id: UUID = UUID(),
        client: String = "",
        artist: String = "",
        projectName: String = "",
        jobDate: Date = Date.now,
        notes: String = "",
        dateOpened: Date = Date.now,
        invoiced: Bool = false,
        dateDelivered: Date = Date.distantPast,
        paid: Bool = false,
        dateClosed: Date = Date.distantPast,
        items: [Item] = [Item](),
        mediaType: MediaType = MediaType.recording,
        status: Status = Status.open
    ) {
        self.id = id
        self.client = client
        self.artist = artist
        self.projectName = projectName
        self.jobDate = jobDate
        self.notes = notes
        self.dateOpened = dateOpened
        self.invoiced = invoiced
        self.dateDelivered = dateDelivered
        self.paid = paid
        self.dateClosed = dateClosed
        self.items = items
        self.mediaType = mediaType
        self.status = status
        
    }
  
    var icon: String {
        switch mediaType {
        case .film:
            ".film"
        case .tv:
            ".tv"
        case .recording:
            "FontIcon.text(.awesome5Solid(code: .headphones), fontsize: 24, color: Color.green)"
        case .concert:
            "FontIcon.text(.awesome5Solid(code: .music), fontsize: 24, color: Color.green)"
        case .lesson:
            "FontIcon.text(.awesome5Solid(code: .user-graduate), fontsize: 24, color: Color.green)"
        case .other:
            "FontIcon.text(.awesome5Solid(code: .record-vinyl), fontsize: 24, color: Color.green)"
        }
    }
    
}

enum Status: String, CaseIterable, Identifiable, Codable {
    case open = "Open"
    case invoiced = "Invoiced"
    case closed = "Closed"

    var id: Self {self}
}

enum MediaType: String, CaseIterable, Identifiable, Codable {
    case film = "Film"
    case tv = "TV"
    case recording = "Recording"
    case concert = "Concert"
    case lesson = "Lesson"
    case other = "Other"
    
    var id: Self {self}
}
