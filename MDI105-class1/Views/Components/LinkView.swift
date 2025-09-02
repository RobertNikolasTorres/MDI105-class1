
import SwiftUI
import Foundation

struct LinkView: View {
    let book : Book
    
    var body: some View {
        HStack{
            Image(book.image)
                .resizable()
                .frame(width: 48, height: 48)
                .scaledToFit()
            Text(book.title)
        }
    }
}
