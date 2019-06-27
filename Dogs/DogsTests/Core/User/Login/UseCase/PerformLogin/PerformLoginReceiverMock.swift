//
//  PerformLoginReceiverMock.swift
//  DogsTests
//
//  Created by Rodrigo Miyashiro on 26/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class PerformLoginReceiverMock: PerformLoginReceiver {
    var callsToHandleSuccessfullyPerformLogin = 0
    var callsToHandleErrorPerformLogin = 0

    var user: User?

    func finishLoginSuccessfully(_ user: User?) {
        self.callsToHandleSuccessfullyPerformLogin += 1

        self.user = user
    }

    func handleLoginFailure() {
        self.callsToHandleErrorPerformLogin += 1
    }
}
