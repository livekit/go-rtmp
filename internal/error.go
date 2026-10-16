//
// Copyright (c) 2018- yutopp (yutopp@gmail.com)
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at  https://www.boost.org/LICENSE_1_0.txt)
//

package internal

import (
	"errors"
)

var ErrChunkIsNotCompleted = errors.New("chunk is not completed")
var ErrPassThroughMsg = errors.New("msg is passed through")
