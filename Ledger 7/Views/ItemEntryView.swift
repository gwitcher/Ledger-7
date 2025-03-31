//
//  ItemEntryView.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/30/25.
//

import SwiftUI
import SwiftData
import SwiftUIFontIcon


struct ItemEntryView: View {
    
    var item: Item

    var body: some View {
        HStack(spacing: 20){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
            //.fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: .music), fontsize: 24, color: Color.green)
                }
            VStack(alignment: .leading, spacing: 6) {
                
                Text(item.itemName)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                Text(item.itemType.rawValue)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
            }
            Spacer()
            
            Text("$\(item.fee.formatted(.number.precision(.fractionLength(2))))")
                .font(.subheadline)
                .fontWeight(.heavy)
                .lineLimit(1)
        }
        .padding()
    }
}

#Preview {
    ItemEntryView(item: Item(itemName: "Sample Item", itemType: .arrangement, fee: 200.00))
}
