//
//  Leilao.swift
//  TDD-Swift
//
//  Created by Wendell Claus on 14/11/22.
//

import Foundation

class Leilao {
    let descricao: String
    let imagem: String?
    var lances: [Lance]?
    
    init(descricao: String, imagem: String? = nil, lances: [Lance] = []) {
        self.descricao = descricao
        self.imagem = imagem
        self.lances = lances
    }
    
    func propoe(lance: Lance) {
        guard let listaDeLances = lances else { return }
       
        if listaDeLances.count == 0 || podeDarLance(lance.usuario, listaDeLances) {
            lances?.append(lance)
        }
    }
    
    private func podeDarLance(_ usuario: Usuario, _ listaDeLances: [Lance]) -> Bool {
        return ultimoLanceDado(listaDeLances).usuario != usuario && quantidadeDeLancesDoUsuario(usuario) < 5
    }
    
    private func ultimoLanceDado(_ lances: [Lance]) -> Lance {
        return lances[lances.count-1]
    }
    
    private func quantidadeDeLancesDoUsuario(_ usuario: Usuario) -> Int {
        guard let listaDeLances = lances else { return 0 }
        
        var total = 0
        for lanceAtual in listaDeLances {
            if lanceAtual.usuario == usuario {
                total+=1
            }
        }
        
        return total
    }
}
