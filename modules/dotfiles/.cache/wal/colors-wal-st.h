const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#181825", /* black   */
  [1] = "#f38ba8", /* red     */
  [2] = "#89b4fa", /* green   */
  [3] = "#f9e2af", /* yellow  */
  [4] = "#a6e3a1", /* blue    */
  [5] = "#cba6f7", /* magenta */
  [6] = "#fab387", /* cyan    */
  [7] = "#cdd6f4", /* white   */

  /* 8 bright colors */
  [8]  = "#313244",  /* black   */
  [9]  = "#f38ba8",  /* red     */
  [10] = "#89b4fa", /* green   */
  [11] = "#f9e2af", /* yellow  */
  [12] = "#a6e3a1", /* blue    */
  [13] = "#cba6f7", /* magenta */
  [14] = "#fab387", /* cyan    */
  [15] = "#cdd6f4", /* white   */

  /* special colors */
  [256] = "#1e1e2e", /* background */
  [257] = "#cdd6f4", /* foreground */
  [258] = "#cdd6f4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
