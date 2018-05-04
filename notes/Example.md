# cheatsheetMarkdown 
# H1 
## H2 
### H3 
#### H4 

*italics* 
**bold** 
***both*** 

## Lists 
1. First 
2. Second 
* Second Sub 
1. Third 
4. Fourth 

## Links 
[I'm an inline-style link](https://www.google.com) 

[I'm an inline-style link with title](https://www.google.com "Google's Homepage") 

[I'm a reference-style link][Arbitrary case-insensitive reference text] 

[I'm a relative reference to a repository file](../blob/master/LICENSE) 

[You can use numbers for reference-style link definitions][1] 

Or leave it empty and use the [link text itself]. 

URLs and URLs in angle brackets will automatically get turned into links. 
http://www.example.com or and sometimes 
example.com (but not on Github, for example). 

Some text to show that the reference links can follow later. 

[arbitrary case-insensitive reference text]: https://www.mozilla.org 
[1]: http://slashdot.org 
[link text itself]: http://www.reddit.com 

## Images 
Here's our logo (hover to see the title text): 

Inline-style: 
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1") 

Reference-style: 
![alt text][logo] 

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2" 

Reference-style-2: 
![alt text][logo2] 

[logo2]: https://i.imgur.com/cXfWL9J.png "Logo Title Text 2" 

## Code and syntax highlighting 
```javascript 
var s = "JavaScript syntax highlighting"; 
alert(s); 
``` 

```python 
s = "Python syntax highlighting" 
print s 
``` 

``` 
No language indicated, so no syntax highlighting. 
But let's throw in a tag. 
``` 

## Tables
Colons can be used to align columns. 

| Tables | Are | Cool |
| ------------- |:-------------:| -----:|
| col 3 is | right-aligned | $1600 |
| col 2 is | centered | $12 |
| zebra stripes | are neat | $1 |

There must be at least 3 dashes separating each header cell. 
The outer pipes (|) are optional, and you don't need to make the 
raw Markdown line up prettily. You can also use inline Markdown. 

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3

## Blockquotes
> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep
> writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put*
> **Markdown** into a blockquote. 

## Inline HTML
	
	Definition list
		Is something people use sometimes.
	
	Markdown in HTML
		Does *not* work **very** well. Use HTML tags.


## Horizontal Rule
Three or more...

---

Hyphens

***

Asterisks

___

Underscores

## Line Breaks
Here's a line for us to start with.

This line is separated from the one above by two newlines, so it will be a *separate paragraph*.

This line is also a separate paragraph, but...
This line is only separated by a single newline, so it's a separate line in the *same paragraph*.

## Youtube Videos

alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" />

Or, in pure Markdown, but losing the image sizing and border:m 

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](http://www.youtube.com/watch?v=YOUTUBE_VIDEO_ID_HERE)
