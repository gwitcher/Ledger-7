//
//  ProjectEntryView.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/27/25.
//

import SwiftUI
import SwiftData
import SwiftUIFontIcon


struct ProjectEntryView: View {
    
    var project: Project
    
    var body: some View {
        HStack(spacing: 20){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
            //.fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: .music), fontsize: 24, color: Color.green)
                }
            VStack(alignment: .leading, spacing: 6) {
                
                Text(project.client)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                Text(project.projectName)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                Text(project.jobDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
            }
        }
    }
}

#Preview {
    ProjectEntryView(project: Project(client: "Dummy", artist: "Dummy", projectName: "Dummy"))
    
}
