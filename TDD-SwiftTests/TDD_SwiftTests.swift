//
//  TDD_SwiftTests.swift
//  TDD-SwiftTests
//
//  Created by Wendell Claus on 14/11/22.
//

import XCTest
@testable import TDD_Swift

class TDD_SwiftTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
       
    }

    func testDeveReceberUmLance() {
        let leilao = Leilao(descricao: "Ipad pro")
        XCTAssertEqual(0, leilao.lances?.count)
        
        let luke = Usuario(nome: "Luke")
        leilao.propoe(lance: Lance(luke, 2000.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
    }
    
    func testDeveReceberVariosLances() {
        let leilao = Leilao(descricao: "macbook pro")
        
        let simba = Usuario(nome: "Simba")
        leilao.propoe(lance: Lance(simba,2000.0))
        
        let toninho = Usuario(nome: "Toninho")
        leilao.propoe(lance: Lance(toninho, 3000.0))
        
        XCTAssertEqual(2, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
        XCTAssertEqual(3000.0, leilao.lances?[1].valor)
    }
    
    func testDeveIgnorarDoisLancesSeguidosDoMesmoUsuario() {
        let leilao = Leilao(descricao: "Air pods")
        let nicolas = Usuario(nome: "Nicolas")
        
        leilao.propoe(lance: Lance(nicolas, 2000))
        leilao.propoe(lance: Lance(nicolas, 3000))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000, leilao.lances?.first?.valor)
    }
    
    func testDeveIgnorarMaisDoQueCincoLancesDoMesmoUsuario() {
        let leilao = Leilao(descricao: "Iphone 14 pro max")
        
        let tony = Usuario(nome: "Toninho Forms")
        let nicolas = Usuario(nome: "Nicolas")
        
        leilao.propoe(lance: Lance(tony, 2000.0))
        leilao.propoe(lance: Lance(nicolas, 3000.0))
        
        leilao.propoe(lance: Lance(tony, 4000.0))
        leilao.propoe(lance: Lance(nicolas, 5000.0))
        
        leilao.propoe(lance: Lance(tony, 6000.0))
        leilao.propoe(lance: Lance(nicolas, 7000.0))
        
        leilao.propoe(lance: Lance(tony, 8000.0))
        leilao.propoe(lance: Lance(nicolas, 9000.0))
        
        leilao.propoe(lance: Lance(tony, 10000.0))
        leilao.propoe(lance: Lance(nicolas, 11000.0))
        
        //IGNORAR:
        leilao.propoe(lance: Lance(tony, 120000.0))
        
        XCTAssertEqual(10, leilao.lances?.count)
        XCTAssertEqual(11000, leilao.lances?.last?.valor	)
    }
    

}
