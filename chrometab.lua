-- https://liuhao.im/english/2017/06/02/macos-automation-and-shortcuts-with-hammerspoon.html#id-open-a-certain-chrome-tab-with-alt--

require("hs.osascript")

function chrome_active_tab_with_name(name)
    return function()
        -- LuaFormatter off
        hs.osascript.javascript([[
            // below is javascript code
            var chrome = Application('Google Chrome');
            chrome.activate();
            var wins = chrome.windows;

            // loop tabs to find a web page with a title of <name>
            function main() {
                for (var i = 0; i < wins.length; i++) {
                    var win = wins.at(i);
                    var tabs = win.tabs;
                    for (var j = 0; j < tabs.length; j++) {
                        var tab = tabs.at(j);
                        tab.title(); j;
                        if (tab.title().indexOf(']] .. name .. [[') > -1) {
                            win.activeTabIndex = j + 1;an
                            return;
                        }
                    }
                }
            }
            main();
            // end of javascript
        ]])
        -- LuaFormatter on
    end
end

-- This one doesn't seem to work
-- http://evantravers.com/articles/2019/10/31/focusing-browser-tab-using-jxa-and-hammerspoon/

function switch_to_slack_in_chrome()
    return function()
        hs.osascript.javascript([[
            (function() {
                var brave = Application('GoogleChrome');
                brave.activate();
                for (win of brave.windows()) {
                    var tabIndex = win.tabs().findIndex(tab => tab.url().match(/api.slack.com/));
                    if (tabIndex != -1) {
                        win.activeTabIndex = (tabIndex + 1);
                        win.index = 1;
                    }
                }
            })();
        ]])
    end
end
