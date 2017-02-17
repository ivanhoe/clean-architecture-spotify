
import Foundation

public protocol Presenter {

    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

public extension Presenter {

    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}

/**
 * Represents the View component inside the Model View Presenter (MVP) pattern.
 * This interface mustbe used as base interface for every View interface declared.
 */

public protocol BaseUI {
}
