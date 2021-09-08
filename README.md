# extractChannelIDs

*Note:* This depends on the Private API of the Channels DVR. Fancy Bits LLC is free to change
this unpublished API at their discretion at any time without notice, and such changes *could*
cause this tool to break.

If this happens, complain to me, not Fancy Bits LLC. They have been quite clear that this API
is for their own use, and there are no guarantees that it will remain unchanged.

## What Does This Do?

**extractChannelIDs** is a tool to generate a tab-separated file of channel names and the associated
GraceNote Channel ID. It does this by pulling the 'On Now' listing from the Channels DVR using
the private API, then parses the JSON information that is returned to extract most of the
information about each channel.

Each line of the output file contatins:<br>
```
<channel name>(tab)<channel number>(tab)<channel id>(tab)<callsign>(newline)
```

for example, the line that is output for one of my local stations is:

```
PBS     54.1    44690   KQEHDT
```
Note that the file created lists all your channels in the guide, whatever the source - HDHomeRun,
TVEverywhere, Custom Channels, etc.

## Why Do I Need This?

If you don't use 'Custom Channels' as a source for your Channels DVR, you don't.

If you do, I'll be writing another tool that post-processes a 'Custom Channels' M3U file obtained
elsewhere to insert the Channels DVR-specific `tvc-guide-stationid` tag. This means that Channels
DVR can  associate the M3U playlist channel with a `tvc-guide-stationid` tag automatically with
the correct Gracenote Guide data.

This tool is separate from the tag-insertion tool, as I expect people will want to run the latter
every time they update their M3U playlist. This tool would be run once, or at most infrequently,
to generate a file that contains the mapping that the tag-insertion tool will read each time.
This mapping may need to be manually edited to match your preferences or correct errors (e.g.
if a station's name changes in the M3U playlist).

## Credits

Thanks to the good folk at Fancy Bits LLC for providing great DVR software, and passing along snippets
of information even about private APIs.<br>
https://getchannels.com/dvr-server/

Thanks also to Dave Gamble for creating the open source cJSON library, without which this would have
been a lot more tedious to write.<br>
https://github.com/DaveGamble/cJSON
