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
    //var id: UUID = UUID()
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
        //id: UUID = UUID(),
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
        //self.id = id
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
  
//    var icon: String {
//        switch mediaType {
//        case .film:
//            ".film"
//        case .tv:
//            ".tv"
//        case .recording:
//            "FontIcon.text(.awesome5Solid(code: .headphones), fontsize: 24, color: Color.green)"
//        case .concert:
//            "FontIcon.text(.awesome5Solid(code: .music), fontsize: 24, color: Color.green)"
//        case .lesson:
//            "FontIcon.text(.awesome5Solid(code: .user-graduate), fontsize: 24, color: Color.green)"
//        case .other:
//            "FontIcon.text(.awesome5Solid(code: .record-vinyl), fontsize: 24, color: Color.green)"
//        }
//    }
    
}

//extension Project {
//    static var preview: ModelContainer {
//        let container = try! ModelContainer(for: Project.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
//        let lastWeek = Calendar.current.date(byAdding: .day, value: -7, to: Date.now)!
//        let lastMonth = Calendar.current.date(byAdding: .month, value: -1, to: Date.now)!
//        let nextWeek = Calendar.current.date(byAdding: .day, value: 7, to: Date.now)!
//        let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: Date.now)!
//        let item1 = [Item(itemName: "Solo Record", itemType: .production, fee: 2500.00)]
//        let item2 = [
//            Item(
//                itemName: "Song 1",
//                itemType: .overdub,
//                fee: 200.00
//            ),
//            Item(
//                itemName: "Song 2",
//                itemType: .overdub,
//                fee: 200.00
//            ),
//            Item(
//                itemName: "Song 3",
//                itemType: .overdub,
//                fee: 200.00
//            ),]
//        let item3 = [
//            Item(
//                itemName: "Jaws",
//                itemType: .arrangement,
//                fee: 3000.00
//            ),
//            Item(
//                itemName: "Imperial March",
//                itemType: .arrangement,
//                fee: 3000.00
//            ),
//            Item(
//                itemName: "Hedwigs Theme",
//                itemType: .score,
//                fee: 3000.00
//            ),
//            Item(
//                itemName: "Raiders March",
//                itemType: .score,
//                fee: 3000.00
//            ),
//        ]
//
//        container.mainContext.insert( Project(
//            client: "Willie Watson",
//            artist: "Willie Watson",
//            projectName: "Willie Watson",
//            jobDate: lastWeek,
//            notes: "",
//            dateOpened: lastMonth,
//            invoiced: false,
//            dateDelivered: lastMonth,
//            paid: false,
//            dateClosed: Date.now,
//            items: item1,
//            mediaType: .recording,
//            status: .closed
//        ))
//        container.mainContext.insert(Project(
//            client: "Dingus McDingerton",
//            artist: "Numbnutz",
//            projectName: "Vanity Project",
//            jobDate: Date.now,
//            notes: "Dont take too long",
//            dateOpened: lastMonth,
//            invoiced: true,
//            dateDelivered: lastWeek,
//            paid: false,
//            dateClosed: Date.distantPast,
//            items: item2,
//            mediaType: .recording,
//            status: .invoiced
//        ))
//        container.mainContext.insert(Project(
//            client: "Disney",
//            artist: "LA Phil",
//            projectName: "John Who???",
//            jobDate: Date.now,
//            notes: "",
//            dateOpened: Date.now,
//            invoiced: false,
//            paid: false,
//            items: item3,
//            mediaType: .concert,
//            status: .open
//        ))
//        container.mainContext.insert(Project(
//            client: "John C. Rilley",
//            artist: "John C Rilley",
//            projectName: "Mr. Romantic",
//            jobDate: nextWeek,
//            notes: "In Nashville",
//            dateOpened: lastWeek,
//            invoiced: false,
//            dateDelivered: Date.distantPast,
//            paid: false,
//            dateClosed: Date.distantPast,
//            items: item1,
//            mediaType: .concert,
//            status: .open
//        ))
//        container.mainContext.insert(Project(
//            client: "Blackbird Presents",
//            artist: "Willie Nelson",
//            projectName: "Willie 90",
//            jobDate: nextMonth,
//            notes: "@ Hollywood Bowl",
//            dateOpened: Date.now,
//            invoiced: false,
//            dateDelivered: Date.distantFuture,
//            paid: false,
//            dateClosed: Date.distantFuture,
//            items: item3,
//            mediaType: .concert,
//            status: .open
//        ))
//        container.mainContext.insert(Project(
//            client: "Hole",
//            artist: "Hole",
//            projectName: "Hole",
//            jobDate: lastWeek,
//            notes: "He is WIld",
//            dateOpened: lastMonth,
//            invoiced: true,
//            dateDelivered: Date.now,
//            paid: false,
//            dateClosed: Date.distantFuture,
//            items: item1,
//            mediaType: .recording,
//            status: .open
//        ))
//        
//        return container
//    }
//}

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
