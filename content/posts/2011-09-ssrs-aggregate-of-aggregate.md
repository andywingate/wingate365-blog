---
title: "SSRS - Aggregate of an Aggregate"
date: 2011-11-12T02:09:00Z
lastmod: 2011-11-12T11:47:47Z
url: "/2011/09/ssrs-aggregate-of-aggregate.html"
hero: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiKWSlXMwkKiGwOWdFFne_iZewTxgSBr4g50nefEgizUyrt4oYZvQuhJwHUJ6t1Jy5Q41bsbUWrMo-SP4oC6Zqnba6GmMK6L3kLkEhgMVpsllld3F3UrDCPBOvhttcMTDahtreG/s200/ssrs+aggregate.PNG"
tags: ["ssrs"]
author: "Andy Wingate"
---
<span class="Apple-style-span" style="font-family: inherit;">So here is how to subtotal a column that is itself a sum function. SSRS 2005 wont allow you to aggregate an aggregate function. For example, the total of a column showing a Running Total, useful in daily stock balance calculations.</span><br />
<span class="Apple-style-span" style="font-family: inherit;">Add the following code to the report &nbsp;Report &gt; Properties</span><br />
<span class="Apple-style-span" style="font-family: inherit;"><br /></span><br />

<span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">Dim public totalBalance As Decimal&nbsp;</span><br />
<span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">Public&nbsp;</span><span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">Function AddTotal(ByVal balance As Decimal) AS Decimal
                totalBalance = totalBalance + balance
                return balance&nbsp;</span><br />
<span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">End Function&nbsp;</span><br />
<span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">Public Function GetTotal() 
                return totalBalance&nbsp;</span><br />
<span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">End Function</span><br />
<span class="Apple-style-span" style="font-family: inherit;"><br /></span><br />
<span class="Apple-style-span" style="font-family: inherit;">This code adds two&nbsp;</span><span class="Apple-style-span" style="font-family: inherit;">variables: totalbalance and cnt as decimal numbers. And two functions AddTotal and GetTotal.</span><br />
<span class="Apple-style-span" style="font-family: inherit;">AddTotal allows items in rows to be added up, use as follows in a value cell, where you had;</span><br />
<span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;"><br /></span><br />
<span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">=RunningTotal(Fields!ColumnName.Value,sum,nothing)&nbsp;</span><br />
with<br />
<span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">=Code.AddTotal(RunningTotal(</span><span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">Fields!ColumnName.Value,sum,nothing)</span><span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">)</span><br />
<br />
in the total cell, where it you were unable to simply use<br />
<span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;"><br /></span><br />
<span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">=sum(RunningTotal(</span><span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">Fields!ColumnName.Value,sum,nothing))</span><br />
use instead<br />
<span class="Apple-style-span" style="font-family: 'Courier New', Courier, monospace;">=Code.GetTotal()</span><br />
<span class="Apple-style-span" style="font-family: inherit;"><br /></span><br />
<span class="Apple-style-span" style="font-family: inherit;">Simply add more variables and public functions if you need to sum the sum of more that one field.</span><br />
Inspired by this post on averages of averages <a href="http://beyondrelational.com/blogs/jason/archive/2010/07/03/aggregate-of-an-aggregate-function-in-ssrs.aspx">link</a>

