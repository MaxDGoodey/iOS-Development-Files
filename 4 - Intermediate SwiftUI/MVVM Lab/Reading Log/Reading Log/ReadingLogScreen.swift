//
//  ReadingLogScreen.swift
//  Reading Log
//
//  This app works, but every piece of it lives in this one file.
//  Over the three MVVM labs you will pull it apart into a Model,
//  a View and a ViewModel. Read the lab for tonight's steps.
//

import SwiftUI

struct ReadingLogScreen: View {
    // VIEWMODEL: data the view uses
    @State private var viewModel = ReadingLogViewModel()
    
    @State private var newTitle = ""
    @State private var newAuthor = ""
    @State private var newPageCount = 0

    var body: some View {
        NavigationStack {
            List {
                Section("Stats") {
                    // VIEWMODEL: view shouldnt have logic
                    Text("Books finished: \(viewModel.booksFinishedCount)")
                    // VIEWMODEL: view shouldnt have logic
                    Text("Pages read: \(viewModel.pagesRead)")
                }

                Section("Add a Book") {
                    TextField("Title", text: $newTitle)
                    TextField("Author", text: $newAuthor)
                    Stepper("Pages: \(newPageCount)", value: $newPageCount, in: 0...2000, step: 10)
                    // VIEWMODEL: the view shouldnt have logic, put this in the viewmodel as a function
                    Button("Add Book") {
                        viewModel.addBook(title: newTitle, author: newAuthor, pageCount: newPageCount)
                        
                        newTitle = ""
                        newAuthor = ""
                        newPageCount = 0
                    }
                }

                Section("Currently Reading") {
                    // VIEWMODEL: put in viewmodel to make this easier to repeat
                    ForEach(viewModel.currentlyReading) { book in
                        // VIEW: only affects the view, not the data
                        HStack {
                            VStack(alignment: .leading) {
                                Text(book.title)
                                // VIEW: only decides how this book looks
                                    .font(.headline)
                                Text("\(book.author) - \(book.pageCount) pages")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            // VIEWMODEL: also should be a func in the viewmodel
                            Button("Finish") {
                                viewModel.markFinished(book)
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }

                Section("Finished") {
                    ForEach(viewModel.finishedBooks) { book in
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                            Text("\(book.author) - \(book.pageCount) pages")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            // VIEW: only effects the view not the data
            .navigationTitle("Reading Log")
        }
    }
}

#Preview {
    ReadingLogScreen()
}

// 4, you would have to fix all of them
// The lines inside stats, they wouldn't need to
// With MVVM, the person moving the stats would only look at the view, and the person changing the rule would only look at the model. without MVVM they might conflict and cause issues
// moving logic out of a view makes it easier to change because you dont have to sort through any views to get to it, you can just access it directly.

// ReadingLogViewModel
// var books, holds every book you want, finished or not
// var unfinishedBooks, an array of every book you havent finished
// var finishedBooks, an array of every book you finished
// var finishedBooksCount, a int telling you how many books you finished
// var pagesRead, a int telling you how many pages youve read by reading finishedBooks
// func addBook, adds a book to the books array and unfinishedBooks array
// func finishBook, adds a book to the finishedBooks array and removes it from the unfinishedBooks array
