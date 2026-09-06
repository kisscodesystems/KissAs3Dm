WHERE DOES THIS EMOJI COME FROM?

demo/demo.svg is here to show that an application can carry emojis of its own on top of
the ones of the framework: EmojiManagerDemo puts it into a category the framework knows
nothing about. It is a vector drawing like every emoji of the framework, so ../../..
/KissAs3Fw/resource/svg_to_kvg.py flattens it into emojis.kvg at build time and
com.kisscodesystems.KissAs3Fw.util.VectorDrawings draws it at any size it is asked for.
Never edit emojis.kvg: the generate_classes_DEMO script of the resource folder writes it
from scratch.

The drawing is the Flat style puzzle piece of the Microsoft Fluent Emoji set, taken
unchanged, under the MIT licence:

  https://github.com/microsoft/fluentui-emoji

The full licence text stands next to the emojis of the framework, in
../../../KissAs3Fw/resource/emoji/readme.txt
