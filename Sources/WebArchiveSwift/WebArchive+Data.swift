import Foundation

public extension WebArchive {
    init(data: Data) throws {
        let decoder = PropertyListDecoder()
        var format: PropertyListSerialization.PropertyListFormat = .binary
        self = try decoder.decode(WebArchive.self, from: data, format: &format)
    }

    func makeData() throws -> Data {
        let encoder = PropertyListEncoder()
        return try encoder.encode(self)
    }
}
