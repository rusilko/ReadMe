//
//  AddBookView.swift
//  ReadMe
//
//  Created by tomek on 05/05/2022.
//

import SwiftUI

struct AddBookView: View {
  @ObservedObject var book: Book = .init()
  @State var image: Image? = nil
  @EnvironmentObject var library: Library
  
  var body: some View {
    NavigationView {
      VStack() {
        TextField("Title", text: $book.title)
        TextField("Author", text: $book.author)
        ReviewAndImageStack(book: book, image: $image)
      }
      .padding()
      .navigationBarTitle("Got a new book?")
      .toolbar {
        ToolbarItem(placement: .status) {
          Button("Add to Library") {
            library.addBook(book, image: image)
            
          }
        }
      }
    }
  }
}

struct AddBookView_Previews: PreviewProvider {
  static var previews: some View {
    AddBookView()
      .environmentObject(Library())
      .previewInAllColorSchemes
  }
}
