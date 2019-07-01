//
//  DefaultPerformLoginExecutor.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class DefaultPerformLoginExecutor: PerformLoginExecutor, PerformLoginReceiver, SessionWriterListener {
    private let listener: PerformLoginListener
    private var persist: SessionWriterExecutor?

    init(listener: PerformLoginListener) {
        self.listener = listener
    }

    func performLogin(_ email: String) {
        let clientHTTP = DefaultHTTPClient()
        let provider = DefaultPerformLoginApplier(client: clientHTTP)
        let performLogin = PerformLogin(provider: provider, receiver: self)

        let parameters: PerformLogin.Parameters = email

        DispatchQueue.global(qos: .userInitiated).async {
            performLogin.execute(with: parameters)
        }
    }

    func finishLoginSuccessfully(_ user: User?) {
        let profile = user?.profile
        self.persistToken(profile?.token)

        DispatchQueue.main.async {
            self.listener.dealWithSuccessfulLogin(user)
        }
    }

    private func persistToken(_ token: String?) {
        self.persist = DefaultSessionWriterExecutor(listener: self)

        try? self.persist?.performSaveToken(token)
    }

    func handleLoginFailure() {
        self.listener.dealWithFailingLogin()
    }

    func dealWithTokenSavedFailure() {
        DispatchQueue.main.async {
            self.listener.dealWithFailingLogin()
        }
    }
}
