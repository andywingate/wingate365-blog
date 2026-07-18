---
title: "Connect to Windows 2016 HyperV Core with delegated credentials  / CredSSP"
date: 2018-02-18T12:24:00Z
lastmod: 2018-02-18T12:24:14Z
url: "/2018/02/connect-to-windows-2016-hyperv-core.html"
tags: ["powershell", "security", "windows"]
author: "Andy Wingate"
---
CredSSP authentication is currently disabled on the local client. You must be running with administrator privileges in order to enable CredSSP<br />
<br />
<h3>
On Win2016 desktop CLIENT</h3>
<br />
<li>Powershell:</li>
<pre>PS C:\Users\Administrator&gt;start-service winrm
PS C:\Users\Administrator&gt;Enable-WSManCredSSP -Role client -DelegateComputer *
PS C:\Users\Administrator&gt;stop-service winrm</pre>
<br />
<li>GPEDIT (as administrator)</li>
Local Computer Policy &gt; Computer Configuration &gt; Administrative Templates &gt; System &gt; Credentials Delegation: 
<pre>Allow delegating fresh credentials with NTLM-only server authentication</pre>
<li> Set: "Enabled" and "Add servers to the list" 
<li> Show: enter "WSMAN/*" as Value</li>
<li>Fire up Hyper-V Manager and connect to server only with IP-address and enter as user "[IP Address]\[username]” and set the password.</li>
</br>
<a href="https://social.technet.microsoft.com/Forums/en-US/8884b81e-0576-4764-a29d-ce7bec5c9ee9/hyperv-server-2016-tp4-howto-manage-hyperv-with-desktopos-hyperv-manager-and-bug?forum=WinServerPreview">Source</a>

