//
//  SignInViewController.swift
//  KingBurguer
//
//  Created by Filipe Rodrigues da Silva on 19/02/24.
//

import Foundation
import UIKit

class SignInViewController:UIViewController {
	
	let email: UITextField = {
		let ed = UITextField()
		ed.backgroundColor = .blue
		ed.placeholder = "Entre com seu e-mail"
		ed.translatesAutoresizingMaskIntoConstraints = false // regrão padrao para utiliar autolayout
		return ed
	}()
	
	let password: UITextField = {
		let ed = UITextField()
		ed.backgroundColor = .red
		ed.placeholder = "Entre com sua senha"
		ed.translatesAutoresizingMaskIntoConstraints = false
		return ed
	}()
	
	// "LAZY = inicialização atrasada, só é criado quando for utilizado"
	lazy var send: UIButton = {
		let btn = UIButton()
		btn.setTitle("Entrar", for: .normal)
		btn.setTitleColor(.black, for: .normal)
		btn.backgroundColor = .yellow
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.addTarget(self, action: #selector(sendDidTap), for: .touchUpInside)
		return btn
	}()
	
	lazy var register: UIButton = {
		let btn = UIButton()
		btn.setTitle("Criar Conta", for: .normal)
		btn.setTitleColor(.white, for: .normal)
		btn.backgroundColor = .purple
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.addTarget(self, action: #selector(registerDidTap), for: .touchUpInside)
		return btn
	}()
	
	var viewModel: SignInViewModel? {
		didSet {
			viewModel?.delegate = self
		}
	}
	
	//1. Definição de Layout
	override func viewDidLoad() {
		super.viewDidLoad()
		//Explicação:
		
		//quando for enum, podemos omitir o nome da enum, ou seja, podemos apenas atribuir o valor direto que vai entender
		//view.backgroundColor = UIColor.red
		view.backgroundColor = .systemBackground
		
		navigationItem.title = "Login"
		
		view.addSubview(email)
		view.addSubview(password)
		view.addSubview(send)
		view.addSubview(register)
		
		//UTILIZANDO O FRAME
		//email.frame = CGRect(x: 0, y: view.bounds.size.height / 2, width: view.bounds.size.width, height: 50)
		
		//password.frame = CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
		
		//UTILIZANDO O AUTO-LAYOUT
		let emailConstraints = [
			// 1. criar as coordernadas da esquerda (leading)
			email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
			// 2. criar as coordernadas da direita (trailing)
			email.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
			// 3. criar as coordernadas do centro Y
			email.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			// 4. criar o tamanho fixo da altura ( height )
			email.heightAnchor.constraint(equalToConstant: 50.0),
		]
		
		// as coordenadas de "Password" criadas relacionadas ao ˜Email˜
		
		let passwordConstraints = [
			password.leadingAnchor.constraint(equalTo: email.leadingAnchor),
			password.trailingAnchor.constraint(equalTo: email.trailingAnchor),
			password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10.0),
			password.heightAnchor.constraint(equalToConstant: 50.0),
		]
		
		let sendConstraints = [
			send.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.0),
			send.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50.0),
			send.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10.0),
			send.heightAnchor.constraint(equalToConstant: 50.0),
		]
		
		let registerConstraints = [
			register.leadingAnchor.constraint(equalTo: email.leadingAnchor),
			register.trailingAnchor.constraint(equalTo: email.trailingAnchor),
			register.topAnchor.constraint(equalTo: send.bottomAnchor, constant: 15.0),
			register.heightAnchor.constraint(equalToConstant: 50.0),
		]
		
		NSLayoutConstraint.activate(emailConstraints)
		NSLayoutConstraint.activate(passwordConstraints)
		NSLayoutConstraint.activate(sendConstraints)
		NSLayoutConstraint.activate(registerConstraints)
	}
	
	//2. Eventos de Touch
	// o uso do " _ " na declaração da função, quer dizer que não é preciso informar a variavel na chamada da função
	@objc func sendDidTap(_ sender:UIButton) {
		viewModel?.send()
	}
	
	@objc func registerDidTap(_ sender:UIButton) {
		viewModel?.goToSignUp()
	}
}


//3. Observers
extension SignInViewController: SignInViewModelDelegate {
	//OBSERVADOR (conexao com viewModel)
	func viewModelDidChanged(state: SignInState) {
		switch (state) {
			case .none:
				break
			case .loading:
				//mostrar progress
				break
			case .goToHome:
				//navegar para a tela principal
				viewModel?.goToHome()
				break
			case .error(let msg):
				let alert = UIAlertController(title: "Titulo", message: msg, preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .default))
				self.present(alert, animated: true)
				
				break
		}
	}
	
}
