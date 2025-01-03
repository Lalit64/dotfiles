{ pkgs, config, ... }:
{
  home.file.".simplebarrc".text = ''
    {
      "global": {
        "theme": "dark",
        "floatingBar": true,
        "noBarBg": true,
        "noColorInData": false,
        "bottomBar": false,
        "inlineSpacesOptions": false,
        "disableNotifications": true,
        "compactMode": false,
        "widgetMaxWidth": "160px",
        "spacesBackgroundColorAsForeground": true,
        "widgetsBackgroundColorAsForeground": true,
        "font": "${config.stylix.fonts.monospace.name}",
        "fontSize": "11px",
        "yabaiPath": "${pkgs.yabai}/bin/yabai",
        "shell": "sh",
        "slidingAnimationPace": "3",
        "externalConfigFile": true
      },
      "themes": {
        "lightTheme": "MacOSLight",
        "darkTheme": "Wal"
      },
      "process": {
        "displayOnlyCurrent": false,
        "centered": false,
        "showCurrentSpaceMode": false,
        "hideWindowTitle": true,
        "displayOnlyIcon": true
      },
      "spacesDisplay": {
        "exclusions": "",
        "titleExclusions": "",
        "spacesExclusions": "",
        "exclusionsAsRegex": false,
        "displayAllSpacesOnAllScreens": false,
        "hideDuplicateAppsInSpaces": false,
        "displayStickyWindowsSeparately": false,
        "hideEmptySpaces": false,
        "showOptionsOnHover": true,
        "switchSpacesWithoutYabai": false
      },
      "widgets": {
        "processWidget": true,
        "weatherWidget": true,
        "batteryWidget": true,
        "wifiWidget": true,
        "vpnWidget": false,
        "zoomWidget": false,
        "soundWidget": true,
        "micWidget": false,
        "dateWidget": false,
        "timeWidget": true,
        "keyboardWidget": false,
        "spotifyWidget": false,
        "cryptoWidget": false,
        "stockWidget": false,
        "musicWidget": false,
        "mpdWidget": false,
        "dndWidget": false,
        "browserTrackWidget": false
      },
      "weatherWidgetOptions": {
        "refreshFrequency": 1800000,
        "unit": "C",
        "hideLocation": false,
        "hideGradient": false,
        "customLocation": "Vijayawada"
      },
      "batteryWidgetOptions": {
        "refreshFrequency": 10000,
        "toggleCaffeinateOnClick": true,
        "caffeinateOption": ""
      },
      "networkWidgetOptions": {
        "refreshFrequency": 20000,
        "networkDevice": "en0",
        "hideWifiIfDisabled": false,
        "toggleWifiOnClick": false,
        "hideNetworkName": false
      },
      "vpnWidgetOptions": {
        "refreshFrequency": 8000,
        "vpnConnectionName": "",
        "vpnShowConnectionName": false
      },
      "zoomWidgetOptions": {
        "refreshFrequency": 5000,
        "showVideo": true,
        "showMic": true
      },
      "soundWidgetOptions": {
        "refreshFrequency": 20000
      },
      "micWidgetOptions": {
        "refreshFrequency": 20000
      },
      "dateWidgetOptions": {
        "refreshFrequency": 30000,
        "shortDateFormat": true,
        "locale": "en-UK",
        "calendarApp": ""
      },
      "timeWidgetOptions": {
        "refreshFrequency": 1000,
        "hour12": false,
        "dayProgress": true,
        "showSeconds": false
      },
      "keyboardWidgetOptions": {
        "refreshFrequency": 20000
      },
      "cryptoWidgetOptions": {
        "refreshFrequency": 300000,
        "denomination": "usd",
        "identifiers": "bitcoin,ethereum,celo",
        "precision": 5
      },
      "stockWidgetOptions": {
        "refreshFrequency": 900000,
        "yahooFinanceApiKey": "YOUR_API_KEY",
        "symbols": "AAPL,TSLA",
        "showSymbol": true,
        "showCurrency": true,
        "showMarketPrice": true,
        "showMarketChange": false,
        "showMarketPercent": true,
        "showColor": true
      },
      "spotifyWidgetOptions": {
        "refreshFrequency": 10000,
        "showSpecter": true
      },
      "musicWidgetOptions": {
        "refreshFrequency": 10000,
        "showSpecter": true
      },
      "mpdWidgetOptions": {
        "refreshFrequency": "1000",
        "showSpecter": true,
        "mpdPort": "6600",
        "mpdHost": "127.0.0.1",
        "mpdFormatString": "%title%[ - %artist%"
      },
      "dndWidgetOptions": {
        "refreshFrequency": 60000,
        "showDndLabel": false
      },
      "browserTrackWidgetOptions": {
        "refreshFrequency": 10000,
        "showSpecter": true
      },
      "userWidgets": {
        "userWidgetsList": {}
      },
      "customStyles": {
        "styles": ".simple-bar--floating {\npadding-left: 10px;\npadding-right: 10px;\nmargin-top: 4px;\n}"
      }
    }
  '';
}
