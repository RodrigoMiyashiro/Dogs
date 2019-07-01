//
//  DefaultHTTPClient.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class DefaultHTTPClient: HTTPClient {
    func request<T>(_ remote: RemoteAddress, httpMethod: HTTPMethod, with queryParameters: [String : String]? = nil, headers: [String : String]? = nil, body: [String : Any]? = nil) throws -> T? where T : Decodable {
        let urlComponents = remote.urlComponets(parameters: queryParameters)

        guard let remoteURL = urlComponents.url else {
            throw HTTPError.requestError("Could not create remote URL")
        }

        var request = URLRequest(url: remoteURL)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = self.createBody(body)

        let semaphoro = DispatchSemaphore(value: 0)
        let session = URLSession(configuration: URLSessionConfiguration.default)

        var responseData: T?
        var responseError: Error?

        session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                responseError = error
                semaphoro.signal()
                return
            }

            guard let jsonData = data else {
                semaphoro.signal()
                return
            }

            let decoder = JSONDecoder()
            responseData = try? decoder.decode(T.self, from: jsonData)

            semaphoro.signal()
        }.resume()

        semaphoro.wait()

        if let _ = responseError {
            throw HTTPError.requestError("There was an error with the resquest")
        }

        return responseData
    }

    private func createBody(_ params: [String: Any]?) -> Data? {
        guard let params = params else {
            return nil
        }

        let postData = try? JSONSerialization.data(withJSONObject: params, options: [])

        return postData
    }
}
