import Foundation

struct Title: Decodable {

    private let rendered: String

    var text: String {
        rendered.strippingHTMLTags()
    }

}

