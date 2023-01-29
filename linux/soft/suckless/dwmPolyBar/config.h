/* See LICENSE file for copyright and license details. */


/* Constants */
#define TERMINAL "st"

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int gappx     = 10;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int usealtbar          = 1;        /* 1 means use non-dwm status bar */
static const char *altbarclass      = "Polybar"; /* Alternate bar class name */
static const char *alttrayname      = "tray";    /* Polybar tray instance name */
static const Bool viewontag         = False;     /* Switch view on tag switch */
static const int horizpadbar        = 2;        /* horizontal padding for statusbar */
static const int vertpadbar         = 21;        /* vertical padding for statusbar */
static const char *fonts[]          = { "Liberation Mono:size=9",
                                        "Material Icons:size=14" };
static const char dmenufont[]       = "monospace:size=10";
static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#444444";
static char normfgcolor[]           = "#fffffb";
static char selfgcolor[]            = "#eeeeee";
static char selbordercolor[]        = "#6688ad";
static char selbgcolor[]            = "#37474F";
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
	   [SchemeTitle]  = { normfgcolor, normbgcolor, normbordercolor  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class        instance    title               tags mask     isfloating   isterminal  noswallow   monitor */
    { "Ferdi",      NULL,       NULL,               1 << 6,       0,           0,          0,          -1 },
    { "Slack",      NULL,       NULL,               1 << 9,       0,           0,          0,          -1 },
    { "discord",    NULL,       NULL,               1 << 9,       0,           0,          0,          -1 },
    { "Spotify",    NULL,       NULL,               1 << 8,       0,           0,          0,          -1 },
    { "Mailspring", NULL,       NULL,               1 << 7,       0,           0,          0,          -1 },
	{ "St",         NULL,       NULL,               0,            0,           1,          0,          -1 },
	{ NULL,         NULL,       "Event Tester",     0,            1,           0,          1,          -1 },  // xev
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "+",        gaplessgrid }
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }


/* commands */
static const char *termcmd[]  = { TERMINAL, NULL };
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "120x34", NULL };
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };

