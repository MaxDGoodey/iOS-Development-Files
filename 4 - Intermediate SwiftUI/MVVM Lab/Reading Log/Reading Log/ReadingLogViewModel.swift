//
//  ReadingLogViewModel.swift
//  Reading Log
//
//  Created by Max Goodey on 11/3/26.
//
import SwiftUI

// Nothing appears to happen. In reality, the data is changing, but none of the views change when the data changes

@Observable
class ReadingLogViewModel {
    var books: [Book] = [
        Book(title: "Hatchet", author: "Gary Paulsen", pageCount: 195, isFinished: true),
        Book(title: "The Hobbit", author: "J.R.R. Tolkien", pageCount: 310, isFinished: false),
        Book(title: "Holes", author: "Louis Sachar", pageCount: 233, isFinished: true),
        Book(title: "Ender's Game", author: "Orson Scott Card", pageCount: 324, isFinished: false)
    ]
    
    var currentlyReading: [Book] {
        books.filter( { !$0.isFinished} )
    }
    var finishedBooks: [Book] {
        books.filter( { $0.isFinished} )
    }
    var booksFinishedCount: Int {
        currentlyReading.count
    }
    var pagesRead: Int {
        finishedBooks.reduce(0) {$0 + $1.pageCount}
    }
    
    func addBook(title: String, author: String, pageCount: Int) {
        let newBook = Book(title: title, author: author, pageCount: pageCount, isFinished: false)
        books.append(newBook)
    }
    
    func markFinished(_ book: Book) {
        if let index = books.firstIndex(where: { $0.id == book.id }) {
            books[index].isFinished = true
        }
    }
    
    func canAdd(title: String, author: String, pageCount: Int) -> Bool {
        let isDuplicate = books.contains(where: { $0.title.lowercased() == title.lowercased() })
        
        if title.isEmpty {
            return false
        }
        
        if author.isEmpty {
            return false
        }
        
        if pageCount <= 0 {
            return false
        }
        
        if isDuplicate {
            return false
        }
        
        return true
    }
}
