//
//  DefaultPerformLoginApplier.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class DefaultPerformLoginApplier: PerformLoginProvider, RemoteProvider {
    private let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func login(with email: String) throws -> User? {
        let path = "/signup"
        let url = self.baseRemoteAddess().appendedPath(path)
        let parameterHeader = ["Content-Type": "application/json"]
        let parameterBody = ["email": email]

        guard let user: User = try self.client.request(url,
                                                       httpMethod: .POST,
                                                       with: nil,
                                                       headers: parameterHeader,
                                                       body: parameterBody) else {
            throw PerformLoginProviderError.errorPerformingLogin
        }

        return user
    }
}
