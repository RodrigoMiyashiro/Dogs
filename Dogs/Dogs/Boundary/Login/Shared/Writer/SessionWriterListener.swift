//
//  SessionWriterListener.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol SessionWriterListener: AnyObject {
    func dealWithTokenSavedFailure()
}
