import Foundation

extension String {

    func strippingHTMLTags() -> String {
        let regex = try! NSRegularExpression(pattern: "<.*?>", options: NSRegularExpression.Options.caseInsensitive)
        let range = NSMakeRange(0, count)
        return regex.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions(), range: range , withTemplate: "")
    }

}
