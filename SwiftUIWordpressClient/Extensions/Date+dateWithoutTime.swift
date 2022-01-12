import Foundation

extension Date {

    var formattedDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM, yyyy"
        return dateFormatter.string(from: self)
    }

}
