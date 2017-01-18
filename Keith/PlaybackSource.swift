//
//  PlaybackSource.swift
//  Keith
//
//  Created by Rafael Alencar on 16/01/17.
//  Copyright © 2017 Movile. All rights reserved.
//

import Foundation
import MobileCoreServices
import MediaPlayer

public struct PlaybackSource {
    
    public struct NowPlayingInfo {
        public let title: String
        public let albumTitle: String
        public let artist: String
        public let artworkUrl: URL?
        
        public init(title: String, albumTitle: String, artist: String, artworkUrl: URL?) {
            self.title = title
            self.albumTitle = albumTitle
            self.artist = artist
            self.artworkUrl = artworkUrl
        }
    }
    
    public enum `Type` {
        case audio(nowPlayingInfo: NowPlayingInfo)
        case video
        
        var uti: String {
            switch self {
            case .audio:
                return kUTTypeMP3 as String
                
            case .video:
                return kUTTypeMPEG4 as String
            }
        }
    }
    
    public enum Source {
        case local
        case remote
    }
    
    public let url: URL
    public let type: Type
    public let source: Source
    
    public init(url: URL, type: Type, source: Source) {
        self.url = url
        self.type = type
        self.source = source
    }
}
