//
//  YoutubeSearchResponse.swift
//  TV Story Board
//
//  Created by Sayat Amanzhol on 17.09.2026.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [ItemProperties]?
}

struct ItemProperties: Codable {
    let id: IdProperties
}

struct IdProperties: Codable {
    let videoId: String?
}
