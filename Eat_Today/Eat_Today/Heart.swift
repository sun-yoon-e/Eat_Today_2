import UIKit

struct Heart {
    var name: String?
    var review: String?
    var rating: Int
    
    init(name: String?, review: String?, rating: Int) {
        self.name = name
        self.review = review
        self.rating = rating
    }
}
