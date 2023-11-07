//
//  NetworkManager.swift
//  BooksApp
//
//  Created by anduser on 06.11.2023.
//

import Firebase
import FirebaseRemoteConfig

protocol NetworkManagerProtocol {
    func fetchContentFromFirebase(completion: @escaping (Result<Response, Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    
    func fetchContentFromFirebase(completion: @escaping (Result<Response, Error>) -> Void) {
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        
        remoteConfig.configSettings = settings
        
        remoteConfig.fetch { status, error in
            if status == .success {
                remoteConfig.activate { _, _ in
                    if let jsonDataString = remoteConfig.configValue(forKey: Constants.Keys.jsonKey).stringValue,
                       let jsonData = jsonDataString.data(using: .utf8) {
                        do {
                            let content = try JSONDecoder().decode(Response.self, from: jsonData)
                            completion(.success(content))
                        } catch {
                            Crashlytics.crashlytics().record(error: error)
                            completion(.failure(error))
                        }
                    } else {
                        completion(.failure(NetworkError.dataNotFound))
                    }
                }
            } else {
                completion(.failure(error ?? NetworkError.invalidResponse))
            }
        }
    }
}

enum NetworkError: Error {
    case decodingFailed
    case dataNotFound
    case invalidResponse
}


