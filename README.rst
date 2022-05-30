Minimal OpenD6
@@@@@@@@@@@@@@

`Minimal OpenD6` is a System Reference Document (SRD) based on `Mini
Six`, from `AnitiPaladin Games`_, used in accordance with the `Mini
Six Standard Trademark License`_ and the `Open Game License`_ used
with OpenD6_.

.. _AnitiPaladin Games: http://www.antipaladingames.com/
.. _Mini Six Standard Trademark License: http://www.antipaladingames.com/p/license.html
.. _Open Game License: https://ogc.rpglibrary.org/images/7/73/OpenD6_OGL_v2.pdf
.. _OpenD6: https://opend6.fandom.com/wiki/OpenD6

First of all, if you just want a copy of `Mini Six` to read, please
download the original for free or buy the print version, both from
DriveThruRPG_.  It is much nicer looking than anything included in
this SRD, and packs an impressive amount in its densely formatted 38
pages.

.. _DriveThruRPG: https://www.drivethrurpg.com/product/144558/Mini-Six-Bare-Bones-Edition

However, if you want to produce a custom version of rules based on
`Mini Six`, this SRD may be a better starting point, whether you just
want to incorporate your house rules or want to produce a completely
new game.  It provides:

* reStructuredText_ source for the open content from `Mini Six` and
  the “Mini Six Standard Trademark License”.
* A GNU makefile for producing output from the source.
* pandoc_ templates and a filter for massaging some of the output
  formats for better output.
* Simple PDF, HTML, EPUB, ``.mobi``, ``.rtf``, Microsoft Word
  ``.docx``, and OpenOffice/LibreOffice ``.odt`` (ODT)_ output for the
  SRD, for those who would rather start with one of those formats and
  not bother with using pandoc_ themselves.
* Markdown source, converted from the reStructuredText_ source by
  pandoc_.

__ https://docutils.sourceforge.io/rst.html
.. _ODT: https://en.wikipedia.org/wiki/OpenDocument

Using pandoc_, the reStructuredText_ source can also be transformed
into other source and output formats, if there is another that you
prefer.  For example, pandoc can transform reStructuredText_ into
asciidoc_.

.. _pandoc: https://pandoc.org/
.. _markdown: https://en.wikipedia.org/wiki/Markdown
.. _asciidoc: https://asciidoc.org/

Starting with `Minimal OpenD6` is an advantage if you want to start
with a simple base and add just what you want, rather than starting
with the full `OpenD6` and cutting out what you don't want.

Pre-built output is found in the `output <output>`_ directory, or you
can download all the pre-built output formats from the `releases
<https://github.com/tkurtbond/Minimal-OpenD6/releases>`_ page.

If you just want the output files without any of the stuff used to
build them, look at the `releases
<https://github.com/tkurtbond/Minimal-OpenD6/releases>`__ page in the
repository for a zip file.
