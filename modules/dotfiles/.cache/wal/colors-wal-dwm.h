static const char norm_fg[] = "#cdd6f4";
static const char norm_bg[] = "#181825";
static const char norm_border[] = "#313244";

static const char sel_fg[] = "#cdd6f4";
static const char sel_bg[] = "#89b4fa";
static const char sel_border[] = "#cdd6f4";

static const char urg_fg[] = "#cdd6f4";
static const char urg_bg[] = "#f38ba8";
static const char urg_border[] = "#f38ba8";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
