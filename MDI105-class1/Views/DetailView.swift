
import SwiftUI

struct DetailView: View {
    @Binding var book: Book
    
    @State private var showingEditSheet = false
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white.opacity(0.1), .red.opacity(0.9)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    HStack{
                        Image(book.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                            .cornerRadius(40)

                    }
                    
                    Text(book.title)
                        .font(.system(size: 30, weight: .bold))
                    
                    Text(" by \(String(describing: book.author))")
                        .font(.headline).foregroundColor(.secondary)
                    
                    if !book.description.isEmpty {
                        VStack(alignment: .leading) {
                            Text(book.description)
                        }
                    }
                    
                    
                    HStack{
                        Spacer()
                        ForEach(1...5, id: \.self) { count in
                            Image(systemName: count <= book.rating ?
                                  "star.fill" : "star")
                        }
                        Spacer()
                        


                    }
                    .accessibilityLabel(" \(book.rating) out of 5 stars")
                    

                    
                    Text(book.status.rawValue)
                        .font(.system(size: 18, weight: .bold))
                        .padding(.top)
                    
                    
                    Button(action: {
                        // ACTION HERE
                    }) {
                        Text("Order Now")
                            .background(Color.black)
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .semibold))
                            .cornerRadius(5)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .padding()
                }
                .padding()
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Edit") { showingEditSheet = true}
                        .foregroundColor(.red)
                }
            }
            .sheet(isPresented: $showingEditSheet) {
                EditView(book: $book)
            }
        }
    }
}

#Preview {
    ContentView()
}
