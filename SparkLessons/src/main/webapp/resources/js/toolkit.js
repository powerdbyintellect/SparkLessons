if (console === undefined) {
	var console = {
		log: function() { }
	};
}

if (prettyPrint === undefined) {
	var prettyPrint = function() { };
	window.alert("There was a problem loading prettify.js!");
}

if (Harmony === undefined) {
	var Harmony = { };
}

var History = window.History; // Note: We are using a capital H instead of a lower h

var Toolkit = {
	loadPage: function(pageToLoad, $pageOpener) {
		if (!pageToLoad && (!$pageOpener || $pageOpener.length === 0)) {
			// Check to see if the URI uses a hash to support older browsers without the History API
			if (window.location.hash && window.location.hash.match(/^#\.\//)) {
				pageToLoad = window.location.hash.split("?")[0].replace(/^#\.\//, "");
			}
			else {
				var pathParts = window.location.pathname.split("/");
				pageToLoad = pathParts[pathParts.length - 1];
				if (pageToLoad.match("#")) {
					pageToLoad = pageToLoad.split("#")[0];
				}
			}
		}

		var $primaryNav = $("nav").children(".nav-drawer").find("ul").eq(0);
		var $activeItem = {};

		// Was the opening page passed with the method call?
		if ($pageOpener && $pageOpener.length === 1) {
			$activeItem = $pageOpener;
		}
		// If not, use the URL to know which item should appear selected
		else {
			$activeItem = $primaryNav.find("a[href='" + pageToLoad + "']");
		}

		// If we still don't know which item should be appear selected, just use the first item found in the navigation
		if ($activeItem.length < 1) {
			$activeItem = $primaryNav.find("a").not("a[href='#']").eq(0);
			pageToLoad = $activeItem.attr("href");
		}

		// !To Do: Fix the race condition that make this setTimeout necessary.
		setTimeout(
			function() {
				$activeItem.trigger("updateNavigation");
			}
		);

		var $page = $("#page");
		if (pageToLoad && pageToLoad !== "back") {
			// Load the file that corresponds to the page
			var fileToLoad = "pages/" + pageToLoad + ".html";
			$page.load(fileToLoad,
				function(response, status, xhr) {
					if (status === "error") {
						$page.html("<h1>There was a problem loading " + fileToLoad + ".</h1>");
					}
					else {
						$page.scrollTop(0).trigger("pageLoaded");
					}
				}
			);
		}
	}
};
// jQuery Plug-ins
(function($) {
	// Add line numbers to code samples that won't be selected with the code
	$.fn.numberLines = function() {
		this.each(
			function() {
				var code = $(this).html();
				if (code) {
					var linecount;
					code = window.escape(code);
					// %0A is a line feed, %0D is a carriage return
					if (code.indexOf("%0D%0A") > -1) {
						code = code.replace(/^%0D%0A/,"");
						linecount = code.match(/%0D%0A/g).length;
					}
					else if (code.indexOf("%0A") > -1) {
						code = code.replace(/^%0A/,"");
						linecount = code.match(/%0A/g).length;
					}
					else if (code.indexOf("%0D") > -1) {
						code = code.replace(/^%0D/,"");
						linecount = code.match(/%0D/g).length;
					}
					code = window.unescape(code);
	
					var linenumbers = 1;
					for (var i = 1; i < linecount; i++) {
						linenumbers += "<br>" + (i + 1);
					}
					$(this).html(code).before("<pre class=\"linenumbers\">" + linenumbers + "</pre>");
				}
			}
		);
	};
})(jQuery);

// Run on DOM Ready event
$(document).ready(
	function() {
		// Bind to StateChange Event
		History.Adapter.bind(
			window,
			"statechange", // Note: We are using statechange instead of popstate
			function() {
				/*
					We're not actually getting the history state. Instead, we're
					parsing the URL inside the Toolkit.loadPage() function.
				*/
				// var State = History.getState(); // Note: We are using History.getState() instead of event.state
				// History.log(State.data, State.title, State.url);

				if (Harmony.useHistory) {
					Toolkit.loadPage();
				}
			}
		);

		// Add line numbers and prettify the code sames on each page load
		$("#page").on(
			"pageLoaded",
			function() {
				// Add line numbers
				$("code.prettyprint").numberLines();

				// Prettify code samples
				prettyPrint();
			}
		);

		// Parse the current URL and load the applicable page.
		Toolkit.loadPage();
		
		// Deactive links with the "disabled" class.
		$(document).on(
			"click",
			"a.disabled",
			function(e) {
				e.preventDefault();
			}
		);
	}
);

