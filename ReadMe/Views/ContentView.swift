//
//  ContentView.swift
//  ReadMe
//
//  Created by tomek on 27/04/2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    List(Library().sortedBooks, id: \.title) { book in
      VStack {
        BookRow(book: book)
      }
    }
  }
}

struct BookRow: View {
  let book: Book
  
  var body: some View {
    HStack {
      Book.Image(title: book.title)
      VStack(alignment: .leading) {
        Text(book.title)
          .font(.title2)
        Text(book.author)
          .font(.body)
          .foregroundColor(.secondary)
      }
      .lineLimit(1)
    }
    .padding(.vertical)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
  }
}
