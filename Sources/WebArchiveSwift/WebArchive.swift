import Foundation

public struct WebArchive {
    let mainResource: WebResource
    let subresources: [WebResource]?
    let subframeArchives: [WebArchive]?
}

extension WebArchive: Codable {
    enum CodingKeys: String, CodingKey {
        case mainResource = "WebMainResource"
        case subresources = "WebSubresources"
        case subframeArchives = "WebSubframeArchives"
    }
}
