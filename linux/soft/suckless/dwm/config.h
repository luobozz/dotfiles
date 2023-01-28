/* See LICENSE file for copyright and license details. */

/* Constants */
#define TERMINAL "st"
// #define TERMCLASS "alacritty"

/* appearance */
static unsigned int borderpx  = 0;        /* border pixel of windows */
static unsigned int snap      = 32;       /* snap pixel */
static unsigned int gappih    = 4;       /* horiz inner gap between windows */
static unsigned int gappiv    = 4;       /* vert inner gap between windows */
static unsigned int gappoh    = 4;       /* horiz outer gap between windows and screen edge */
static unsigned int gappov    = 4;       /* vert outer gap between windows and screen edge */
static int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static int showbar            = 1;        /* 0 means no bar */
static int topbar             = 1;        /* 0 means bottom bar */
// static char *fonts[]          = { "Fira Mono:style=Bold:size=10","HarmonyOS Sans SC:style=Bold:size=10" };
static char *fonts[]          = {"JetBrains Mono:style=Bold:pixelsize=14:antialias=true:autohint=true"," Alibaba PuHuiTi 2.0:style=Bold:pixelsize=14" ,"Fira Code Nerd Font Mono:pixelsize=20:antialias=true:autohint=true"};
static const char dmenufont[]       = "Fira Mono:style=Bold:size=10";
static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#444444";
static char normfgcolor[]           = "#fffffb";
static char selfgcolor[]            = "#eeeeee";
static char selbordercolor[]        = "#6688ad";
static char selbgcolor[]            = "#37474F";
static const unsigned int baralpha = 0x64;
static const unsigned int borderalpha = OPAQUE;
static const char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {TERMINAL, "-n", "spterm","-g", "120x34", NULL };
const char *spcmd2[] = {"alacritty", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"spcalc",      spcmd2},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
/* static const char *tags[] = { "🐭", "🐮", "🐯", "🐰", "🐉", "🐍", "🐴", "🐑", "🐵" }; */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	*/
	/* class    instance      title       	 tags mask    isfloating   isterminal  noswallow  monitor */
	{ "Gimp",     NULL,       NULL,       	    1 << 8,       0,           0,         0,        -1 },
	// { TERMCLASS,  NULL,       NULL,       	    0,            0,           1,         0,        -1 },
	{ NULL,       NULL,       "Event Tester",   0,            0,           0,         1,        -1 },
	{ NULL,      "spterm",    NULL,       	    SPTAG(0),     1,           1,         0,        -1 },
	{ NULL,      "spcalc",    NULL,       	    SPTAG(1),     1,           1,         0,        -1 },
};

/* layout(s) */
static float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static int nmaster     = 1;    /* number of clients in master area */
static int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",	tile },			/* Default: Master on left, slaves on right */
	{ "TTT",	bstack },		/* Master on top, slaves on bottom */

	{ "[@]",	spiral },		/* Fibonacci spiral */
	{ "[\\]",	dwindle },		/* Decreasing in size right and leftward */

	{ "[D]",	deck },			/* Master on left, slaves in monocle-like mode on right */
	{ "[M]",	monocle },		/* All windows on top of eachother */

	{ "|M|",	centeredmaster },		/* Master in middle, slaves on sides */
	{ ">M>",	centeredfloatingmaster },	/* Same but master floats */

	{ "><>",	NULL },			/* no layout function means floating behavior */
	{ NULL,		NULL },
};

/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
		{ "color0",		STRING,	&normbordercolor },
		{ "color2",		STRING,	&selbordercolor },  // maybe color1
		/* { "color2",		STRING,	&normbgcolor },    // maybe color1 */
		/* { "color4",		STRING,	&normfgcolor }, */
		/* { "color7",		STRING,	&normfgcolor }, */
		{ "color0",		STRING,	&selfgcolor },
		/* { "color4",		STRING,	&selbgcolor }, */
		{ "borderpx",		INTEGER, &borderpx },
		{ "snap",		INTEGER, &snap },
		{ "showbar",		INTEGER, &showbar },
		{ "topbar",		INTEGER, &topbar },
		{ "nmaster",		INTEGER, &nmaster },
		{ "resizehints",	INTEGER, &resizehints },
		{ "mfact",		FLOAT,	&mfact },
		{ "gappih",		INTEGER, &gappih },
		{ "gappiv",		INTEGER, &gappiv },
		{ "gappoh",		INTEGER, &gappoh },
		{ "gappov",		INTEGER, &gappov },
		{ "swallowfloating",	INTEGER, &swallowfloating },
		{ "smartgaps",		INTEGER, &smartgaps },
};

