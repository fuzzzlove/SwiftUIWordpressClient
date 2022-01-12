import Foundation

private let urlString = Bundle.main.object(forInfoDictionaryKey: "API_URL") as! String

extension URL {

    static func makeEndpointURL(relativePath: String) -> URL? {
        URL(string: urlString + relativePath)
    }

}
