
import SwiftUI
import Foundation

struct Book {
    let id = UUID() 
    var title: String;
    var image: String;
    var description: String;
    var author: String;
    var rating: Double;
    var review: String;
    
    var status: ReadingStatus
}

enum ReadingStatus: String {
    case planToRead = "Plan to Read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
}
