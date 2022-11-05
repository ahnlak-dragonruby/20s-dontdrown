# main.rb - part of Don't Drown
#
# Copyright (C) 2022 Pete Favelle <dragonruby@ahnlak.com>
# This file is released under the MIT License; see LICENSE for details.
#
# To keep code as tidy as possible, all the logic is wrapped in a Module - done
# for various reasons, not least to make this easy to drop into a larger app
# at some future point. All the main tick does it hand control into that Module.

require 'dontdrown/app/dontdrown.rb'
require 'dontdrown/app/splash.rb'

def tick(args)

  DontDrown.tick(args)

end
