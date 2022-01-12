import Foundation

struct Embedded: Decodable {

    let medias: [WPFeaturedMedia]?

    enum CodingKeys: String, CodingKey {
        case medias = "wp:featuredmedia"
    }

}
