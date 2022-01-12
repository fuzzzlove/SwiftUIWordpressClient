import Foundation

extension Date {

    var dateWithoutTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM, yyyy"
        return dateFormatter.string(from: self)
    }

}
