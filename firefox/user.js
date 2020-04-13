/****************************************************
 *     teal's custom firefox configuration file     *
 * (limited by the inability to install extensions) *
 ****************************************************/

// I don't understand why recently used is the default, it feels awkward
user_pref("browser.ctrlTab.recentlyUsedOrder", false);
// user_pref("browser.discovery.enabled", false);
// user_pref("browser.formfill.enable", false);

// Disable use of Google's safebrowsing feature
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);

// Disable autocomplete in the URL bar
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.autoFill", false);

// Don't suggest entries from history or searches
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.seaches", false);

// No No No
user_pref("datareporting.healthreport.uploadEnabled", false);

// Disable Battery Status API
user_pref("dom.battery.enabled", false);

// Disable Pocket (built-in extensions are a bad idea)
user_pref("extensions.pocket.enabled", false);

// Disable Location-Aware Browsing
user_pref("geo.enabled", false);

// Disable WebRTC
user_pref("media.peerconnection.enabled", false);
user_pref("permissions.default.camera", 2);
user_pref("permissions.default.desktop-notification", 2);
user_pref("permissions.default.geo", 2);
user_pref("permissions.default.microphone", 2);
user_pref("places.history.enabled", false);
user_pref("reader.color_scheme", "dark");
user_pref("security.secure_connection_icon_color_gray", false);

// Color Scheme (fingerprintable)
user_pref("devtools.theme", "dark");
user_pref("ui.systemUsesDarkTheme", 1);

// Disable ugly expanding search bar
user_pref("browser.urlbar.update1", false);
