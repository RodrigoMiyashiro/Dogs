//
//  DefaultBreedSummaryProvider.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class DefaultBreedSummaryProvider: BreedProvider, RemoteProvider, SessionReaderReceiver {
    private let client: HTTPClient
    private var persist: SessionReaderExecutor?
    private var token: String = ""

    init(client: HTTPClient) {
        self.client = client
        self.getToken()
    }

    func breed(_ category: String) throws -> Breed? {
        let path = "/feed"
        let url = self.baseRemoteAddess().appendedPath(path)
        let parameterHeader = ["Content-Type": "application/json",
                               "Authorization": self.token]
        let parameter = ["category": category]
 
        guard let breed: Breed = try self.client.request(url,
                                                         httpMethod: .GET,
                                                         with: parameter,
                                                         headers: parameterHeader,
                                                         body: nil) else {
            throw BreedProviderError.errorObtainingBreed
        }

        return breed
    }

    private func getToken() {
        self.persist = DefaultSessionReaderExecutor(receiver: self)
        self.persist?.performLoadToken()
    }

    func dealWithTokenLoadedSuccessfully(_ token: String?) {
        self.token = token ?? ""
    }
    
    func dealWithTokenLoadedFailure() {
        print("🕵️‍♂️ Error get token")
    }
}
