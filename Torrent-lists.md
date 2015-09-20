
## COUNT directory tree sort and chop the list and display the last value (works with named torrent files)
clear && ls -shal | awk '{print $10}' | sed -e 's:torrent-::g' | sort -n | tail -n 1



#
# awk '/<torrent>/{x="torrent-"++i;}{print > x;}'
#
# the above code results in a split file containing this set of XML tags


# this following snippet will search through an XML style-sheet and grab just the relevant info for the torrent
# you will note in the following example the <magnet></magnet> tags were replaced to form an actual link
# <title>Half Life 2 plus extras</title>
# magnet:?xt=urn:btih:19e53b6485d0487d0babeae9c4c600a5eda71f74
# <size>3005661885</size>
# <seeders>24</seeders>
# <leechers>6</leechers>

# awk '/<title>/,/<leechers>/{print}' rich.xml | grep --ignore-case "REGEX" -A 4 | sed 's:<\/magnet>::g' | sed 's:<magnet>:magnet\:?xt=urn\:btih\::g'

<torrent>
<id>3234495</id>
<title>[Request] Bamse - Världens starkaste björn.DivX</title>
<magnet>eaee71d0c5834e0c91581198c314dd87c6e76854</magnet>
<size>344371200</size>
<seeders>0</seeders>
<leechers>1</leechers>
<quality><up>0</up><down>0</down></quality>
<uploaded>2004-08-26 19:43:03</uploaded>
<nfo>Önskemål: Bamse - Världens starkaste björn. Svenskt tal.</nfo>
<comments>
<comment><when>2004-08-27 11:59</when><what>Instämmer med Urkel!&lt;br /&gt;
Finns det fler bamse-filmer vore det skoj ifall de kom upp på trackern. :bounce:</what></comment>
<comment><when>2004-09-03 12:15</when><what>tittade på den här på en 32 tummare, och det var inga problem, syrrans ungar blev väldigt till sig när jag kom m$
<comment><when>2006-07-08 10:58</when><what>När kommer den sista 0.1% ? Är det någon som har denna torrent komplett så var snäll och seeda. Lite tråkigt med$
</comments>

</torrent>




# I think Python + BS4 is a good fit for this since we can scrape the required data and place into a MySQL database (See Icemelt)
# INITIAL DATA DUMP FROM WEB SITE
# IF title is "<title>Not Found" there is no data beyond this point on the page


# <div id="title">
# The whole Pirate Bay magnet archive</div>
# <div id='details'>
# <dl class='col1'>
# <dt>Type:</dt>
# <dd><a href="/browse/699" title="More from this category">Other &gt; Other</a></dd>
# <dt>Files:</dt>
# <dd><a href="javascript:void(0);" title="Files" onclick="if( filelist &lt; 1 ) { new Ajax.Updater('filelistContainer', '/ajax_details_filelist.php', { method: 'get', parameters: 'id=7016365' } ); filelist=1; }; toggleFilelist(); return false;">1</a></dd>
# <dt>Size:</dt>
# <dd>90.1&nbsp;MiB&nbsp;(94475182&nbsp;Bytes)</dd>
# <dt>Tag(s):</dt>
# <dd><a href="/tag/pirate+bay">pirate bay</a> <a href="/tag/dump">dump</a> </dd>
# </dl>
# <dl class='col2'>
# <dt>Uploaded:</dt>
# <dd>2012-02-08 03:48:18 GMT</dd>
# <dt>By:</dt>
# <dd><a href="/user/allisfine/" title="Browse allisfine">allisfine</a></dd>
# <dt>Seeders:</dt>
# <dd>20</dd>
# <dt>Leechers:</dt>
# <dd>1</dd>
# <dt>Comments</dt>
# <dd><span id='NumComments'>105</span>
# &nbsp; </dd>
# <br/>
# <dt>Info Hash:</dt><dd></dd>
# 938802790A385C49307F34CCA4C30F80B03DF59C
# </dl>

another torrent file had this format:
3519077|Star Trek DS9 S7D1|4642166784|1|0|8aff8ea107b84f77fb0b47ce311739339af125a4
something|Title|

This will print out a table with magnet links and torrent names

cat complete | grep "[Ss]earch [Tt]erm" | awk -F "|" '{print $2,"<>magnet:?xt=urn:btih:"$6}' | awk -F "<>" -f "col.awk"

col.awk
```awk
{
    width=65;
    separator="";

    for (i=1; i<=NF; i++) {
        if (match($i, /[-+]*[0-9]+[\.]*[0-9]*/)) {
            printf("%"width"s", $i);
        }
        else {
            printf("%-"width"s", $i);
        }
        if (i == NF) printf("\n");
        else printf("%s", separator);
    }
}
```
