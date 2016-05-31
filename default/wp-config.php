<?php


// ** MySQL settings ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpress');

/** MySQL database password */
define('DB_PASSWORD', 'wordpress');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

define('AUTH_KEY',         'De`T^#J4YUJ?)5i,*jxY*+T$Z_1DAs!z{EkW(cBWA/F=c+~k3B)42W)wQF-VPbW~');
define('SECURE_AUTH_KEY',  '@I6PrNixYBy^Yn=yQYv1c{|2kPYu^tqV0B?G_o?}1;TE3dU$h:hb99t2M*HX=rxP');
define('LOGGED_IN_KEY',    '3`6=/1O?=dg][owrf.)w!YUP!GKuSdp5gE0z;+=(r>TaPqBXXa)+tCtzAV|-j`J-');
define('NONCE_KEY',        '0%gt~|gi^T7;e%oxS5[[$3p,_7(>;|DDmr0UqA:S]lt/Me=eM51RRa Ll:YI!i.i');
define('AUTH_SALT',        'gORG1yL8{ tTm|w77jK9_J=u+<TAkfy6PWhA=(~;^0fO%Oaqy/e8dgyPwWDdB++(');
define('SECURE_AUTH_SALT', '>LSH6|qZr n{STi()->_:aax1cI|A[uLQytBz4MH7LKo@3pO*{2Xitst{511M+2H');
define('LOGGED_IN_SALT',   'W>jVJz?+ns|GA![-:em+mXAV&c|<|ZGF}&6,Y5]nP}aHlPopwMkq|Cg3PPq.6<g>');
define('NONCE_SALT',       'E>Xm`OM=F{6o&`B5x# M61 uV+((6N2B3g*:@l`G)JI[LkWm^(s]3bf)TY@aGC]0');


$table_prefix = 'wp_';





/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
