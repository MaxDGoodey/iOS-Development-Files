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
                    ReadingStatsView(viewModel: viewModel)
                }

                Section("Add a Book") {
                    NewBookFields(title: $newTitle, author: $newAuthor, pageCount: $newPageCount)
                    Button("Add Book") {
                        viewModel.addBook(title: newTitle, author: newAuthor, pageCount: newPageCount)
                        
                        newTitle = ""
                        newAuthor = ""
                        newPageCount = 0
                    }
                    .disabled(!viewModel.canAdd(title: newTitle, author: newAuthor, pageCount: newPageCount))
                }

                Section("Currently Reading") {
                    ForEach(viewModel.currentlyReading) { book in
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
            .navigationTitle("Reading Log")
        }
    }
}

// This takes bindings and not the viewmodel because it doesn't need to see the viewmodel, only what the user is inputting

struct NewBookFields: View {
    @Binding var title: String
    @Binding var author: String
    @Binding var pageCount: Int
    
    var body: some View {
        TextField("Title", text: $title)
        TextField("Author", text: $author)
        Stepper("Pages: \(pageCount)", value: $pageCount, in: 0...2000, step: 10)
    }
}

// This uses viewModel because it does need to access the viewmodel data, it saves space and makes updating automatic

struct ReadingStatsView: View {
    let viewModel: ReadingLogViewModel
    
    var body: some View {
        Text("Books finished: \(viewModel.booksFinishedCount)")
        Text("Pages read: \(viewModel.pagesRead)")
    }
}

#Preview {
    ReadingLogScreen()
}

// 1. User taps the finish button
// 2. markFinished is called in the viewModel passing in book from the ForEach loop
// 3. In the viewModel it checks if the book can be finished
// 4. It changes the isFinished property to true
// 5. The computed properties currentlyReading and finishedBooks update with the new values
// 6. Because ReadingLogViewModel is observable, the viewModel passed in from ReadingLogScreen into ReadingStatsView is updated, and the Text's in ReadingStatsView update according to the new viewModel data


// averagePagesPerBook: ViewModel, similar to pages read
// .foregroundStyle(.secondary): View, only effects the view and not the data
// isLongBook(_:): ViewModel, functions should be in the viewmodel
// searchText: View, similar to the newTitle property
// showingAddBookSheet: View, only effects the view and doesn't relate to the viewModel data
// Text(book.author): View, only effects the view and not the data



// i feel like MVVM is just how little code can you write while keeping it readable, and really in general code management
