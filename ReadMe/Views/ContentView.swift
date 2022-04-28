//
//  ContentView.swift
//  ReadMe
//
//  Created by tomek on 27/04/2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    HStack {
      Book.Image(title: Book().title)
      Text("Hello, world!")
        .font(.title2)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
  }
}
