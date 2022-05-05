import SwiftUI

extension Book {
  struct Image: View {
    let image: SwiftUI.Image?
    let title: String
    let size: CGFloat?
    let cornerRadius: CGFloat
    
    var body: some View {
      if let image = image {
        image
          .resizable()
          .scaledToFill()
          .frame(width: size, height: size, alignment: .leading)
          .cornerRadius(cornerRadius)
      } else {
        SwiftUI.Image(systemName: self.symbolName())
          .resizable()
          .scaledToFit()
          .frame(width: size, height: size)
          .font(.title.weight(.light))
          .foregroundColor(.secondary.opacity(0.5))
      }
    }
  }
}
 
extension Book.Image {
  func symbolName() -> String {
    if let character = title.first,
       case let symbolName = "\(character.lowercased()).square",
       let _ = UIImage(systemName: symbolName) {
      return symbolName
    }
    else {
      return "book.closed.fill"
    }
  }
}
 
extension Book.Image {
  /// A preview image.
  init(title: String) {
    self.init(image: nil, title: title, size: 80.0, cornerRadius: .init())
  }
}

struct TitleAndAuthorStack: View {
  let book: Book
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(book.title)
        .font(.title2)
      Text(book.author)
        .font(.body)
        .foregroundColor(.secondary)
    }
  }
}

extension View {
  var previewInAllColorSchemes: some View {
    ForEach(
      ColorScheme.allCases, id: \.self,
      content: preferredColorScheme
    )
  }
  
  var previewInAllColorSchemes2: some View {
    ForEach(
      ColorScheme.allCases, id: \.self,
      content: { scheme in
        self.preferredColorScheme(scheme)
      }
    )
  }
  
  var previewInAllColorSchemes3: some View {
    ForEach(
      ColorScheme.allCases, id: \.self,
      content: { self.preferredColorScheme($0) }
    )
  }
  
  var previewInAllColorSchemes4: some View {
    ForEach(ColorScheme.allCases, id: \.self) { preferredColorScheme($0)
    }
  }
  
  var previewInAllColorSchemes5: some View {
    ForEach(ColorScheme.allCases, id: \.self) { scheme in  preferredColorScheme(scheme)
    }
  }
}

struct Book_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      Book.Image(title: Book().title)
      Book.Image(title: "")
      Book.Image(title: "📕")
    }.previewInAllColorSchemes
  }
}
