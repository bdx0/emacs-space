<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: file-template.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=file-template.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: file-template.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=file-template.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for file-template.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=file-template.el" /><meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script src="http://emacswiki.org/emacs/emacs-bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><br /><span class="specialdays">Equatorial Guinea, Independence Day, Spain, National Day</span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.emacswiki.org/emacs?search=%22file-template%5c.el%22">file-template.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/file-template.el">Download</a></p><pre><span class="comment">;;; file-template.el --- File templates</span>

<span class="comment">;; Copyright (C) 2007  Scott Frazer</span>

<span class="comment">;; Author: Scott Frazer &lt;frazer.scott@gmail.com&gt;</span>
<span class="comment">;; Maintainer: Scott Frazer &lt;frazer.scott@gmail.com&gt;</span>
<span class="comment">;; Created: 29 Nov 2007</span>
<span class="comment">;; Version: 1.0</span>
<span class="comment">;; Keywords: template</span>

<span class="comment">;; This file is free software; you can redistribute it and/or modify</span>
<span class="comment">;; it under the terms of the GNU General Public License as published by</span>
<span class="comment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="comment">;; any later version.</span>

<span class="comment">;; This file is distributed in the hope that it will be useful,</span>
<span class="comment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="comment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="comment">;; GNU General Public License for more details.</span>

<span class="comment">;; You should have received a copy of the GNU General Public License</span>
<span class="comment">;; along with GNU Emacs; see the file COPYING.  If not, write to</span>
<span class="comment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,</span>
<span class="comment">;; Boston, MA 02110-1301, USA.</span>

<span class="comment">;;; Commentary<span class="builtin">:</span></span>

