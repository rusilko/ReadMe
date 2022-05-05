//
//  ContentView.swift
//  ReadMe
//
//  Created by tomek on 27/04/2022.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var library: Library
  @State var showAddBookView = false
  
  var body: some View {
    NavigationView {
      List {
        Button {
          self.showAddBookView = true
        } label: {
          Spacer()
          VStack(spacing: 6) {
            Image(systemName: "book.circle")
              .font(.system(size: 40))
            Text("Add New Book")
              .font(.title2)
          }
            Spacer()
        }
        .buttonStyle(.borderless)
        .padding(.vertical, 8)

        ForEach(library.sortedBooks) { book in
          BookRow(book: book)
            .listRowSeparator(.hidden)
        }
      }
      .navigationTitle("My Library")
    }
    .sheet(isPresented: $showAddBookView, content: AddBookView.init)
  }
}

struct BookRow: View {
  @ObservedObject var book: Book
  @EnvironmentObject var library: Library
  
  var body: some View {
    NavigationLink(destination: DetailsView(book: book)) {
      HStack {
        Book.Image(image: library.images[book], title: book.title, size: 80, cornerRadius: 12.0)
        VStack(alignment: .leading) {
          TitleAndAuthorStack(book: book)
            .lineLimit(1)
          Text(book.microReview).lineLimit(1)
        }
      }
      .padding(.vertical)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(Library())
      .previewInAllColorSchemes
  }
}
