# dontdrown.rb - part of Don't Drown
#
# Copyright (C) 2022 Pete Favelle <dragonruby@ahnlak.com>
# This file is released under the MIT License; see LICENSE for details.
#
# This is the 'main' of Don't Drown, tucked away safely in our own Module.
# All main.rb needs to do is to call into DontDrown.tick each tick.

module DontDrown

  # init - initialises the game overall; sets static things up in a one-time
  #        setup phase.
  #
  def self.init(args)

    # We'll need a dedicated handler for the splash / start screen.
    @splash = Splash.new(args)

    # And the main game too.

    # We always want to be showing the version on screen.
    args.state.dontdrown.version = args.cvars['game_metadata.version'].value
    args.outputs.static_labels << {
      x: 10, y: 25, size_enum: 0,
      font: 'dontdrown/fonts/NanumPenScript-Regular.ttf',
      r: 50, g: 50, b: 50, a: 128,
      text: "Version #{args.state.dontdrown.version}"
    }

    # Finally, set some flags for our current state, and initialisedness.
    args.state.dontdrown.state = 'splash'
    args.state.dontdrown.initialised = true

  end

  # tick - called every tick of the game; ensures we have initialised things,
  #        and then runs through our more traditional update / render sequence.
  #
  def self.tick(args)

    # If we're not intialised, do so
    DontDrown.init(args) if args.state.dontdrown.initialised != true

    # Set a background colour
    args.outputs.background_color = [51,165,255,255]

    # Feed the updated args object to our handlers
    @splash.args = args

    # And call the right one
    case args.state.dontdrown.state
    when 'splash'
      @splash.update
      @splash.render
    end

    args.outputs.solids << [ args.grid.left, args.grid.bottom, 100, 100, 255, 0, 0 ]
    args.outputs.solids << [ args.grid.left, args.grid.top-100, 100, 100, 255, 255, 0 ]
    args.outputs.solids << [ args.grid.right-100, args.grid.top-100, 100, 100, 0, 255, 255 ]
    args.outputs.solids << [ args.grid.right-100, args.grid.bottom, 100, 100, 0, 0, 255 ]

  end

end

# end of dontdrown.rb
