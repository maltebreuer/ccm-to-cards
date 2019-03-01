# CCM to Cards Exporter

Exports CCM query results from CSV to PDFs to print cards from.

## Dependencies

- miktex portable:  https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x86/miktex-portable-2.9.6753.exe

## Symbols
The symbols that shall be displayed per item type and status have to be configured in the `symbols.json` file. Make sure keep the [JSON syntax valid](https://jsonformatter.curiousconcept.com/) (e.g. no commas without some data after them). All 7818 characters from the [Symbola](http://users.teilar.gr/~g1951d/) font are being supported. Have a look at the [character map](https://www.fontspace.com/unicode-fonts-for-ancient-scripts/symbola/37632/charmap) and copy desired symbols to the configuration file.