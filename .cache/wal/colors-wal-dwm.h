static const char norm_fg[] = "#e0def4";
static const char norm_bg[] = "#393552";
static const char norm_border[] = "#6e6a86";

static const char sel_fg[] = "#e0def4";
static const char sel_bg[] = "#3e8fb0";
static const char sel_border[] = "#e0def4";

static const char urg_fg[] = "#e0def4";
static const char urg_bg[] = "#eb6f92";
static const char urg_border[] = "#eb6f92";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
