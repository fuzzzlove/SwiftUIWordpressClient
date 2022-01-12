import Foundation

struct PostHeader: Decodable, Identifiable {

    var id: Int

    let date: Date
    var title: Title
    let embedded: Embedded

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case title = "title"
        case embedded = "_embedded"
        case id = "id"
    }

}
