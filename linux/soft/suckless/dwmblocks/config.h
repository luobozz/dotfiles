//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/			/*Update Interval*/	/*Update Signal*/
	{"",		"dwmblocktools-blockscmd 'dwmblock-mem' frontspace",				2,					1},
	{"",		"dwmblocktools-blockscmd 'dwmblock-cpu'",							2,					2},
	{"",		"dwmblocktools-blockscmd 'dwmblock-video'",							2,					3},
	{"",		"dwmblocktools-blockscmd 'dwmblock-date'",							1,					4},
	{"",		"dwmblocktools-blockscmd 'dwmblock-clock'",							1,					5},
	{"",		"dwmblocktools-blockscmd 'dwmblock-refresh'",						0,					6},
};

//Sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char *delim = "";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
