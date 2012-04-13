---
layout: post
title: "XSLT Shortcut"
comments: false
date: 2003-05-06 12:14:00
categories:
 - Technology
subtext-id: 77c02ec3-a93a-4739-bb04-ddd02faa52cd
alias: /blog/XSLT-Shortcut.aspx
---


I've been writing XSLT transforms almost since they came out, and I can't believe I didnt' know this shortcut.

When I had to add a dynamic attribute to an element, I used to do it like this:
    
    <xsl:template match="link">  
    &nbsp_place_holder; <a>  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <xsl:attribute name="href">  
          <xsl:value-of select="@href"/>  
        </xsl:attribute>  
    &nbsp_place_holder;&nbsp_place_holder;&nbsp_place_holder; <xsl:value-of select="@text" />  
    &nbsp_place_holder; </a>  
    </xsl:template>

This isn't that bad, but all the <xsl:attribute> stuff was tedious. I just finished reading Essential XML and noticed this:
    
    <xsl:template match="link">  
    &nbsp_place_holder; <a href="{@href}"><xsl:value-of select="@text" /></a>  
    </xsl:template>

Not only is this shorter, but it is much easier to read.
