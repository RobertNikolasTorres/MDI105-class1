//
//  EditView.swift
//  MDI105-class1
//
//  Created by Robert Nikolas Torres on 8/17/25.
//

import SwiftUI

struct AddEditView: View {
    
    @Binding var book: Book
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var navigationTitle: String

    init(book: Binding<Book>) {
        self._book = book
        
        self._navigationTitle = State(initialValue: book.wrappedValue.title.isEmpty ? "Add Book" : "Edit Book")
    }

        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("Book Details")) {
                        TextField("Title", text: $book.title)
                        TextField("Author", text: $book.author)
                        Picker("Status", selection: $book.status) {
                            ForEach(ReadingStatus.allCases, id: \.self) {
                                status in
                                Text(status.rawValue).tag(status)
                            }
                        }
                        TextEditor(text: $book.description)
                            .frame(height: 150)
                    }
                    
                    Section(header: Text("Rating & Review")) {
                        StarRatingView(rating: $book.rating)
                        TextEditor(text: $book.review)
                            .frame(height: 150)
                            
                    }
                }
                .navigationTitle(navigationTitle)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Close") { dismiss() }
                    }
                }
                
            }
        Text("Edit View")
    }
}

#Preview {
    ContentView()
}
