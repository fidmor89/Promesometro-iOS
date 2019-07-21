#!/bin/sh

#  SwiftLint.sh
#  Promesometro-iOS
#
#  Created by Fidel Esteban Morales Cifuentes on 7/21/19.
#  Copyright © 2019 Fidmor.89. All rights reserved.

# To make script executable run from terminal: chmod u+x SwiftLint.sh
# To view available rules run swiftlint rules

echo "Run swiftlint autocorrect"
cd "${PROJECT_DIR}"
Pods/SwiftLint/swiftlint autocorrect

echo "Run swiftlint"
"${PODS_ROOT}/SwiftLint/swiftlint"
