WHAT ARE THE generate_classes_DEMO SCRIPTS FOR?

  generate_classes_DEMO_linux.sh
  generate_classes_DEMO_macos.sh
  generate_classes_DEMO_windows.ps1

The three scripts do the very same thing, one of them is for every operating system.
Run the one of your system from this folder after you have changed anything here:

  icon/     an icon has been added or removed
  sound/    a sound has been added or removed
  emoji/    an emoji has been added or removed (the emojis are SVG files)
  label/    a text key has been added to or removed from the label xml

They rewrite the classes that embed and list those resources:

  ../manager/IconManagerDemo.as     ../enum/EnumIconsDemo.as
  ../manager/SoundManagerDemo.as    ../enum/EnumSoundsDemo.as
  ../manager/EmojiManagerDemo.as    ../enum/EnumEmojisDemo.as
                                    ../enum/EnumTextKeysDemo.as

Every one of those classes extends the one of the KissAs3Fw framework, so the demo
resources come on top of the framework resources instead of replacing them.

The emoji folder is handled one step differently. ActionScript can display neither an
SVG nor an FXG, so the scripts first call the svg_to_kvg.py of the framework, which
flattens every emoji SVG of that folder into emoji/emojis.kvg: one blob of the drawing
commands the runtime does understand. EmojiManagerDemo embeds that blob of its own and
reads it with the same util/VectorDrawings the framework uses, so an emoji of this
application is as sharp at any size as one of the framework. A python3 of any recent
version therefore has to be on the path to run these scripts.

Every one of those classes is written from scratch, so never edit them by hand:
the next run throws your changes away. The header of those classes says this too.
The same holds for emoji/emojis.kvg: it is built from the SVG files next to it.

The three scripts write exactly the same bytes, so it does not matter which one of
them has been run, and the classes stay the same until a resource really changes.

HOW TO RUN

  linux:    $ ./generate_classes_DEMO_linux.sh
  macos:    $ ./generate_classes_DEMO_macos.sh
  windows:  > powershell -ExecutionPolicy Bypass -File .\generate_classes_DEMO_windows.ps1
