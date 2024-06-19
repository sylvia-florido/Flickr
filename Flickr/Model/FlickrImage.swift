//
//  FlickrImage.swift
//  Flickr
//
//  Created by Silvia Florido on 18/06/24.
//

import Foundation

struct FlickrImage: Hashable, Decodable {
    let title: String
    let imageUrl: String
    let description: String?
    let author: String?
    let published: String?
    
    enum CodingKeys: String, CodingKey {
        case title, media, description, author, published
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        let media = try container.decode(Media.self, forKey: .media)
        self.imageUrl = media.m
        self.description = try container.decode(String.self, forKey: .description)
        self.author = try container.decode(String.self, forKey: .author)
        self.published = try container.decode(String.self, forKey: .published)
    }
    
    init(title: String, imageUrl: String, description: String?, author: String?, published: String?) {
        self.title = title
        self.imageUrl = imageUrl
        self.description = description
        self.author = author
        self.published = published
    }
    
    struct Media: Decodable {
        let m:  String
    }
    
    // MARK: - Preview helper
    static func exampleImage() -> FlickrImage {
        FlickrImage(title: "Porcupine", 
                    imageUrl: "https://live.staticflickr.com/65535/53799931021_2b5369121d_m.jpg",
                    description: " <p><a href=\"https://www.flickr.com/people/future-echoes/\">Future-Echoes</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/future-echoes/53799931021/\" title=\"Porcupine\"><img src=\"https://live.staticflickr.com/65535/53799931021_2b5369121d_m.jpg\" width=\"240\" height=\"160\" alt=\"Porcupine\" /></a></p> <p>London Zoo, London, England - 2nd June, 2013</p> ",
                    author:"nobody@flickr.com (\"Future-Echoes\")",
                    published:"2024-06-18T15:12:49Z")
    }
}

struct FlickrImagesList: Hashable, Decodable {
    let title: String
    let link: String
    let items: [FlickrImage]
    
    static func exampleList() -> FlickrImagesList {
        return FlickrImagesList(title: "Test List",
                                link: "",
                                items: [FlickrImage.exampleImage()])
    }
    
}
