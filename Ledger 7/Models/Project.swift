//
//  Project.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/27/25.
//

import Foundation
import SwiftData

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
    //var mediaType: String
    
    
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
        dateClosed: Date = Date.distantPast
        //mediaType: MediaType.RawValue = MediaType.tv.rawValue
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
        //self.mediaType = mediaType
    }
  
    
    
}

enum Status: String, CaseIterable, Identifiable {
    case open = "Open"
    case invoiced = "Invoiced"
    case closed = "Closed"

    var id: Self {self}
}

enum MediaType: String, CaseIterable, Identifiable {
    case film = "Film"
    case tv = "TV"
    case recording = "Recording"
    case concert = "Concert"
    case lesson = "Lesson"
    case other = "Other"
    
    var id: Self {self}
}
