//
//  RemoteProvider.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

private let remoteAddress = RemoteAddress(scheme: "https",
                                         host: "api-iddog.idwall.co")

protocol RemoteProvider { }

extension RemoteProvider {
    func baseRemoteAddess() -> RemoteAddress {
        return remoteAddress
    }
}
