//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 이가을 on 1/16/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate { // 대리자 사용을 위한 프로토콜 채택

    ///////////////////////////////////////////////////////////////////////////////////////////// member
    @IBOutlet weak var textField: UITextField!
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////// init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self // 텍스트필드의 대리자를 self로 설정 -> 여기서 self는 뷰컨트롤러겠죠?
        
        setup()
    }
    
    func setup(){
        view.backgroundColor = UIColor.gray // to see textField easily
        textField.keyboardType = UIKeyboardType.emailAddress// 해당 속성을 통해 textField가 터치되었을 때 나타나는 키보드 타입을 설정할 수 있음
        textField.placeholder = "Enter an Email"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always // 텍스트를 입력했을 때, 필드의 우측에 입력 내용을 지울 수 있는 버튼?이 생김
        textField.returnKeyType = .go // google(search), next 등 엔터키 속성 변경
        
    }
    
    
    // 채택한 프로토콜의 조건(필수 조건이 있으나, 이번에 사용한 프로토콜은 선택적 조건인듯)
    // 텍스트필드의 입력을 시작할 때 호출 (시작할지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true // 이 조건에 따라 텍스트 입력 허락 또는 금지(?)
    }
    // 시점 -
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("start writing")
    }
    // 텍스트필드 글자 내용이 (한글자 한글자) 지워질때 호출 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        return true
    }
    
    // 실사용 예시
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == ""{
            textField.placeholder = "Type Somthing"
            return false
        }else{
            return true
        }
    }
    
    

    ////////////////////////////////////////////////////////////////////////////////////////////// event
    @IBAction func doneBtnTapped(_ sender: UIButton) {
    }
}

