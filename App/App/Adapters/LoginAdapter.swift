//
//  LoginAdapter.swift
//  App
//
//  Created by Lorenzo Limoli on 28/09/22.
//

import Login
import API

class LoginAdapter: LoginProtocol{
    private let _apiClient = APIClient.shared
    private let _onLoginSuccess: () -> Void
    
    init(_onLoginSuccess: @escaping () -> Void) {
        self._onLoginSuccess = _onLoginSuccess
    }
    
    func didTapLogin(completion: @escaping (Login.UserState) -> Void) {
        _apiClient.execute(request: URLRequest(url: URL(string: "https://helloworld.com")!)) { _ in
            completion(.loggedIn)
        }
    }
    
    func onLoginSuccess() {
        _onLoginSuccess()
    }
}
