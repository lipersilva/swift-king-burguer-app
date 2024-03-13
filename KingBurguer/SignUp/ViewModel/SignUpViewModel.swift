//
//  SignUpViewModel.swift
//  KingBurguer
//
//  Created by Filipe Rodrigues da Silva on 02/03/24.
//

import Foundation
import UIKit


import Foundation

protocol SignUpViewModelDelegate {
	func viewModelDidChanged(state: SignUpState)
}

class SignUpViewModel {
	
	var delegate : SignUpViewModelDelegate?
	var coordinator: SignUpCoordinator?
	
	var state: SignUpState = .none {
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
}

