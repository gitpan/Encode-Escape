# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Encode-Escape-ASCII.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 491;
BEGIN { use_ok('Encode::Escape::Unicode') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

ok defined &encode, "import Encode's encode() function";
ok defined &decode, "import Encode's decode() function";

$string = "\a\b\e\f\n\r\t\\\"\$\@";
$escaped = "\\a\\b\\e\\f\\n\\r\\t\\\\\\\"\\\$\\\@"; 

is	$string, 
	(decode 'unicode-escape', $escaped),
	'decoded character escape sequences';
is	$escaped, 
	(encode 'unicode-escape', $string), 
	'encoded character escape sequences';

$string_oct = "\0\00\000\1\01\001\11\011\100\111";
$escaped_oct = "\\0\\00\\000\\1\\01\\001\\11\\011\\100\\111";

is	$string_oct, 
	(decode 'unicode-escape', $escaped_oct), 
	'decoded octal escape sequences';

$string_hex = "\x27\x37\x47\x57\x67\x77\x87\x97\xa7\xb7\xc7\xd7\xe7\xf7";
$escaped_hex = "\\x27\\x37\\x47\\x57\\x67\\x77\\x87\\x97\\xa7\\xb7\\xc7\\xd7\\xe7\\xf7";

is	$string_hex, 
	(decode 'unicode-escape', $escaped_hex), 
	'decoded hex escape sequences';

$string_non_printing 
	= "\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e" .
	  "\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\x1c\x1d\x1e" .
	  "\x7f";
$escaped_non_printing 
	= "\\x{0000}\\x{0001}\\x{0002}\\x{0003}\\x{0004}\\x{0005}\\x{0006}\\a\\b\\t\\n\\x{000B}\\f\\r\\x{000E}" .
      "\\x{0010}\\x{0011}\\x{0012}\\x{0013}\\x{0014}\\x{0015}\\x{0016}\\x{0017}\\x{0018}\\x{0019}\\x{001A}\\e\\x{001C}\\x{001D}\\x{001E}" .
	  "\\x{007F}";

is $string_non_printing,
	(decode 'unicode-escape', $escaped_non_printing),
	'decoded non-printing characters';
is $escaped_non_printing,
	(encode 'unicode-escape', $string_non_printing),
	'encoded non-printing characters';



@string_unicode = (
	"English",
	"Deutsch",
	"Fran\x{00E7}ais",
	"Polski",
	"\x{65E5}\x{672C}\x{8A9E}",
	"Nederlands",
	"Italiano",
	"Portugu\x{00EA}s",
	"Espa\x{00F1}ol",
	"Svenska",
	"\x{0420}\x{0443}\x{0441}\x{0441}\x{043A}\x{0438}\x{0439}",
	"\x{4E2D}\x{6587}",
	"\x{202A}Norsk (bokm\x{00E5}l)\x{202C}",
	"Suomi",
	"Volap\x{00FC}k",
	"Lumbaart",
	"Rom\x{00E2}n\x{0103}",
	"T\x{00FC}rk\x{00E7}e",
	"Esperanto",
	"Catal\x{00E0}",
	"Sloven\x{010D}ina",
	"\x{010C}esky",
	"\x{0423}\x{043A}\x{0440}\x{0430}\x{0457}\x{043D}\x{0441}\x{044C}\x{043A}\x{0430}",
	"Magyar",
	"Dansk",
	"Bahasa Indonesia",
	"\x{05E2}\x{05D1}\x{05E8}\x{05D9}\x{05EA}",
	"Lietuvi\x{0173}",
	"\x{0421}\x{0440}\x{043F}\x{0441}\x{043A}\x{0438} / Srpski",
	"Sloven\x{0161}\x{010D}ina",
	"\x{0411}\x{044A}\x{043B}\x{0433}\x{0430}\x{0440}\x{0441}\x{043A}\x{0438}",
	"\x{D55C}\x{AD6D}\x{C5B4}",
	"\x{0627}\x{0644}\x{0639}\x{0631}\x{0628}\x{064A}\x{0629}",
	"Eesti",
	"\x{0C24}\x{0C46}\x{0C32}\x{0C41}\x{0C17}\x{0C41}",
	"\x{0928}\x{0947}\x{092A}\x{093E}\x{0932} \x{092D}\x{093E}\x{0937}\x{093E}",
	"Hrvatski",
	"Cebuano",
	"Galego",
	"\x{0395}\x{03BB}\x{03BB}\x{03B7}\x{03BD}\x{03B9}\x{03BA}\x{03AC}",
	"\x{0E44}\x{0E17}\x{0E22}",
	"\x{0641}\x{0627}\x{0631}\x{0633}\x{06CC}",
	"\x{202A}Norsk (nynorsk)\x{202C}",
	"Ti\x{1EBF}ng Vi\x{1EC7}t",
	"Bahasa Melayu",
	"\x{0987}\x{09AE}\x{09BE}\x{09B0} \x{09A0}\x{09BE}\x{09B0}/\x{09AC}\x{09BF}\x{09B7}\x{09CD}\x{09A3}\x{09C1}\x{09AA}\x{09CD}\x{09B0}\x{09BF}\x{09AF}\x{09BC}\x{09BE} \x{09AE}\x{09A3}\x{09BF}\x{09AA}\x{09C1}\x{09B0}\x{09C0}",
	"Euskara",
	"Bosanski",
	"Simple English",
	"\x{00CD}slenska",
	"L\x{00EB}tzebuergesch",
	"\x{10E5}\x{10D0}\x{10E0}\x{10D7}\x{10E3}\x{10DA}\x{10D8}",
	"Shqip",
	"Az\x{0259}rbaycan",
	"Brezhoneg",
	"Latina",
	"\x{09AC}\x{09BE}\x{0982}\x{09B2}\x{09BE}",
	"Ido",
	"\x{0939}\x{093F}\x{0928}\x{094D}\x{0926}\x{0940}",
	"Srpskohrvatski / \x{0421}\x{0440}\x{043F}\x{0441}\x{043A}\x{043E}\x{0445}\x{0440}\x{0432}\x{0430}\x{0442}\x{0441}\x{043A}\x{0438}",
	"\x{092E}\x{0930}\x{093E}\x{0920}\x{0940}",
	"\x{041C}\x{0430}\x{043A}\x{0435}\x{0434}\x{043E}\x{043D}\x{0441}\x{043A}\x{0438}",
	"Basa Sunda",
	"Nnapulitano",
	"Cymraeg",
	"Tagalog",
	"\x{0BA4}\x{0BAE}\x{0BBF}\x{0BB4}\x{0BCD}",
	"Latvie\x{0161}u",
	"Piemont\x{00E8}is",
	"Sicilianu",
	"Plattd\x{00FC}\x{00FC}tsch",
	"Basa Jawa",
	"Occitan",
	"Kurd\x{00EE} / \x{0643}\x{0648}\x{0631}\x{062F}\x{06CC}",
	"Asturianu",
	"Walon",
	"Afrikaans",
	"\x{0422}\x{043E}\x{04B7}\x{0438}\x{043A}\x{04E3}",
	"\x{0411}\x{0435}\x{043B}\x{0430}\x{0440}\x{0443}\x{0441}\x{043A}\x{0430}\x{044F} (\x{0442}\x{0430}\x{0440}\x{0430}\x{0448}\x{043A}\x{0435}\x{0432}\x{0456}\x{0446}\x{0430})",
	"Aragon\x{00E9}s",
	"Tarand\x{00ED}ne",
	"\x{0411}\x{0435}\x{043B}\x{0430}\x{0440}\x{0443}\x{0441}\x{043A}\x{0430}\x{044F}",
	"Ripoarisch",
	"Krey\x{00F2}l ayisyen",
	"\x{0427}\x{0103}\x{0432}\x{0430}\x{0448}\x{043B}\x{0430}",
	"\x{0627}\x{0631}\x{062F}\x{0648}",
	"M\x{0101}ori",
	"Kiswahili",
	"Frysk",
	"\x{7CB5}\x{8A9E}",
	"O'zbek",
	"V\x{00E8}neto",
	"Gaeilge",
	"Runa Simi",
	"Corsu",
	"\x{0C95}\x{0CA8}\x{0CCD}\x{0CA8}\x{0CA1}",
	"\x{0D2E}\x{0D32}\x{0D2F}\x{0D3E}\x{0D33}\x{0D02}",
	"G\x{00E0}idhlig",
	"\x{05D9}\x{05D9}\x{05B4}\x{05D3}\x{05D9}\x{05E9}",
	"Hornjoserbsce",
	"Yor\x{00F9}b\x{00E1}",
	"\x{017D}emait\x{0117}\x{0161}ka",
	"Kapampangan",
	"Nahuatl",
	"Tatar\x{00E7}a",
	"Interlingua",
	"\x{0938}\x{0902}\x{0938}\x{094D}\x{0915}\x{0943}\x{0924}",
	"Limburgs",
	"\x{0540}\x{0561}\x{0575}\x{0565}\x{0580}\x{0565}\x{0576}",
	"Alemannisch",
	"Basa Banyumasan",
	"\x{12A0}\x{121B}\x{122D}\x{129B}",
	"B\x{00E2}n-l\x{00E2}m-g\x{00FA}",
	"Pangasinan",
	"Nouormand",
	"F\x{00F8}royskt",
	"S\x{00E1}megiella",
	"Nedersaksisch",
	"Winaray",
	"Furlan",
	"\x{092D}\x{094B}\x{091C}\x{092A}\x{0941}\x{0930}\x{0940}",
	"West-Vlams",
	"Novial",
	"\x{092A}\x{093E}\x{093F}\x{0934}",
	"Ilokano",
	"L\x{00ED}guru",
	"Scots",
	"\x{0928}\x{0947}\x{092A}\x{093E}\x{0932}\x{0940}",
	"Arpetan",
	"\x{078B}\x{07A8}\x{0788}\x{07AC}\x{0780}\x{07A8}\x{0784}\x{07A6}\x{0790}\x{07B0}",
	"\x{0418}\x{0440}\x{043E}\x{043D}\x{0430}\x{0443}",
	"\x{53E4}\x{6587} / \x{6587}\x{8A00}\x{6587}",
	"Zazaki",
	"\x{049A}\x{0430}\x{0437}\x{0430}\x{049B}\x{0448}\x{0430}",
	"Malti",
	"Kasz\x{00EB}bsczi",
	"Rumantsch",
	"Deitsch",
	"Ladino",
	"V\x{00F5}ro",
	"Kernewek",
	"faka-Tonga",
	"Boarisch",
	"\x{067E}\x{069A}\x{062A}\x{0648}",
	"Arm\x{00E3}neashce",
	"\x{041C}\x{043E}\x{043D}\x{0433}\x{043E}\x{043B}",
	"Ling\x{00E1}la",
	"T\x{00FC}rkmen",
	"Anglo Saxon",
	"Lojban",
	"Tok Pisin",
	"\x{0B13}\x{0B5C}\x{0B3F}\x{0B06}",
	"Wolof",
	"Emili\x{00E0}n e rumagn\x{00F2}l",
	"Reo M\x{0101}`ohi",
	"\x{041A}\x{044B}\x{0440}\x{0433}\x{044B}\x{0437}\x{0447}\x{0430}",
	"Interlingue",
	"\x{0710}\x{072A}\x{0721}\x{071D}\x{0710}",
	"\x{06AF}\x{06CC}\x{0644}\x{06A9}\x{06CC}",
	"Igbo",
	"\x{1797}\x{17B6}\x{179F}\x{17B6}\x{1781}\x{17D2}\x{1798}\x{17C2}\x{179A}",
	"Ze\x{00EA}uws",
	"\x{0A97}\x{0AC1}\x{0A9C}\x{0AB0}\x{0ABE}\x{0AA4}\x{0AC0}",
	"Taqbaylit",
	"\x{0915}\x{0936}\x{094D}\x{092E}\x{0940}\x{0930}\x{0940} - (\x{0643}\x{0634}\x{0645}\x{064A}\x{0631}\x{064A})",
	"\x{0DC3}\x{0DD2}\x{0D82}\x{0DC4}\x{0DBD}",
	"\x{5434}\x{8BED}",
	"\x{0421}\x{043B}\x{043E}\x{0432}\x{0463}\x{043D}\x{044C}\x{0441}\x{043A}\x{044A}",
	"Malagasy",
	"Soomaaliga",
	"Tetun",
	"\x{0423}\x{0434}\x{043C}\x{0443}\x{0440}\x{0442}",
	"Sardu",
	"Gaelg",
	"Zamboangue\x{00F1}o",
	"Kongo",
	"\x{1403}\x{14C4}\x{1483}\x{144E}\x{1450}\x{1466}/inuktitut",
	"Aymar",
	"\x{0A2A}\x{0A70}\x{0A1C}\x{0A3E}\x{0A2C}\x{0A40}",
	"Hawai`i",
	"Romani",
	"Ekakair\x{0169} Naoero",
	"\x{0F56}\x{0F7C}\x{0F51}\x{0F0B}\x{0F61}\x{0F72}\x{0F42}",
	"\x{0EA5}\x{0EB2}\x{0EA7}",
	"\x{0633}\x{0646}\x{068C}\x{064A}",
	"\x{0411}\x{0430}\x{0448}\x{04A1}\x{043E}\x{0440}\x{0442}",
	"\x{13E3}\x{13B3}\x{13A9}",
	"\x{041D}\x{043E}\x{0445}\x{0447}\x{0438}\x{0439}\x{043D}",
	"Oromoo",
	"E\x{028B}egbe",
	"\x{1275}\x{130D}\x{122D}\x{129B}",
	"Gagana Samoa",
	"\x{0985}\x{09B8}\x{09AE}\x{09C0}\x{09DF}\x{09BE}",
	"Uyghurche\x{200E} / \x{0626}\x{06C7}\x{064A}\x{063A}\x{06C7}\x{0631}\x{0686}\x{06D5}",
	"Hak-k\x{00E2}-fa",
	"\x{0410}\x{0432}\x{0430}\x{0440}",
	"M\x{00EC}ng-d\x{0115}\x{0324}ng-ng\x{1E73}\x{0304}",
	"\x{0645}\x{064E}\x{0632}\x{0650}\x{0631}\x{0648}\x{0646}\x{064A}",
	"Bamanankan",
	"Din\x{00E9} bizaad",
	"Papiamentu",
	"N\x{0113}hiyaw\x{0113}win / \x{14C0}\x{1426}\x{1403}\x{152D}\x{140D}\x{140F}\x{1423}",
	"isiZulu",
	"Norfuk / Pitkern",
	"Kinyarwanda",
	"Myanmasa",
	"isiXhosa",
	"Tshivenda",
	"I\x{00F1}upiak",
	"SiSwati",
	"Ava\x{00F1}e'\x{1EBD}",
	"\x{0F47}\x{0F7C}\x{0F44}\x{0F0B}\x{0F41}",
	"\x{0410}\x{04A7}\x{0441}\x{0443}\x{0430}",
	"Kalaallisut",
	"\x{041A}\x{043E}\x{043C}\x{0438}",
	"\x{0425}\x{0430}\x{043B}\x{044C}\x{043C}\x{0433}",
	"\x{1A05}\x{1A14} \x{1A15}\x{1A18}\x{1A01}\x{1A17}",
	"Bislama",
	"Akan",
	"\x{0411}\x{0443}\x{0440}\x{044F}\x{0430}\x{0434}",
	"Sesotho",
	"Setswana",
	"Twi",
	"Chi-Chewa",
	"Na Vosa Vakaviti",
	"\x{041B}\x{0430}\x{043A}\x{043A}\x{0443}",
	"Fulfulde",
	"(Cuengh)",
	"\x{0647}\x{064E}\x{0648}\x{064F}\x{0633}\x{064E}",
	"chiShona",
	"chiTumbuka",
	"G\x{0129}k\x{0169}y\x{0169}",
	"S\x{00E4}ng\x{00F6}",
	"Luganda",
	"Xitsonga",
	"Kirundi",
	"Afar",
	"Ebon",
	"Tsets\x{00EA}hest\x{00E2}hese",
	"Chamoru",
	"Oshiwambo",
);


@escaped_unicode = (
	"English",
	"Deutsch",
	"Fran\\x{00E7}ais",
	"Polski",
	"\\x{65E5}\\x{672C}\\x{8A9E}",
	"Nederlands",
	"Italiano",
	"Portugu\\x{00EA}s",
	"Espa\\x{00F1}ol",
	"Svenska",
	"\\x{0420}\\x{0443}\\x{0441}\\x{0441}\\x{043A}\\x{0438}\\x{0439}",
	"\\x{4E2D}\\x{6587}",
	"\\x{202A}Norsk (bokm\\x{00E5}l)\\x{202C}",
	"Suomi",
	"Volap\\x{00FC}k",
	"Lumbaart",
	"Rom\\x{00E2}n\\x{0103}",
	"T\\x{00FC}rk\\x{00E7}e",
	"Esperanto",
	"Catal\\x{00E0}",
	"Sloven\\x{010D}ina",
	"\\x{010C}esky",
	"\\x{0423}\\x{043A}\\x{0440}\\x{0430}\\x{0457}\\x{043D}\\x{0441}\\x{044C}\\x{043A}\\x{0430}",
	"Magyar",
	"Dansk",
	"Bahasa Indonesia",
	"\\x{05E2}\\x{05D1}\\x{05E8}\\x{05D9}\\x{05EA}",
	"Lietuvi\\x{0173}",
	"\\x{0421}\\x{0440}\\x{043F}\\x{0441}\\x{043A}\\x{0438} / Srpski",
	"Sloven\\x{0161}\\x{010D}ina",
	"\\x{0411}\\x{044A}\\x{043B}\\x{0433}\\x{0430}\\x{0440}\\x{0441}\\x{043A}\\x{0438}",
	"\\x{D55C}\\x{AD6D}\\x{C5B4}",
	"\\x{0627}\\x{0644}\\x{0639}\\x{0631}\\x{0628}\\x{064A}\\x{0629}",
	"Eesti",
	"\\x{0C24}\\x{0C46}\\x{0C32}\\x{0C41}\\x{0C17}\\x{0C41}",
	"\\x{0928}\\x{0947}\\x{092A}\\x{093E}\\x{0932} \\x{092D}\\x{093E}\\x{0937}\\x{093E}",
	"Hrvatski",
	"Cebuano",
	"Galego",
	"\\x{0395}\\x{03BB}\\x{03BB}\\x{03B7}\\x{03BD}\\x{03B9}\\x{03BA}\\x{03AC}",
	"\\x{0E44}\\x{0E17}\\x{0E22}",
	"\\x{0641}\\x{0627}\\x{0631}\\x{0633}\\x{06CC}",
	"\\x{202A}Norsk (nynorsk)\\x{202C}",
	"Ti\\x{1EBF}ng Vi\\x{1EC7}t",
	"Bahasa Melayu",
	"\\x{0987}\\x{09AE}\\x{09BE}\\x{09B0} \\x{09A0}\\x{09BE}\\x{09B0}/\\x{09AC}\\x{09BF}\\x{09B7}\\x{09CD}\\x{09A3}\\x{09C1}\\x{09AA}\\x{09CD}\\x{09B0}\\x{09BF}\\x{09AF}\\x{09BC}\\x{09BE} \\x{09AE}\\x{09A3}\\x{09BF}\\x{09AA}\\x{09C1}\\x{09B0}\\x{09C0}",
	"Euskara",
	"Bosanski",
	"Simple English",
	"\\x{00CD}slenska",
	"L\\x{00EB}tzebuergesch",
	"\\x{10E5}\\x{10D0}\\x{10E0}\\x{10D7}\\x{10E3}\\x{10DA}\\x{10D8}",
	"Shqip",
	"Az\\x{0259}rbaycan",
	"Brezhoneg",
	"Latina",
	"\\x{09AC}\\x{09BE}\\x{0982}\\x{09B2}\\x{09BE}",
	"Ido",
	"\\x{0939}\\x{093F}\\x{0928}\\x{094D}\\x{0926}\\x{0940}",
	"Srpskohrvatski / \\x{0421}\\x{0440}\\x{043F}\\x{0441}\\x{043A}\\x{043E}\\x{0445}\\x{0440}\\x{0432}\\x{0430}\\x{0442}\\x{0441}\\x{043A}\\x{0438}",
	"\\x{092E}\\x{0930}\\x{093E}\\x{0920}\\x{0940}",
	"\\x{041C}\\x{0430}\\x{043A}\\x{0435}\\x{0434}\\x{043E}\\x{043D}\\x{0441}\\x{043A}\\x{0438}",
	"Basa Sunda",
	"Nnapulitano",
	"Cymraeg",
	"Tagalog",
	"\\x{0BA4}\\x{0BAE}\\x{0BBF}\\x{0BB4}\\x{0BCD}",
	"Latvie\\x{0161}u",
	"Piemont\\x{00E8}is",
	"Sicilianu",
	"Plattd\\x{00FC}\\x{00FC}tsch",
	"Basa Jawa",
	"Occitan",
	"Kurd\\x{00EE} / \\x{0643}\\x{0648}\\x{0631}\\x{062F}\\x{06CC}",
	"Asturianu",
	"Walon",
	"Afrikaans",
	"\\x{0422}\\x{043E}\\x{04B7}\\x{0438}\\x{043A}\\x{04E3}",
	"\\x{0411}\\x{0435}\\x{043B}\\x{0430}\\x{0440}\\x{0443}\\x{0441}\\x{043A}\\x{0430}\\x{044F} (\\x{0442}\\x{0430}\\x{0440}\\x{0430}\\x{0448}\\x{043A}\\x{0435}\\x{0432}\\x{0456}\\x{0446}\\x{0430})",
	"Aragon\\x{00E9}s",
	"Tarand\\x{00ED}ne",
	"\\x{0411}\\x{0435}\\x{043B}\\x{0430}\\x{0440}\\x{0443}\\x{0441}\\x{043A}\\x{0430}\\x{044F}",
	"Ripoarisch",
	"Krey\\x{00F2}l ayisyen",
	"\\x{0427}\\x{0103}\\x{0432}\\x{0430}\\x{0448}\\x{043B}\\x{0430}",
	"\\x{0627}\\x{0631}\\x{062F}\\x{0648}",
	"M\\x{0101}ori",
	"Kiswahili",
	"Frysk",
	"\\x{7CB5}\\x{8A9E}",
	"O'zbek",
	"V\\x{00E8}neto",
	"Gaeilge",
	"Runa Simi",
	"Corsu",
	"\\x{0C95}\\x{0CA8}\\x{0CCD}\\x{0CA8}\\x{0CA1}",
	"\\x{0D2E}\\x{0D32}\\x{0D2F}\\x{0D3E}\\x{0D33}\\x{0D02}",
	"G\\x{00E0}idhlig",
	"\\x{05D9}\\x{05D9}\\x{05B4}\\x{05D3}\\x{05D9}\\x{05E9}",
	"Hornjoserbsce",
	"Yor\\x{00F9}b\\x{00E1}",
	"\\x{017D}emait\\x{0117}\\x{0161}ka",
	"Kapampangan",
	"Nahuatl",
	"Tatar\\x{00E7}a",
	"Interlingua",
	"\\x{0938}\\x{0902}\\x{0938}\\x{094D}\\x{0915}\\x{0943}\\x{0924}",
	"Limburgs",
	"\\x{0540}\\x{0561}\\x{0575}\\x{0565}\\x{0580}\\x{0565}\\x{0576}",
	"Alemannisch",
	"Basa Banyumasan",
	"\\x{12A0}\\x{121B}\\x{122D}\\x{129B}",
	"B\\x{00E2}n-l\\x{00E2}m-g\\x{00FA}",
	"Pangasinan",
	"Nouormand",
	"F\\x{00F8}royskt",
	"S\\x{00E1}megiella",
	"Nedersaksisch",
	"Winaray",
	"Furlan",
	"\\x{092D}\\x{094B}\\x{091C}\\x{092A}\\x{0941}\\x{0930}\\x{0940}",
	"West-Vlams",
	"Novial",
	"\\x{092A}\\x{093E}\\x{093F}\\x{0934}",
	"Ilokano",
	"L\\x{00ED}guru",
	"Scots",
	"\\x{0928}\\x{0947}\\x{092A}\\x{093E}\\x{0932}\\x{0940}",
	"Arpetan",
	"\\x{078B}\\x{07A8}\\x{0788}\\x{07AC}\\x{0780}\\x{07A8}\\x{0784}\\x{07A6}\\x{0790}\\x{07B0}",
	"\\x{0418}\\x{0440}\\x{043E}\\x{043D}\\x{0430}\\x{0443}",
	"\\x{53E4}\\x{6587} / \\x{6587}\\x{8A00}\\x{6587}",
	"Zazaki",
	"\\x{049A}\\x{0430}\\x{0437}\\x{0430}\\x{049B}\\x{0448}\\x{0430}",
	"Malti",
	"Kasz\\x{00EB}bsczi",
	"Rumantsch",
	"Deitsch",
	"Ladino",
	"V\\x{00F5}ro",
	"Kernewek",
	"faka-Tonga",
	"Boarisch",
	"\\x{067E}\\x{069A}\\x{062A}\\x{0648}",
	"Arm\\x{00E3}neashce",
	"\\x{041C}\\x{043E}\\x{043D}\\x{0433}\\x{043E}\\x{043B}",
	"Ling\\x{00E1}la",
	"T\\x{00FC}rkmen",
	"Anglo Saxon",
	"Lojban",
	"Tok Pisin",
	"\\x{0B13}\\x{0B5C}\\x{0B3F}\\x{0B06}",
	"Wolof",
	"Emili\\x{00E0}n e rumagn\\x{00F2}l",
	"Reo M\\x{0101}`ohi",
	"\\x{041A}\\x{044B}\\x{0440}\\x{0433}\\x{044B}\\x{0437}\\x{0447}\\x{0430}",
	"Interlingue",
	"\\x{0710}\\x{072A}\\x{0721}\\x{071D}\\x{0710}",
	"\\x{06AF}\\x{06CC}\\x{0644}\\x{06A9}\\x{06CC}",
	"Igbo",
	"\\x{1797}\\x{17B6}\\x{179F}\\x{17B6}\\x{1781}\\x{17D2}\\x{1798}\\x{17C2}\\x{179A}",
	"Ze\\x{00EA}uws",
	"\\x{0A97}\\x{0AC1}\\x{0A9C}\\x{0AB0}\\x{0ABE}\\x{0AA4}\\x{0AC0}",
	"Taqbaylit",
	"\\x{0915}\\x{0936}\\x{094D}\\x{092E}\\x{0940}\\x{0930}\\x{0940} - (\\x{0643}\\x{0634}\\x{0645}\\x{064A}\\x{0631}\\x{064A})",
	"\\x{0DC3}\\x{0DD2}\\x{0D82}\\x{0DC4}\\x{0DBD}",
	"\\x{5434}\\x{8BED}",
	"\\x{0421}\\x{043B}\\x{043E}\\x{0432}\\x{0463}\\x{043D}\\x{044C}\\x{0441}\\x{043A}\\x{044A}",
	"Malagasy",
	"Soomaaliga",
	"Tetun",
	"\\x{0423}\\x{0434}\\x{043C}\\x{0443}\\x{0440}\\x{0442}",
	"Sardu",
	"Gaelg",
	"Zamboangue\\x{00F1}o",
	"Kongo",
	"\\x{1403}\\x{14C4}\\x{1483}\\x{144E}\\x{1450}\\x{1466}/inuktitut",
	"Aymar",
	"\\x{0A2A}\\x{0A70}\\x{0A1C}\\x{0A3E}\\x{0A2C}\\x{0A40}",
	"Hawai`i",
	"Romani",
	"Ekakair\\x{0169} Naoero",
	"\\x{0F56}\\x{0F7C}\\x{0F51}\\x{0F0B}\\x{0F61}\\x{0F72}\\x{0F42}",
	"\\x{0EA5}\\x{0EB2}\\x{0EA7}",
	"\\x{0633}\\x{0646}\\x{068C}\\x{064A}",
	"\\x{0411}\\x{0430}\\x{0448}\\x{04A1}\\x{043E}\\x{0440}\\x{0442}",
	"\\x{13E3}\\x{13B3}\\x{13A9}",
	"\\x{041D}\\x{043E}\\x{0445}\\x{0447}\\x{0438}\\x{0439}\\x{043D}",
	"Oromoo",
	"E\\x{028B}egbe",
	"\\x{1275}\\x{130D}\\x{122D}\\x{129B}",
	"Gagana Samoa",
	"\\x{0985}\\x{09B8}\\x{09AE}\\x{09C0}\\x{09DF}\\x{09BE}",
	"Uyghurche\\x{200E} / \\x{0626}\\x{06C7}\\x{064A}\\x{063A}\\x{06C7}\\x{0631}\\x{0686}\\x{06D5}",
	"Hak-k\\x{00E2}-fa",
	"\\x{0410}\\x{0432}\\x{0430}\\x{0440}",
	"M\\x{00EC}ng-d\\x{0115}\\x{0324}ng-ng\\x{1E73}\\x{0304}",
	"\\x{0645}\\x{064E}\\x{0632}\\x{0650}\\x{0631}\\x{0648}\\x{0646}\\x{064A}",
	"Bamanankan",
	"Din\\x{00E9} bizaad",
	"Papiamentu",
	"N\\x{0113}hiyaw\\x{0113}win / \\x{14C0}\\x{1426}\\x{1403}\\x{152D}\\x{140D}\\x{140F}\\x{1423}",
	"isiZulu",
	"Norfuk / Pitkern",
	"Kinyarwanda",
	"Myanmasa",
	"isiXhosa",
	"Tshivenda",
	"I\\x{00F1}upiak",
	"SiSwati",
	"Ava\\x{00F1}e'\\x{1EBD}",
	"\\x{0F47}\\x{0F7C}\\x{0F44}\\x{0F0B}\\x{0F41}",
	"\\x{0410}\\x{04A7}\\x{0441}\\x{0443}\\x{0430}",
	"Kalaallisut",
	"\\x{041A}\\x{043E}\\x{043C}\\x{0438}",
	"\\x{0425}\\x{0430}\\x{043B}\\x{044C}\\x{043C}\\x{0433}",
	"\\x{1A05}\\x{1A14} \\x{1A15}\\x{1A18}\\x{1A01}\\x{1A17}",
	"Bislama",
	"Akan",
	"\\x{0411}\\x{0443}\\x{0440}\\x{044F}\\x{0430}\\x{0434}",
	"Sesotho",
	"Setswana",
	"Twi",
	"Chi-Chewa",
	"Na Vosa Vakaviti",
	"\\x{041B}\\x{0430}\\x{043A}\\x{043A}\\x{0443}",
	"Fulfulde",
	"(Cuengh)",
	"\\x{0647}\\x{064E}\\x{0648}\\x{064F}\\x{0633}\\x{064E}",
	"chiShona",
	"chiTumbuka",
	"G\\x{0129}k\\x{0169}y\\x{0169}",
	"S\\x{00E4}ng\\x{00F6}",
	"Luganda",
	"Xitsonga",
	"Kirundi",
	"Afar",
	"Ebon",
	"Tsets\\x{00EA}hest\\x{00E2}hese",
	"Chamoru",
	"Oshiwambo",
); 

for (my $i = 0; $i < 240; ++$i) {
	is $string_unicode[$i], (decode 'unicode-escape', $escaped_unicode[$i]), "decoded unicode escape";
	is $escaped_unicode[$i], (encode 'unicode-escape', $string_unicode[$i]), "encoded unicode string";
}


Encode::Escape::Unicode->enmode('python');
Encode::Escape::Unicode->demode('python');

$string_unicode = "\x{0420}\x{0443}\x{0441}\x{0441}\x{043A}\x{0438}\x{0439}";
$escaped_python = "\\u0420\\u0443\\u0441\\u0441\\u043a\\u0438\\u0439";

is	$string_unicode,
	(decode 'unicode-escape', $escaped_python),
	"decoded python mode";
is	$escaped_python,
	(encode 'unicode-escape', $string_unicode),
	"encoded python mode";



