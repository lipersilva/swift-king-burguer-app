//
//  SignInViewModel.swift
//  KingBurguer
//
//  Created by Filipe Rodrigues da Silva on 29/02/24.
//

import Foundation

protocol SignInViewModelDelegate {
	func viewModelDidChanged(state: SignInState)
}

class SignInViewModel {
	
	var delegate : SignInViewModelDelegate?
	var coordinator: SignInCoordinator?
	
	var state: SignInState = .none {
		//funçao do swift que dispara uma logica
		didSet {
			delegate?.viewModelDidChanged(state: state)
		}
	}
	
	
	func send() {
		state = .loading
		
		//aqui eu espero 2 segundos (latencia)
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			self.state = .goToHome
		}
	}
	
	func goToSignUp() {
		coordinator?.signUp()
	}
	
	func goToHome() {
		coordinator?.home()
	}
	
	
}
