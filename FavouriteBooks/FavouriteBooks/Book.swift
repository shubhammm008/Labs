//
//  Book.swift
//  FavouriteBooks
//
//  Created by Shubham Singh on 25/08/25.
//

import Foundation
struct Book{
    var title:String
    var author:String
    var genre:String
    var length:String
}
var books: [Book] = [
    Book(title: "To Kill a Mockingbird", author: "Harper Lee", genre: "Fiction", length: "281 pages"),
    Book(title: "1984", author: "George Orwell", genre: "Dystopian", length: "328 pages"),
    Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre: "Classic", length: "180 pages"),
    Book(title: "Pride and Prejudice", author: "Jane Austen", genre: "Romance", length: "279 pages"),
    Book(title: "The Catcher in the Rye", author: "J.D. Salinger", genre: "Coming-of-age", length: "214 pages"),
    Book(title: "The Hobbit", author: "J.R.R. Tolkien", genre: "Fantasy", length: "310 pages"),
    Book(title: "Moby Dick", author: "Herman Melville", genre: "Adventure", length: "585 pages"),
    Book(title: "War and Peace", author: "Leo Tolstoy", genre: "Historical", length: "1225 pages"),
    Book(title: "The Alchemist", author: "Paulo Coelho", genre: "Philosophical", length: "208 pages"),
    Book(title: "The Da Vinci Code", author: "Dan Brown", genre: "Thriller", length: "454 pages")
]
