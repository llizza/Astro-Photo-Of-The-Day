//
//  URLHelper.swift
//  AstroPhoto
//
//  Created by Елизавета Матвеева on 16.03.2024.
//

import Foundation

extension URL{
    func withQuery(_ query: [String :String]) -> URL?{
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = query.map { URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}
