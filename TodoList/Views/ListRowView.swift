//
//  ListRowView.swift
//  TodoList
//
//  Created by Badruddin Tasnim on 5/2/26.
//

internal import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .primary)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .fontWeight(.regular)
        .padding(.vertical, 4)
//        .background(Color.red)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListRowView(item: ItemModel(title: "This is the first item", isCompleted: false))
    
}

#Preview(traits: .sizeThatFitsLayout) {
    ListRowView(item: ItemModel(title: "This is the second item", isCompleted: true))
}
