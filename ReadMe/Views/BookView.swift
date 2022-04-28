import SwiftUI

extension Book {
  struct Image: View {
    let title: String
    private let symbolName: String
    
    init(title: String) {
      self.title = title
      
      if let character = title.first,
         case let symbolName = "\(character.lowercased()).square",
         let _ = UIImage(systemName: symbolName) {
        
        self.symbolName = symbolName
      }
      else {
        self.symbolName = "book.closed.fill"
      }
      
    }
    
    var body: some View {
      SwiftUI.Image(systemName: symbolName)
        .resizable()
        .scaledToFit()
        .frame(width: 80, height: 80)
        .font(.title.weight(.light))
        .foregroundColor(.secondary.opacity(0.5))
    }
  }
}

struct Book_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      Book.Image(title: Book().title)
      Book.Image(title: "")
      Book.Image(title: "📕")
    }
  }
}
