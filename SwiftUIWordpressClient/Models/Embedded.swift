import Foundation

struct Embedded: Decodable {

    let medias: [WpFeaturedMedia]?

    enum CodingKeys: String, CodingKey {
        case medias = "wp:featuredmedia"
    }

}
