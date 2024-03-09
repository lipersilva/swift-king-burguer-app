//
//  SignUpViewController.swift
//  KingBurguer
//
//  Created by Filipe Rodrigues da Silva on 29/02/24.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
	
	let name: UITextField = {
		let ed = UITextField()
		ed.backgroundColor = .green
		ed.placeholder = "Entre com seu nome"
		ed.translatesAutoresizingMaskIntoConstraints = false
		return ed
	}()
	
	let email: UITextField = {
		let ed = UITextField()
		ed.backgroundColor = .green
		ed.placeholder = "Entre com seu e-mail"
		ed.translatesAutoresizingMaskIntoConstraints = false
		return ed
	}()
	
	let password: UITextField = {
		let ed = UITextField()
		ed.backgroundColor = .green
		ed.placeholder = "Entre com sua senha"
		ed.translatesAutoresizingMaskIntoConstraints = false
		return ed
	}()
	
	let document: UITextField = {
		let ed = UITextField()
		ed.backgroundColor = .green
		ed.placeholder = "Entre com seu CPF"
		ed.translatesAutoresizingMaskIntoConstraints = false
		return ed
	}()
	
	let birthday: UITextField = {
		let ed = UITextField()
		ed.backgroundColor = .green
		ed.placeholder = "Entre com sua data de nascimento"
		ed.translatesAutoresizingMaskIntoConstraints = false
		return ed
	}()
	
	lazy var send: UIButton = {
		let btn = UIButton()
		btn.setTitle("Entrar", for: .normal)
		btn.setTitleColor(.black, for: .normal)
		btn.backgroundColor = .yellow
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.addTarget(self, action: #selector(sendDidTap), for: .touchUpInside)
		return btn
	}()
	
	var viewModel: SignUpViewModel? {
		didSet {
			viewModel?.delegate = self
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		view.addSubview(name)
		view.addSubview(email)
		view.addSubview(password)
		view.addSubview(document)
		view.addSubview(birthday)
		view.addSubview(send)
		
		let nameConstraints = [
			name.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			name.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			name.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100.0),
			name.heightAnchor.constraint(equalToConstant: 50.0),
		]
		
		let emailConstraints = [
			email.leadingAnchor.constraint(equalTo: name.leadingAnchor),
			email.trailingAnchor.constraint(equalTo: name.trailingAnchor),
			email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10.0),
			email.heightAnchor.constraint(equalToConstant: 50.0),
		]
		
		let passwordConstraints = [
			password.leadingAnchor.constraint(equalTo: name.leadingAnchor),
			password.trailingAnchor.constraint(equalTo: name.trailingAnchor),
			password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10.0),
			password.heightAnchor.constraint(equalToConstant: 50.0),
		]
		
		let documentConstraints = [
			document.leadingAnchor.constraint(equalTo: name.leadingAnchor),
			document.trailingAnchor.constraint(equalTo: name.trailingAnchor),
			document.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10.0),
			document.heightAnchor.constraint(equalToConstant: 50.0),
		]
		
		let birthdayConstraints = [
			birthday.leadingAnchor.constraint(equalTo: name.leadingAnchor),
			birthday.trailingAnchor.constraint(equalTo: name.trailingAnchor),
			birthday.topAnchor.constraint(equalTo: document.bottomAnchor, constant: 10.0),
			birthday.heightAnchor.constraint(equalToConstant: 50.0),
		]
		
		let sendConstraints = [
			send.leadingAnchor.constraint(equalTo: name.leadingAnchor),
			send.trailingAnchor.constraint(equalTo: name.trailingAnchor),
			send.topAnchor.constraint(equalTo: birthday.bottomAnchor, constant: 10.0),
			send.heightAnchor.constraint(equalToConstant: 50.0),
		]
		
		NSLayoutConstraint.activate(nameConstraints)
		NSLayoutConstraint.activate(emailConstraints)
		NSLayoutConstraint.activate(passwordConstraints)
		NSLayoutConstraint.activate(documentConstraints)
		NSLayoutConstraint.activate(birthdayConstraints)
		NSLayoutConstraint.activate(sendConstraints)
	}
	
	@objc func sendDidTap(_ sender:UIButton) {
		viewModel?.send()
	}
}

extension SignUpViewController: SignUpViewModelDelegate {
	//OBSERVADOR (conexao com viewModel)
	func viewModelDidChanged(state: SignUpState) {
		switch (state) {
			case .none:
				break
			case .loading:
				//mostrar progress
				break
			case .goToHome:
				//navegar para a tela principal
				break
			case .error(let msg):
				let alert = UIAlertController(title: "Titulo", message: msg, preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .default))
				self.present(alert, animated: true)
				
				break
		}
	}}
