//
//  ViewController.swift
//  MinhasAnotacoes
//
//  Created by Jefferson Oliveira de Araujo on 30/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textViewUser: UITextView!
    let keyNote = "myAnotation"
    
//     MARK: ESCONDER BARRA DE STATUS
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textViewUser.text = getDataUserDefault()
    }
//    MARK: SALVA DADOS NO CACHE
    @IBAction func saveNotes(_ sender: Any) {
        if let text = textViewUser.text {
            UserDefaults.standard.setValue(text, forKey: keyNote)
        }
    }
//    MARK: PEGA DADOS SALVOS EM CACHE
    func getDataUserDefault() -> String {
        if let getTextUserDefault = UserDefaults.standard.object(forKey: keyNote) {
            return getTextUserDefault as! String
        }
        return ""
    }
    
//    MARK: FECHA TECLADO CLICANDO NA TELA
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

