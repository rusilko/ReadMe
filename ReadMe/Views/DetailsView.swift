//
//  DetailsView.swift
//  ReadMe
//
//  Created by Tomek Rusilko on 29/04/2022.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct DetailsView: View {
  let book: Book
  @State var showImagePicker = false
  @Binding var image: Image?
  
  var body: some View {
    VStack(alignment: .leading) {
      TitleAndAuthorStack(book: book)
      VStack {
        Book.Image(image: image, title: book.title, size: 200, cornerRadius: 12.0).scaledToFill()
        Button("Update Image…") {
          self.showImagePicker = true
        }
      }
      Spacer()
    }
    .padding()
    .sheet(isPresented: $showImagePicker) {
      PHPickerViewController.View(image: $image)
    }
    
  }
}

struct DetailsView_Previews: PreviewProvider {
  static var previews: some View {
    DetailsView(book: Book.init(), image: .constant(nil))
  }
}
