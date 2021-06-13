import Foundation

public struct WebResource {
    let data: Data
    let mimeType: String
    let urlString: String
    let frameName: String?
    let textEncodingName: String?

    var url: URL? {
        URL(string: urlString)
    }
}

extension WebResource: Codable {
    enum CodingKeys: String, CodingKey {
        case data = "WebResourceData"
        case mimeType = "WebResourceMIMEType"
        case urlString = "WebResourceURL"
        case frameName = "WebResourceFrameName"
        case textEncodingName = "WebResourceTextEncodingName"
    }
}
