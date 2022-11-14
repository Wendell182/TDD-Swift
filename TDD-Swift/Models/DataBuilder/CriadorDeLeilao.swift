//
//  CriadorDeLeilao.swift
//  TDD-Swift
//
//  Created by Wendell Claus on 14/11/22.
//

import UIKit

class CriadorDeLeilao: NSObject {
    private var leilao: Leilao!
    
    func para(descricao: String) -> Self {
        leilao = Leilao(descricao: descricao)
        
        return self
    }
    
    func lance(_ usuario: Usuario, _ valor: Double) -> Self {
        leilao.propoe(lance: Lance(usuario, valor))
        
        return self
    }
    
    func constroi() -> Leilao {
        return leilao
    }
}
