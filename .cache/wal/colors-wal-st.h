const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#26233a", /* black   */
  [1] = "#eb6f92", /* red     */
  [2] = "#31748f", /* green   */
  [3] = "#f6c177", /* yellow  */
  [4] = "#9ccfd8", /* blue    */
  [5] = "#c4a7e7", /* magenta */
  [6] = "#ebbcba", /* cyan    */
  [7] = "#e0def4", /* white   */

  /* 8 bright colors */
  [8]  = "#6e6a86",  /* black   */
  [9]  = "#eb6f92",  /* red     */
  [10] = "#31748f", /* green   */
  [11] = "#f6c177", /* yellow  */
  [12] = "#9ccfd8", /* blue    */
  [13] = "#c4a7e7", /* magenta */
  [14] = "#ebbcba", /* cyan    */
  [15] = "#e0def4", /* white   */

  /* special colors */
  [256] = "#191724", /* background */
  [257] = "#e0def4", /* foreground */
  [258] = "#e0def4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
