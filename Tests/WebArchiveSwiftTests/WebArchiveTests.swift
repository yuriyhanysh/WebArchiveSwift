import XCTest
@testable import WebArchiveSwift

final class WebArchiveTests: XCTestCase {
    func testCanUnarchiveFileCreatedWithSafari() throws {
        let data = try XCTUnwrap(loadArchive(forResource: "Resources/Safari"))
        let actual = try WebArchive(data: data)

        XCTAssertEqual(actual.mainResource.data.count, 52643)
        XCTAssertEqual(actual.mainResource.mimeType, "text/html")
        XCTAssertEqual(actual.mainResource.textEncodingName, "UTF-8")
        XCTAssertEqual(actual.subresources?.count, 25)
        XCTAssertNil(actual.subframeArchives)
    }

    func testCanUnarchiveFilePastedFromNotes() throws {
        let data = try XCTUnwrap(loadArchive(forResource: "Resources/Notes"))
        let actual = try WebArchive(data: data)

        XCTAssertEqual(actual.mainResource.data.count, 2563)
        XCTAssertEqual(actual.mainResource.mimeType, "text/html")
        XCTAssertEqual(actual.mainResource.textEncodingName, "UTF-8")
        XCTAssertEqual(actual.mainResource.urlString, "file:///index.html")
        XCTAssertEqual(actual.subresources?.count, 1)
        XCTAssertEqual(actual.subresources?[0].mimeType, "image/jpeg")
        XCTAssertNil(actual.subframeArchives)
    }
    
    func testCanArchiveAndUnarchive() throws {
        let data = try XCTUnwrap(loadArchive(forResource: "Resources/Notes"))
        let webarchive = try WebArchive(data: data)
        
        let newData = try webarchive.makeData()
        let newWebarchive = try WebArchive(data: newData)
        
        XCTAssertEqual(webarchive.mainResource.data.count, newWebarchive.mainResource.data.count)
        XCTAssertEqual(webarchive.mainResource.mimeType, newWebarchive.mainResource.mimeType)
        XCTAssertEqual(webarchive.mainResource.textEncodingName, newWebarchive.mainResource.textEncodingName)
        XCTAssertEqual(webarchive.mainResource.urlString, newWebarchive.mainResource.urlString)
        XCTAssertEqual(webarchive.subresources?.count, newWebarchive.subresources?.count)
        XCTAssertEqual(webarchive.subresources?[0].mimeType, newWebarchive.subresources?[0].mimeType)
    }

    private func loadArchive(forResource resource: String) -> Data? {
        Bundle.module.url(forResource: resource, withExtension: "webarchive").flatMap { try? Data(contentsOf: $0) }
    }
}
