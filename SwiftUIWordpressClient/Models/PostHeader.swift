import Foundation

struct PostHeader: Decodable, Identifiable {

    let id: Int

    let date: Date
    let title: Title
    let embedded: Embedded

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case title = "title"
        case embedded = "_embedded"
        case id = "id"
    }

}