#include <X11/XF86keysym.h>
#include "shiftview.c"

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define STACKKEYS(MOD,ACTION) \
	{ MOD,	XK_j,	ACTION##stack,	{.i = INC(+1) } }, \
	{ MOD,	XK_l,	ACTION##stack,	{.i = INC(-1) } }, \

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *termcmd[]  = { TERMINAL, NULL };
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static Key keys[] = {
	/* modifier                     key                  function            argument */
	// dmenu         
	/* { MODKEY,						XK_p,  	             spawn,              {.v= dmenucmd} }, */
    {Mod1Mask,                      XK_space,           spawn,              SHCMD("rofi -show run")},
	//快捷启动         
	{ MODKEY|Mod1Mask,             	XK_1,               spawn,              SHCMD("dwm-soft-chrome") },
	{ MODKEY|Mod1Mask,              XK_2,               spawn,              {.v = termcmd} },
	{ MODKEY,                       XK_Return,          spawn,              {.v = termcmd} },
	{ MODKEY|Mod1Mask,             	XK_3,               spawn,              SHCMD("code") },
	// 关闭当前窗口         
	{ MODKEY,             			XK_c,                killclient,         {0} },
	// 隐藏任务栏         
	{ MODKEY,                       XK_b,                togglebar,          {0} },
	// 开启一个浮动控制台         
 	/* { MODKEY,		            	XK_grave,            togglescratch,      {.ui = 0} }, */
 	{ MODKEY,		            	XK_Escape,            togglescratch,      {.ui = 0} },
          
    // 任务栏 标签移动         
 	{ MODKEY,						XK_Left,	         shiftview,	         {.i = -1} },
 	{ MODKEY,						XK_Right,	         shiftview,	         {.i = +1} },
	{ MODKEY,                       XK_w, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_w,  tagmon,         {.i = -1 } },
	{ MODKEY,						XK_Tab,		         view,		         {0} },
	TAGKEYS(                        XK_1,                                    0)
	TAGKEYS(                        XK_2,                                    1)
	TAGKEYS(                        XK_3,                                    2)
	TAGKEYS(                        XK_4,                                    3)
	TAGKEYS(                        XK_5,                                    4)
	TAGKEYS(                        XK_6,                                    5)
	TAGKEYS(                        XK_7,                                    6)
	TAGKEYS(                        XK_8,                                    7)
	TAGKEYS(                        XK_9,                                    8)
         
	//窗口移动         
	STACKKEYS(MODKEY,               focus)         
	STACKKEYS(MODKEY|ShiftMask,     push)         
	{ MODKEY,                       XK_minus,            setmfact,           {.f = -0.05} },
	{ MODKEY,                       XK_equal,            setmfact,           {.f = +0.05} },
	//TODO 某些笔记本增强按键(修复equal按不下去目前不知道原因)      
	{ MODKEY,                       XK_KP_Subtract,      setmfact,           {.f = +0.05} },
	{ MODKEY,                       XK_KP_Add,           setmfact,           {.f = -0.05} },
	
	//窗口操作
	//全屏
	{ MODKEY,			 			XK_F11,				 togglefullscr,	     {0} },
	{ MODKEY,			 			XK_m,				 spawn,              SHCMD("slock") },
	{ MODKEY,                       XK_d,      hidewin,        {0} },
	{ MODKEY|ShiftMask,             XK_d,      restorewin,     {0} },
	//切换当前窗口到主窗口        
	{ MODKEY,						XK_space,			 zoom,		         {0} },
	// 窗口伴随         		
	{ MODKEY,						XK_s,				 togglesticky,	     {0} },	
	{ MODKEY|ShiftMask,             XK_F12,                spawn,              SHCMD("ps -ef | grep Xorg | awk '{print $2}' | xargs kill -9") },
	{ MODKEY|ShiftMask,             XK_a,                spawn,              SHCMD("flameshot gui")},
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkStatusText,        0,              Button1,        sigdwmblocks,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigdwmblocks,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigdwmblocks,   {.i = 3} },
	{ ClkStatusText,        0,              Button4,        sigdwmblocks,   {.i = 4} },
	{ ClkStatusText,        0,              Button5,        sigdwmblocks,   {.i = 5} },
	{ ClkStatusText,        ShiftMask,      Button1,        sigdwmblocks,   {.i = 6} },
};
