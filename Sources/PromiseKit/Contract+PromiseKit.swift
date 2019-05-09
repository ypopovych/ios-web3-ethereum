//
//  ContractPromiseExtensions.swift
//  BigInt
//
//  Created by Koray Koska on 23.06.18.
//  Copyright © 2018 Boilertalk. All rights reserved.
//

import PromiseKit
import Ethereum
#if !COCOAPODS
    import EthereumWeb3
#endif

// MARK: - Extensions

public extension SolidityInvocation {

    func call(block: QuantityTag = .latest) -> Promise<[String: Any]> {
        return Promise { seal in
            self.call(block: block, completion: seal.resolve)
        }
    }

    func send(nonce: Quantity? = nil, from: Address, value: Quantity? = nil, gas: Quantity? = nil, gasPrice: Quantity? = nil) -> Promise<EthData> {
        return Promise{ seal in
            self.send(nonce: nonce, from: from, value: value, gas: gas, gasPrice: gasPrice, completion: seal.resolve)
        }
    }

    func estimateGas(from: Address? = nil, gas: Quantity? = nil, value: Quantity? = nil) -> Promise<Quantity> {
        return Promise { seal in
            self.estimateGas(from: from, gas: gas, value: value, completion: seal.resolve)
        }
    }
}

public extension SolidityConstructorInvocation {

    func send(nonce: Quantity? = nil, from: Address, value: Quantity? = nil, gas: Quantity? = nil, gasPrice: Quantity? = nil) -> Promise<EthData> {
        return Promise { seal in
            self.send(nonce: nonce, from: from, value: value ?? 0, gas: gas, gasPrice: gasPrice, completion: seal.resolve)
        }
    }
}

