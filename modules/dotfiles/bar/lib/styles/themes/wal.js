import { variables } from '../pywal/pywal.js';

export const theme = {
  name: 'Wal',
  kind: 'dark',
  foreground: variables.cursor,
  transparentDark: 'rgba(0, 0, 0, 0.05)',
  defaultFont: 'JetBrains Mono, Monaco, Menlo, monospace',
  barHeight: '34px',
  compactBarHeight: '28px',
  barRadius: '3px',
  barInnerMargin: '3px',
  itemRadius: '2px',
  itemInnerMargin: '3px 7px',
  itemOuterMargin: '0 0 0 5px',
  hoverRing: '0 0 0 2px rgba(255, 255, 255, 0.75)',
  focusRing: '0 0 0 2px rgb(255, 255, 255)',
  lightShadow: '0 5px 10px rgba(0, 0, 0, 0.24)',
  transitionEasing: 'cubic-bezier(0.4, 0, 0.2, 1)',
  clickEffect: 'rgba(255, 255, 255, 0.3)',
};
