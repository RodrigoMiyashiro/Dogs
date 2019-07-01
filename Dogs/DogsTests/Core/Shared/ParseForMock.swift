//
//  ParseForMock.swift
//  DogsTests
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class ParseForMock {
    func parseData<T>(fileName: String, ofType: String) -> T? where T: Decodable {
        var responseData: T?

        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: fileName, ofType: ofType)

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path!))
            responseData = try JSONDecoder().decode(T.self, from: data)
        }
        catch {
            print("Error...")
        }

        return responseData
    }
}
