import Foundation

struct Post: Decodable, Identifiable {

    var id: Int

    let date: Date
    var title: Title
    let content: Content
    let embedded: Embedded

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case title = "title"
        case content = "content"
        case embedded = "_embedded"
        case id = "id"
    }

}