#include "movestack.c"
static Key keys[] = {
	/* modifier key function argument */
	{ Mod1Mask, XK_space, spawn,SHCMD("rofi -show run")},
	{ MODKEY|Mod1Mask, XK_1, spawn,SHCMD("dwm-soft-chrome")},
	{ MODKEY, XK_m, spawn,SHCMD("slock")},
	{ MODKEY|ShiftMask, XK_a, spawn,SHCMD("flameshot gui")},
	{ MODKEY|ShiftMask, XK_F12, spawn,SHCMD("ps -ef | grep Xorg | awk '{print $2}' | xargs kill -9")},
	// { MODKEY|Mod1Mask, XK_2, spawn,{.v = termcmd} },
	// { MODKEY|Mod1Mask, XK_3, spawn,SHCMD("code")},
	{ MODKEY, XK_Return, spawn,{.v = termcmd} },
	{ MODKEY, XK_c, killclient, {0}},
	{ MODKEY, XK_b, togglebar, {0}},
	{ MODKEY, XK_Escape, togglescratch, {.v = scratchpadcmd }},
	// { MODKEY, XK_Left, shiftview, {.i = -1}},
	// { MODKEY, XK_Right, shiftview, {.i = +1}},
	{ MODKEY, XK_j, focusstack, {.i = -1}},
	{ MODKEY, XK_l, focusstack, {.i = +1}},
	{ MODKEY|ShiftMask, XK_j, movestack, {.i = -1}},
	{ MODKEY|ShiftMask, XK_l, movestack, {.i = +1}},
	{ MODKEY, XK_w, focusmon, {.i = +1}},
	{ MODKEY|ShiftMask, tagmon, focusmon, {.i = -1}},
	{ MODKEY, XK_Tab, view, {0}},
	{ MODKEY, XK_space, zoom, {0}},
	{ MODKEY, XK_s, togglesticky, {0}},
	{ MODKEY, XK_minus, setmfact, {.f = -0.05}},
	{ MODKEY, XK_equal, setmfact, {.f = +0.05}},
	TAGKEYS(XK_1,0)
	TAGKEYS(XK_2,1)
	TAGKEYS(XK_3,2)
	TAGKEYS(XK_4,3)
	TAGKEYS(XK_5,4)
	TAGKEYS(XK_6,5)
	TAGKEYS(XK_7,6)
	TAGKEYS(XK_8,7)
	TAGKEYS(XK_9,8)
         
// 	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
// 	{ MODKEY,                       XK_grave,  togglescratch,  {.v = scratchpadcmd } },
// 	{ MODKEY,                       XK_b,      togglebar,      {0} },
// 	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
// 	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
// 	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
// 	{ MODKEY,                       XK_r,      incnmaster,     {.i = -1 } },
// 	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
// 	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
// 	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
// 	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
// 	{ MODKEY|ShiftMask,             XK_h,      setcfact,       {.f = +0.25} },
// 	{ MODKEY|ShiftMask,             XK_l,      setcfact,       {.f = -0.25} },
// 	{ MODKEY|ShiftMask,             XK_o,      setcfact,       {.f =  0.00} },
// //	{ MODKEY,                       XK_Return, zoom,           {0} },
// //	{ MODKEY,                       XK_Tab,    view,           {0} },
// 	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
// 	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
// //	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
// 	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[2]} },
// 	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[3]} },
// //	{ MODKEY,                       XK_space,  setlayout,      {0} },
// 	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
// 	{ MODKEY|ShiftMask,             XK_s,      togglesticky,   {0} },
// 	{ MODKEY,                       XK_Tab,    view,           {.ui = ~0 } },
// 	{ MODKEY|ShiftMask,             XK_Tab,    tag,            {.ui = ~0 } },
// 	{ MODKEY|ControlMask,           XK_j,      focusmon,       {.i = -1 } },
// 	{ MODKEY|ControlMask,           XK_k,      focusmon,       {.i = +1 } },
// 	{ MODKEY|ControlMask|ShiftMask, XK_j,      tagmon,         {.i = -1 } },
// 	{ MODKEY|ControlMask|ShiftMask, XK_k,      tagmon,         {.i = +1 } },
// //	{ MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
// //	{ MODKEY,                       XK_equal,  setgaps,        {.i = +1 } },
// //	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
// 	{ MODKEY,                       XK_F5,     xrdb,           {.v = NULL } },
// 	TAGKEYS(                        XK_1,                      0)
// 	TAGKEYS(                        XK_2,                      1)
// 	TAGKEYS(                        XK_3,                      2)
// 	TAGKEYS(                        XK_4,                      3)
// 	TAGKEYS(                        XK_5,                      4)
// 	TAGKEYS(                        XK_6,                      5)
// 	TAGKEYS(                        XK_7,                      6)
// 	TAGKEYS(                        XK_8,                      7)
// 	TAGKEYS(                        XK_9,                      8)
//     TAGKEYS(                        XK_0,                      9)
// 	{ MODKEY|ControlMask|ShiftMask, XK_e,      quit,           {1} }, 
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
};

static const char *ipcsockpath = "/tmp/dwm.sock";
static IPCCommand ipccommands[] = {
  IPCCOMMAND(  view,                1,      {ARG_TYPE_UINT}   ),
  IPCCOMMAND(  toggleview,          1,      {ARG_TYPE_UINT}   ),
  IPCCOMMAND(  tag,                 1,      {ARG_TYPE_UINT}   ),
  IPCCOMMAND(  toggletag,           1,      {ARG_TYPE_UINT}   ),
  IPCCOMMAND(  tagmon,              1,      {ARG_TYPE_UINT}   ),
  IPCCOMMAND(  focusmon,            1,      {ARG_TYPE_SINT}   ),
  IPCCOMMAND(  focusmonnum,         1,      {ARG_TYPE_UINT}   ),
  IPCCOMMAND(  focusstack,          1,      {ARG_TYPE_SINT}   ),
  IPCCOMMAND(  zoom,                1,      {ARG_TYPE_NONE}   ),
  IPCCOMMAND(  spawn,               1,      {ARG_TYPE_PTR}    ),
  IPCCOMMAND(  incnmaster,          1,      {ARG_TYPE_SINT}   ),
  IPCCOMMAND(  killclient,          1,      {ARG_TYPE_SINT}   ),
  IPCCOMMAND(  togglefloating,      1,      {ARG_TYPE_NONE}   ),
  IPCCOMMAND(  setmfact,            1,      {ARG_TYPE_FLOAT}  ),
  IPCCOMMAND(  setlayoutsafe,       1,      {ARG_TYPE_PTR}    ),
  IPCCOMMAND(  quit,                1,      {ARG_TYPE_NONE}   )
};

