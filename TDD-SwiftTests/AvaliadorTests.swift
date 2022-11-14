//
//  AvaliadorTests.swift
//  TDD-SwiftTests
//
//  Created by Wendell Claus on 14/11/22.
//

import XCTest
@testable import TDD_Swift

class AvaliadorTests: XCTestCase {
    var leiloeiro: Avaliador!

    private var joao: Usuario!
    private var maria: Usuario!
    private var jose: Usuario!
    

    override func setUpWithError() throws {
        leiloeiro = Avaliador()

        joao = Usuario(nome: "Joao")
        jose = Usuario(nome: "Jose")
        maria = Usuario(nome: "Maria")
    }

    override func tearDownWithError() throws {
        
    }

    func testDeveEntenderLancesEmOrdemCrescente() {
        let leilao = Leilao(descricao: "Playstation 5")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        try? leiloeiro.avalia(leilao)
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400.0, leiloeiro.maiorLance())
    }
    
    func testDeveEntenderLeilaoComApenasUmLance() {
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(joao, 1000.0))
        
        let leiloeiro = Avaliador()
        try? leiloeiro.avalia(leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
    
    func testDeveEncontrarOsTresMaioresLances() {
        let leilao = CriadorDeLeilao().para(descricao: "Iphone 12")
            .lance(joao, 300.0)
            .lance(maria, 400.0)
            .lance(joao, 500.0)
            .lance(maria, 600.0)
            .constroi()
        
        try? leiloeiro.avalia(leilao)
        
        let listaDeLances =  leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, listaDeLances.count)
        XCTAssertEqual(600.0, listaDeLances[0].valor)
        XCTAssertEqual(500.0, listaDeLances[1].valor)
        XCTAssertEqual(400.0, listaDeLances[2].valor)
    }
    
    func testDeveIgnorarLeilaoSemNehumLance() {
        let leilao = CriadorDeLeilao().para(descricao: "Xbox s").constroi()
        
        XCTAssertThrowsError(try leiloeiro.avalia(leilao), "Não é possível avaliar um leilão sem lances") { error in
            print(error.localizedDescription)
        }
    }
}
