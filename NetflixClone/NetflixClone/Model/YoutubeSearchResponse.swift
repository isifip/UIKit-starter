//
//  YoutubeSearchResult.swift
//  NetflixClone
//
//  Created by Irakli Sokhaneishvili on 19.02.22.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: idVideoElement
}

struct idVideoElement: Codable {
    let kind: String
    let videoId: String
}
