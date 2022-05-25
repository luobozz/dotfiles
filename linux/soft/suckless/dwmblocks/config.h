//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/			/*Update Interval*/	/*Update Signal*/
	{"",		"dwmblocktools-blockscmd 'dwmblock-network-raf' frontspace",		2,					1},
	{"",		"dwmblocktools-blockscmd 'dwmblock-mem' ",							2,					2},
	{"",		"dwmblocktools-blockscmd 'dwmblock-cpu'",							2,					3},
	{"",		"dwmblocktools-blockscmd 'dwmblock-disk'",							5,					4},
	{"",		"dwmblocktools-blockscmd 'dwmblock-date'",							1,					5},
	{"",		"dwmblocktools-blockscmd 'dwmblock-vol'",							1,					6},
	{"",		"dwmblocktools-blockscmd 'dwmblock-network'",						1,					7},
	{"",		"dwmblocktools-blockscmd 'dwmblock-network-proxy'",					1,					8},
	{"",		"dwmblocktools-blockscmd 'dwmblock-fcitx'",							1,					9},
	{"",		"dwmblocktools-blockscmd 'dwmblock-refresh'",						0,					10},
};

//Sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char *delim = "";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
