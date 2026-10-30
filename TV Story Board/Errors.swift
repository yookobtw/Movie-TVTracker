//
//  Errors.swift
//  TV Story Board
//
//  Created by Sayat Amanzhol on 22.06.2026.
//

import Foundation

enum APIConfigError: Error, LocalizedError {
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "File not found."
        case .dataLoadingFailed(underlyingError: let error):
            return "Data loading failed: \(error.localizedDescription)."
        case .decodingFailed(underlyingError: let error):
            return "Decoding failed: \(error.localizedDescription)."
        }
    }
}

enum NetworkError: Error, LocalizedError {
    case badURLResponse(underlyingError: Error)
    case missingConfig
    case urlBuildFailed
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(underlyingError: let error):
            return "Bad URL response: \(error.localizedDescription)."
        case .missingConfig:
            return "Missing API configuration. Copy APIConfig.example.json to TV Story Board/APIConfig.json and add your keys."
        case .urlBuildFailed:
            return "Failed to build URL"
        }
    }
}
