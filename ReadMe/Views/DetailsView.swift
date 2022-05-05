//
//  DetailsView.swift
//  ReadMe
//
//  Created by Tomek Rusilko on 29/04/2022.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct DetailsView: View {
  @ObservedObject var book: Book
  @EnvironmentObject var library: Library
  
  var body: some View {
    VStack(alignment: .center) {
      HStack(spacing: 16) {
        Button {
          book.readMe.toggle()
        } label: {
          Image(systemName: book.readMe ? "bookmark.fill" : "bookmark")
            .font(.system(size: 48, weight: .light))
        }
        TitleAndAuthorStack(book: book)
      }
      ReviewAndImageStack(book: book, image: $library.images[book])
    }
  }
}


struct ReviewAndImageStack: View {
  @ObservedObject var book: Book
  @Binding var image: Image?
  @State var showImagePicker = false
  @State var showDeleteDialog = false
  
  var body: some View {
    VStack {
      TextField("Review", text: $book.microReview)
      Book.Image(image: image, title: book.title, size: 200, cornerRadius: 12.0).scaledToFill()
      HStack {
        if image != nil {
          Spacer()
          Button("Delete Image") {
            self.showDeleteDialog = true
          }
        }
        Spacer()
        Button("Update Image…") {
          self.showImagePicker = true
        }
        Spacer()
      }.padding()
    }
    .sheet(isPresented: $showImagePicker) {
      PHPickerViewController.View(image: $image)
    }
    .confirmationDialog("Delete image for \(book.title)", isPresented: $showDeleteDialog) {
      Button("Delete", role: .destructive) { image = nil }
    } message: {
      Text("Delete image for \(book.title)")
    }
    .padding()
    Spacer()
  }
}


struct DetailsView_Previews: PreviewProvider {
  static var previews: some View {
    DetailsView(book: Book.init())
      .environmentObject(Library())
      .previewInAllColorSchemes
  }
}
