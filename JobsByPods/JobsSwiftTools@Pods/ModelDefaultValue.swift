//
//  ModelDefaultValue.swift
//  BBSport
//
//  Created by Wade Wang on 2022/11/24.
//  Copyright © 2022 SEEKTOP. All rights reserved.
//

import Foundation
/**
  
      【举例】
     hostId 这个属性在做 JSON -> Model 的 Decodable 解码时
     如果 JSON 里没有 hostId 字段、或者字段是 null、或者类型不匹配导致解码失败（取决于实现）
     就不会让整个解码失败，而是给 hostId 一个 默认值（对 DefaultInt 来说一般是 0）
     @DecodableDefault.DefaultInt var hostId: Int
 */
enum DecodableDefault {}

protocol DecodableDefaultSource {
    associatedtype Value: Decodable
    static var defaultValue: Value { get }
}

extension DecodableDefault {
    @propertyWrapper
    struct Wrapper<Source: DecodableDefaultSource> {
        typealias Value = Source.Value
        var wrappedValue = Source.defaultValue
    }
}

extension DecodableDefault.Wrapper: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = try container.decode(Value.self)
    }
}

extension KeyedDecodingContainer {
    func decode<T>(_ type: DecodableDefault.Wrapper<T>.Type,
                   forKey key: Key) throws -> DecodableDefault.Wrapper<T> {
        try decodeIfPresent(type, forKey: key) ?? .init()
    }
}

extension DecodableDefault {
    typealias True = Wrapper<Sources.True>
    typealias False = Wrapper<Sources.False>
    typealias EmptyString = Wrapper<Sources.EmptyString>
    typealias ZeroString = Wrapper<Sources.DefaultStringZero>
    typealias DefaultFloat = Wrapper<Sources.DefaultFloat>
    typealias DefaultInt = Wrapper<Sources.DefaultInt>
    typealias DefaultMinusOne = Wrapper<Sources.DefaultMinusOne>
    typealias DefaultTripleNine = Wrapper<Sources.DefaultTripleNine>
    typealias EmptyList<T: List> = Wrapper<Sources.EmptyList<T>>
    typealias EmptyMap<T: Map> = Wrapper<Sources.EmptyMap<T>>

//    typealias DefaultLiveStreamStatus = Wrapper<Sources.DefaultLiveStreamStatus>
//    typealias DefaultEmojiType = Wrapper<Sources.DefaultEmojiType>
//    typealias DefaultLiveStreamShowType = Wrapper<Sources.DefaultLiveStreamShowType>
//    typealias DefaultOrderStatus = Wrapper<Sources.DefaultOrderStatus>
}

extension DecodableDefault {
    typealias Source = DecodableDefaultSource
    typealias List = Decodable & ExpressibleByArrayLiteral
    typealias Map = Decodable & ExpressibleByDictionaryLiteral

    enum Sources {
        enum True: Source {
            static var defaultValue: Bool { true }
        }

        enum False: Source {
            static var defaultValue: Bool { false }
        }

        enum DefaultInt: Source {
            static var defaultValue: Int { 0 }
        }

        enum DefaultMinusOne: Source {
            static var defaultValue: Int { -1 }
        }

        enum DefaultTripleNine: Source {
            static var defaultValue: Int { 999 }
        }

        enum DefaultStringZero: Source {
            static var defaultValue: String { "0" }
        }

        enum EmptyString: Source {
            static var defaultValue: String { "" }
        }

        enum EmptyList<T: List>: Source {
            static var defaultValue: T { [] }
        }

        enum EmptyMap<T: Map>: Source {
            static var defaultValue: T { [:] }
        }

        enum DefaultFloat: Source {
            static var defaultValue: Float { 0 }
        }

//        enum DefaultLiveStreamStatus: Source {
//            static var defaultValue: LiveStreamStatus { .UnStream }
//        }
//
//        enum DefaultLiveStreamShowType: Source {
//            static var defaultValue: LiveStreamShowType { .Sport }
//        }
//
//        enum DefaultEmojiType: Source {
//            static var defaultValue: STEmojiType { .normal }
//        }
//
//        enum DefaultOrderStatus: Source {
//            static var defaultValue: OrderShareStatus { .others }
//        }
    }
}
