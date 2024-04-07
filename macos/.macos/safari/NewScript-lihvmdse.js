// ==UserScript==
// @name        NewScript-lihvmdse
// @description This is your new file, start writing code
// @match       *://*/*
// ==/UserScript==
document.documentElement.setAttribute("data-location", window.location.href);

if (window.location.href.includes("duckduckgo.com")) {
  document.getElementById("r1-0").focus();
}
