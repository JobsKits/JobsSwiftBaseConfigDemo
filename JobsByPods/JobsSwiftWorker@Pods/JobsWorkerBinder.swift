//
//  JobsWorkerBinder.swift
//  JobsSwiftWorker
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Copyright © 2026 Jobs. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
import Foundation

public enum JobsWorkerBinder {
    @discardableResult
    public static func bindText(_ source: JobsObservable<String>,
                                to label: UILabel,
                                prefix: String = "",
                                suffix: String = "",
                                storeIn bag: JobsWorkerBag? = nil) -> JobsWorker {
        let worker = source.ever { change in
            DispatchQueue.main.async {
                label.text = prefix + change.newValue + suffix
            }
        }
        if let bag {
            worker.store(in: bag)
        }
        return worker
    }

    @discardableResult
    public static func bindTextField(_ textField: UITextField,
                                     to source: JobsObservable<String>) -> JobsWorker {
        let worker = JobsWorker(mode: .ever, label: "textField.binding")
        textField.addTarget(TextFieldTarget.shared, action: #selector(TextFieldTarget.shared.inputChanged(_:)), for: .editingChanged)
        TextFieldTarget.shared.register(textField: textField, observable: source, worker: worker)
        worker.setDisposer {
            TextFieldTarget.shared.unregister(textField: textField)
        }
        return worker
    }
}

private final class TextFieldTarget: NSObject {
    static let shared = TextFieldTarget()

    private let lock = NSLock()
    private var storage: [ObjectIdentifier: Entry] = [:]

    struct Entry {
        weak var textField: UITextField?
        weak var worker: JobsWorker?
        let observable: JobsObservable<String>
    }

    func register(textField: UITextField,
                  observable: JobsObservable<String>,
                  worker: JobsWorker) {
        lock.lock()
        storage[ObjectIdentifier(textField)] = Entry(textField: textField, worker: worker, observable: observable)
        lock.unlock()
    }

    func unregister(textField: UITextField) {
        lock.lock()
        storage.removeValue(forKey: ObjectIdentifier(textField))
        lock.unlock()
        textField.removeTarget(self, action: #selector(inputChanged(_:)), for: .editingChanged)
    }

    @objc func inputChanged(_ sender: UITextField) {
        lock.lock()
        let entry = storage[ObjectIdentifier(sender)]
        lock.unlock()
        guard let entry else { return }
        guard entry.worker?.isDisposed == false else { return }
        entry.observable.accept(sender.text ?? "")
    }
}
#endif
