<?lassoscript
//............................................................................
//
//	pageblocks: (c) 2002-2007 http://www.pageblocks.org/
//
//............................................................................
/*

	{fileName=		error.lasso }
	{rsrcType=		include }
	{rsrcName=		error.lasso }
	{rsrcHTTP=		www.pageblocks.org/refc/ }
	
	{lassoVrsnMin=	8.1.0 }
	{lassoVrsnMax=	8.5.2 }

	{author=		Greg Willits }
	{authorEmail=	help@fwpro.com }
	{authorHTTP=	www.pageblocks.org }
	
	{desc=			custom error trapping page }
	
	{maintvsrn=		1.0.1 }
	{maintrelease=	5.1.1 }
	{maintdate=		2006-10-15 }
	{maintauthor=	Greg Willits }
	{maintnotes=	added output to explain how to turn error messages off }

	{maintvsrn=		1.0.1 }
	{maintrelease=	5.0.1 }
	{maintdate=		2006-04-05 }
	{maintauthor=	Greg Willits }
	{maintnotes=	fixed obsolete var name for fw_pgTitle }

	{maintvsrn=		1.0 }
	{maintrelease=	3.0.0 }
	{maintdate=		2004-09-06 }
	{maintauthor=	Greg Willits }
	{maintnotes=	initial release }

*/
//.............................................................................


$__html_reply__ = (string);
	
include: '/site/msthd/templates/template_fatal.dsp';


//	During development, change the if below to if: true;
//	if there are syntax errors in the page code
//	this should help display on screen in many cases
//	while keeping the full error management system in tact for testing

if: false;
var:'errorStr' = error_currentError;
'<hr><h3>Lasso Error (site)</h3>';
'<p>('; error_currentError: -errorCode; ') -- '; (var:'errorStr', -encodebreak); '</p>';
'<p>(this output can be turned off in the /LassoSites/{yourSite}/LassoAdmin/error.lasso file)</p>';
/if;
?>
