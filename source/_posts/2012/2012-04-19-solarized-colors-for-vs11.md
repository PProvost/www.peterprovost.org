---
layout: post
title: "Solarized Colors for Visual Studio 11"
date: 2012-04-19 00:08
comments: true
categories: 
- Code
tags:
- vs11
- powershell
---

{% img right no-border /images/blog/VS11-Beta-Logo.png %}

***Update:*** I sent a pull-request to David Thibault and this update
is now in [his mainline repository][6].

I'm sure everyone and their dog knows by now that we changed the color theme in
VS11 Beta to something a little more... ummm... monochromatic.

If you didn't read about it, you should visit the [Visual Studio blog][3] and
read [Introducing the New Developer Experience][4].

Regardless of what you think about it, I do know that the UX designers had an
admirable goal in mind, and that was making the code be the bit you see the
most, and take the chrome out of your line of sight. The idea is to let you
focus where it matters and not have Las Vegas lights happening all around it
distracting you.

Regardless, I'm not here to comment on all that, but on what I like to do to
make the experience even better.

**SOLARIZE IT!**

<!-- more -->

Solarized is a really nice, well-designed color scheme designed by Evan
Schoonover.  You can read all about how he designed it, the symmetry, contrast
values, etc., over on his website [http://ethanschoonover.com/solarized][1].

His initial implementation was for Vim, which is how I originally found it.
After doing a bit of poking around, I found that David Thibault had made ports
of it for VS2005, VS2008 and VS2010 (available [here][6], but not for VS11 Beta.

So I did. But I decided I hated editing the colors in the VS color dialog, and
editing the XML by hand wasn't much better. And since Ethan's design is pretty
straightforward regarding which color to use when, I decided to script it.

Here's the result in VS11 Beta. It looks pretty much like David's VS2010
implementation with a few changes that I think are more in line with Ethan's
choices (painstakingly dug out of his Vim colors file).

{% img center /images/blog/2012-04-19-solarized-colors-for-vs11/VS11-Beta-Dark-Solarized-Light.png %}

Solarized comes in light and dark modes, but what I've really been enjoying is
Visual Studio 11 in Dark theme, with Solarized in Light mode, so that's what is
in the screenshot. It also seems to live up to the idea of making the code pop
better than the default editor colors in Dark theme.

The powershell generator for it wasn't that hard. I started by taking David's
VS2010 file and replacing each color value with a token that represented
Ethan's color *intent*. Then the powershell just swaps in the colors.

{% gist 2419198 %}

You use it by telling it light or dark and then passing the output to
`out-file`. The whole thing, including the generator and the resulting
vssettings files are available from my [GitHub fork][2].

Enjoy!

[1]: http://ethanschoonover.com/solarized
[2]: https://github.com/PProvost/visualstudio-colors-solarized/
[3]: http://blogs.msdn.com/b/visualstudio/
[4]: http://blogs.msdn.com/b/visualstudio/archive/2012/02/23/introducing-the-new-developer-experience.aspx
[6]: https://github.com/leddt/visualstudio-colors-solarized
