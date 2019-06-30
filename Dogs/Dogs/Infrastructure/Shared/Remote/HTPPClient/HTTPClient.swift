//
//  HTTPClient.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol HTTPClient {
    func request<T>(_ remote: RemoteAddress, httpMethod: HTTPMethod, with queryParameters: [String: String]?, headers: [String: String]?, body: [String: Any]?) throws -> T? where T: Decodable
}
