import Foundation

struct WPFeaturedMedia: Decodable {

    let sourceURLString: String

    var url: URL? {
        .init(string: sourceURLString)
    }

    enum CodingKeys: String, CodingKey {
        case sourceURLString = "source_url"
    }

}
