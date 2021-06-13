# WebArchiveSwift

WebKit uses WebArchive to represent a webpage that can be archived. iOS and macOS apps use this type extensively to share rich text
via Pasteboard. For some time you could use WebArchive class on macOS until it was deprecated. On iOS it wasn't available.
This package allows you to decode or encode the archive and use it in your application.

## What is WebArchive

> A WebArchive object represents a webpage that can be archived—for example, archived on disk or on the pasteboard. A WebArchive object contains the main resource, as well as the subresources and subframes of the main resource. The main resource can be an entire webpage, a portion of a webpage, or some other kind of data such as an image. Use this class to archive webpages, or place a portion of a webpage on the pasteboard, or to represent rich web content in any application.
> – [From documentation](https://developer.apple.com/documentation/webkit/webarchive/)

## Other Projects And Documentation

- [DTWebArchive - WebArchive in Objective-C](https://github.com/Cocoanetics/DTWebArchive)
- [WebArchive in Python](https://github.com/rcarmo/python-webarchive)
- [Deprecated WebArchive object documentation](https://developer.apple.com/documentation/webkit/webarchive/)
