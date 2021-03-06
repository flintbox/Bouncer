//
//  Init.swift
//  Bouncer
//
//  Copyright (c) 2018 Jason Nam (https://jasonnam.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import Bouncer

let quietOption =          Option(name: "quiet", shortName: "q", optional: true, argumentType: .none)
let bareOption =           Option(name: "bare", optional: true, argumentType: .none)
let templateOption =       Option(name: "template", optional: true, argumentType: .required)
let separateGitDirOption = Option(name: "separate-git-dir", optional: true, argumentType: .required)
let sharedOption =         Option(name: "shared", optional: true, argumentType: .optional("group"))

let initCommand = Command(
    name: ["init"],
    operandType: .optionalEqual(1),
    options: [quietOption, bareOption, templateOption, separateGitDirOption, sharedOption]
) { program, command, operands, optionValues in
    let directory = operands[optional: 0]
    let quiet = optionValues.have(quietOption)
    let bare = optionValues.have(bareOption)
    let templateDirectory = optionValues.findOptionalArgument(for: templateOption)
    let gitDirectory = optionValues.findOptionalArgument(for: separateGitDirOption)
    let shared = optionValues.findOptionalArgument(for: sharedOption)
    print(
        """

            init command <https://git-scm.com/docs/git-init>

            directory    : \(directory ?? "nil")
            quiet        : \(quiet)
            bare         : \(bare)
            template dir : \(templateDirectory ?? "nil")
            git dir      : \(gitDirectory ?? "nil")
            shared       : \(shared ?? "nil")

        """
    )
}
