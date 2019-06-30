//
//  SessionReaderReceiver.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol SessionReaderReceiver: AnyObject {
    func dealWithTokenLoadedSuccessfully(_ token: String?)
    func dealWithTokenLoadedFailure()
}
