import UIKit

struct Heart {
    var review: String?
    var rating: Int
    
    init(review: String?, rating: Int) {
        self.review = review
        self.rating = rating
    }
}
