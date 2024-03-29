<?php
# This file was automatically generated by the MediaWiki 1.32.0
# installer. If you make manual changes, please keep track in case you
# need to recreate them later.
#
# See includes/DefaultSettings.php for all configurable settings
# and their default values, but don't forget to make changes in _this_
# file, not there.
#
# Further documentation for configuration settings may be found at:
# https://www.mediawiki.org/wiki/Manual:Configuration_settings

# Protect against web entry
if ( !defined( 'MEDIAWIKI' ) ) {
	exit;
}


## Uncomment this to disable output compression
# $wgDisableOutputCompression = true;

$wgSitename = "Pandorabox";

## The URL base path to the directory containing the wiki;
## defaults for all runtime URL paths are based off of this.
## For more information on customizing the URLs
## (like /w/index.php/Page_title to /wiki/Page_title) please see:
## https://www.mediawiki.org/wiki/Manual:Short_URL
$wgScriptPath = "";

## The protocol and server name to use in fully-qualified URLs
$wgServer = "https://pandorabox.io";

## The URL path to static resources (images, scripts, etc.)
$wgResourceBasePath = $wgScriptPath;

## The URL path to the logo.  Make sure you change this from the default,
## or else you'll overwrite your logo when you upgrade!
//$wgLogo = "$wgResourceBasePath/resources/assets/wiki.png";
$wgLogo = $wgScriptPath . '/images/1/1a/Pandorabox_black_small.png';

## UPO means: this is also a user preference option

$wgEnableEmail = true;
$wgEnableUserEmail = true; # UPO

$wgEmergencyContact = "wiki@pandorabox.io";
$wgPasswordSender = "wiki@pandorabox.io";

$wgEnotifUserTalk = false; # UPO
$wgEnotifWatchlist = false; # UPO
$wgEmailAuthentication = true;

## Database settings
$wgDBtype = "postgres";
$wgDBserver = "postgres";
$wgDBname = "wiki";
$wgDBuser = "postgres";
$wgDBpassword = "enter";

# Postgres specific settings
$wgDBport = "5432";
$wgDBmwschema = "mediawiki";

## Shared memory settings
#$wgMainCacheType = CACHE_NONE;
$wgMainCacheType = CACHE_ANYTHING;
$wgMemCachedServers = [];

## To enable image uploads, make sure the 'images' directory
## is writable, then set this to true:
$wgEnableUploads = true;
#$wgUseImageMagick = true;
#$wgImageMagickConvertCommand = "/usr/bin/convert";

# InstantCommons allows wiki to use images from https://commons.wikimedia.org
$wgUseInstantCommons = true;

# Periodically send a pingback to https://www.mediawiki.org/ with basic data
# about this MediaWiki instance. The Wikimedia Foundation shares this data
# with MediaWiki developers to help guide future development efforts.
$wgPingback = true;

## If you use ImageMagick (or any other shell command) on a
## Linux server, this will need to be set to the name of an
## available UTF-8 locale
$wgShellLocale = "C.UTF-8";

## Set $wgCacheDirectory to a writable directory on the web server
## to make your wiki go slightly faster. The directory should not
## be publically accessible from the web.
$wgCacheDirectory = "$IP/cache";

# Site language code, should be one of the list in ./languages/data/Names.php
$wgLanguageCode = "en";

# Changing this will log out all existing sessions.
$wgAuthenticationTokenVersion = "1";

# Site upgrade key. Must be set to a string (default provided) to turn on the
# web installer while LocalSettings.php is in place
$wgUpgradeKey = "096546294b1188db";

## For attaching licensing metadata to pages, and displaying an
## appropriate copyright notice / icon. GNU Free Documentation
## License and Creative Commons licenses are supported so far.
$wgRightsPage = ""; # Set to the title of a wiki page that describes your license/copyright
$wgRightsUrl = "";
$wgRightsText = "";
$wgRightsIcon = "";

# Path to the GNU diff3 utility. Used for conflict resolution.
$wgDiff3 = "/usr/bin/diff3";

# The following permissions were set based on your choice in the installer
$wgGroupPermissions['*']['edit'] = false;
$wgGroupPermissions['*']['createaccount'] = false;
$wgGroupPermissions['*']['autocreateaccount'] = true;
$wgGroupPermissions['*']['editmyprivateinfo'] = true;
$wgGroupPermissions['*']['editmyoptions'] = true;
$wgGroupPermissions['*']['viewmyprivateinfo'] = true;
$wgGroupPermissions['*']['viewmywatchlist'] = true;
$wgGroupPermissions['*']['sendemail'] = true;



## Default skin: you can change the default skin. Use the internal symbolic
## names, ie 'vector', 'monobook':
$wgDefaultSkin = "vector";

# NOTE: file-cache has issues with stale category-pages (added/removed pages not showing up)
$wgUseFileCache = false;
$wgFileCacheDirectory = "$IP/cache";

# Enabled skins.
# The following skins were automatically enabled:
wfLoadSkin( 'MonoBook' );
wfLoadSkin( 'Timeless' );
wfLoadSkin( 'Vector' );


wfLoadExtension( 'CategoryTree' );
wfLoadExtension( 'Cite' );
wfLoadExtension( 'CiteThisPage' );
wfLoadExtension( 'CodeEditor' );
wfLoadExtension( 'ConfirmEdit' );
wfLoadExtension( 'ImageMap' );
wfLoadExtension( 'Interwiki' );
wfLoadExtension( 'ParserFunctions' );
#wfLoadExtension( 'SpamBlacklist' );
wfLoadExtension( 'WikiEditor' );
wfLoadExtension( 'MsUpload' );

# End of automatically generated settings.
# Add more configuration options below.

wfLoadExtension( 'AuthMinetest' );


$wgAuthManagerAutoConfig['primaryauth'] = [
        MediaWiki\Auth\MinetestPasswordPrimaryAuthenticationProvider::class => [
                'class' => MediaWiki\Auth\MinetestPasswordPrimaryAuthenticationProvider::class,
                'args' => [
                        [
                                'minetestUrl' => 'http://auth-proxy:8080',
                        ]
                ],
                'sort' => 0,
        ],
];

require_once "$IP/extensions/SimpleEmbed/SimpleEmbed.php";

//wfLoadExtension( 'MobileFrontend' );
//$wgMFAutodetectMobileView = true;

wfLoadExtension( 'Scribunto' );
$wgScribuntoDefaultEngine = 'luastandalone';

wfLoadExtension( 'SyntaxHighlight_GeSHi' );

wfLoadExtension( 'MultimediaViewer' );
wfLoadExtension( 'SimpleBatchUpload' );
wfLoadExtension( 'TemplateStyles' );

wfLoadExtension( 'Matomo' );
$wgMatomoURL = "analytics.rudin.io";
$wgMatomoIgnoreSysops = false;
$wgMatomoIDSite = "1";


wfLoadExtension( 'DiscordNotifications' );
// Required. Your Discord incoming webhook URL. Read more from here: https://support.discordapp.com/hc/en-us/articles/228383668
$wgDiscordFromName = "Wikibot";
$wgWikiUrl		= "http://pandorabox.io/";
$wgWikiUrlEnding = "index.php/";

wfLoadExtension( 'JavascriptSlideshow' );
wfLoadExtension( 'FontAwesome' );

$wgShowExceptionDetails = true;

include "LocalSettings.secrets.php";