<span class="comment">;; Insert template into buffer, performing tag expansions.  Inspired by</span>
<span class="comment">;; auto-insert and auto-insert-tkld.</span>
<span class="comment">;;</span>
<span class="comment">;; See `<span class="constant important">file-template-tag-alist</span>' for predefined tags.</span>
<span class="comment">;;</span>
<span class="comment">;; Add this to your .emacs if you want to insert templates explicitly<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; (autoload 'file-template-auto-insert <span class="string">"file-template"</span> nil t)</span>
<span class="comment">;;</span>
<span class="comment">;; You can also have templates inserted into new files automatically</span>
<span class="comment">;; by setting `<span class="constant important">file-template-insert-automatically</span>' appropriately and</span>
<span class="comment">;; adding this to your .emacs<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; (autoload 'file-template-find-file-not-found-hook <span class="string">"file-template"</span> nil t)</span>
<span class="comment">;; (add-hook 'find-file-not-found-hooks 'file-template-find-file-not-found-hook 'append)</span>
<span class="comment">;;</span>
<span class="comment">;;; Change log<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; 29 Nov 2007 -- v1.0</span>
<span class="comment">;;                Initial creation</span>

<span class="comment">;;; Code<span class="builtin">:</span></span>

(<span class="keyword">require</span> '<span class="constant">custom</span>)

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;; Custom variables</span>

(<span class="keyword">defgroup</span> <span class="type">file-template</span> nil
  <span class="string">"*File templates."</span>
  <span class="builtin">:group</span> 'file-template)

(<span class="keyword">defcustom</span> <span class="variable">file-template-insert-automatically</span> nil
  <span class="string">"*Insert file-template automatically.
Can be one of the following values:

nil - do not insert automatically.
t   - always insert automatically.
ask - ask whether to insert or not."</span>
  <span class="builtin">:group</span> 'file-template
  <span class="builtin">:type</span> '(choice (const <span class="builtin">:tag</span> <span class="string">"No"</span>  nil)
                 (const <span class="builtin">:tag</span> <span class="string">"Yes"</span> t)
                 (const <span class="builtin">:tag</span> <span class="string">"Ask"</span> 'ask)))

(<span class="keyword">defcustom</span> <span class="variable">file-template-login-name</span> (user-login-name)
  <span class="string">"*User's login name."</span>
  <span class="builtin">:group</span> 'file-template
  <span class="builtin">:type</span> 'string)

(<span class="keyword">defcustom</span> <span class="variable">file-template-full-name</span> (user-full-name)
  <span class="string">"*User's full name."</span>
  <span class="builtin">:group</span> 'file-template
  <span class="builtin">:type</span> 'string)

(<span class="keyword">defcustom</span> <span class="variable">file-template-num-prefix</span> <span class="string">"0"</span>
  <span class="string">"*String used as prefix for numerical days and months.
Suggested values are \" \", \"0\" and \"\"."</span>
  <span class="builtin">:group</span> 'file-template
  <span class="builtin">:type</span> 'string)

(<span class="keyword">defcustom</span> <span class="variable">file-template-paths</span> '(<span class="string">"~/insert/"</span> <span class="string">"/usr/share/emacs/insert/"</span>)
  <span class="string">"*List of directories where templates are."</span>
  <span class="builtin">:group</span> 'file-template
  <span class="builtin">:type</span> '(repeat string))

(<span class="keyword">defcustom</span> <span class="variable">file-template-search-current-dir</span> t
  <span class="string">"*Search current directory of buffer for templates before `<span class="constant important">file-template-paths</span>'."</span>
  <span class="builtin">:group</span> 'file-template
  <span class="builtin">:type</span> 'boolean)

(<span class="keyword">defcustom</span> <span class="variable">file-template-mapping-alist</span>
  '((<span class="string">"\\.el$"</span> . <span class="string">"template.el"</span>)
    (<span class="string">"\\.c$"</span> . <span class="string">"template.c"</span>)
    (<span class="string">"\\.\\(cc\\|cpp\\|C\\)$"</span> . <span class="string">"template.cc"</span>)
    (<span class="string">"\\.h\\(pp\\)?$"</span> . <span class="string">"template.h"</span>)
    (<span class="string">"[Mm]akefile"</span> . <span class="string">"template.mk"</span>)
    (<span class="string">"\\.sh$"</span> . <span class="string">"template.sh"</span>)
    (<span class="string">"\\.csh$"</span> . <span class="string">"template.csh"</span>)
    (<span class="string">"\\.pl$"</span> . <span class="string">"template.pl"</span>)
    (<span class="string">"\\.py$"</span> . <span class="string">"template.py"</span>))
  <span class="string">"*Alist mapping filename or extension to a template."</span>
  <span class="builtin">:group</span> 'file-template
  <span class="builtin">:type</span> 'alist)

(<span class="keyword">defcustom</span> <span class="variable">file-template-insert-hook</span> nil
  <span class="string">"*List of functions to call after inserting a template."</span>
  <span class="builtin">:group</span> 'file-template
  <span class="builtin">:type</span> 'hook)

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;; Internal variables</span>

(<span class="keyword">defvar</span> <span class="variable">file-template-history</span> nil
  <span class="string">"Minibuffer history list for templates."</span>)

(<span class="keyword">defvar</span> <span class="variable">file-template-prompt-start-point</span> nil
  <span class="string">"Starting point for prompt string."</span>)

(<span class="keyword">defvar</span> <span class="variable">file-template-prompted-strings</span> nil
  <span class="string">"Strings prompted for (to fill in %1-%9 later in template)."</span>)

(<span class="keyword">defvar</span> <span class="variable">file-template-eval-start-point</span> nil
  <span class="string">"Starting point for eval string."</span>)

(<span class="keyword">defvar</span> <span class="variable">file-template-final-point</span> nil
  <span class="string">"Where point should go after the template is done being inserted."</span>)

(<span class="keyword">defvar</span> <span class="variable">file-template-tag-alist</span>
  '((<span class="string">"u"</span> . file-template-login-name)
    (<span class="string">"U"</span> . file-template-full-name)
    (<span class="string">"a"</span> . user-mail-address)
    (<span class="string">"f"</span> . (buffer-file-name))
    (<span class="string">"b"</span> . (file-name-nondirectory (buffer-file-name)))
    (<span class="string">"n"</span> . (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))
    (<span class="string">"N"</span> . (upcase (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
    (<span class="string">"e"</span> . (file-name-extension (buffer-file-name)))
    (<span class="string">"E"</span> . (upcase (or (file-name-extension (buffer-file-name)) <span class="string">""</span>)))
    (<span class="string">"p"</span> . (file-name-directory (buffer-file-name)))
    (<span class="string">"d"</span> . (file-template-pad-num-string (file-template-get-date-item 'day)))
    (<span class="string">"m"</span> . (file-template-get-month-num))
    (<span class="string">"M"</span> . (file-template-get-date-item 'month))
    (<span class="string">"y"</span> . (substring (file-template-get-date-item 'year) -2))
    (<span class="string">"Y"</span> . (file-template-get-date-item 'year))
    (<span class="string">"q"</span> . (fill-paragraph nil))
    (<span class="string">"["</span> . (file-template-start-prompt))
    (<span class="string">"]"</span> . (file-template-finish-prompt))
    (<span class="string">"1"</span> . (file-template-get-nth-prompted 1))
    (<span class="string">"2"</span> . (file-template-get-nth-prompted 2))
    (<span class="string">"3"</span> . (file-template-get-nth-prompted 3))
    (<span class="string">"4"</span> . (file-template-get-nth-prompted 4))
    (<span class="string">"5"</span> . (file-template-get-nth-prompted 5))
    (<span class="string">"6"</span> . (file-template-get-nth-prompted 6))
    (<span class="string">"7"</span> . (file-template-get-nth-prompted 7))
    (<span class="string">"8"</span> . (file-template-get-nth-prompted 8))
    (<span class="string">"9"</span> . (file-template-get-nth-prompted 9))
    (<span class="string">"("</span> . (file-template-start-eval))
    (<span class="string">")"</span> . (file-template-finish-eval))
    (<span class="string">"%"</span> . <span class="string">"%"</span>)
    (<span class="string">"@"</span> . (setq file-template-final-point (point))))
  <span class="string">"Lookup table mapping % tags to variable/function.  Return a string
to be inserted into the buffer<span class="comment">; non-strings are ignored.  Predefined</span>
tags are:

 %u       user's login name
 %U       user's full name
 %a       user's mail address (from the variable `<span class="constant important">user-mail-address</span>')
 %f       file name with path
 %b       file name without path
 %n       file name without path and extension
 %N       file name without path and extension, capitalized
 %e       file extension
 %E       file extension capitalized
 %p       file directory
 %d       day
 %m       month
 %M       abbreviated month name
 %y       last two digits of year
 %Y       year
 %q       `<span class="constant important">fill-paragraph</span>'
 %[ %]    prompt user for a string
 %1-%9    refer to the nth strings prompted for with %[ %]
 %( %)    elisp form to be evaluated
 %%       inserts %
 %@       sets the final position of `<span class="constant important">point</span>'"</span>)

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;;; Functions</span>

(<span class="keyword">defun</span> <span class="function">file-template-get-date-item</span> (item)
  <span class="string">"item can be 'day, 'month, or 'year."</span>
  (<span class="keyword elisp">let</span> ((time-string (current-time-string)))
    (<span class="keyword cl">when</span> (string-match <span class="string">"^\\w+\\s-+\\(\\w+\\)\\s-+\\([0-9]+\\)\\s-+[0-9]+:[0-9]+:[0-9]+\\s-+\\([0-9]+\\)"</span> time-string)
      (<span class="keyword elisp">cond</span>
       ((equal item 'day)
        (match-string 2 time-string))
       ((equal item 'month)
        (match-string 1 time-string))
       ((equal item 'year)
        (match-string 3 time-string))))))

(<span class="keyword">defun</span> <span class="function">file-template-get-month-num</span> ()
  <span class="string">"Get month as a number."</span>
  (<span class="keyword elisp">let</span> ((month (file-template-get-date-item 'month))
        (month-names '(<span class="string">"Dec"</span> <span class="string">"Nov"</span> <span class="string">"Oct"</span> <span class="string">"Sep"</span> <span class="string">"Aug"</span> <span class="string">"Jul"</span> <span class="string">"Jun"</span> <span class="string">"May"</span> <span class="string">"Apr"</span> <span class="string">"Mar"</span> <span class="string">"Feb"</span> <span class="string">"Jan"</span>)))
    (<span class="keyword">catch</span> '<span class="constant">found</span>
      (<span class="keyword elisp">while</span> month-names
        (<span class="keyword elisp">if</span> (string= month (car month-names))
            (<span class="keyword">throw</span> '<span class="constant">found</span> (file-template-pad-num-string (int-to-string (length month-names))))
          (setq month-names (cdr month-names)))))))

(<span class="keyword">defun</span> <span class="function">file-template-pad-num-string</span> (num-string)
  <span class="string">"Pad out a number string."</span>
  (<span class="keyword elisp">let</span> ((result (concat file-template-num-prefix num-string)))
    (<span class="keyword elisp">if</span> (&gt; (length result) 2)
        (substring result -2)
      result)))

(<span class="keyword">defun</span> <span class="function">file-template-get-nth-prompted</span> (n)
  <span class="string">"Get nth prompted string."</span>
  (<span class="keyword elisp">if</span> (&gt; n (length file-template-prompted-strings))
      (<span class="warning">error</span> <span class="string">"There are only %d prompted strings so far, and you tried to expand %%%d"</span>
             (length file-template-prompted-strings) n)
    (nth (1- n) file-template-prompted-strings)))

(<span class="keyword">defun</span> <span class="function">file-template-start-prompt</span> ()
  <span class="string">"Start prompting for input."</span>
  (<span class="keyword elisp">if</span> file-template-prompt-start-point
      (<span class="warning">error</span> <span class="string">"Nested prompts are not allowed"</span>)
    (setq file-template-prompt-start-point (point))))

(<span class="keyword">defun</span> <span class="function">file-template-finish-prompt</span> ()
  <span class="string">"Finish prompting for input."</span>
  (<span class="keyword elisp">if</span> (not file-template-prompt-start-point)
      (<span class="warning">error</span> <span class="string">"No matching %%["</span>)
    (<span class="keyword elisp">let</span> ((prompt (buffer-substring file-template-prompt-start-point (point))) answer)
      (delete-region file-template-prompt-start-point (point))
      (setq answer (read-string prompt))
      (setq file-template-prompted-strings (append file-template-prompted-strings (list answer)))
      (setq file-template-prompt-start-point nil)
      answer)))

(<span class="keyword">defun</span> <span class="function">file-template-start-eval</span> ()
  <span class="string">"Start eval of elisp."</span>
  (<span class="keyword elisp">if</span> file-template-eval-start-point
      (<span class="warning">error</span> <span class="string">"Nested evals are not allowed"</span>)
    (setq file-template-eval-start-point (point))))

(<span class="keyword">defun</span> <span class="function">file-template-finish-eval</span> ()
  <span class="string">"Finish eval of elisp."</span>
  (<span class="keyword elisp">if</span> (not file-template-eval-start-point)
      (<span class="warning">error</span> <span class="string">"No matching %%("</span>)
    (<span class="keyword elisp">let</span> ((form (buffer-substring file-template-eval-start-point (point))))
      (delete-region file-template-eval-start-point (point))
      (<span class="keyword elisp">save-excursion</span>
        (<span class="keyword elisp">save-restriction</span>
          (setq file-template-eval-start-point nil)
          (eval (car (read-from-string form))))))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">file-template-insert</span> (template)
  <span class="string">"Insert template into buffer, performing tag expansions.
See `<span class="constant important">file-template-tag-alist</span>' for list of predefined tags.

Use this function when you don't want to insert the default template
associated with the file type in `<span class="constant important">file-template-mapping-alist</span>'.
Otherwise, use `<span class="constant important">file-template-auto-insert</span>'."</span>
  (interactive <span class="string">"fTemplate to insert? "</span>)
  (setq file-template-prompt-start-point nil)
  (setq file-template-prompted-strings '())
  (setq file-template-eval-start-point nil)
  (setq file-template-final-point nil)
  (<span class="keyword elisp">save-restriction</span>
    (narrow-to-region (point) (point))
    (insert-file-contents template)
    (<span class="keyword elisp">let</span> (char result)
      (<span class="keyword elisp">while</span> (search-forward <span class="string">"%"</span> nil t)
        (delete-char -1)
        (setq char (char-after))
        (delete-char 1)
        (setq result (assoc (char-to-string char) file-template-tag-alist))
        (<span class="keyword elisp">if</span> (not result)
            (<span class="warning">error</span> <span class="string">"Unknown tag %%%c"</span> char)
          (setq result (eval (cdr result)))
          (<span class="keyword cl">when</span> (stringp result)
            (insert result))))
      (<span class="keyword cl">when</span> file-template-final-point
        (goto-char file-template-final-point)))
    (run-hooks 'file-template-insert-hook)))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">file-template-auto-insert</span> ()
  <span class="string">"Insert default template into buffer."</span>
  (interactive)
  (<span class="keyword elisp">let</span> ((mapping-alist file-template-mapping-alist)
        template-name template)
    (setq template-name
          (<span class="keyword">catch</span> '<span class="constant">found</span>
            (<span class="keyword elisp">while</span> mapping-alist
              (<span class="keyword elisp">if</span> (string-match (caar mapping-alist) (buffer-name))
                  (<span class="keyword">throw</span> '<span class="constant">found</span> (cdar mapping-alist))
                (setq mapping-alist (cdr mapping-alist))))))
    (<span class="keyword elisp">if</span> (not template-name)
        (message (format <span class="string">"No template defined for file type \"%s\""</span> (buffer-name)))
      (setq template (locate-file template-name (<span class="keyword elisp">if</span> file-template-search-current-dir
                                                    (cons <span class="string">"."</span> file-template-paths)
                                                  file-template-paths)))
      (<span class="keyword elisp">if</span> (not template)
          (message (format <span class="string">"Couldn't find template \"%s\""</span> template-name))
        (file-template-insert template)))))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">file-template-find-file-not-found-hook</span> ()
  <span class="string">"Hook to (optionally) insert the default template when a new file is created."</span>
  (<span class="keyword cl">when</span> (or (equal file-template-insert-automatically t)
            (and (equal file-template-insert-automatically 'ask)
                 (y-or-n-p <span class="string">"Insert default template? "</span>)))
    (file-template-auto-insert)))

(<span class="keyword">provide</span> '<span class="constant">file-template</span>)
<span class="comment">;;; file-template.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=file-template.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local edit" accesskey="c" href="http://www.emacswiki.org/emacs/Comments_on_file-template.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=file-template.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=file-template.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=file-template.el">Administration</a></span><span class="time"><br /> Last edited 2013-08-24 11:57 UTC by <a class="author" title="from 178-83-163-103.dynamic.hispeed.ch" href="http://www.emacswiki.org/emacs/AlexSchroeder">AlexSchroeder</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=file-template.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search">
<p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
