//
//  MangaObject.swift
//  Aidoku
//
//  Created by Skitty on 1/27/22.
//

import Foundation
import CoreData

@objc(MangaObject)
public class MangaObject: NSManagedObject {
    func load(from manga: Manga) {
        id = manga.id
        sourceId = manga.sourceId
        title = manga.title ?? "No title"
        author = manga.author
        artist = manga.artist
        desc = manga.description
        tags = manga.tags ?? []
        status = Int16(manga.status.rawValue)
        cover = manga.cover ?? ""
        nsfw = false
        viewer = Int16(manga.viewer.rawValue)
    }
    
    func toManga() -> Manga {
        Manga(
            sourceId: sourceId,
            id: id,
            title: title,
            author: author,
            artist: artist,
            description: desc,
            tags: tags ?? [],
            status: MangaStatus(rawValue: Int(status)) ?? .unknown,
            cover: cover,
            viewer: MangaViewer(rawValue: Int(viewer)) ?? .rtl
        )
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        favorite = false
        lastUpdate = Date()
        flags = 0
    }
}

extension MangaObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MangaObject> {
        return NSFetchRequest<MangaObject>(entityName: "Manga")
    }
    
    @NSManaged public var id: String
    @NSManaged public var sourceId: String
    @NSManaged public var title: String
    @NSManaged public var author: String?
    @NSManaged public var artist: String?
    @NSManaged public var desc: String?
    @NSManaged public var tags: [String]?
    @NSManaged public var status: Int16
    @NSManaged public var cover: String
    @NSManaged public var nsfw: Bool
    
    @NSManaged public var favorite: Bool
    
    @NSManaged public var lastUpdate: Date
    
    @NSManaged public var viewer: Int16
    @NSManaged public var flags: Int16
    
    @NSManaged public var libraryObject: LibraryMangaObject?
    @NSManaged public var chapters: NSSet?

}

// MARK: Generated accessors for chapters
extension MangaObject {

    @objc(addChaptersObject:)
    @NSManaged public func addToChapters(_ value: ChapterObject)

    @objc(removeChaptersObject:)
    @NSManaged public func removeFromChapters(_ value: ChapterObject)

    @objc(addChapters:)
    @NSManaged public func addToChapters(_ values: NSSet)

    @objc(removeChapters:)
    @NSManaged public func removeFromChapters(_ values: NSSet)

}

extension MangaObject : Identifiable {

}