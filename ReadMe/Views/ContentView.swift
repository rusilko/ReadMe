//
//  ContentView.swift
//  ReadMe
//
//  Created by tomek on 27/04/2022.
//

import SwiftUI

struct ContentView: View {
  @State var library: Library = Library()
  
  var body: some View {
    NavigationView {
      List(library.sortedBooks, id: \.self) { book in
        BookRow(book: book, image: $library.images[book])
          .listRowSeparator(.hidden)
      }
      .navigationTitle("My Library")
    }
  }
}

struct BookRow: View {
  let book: Book
  @Binding var image: Image?
  
  var body: some View {
    NavigationLink(destination: DetailsView(book: book, image: $image)) {
      HStack {
        Book.Image(image: image, title: book.title, size: 80, cornerRadius: 12.0)
        TitleAndAuthorStack(book: book)
          .lineLimit(1)
      }
      .padding(.vertical)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
  }
}
