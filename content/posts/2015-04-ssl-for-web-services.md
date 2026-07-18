---
title: "TLS/SSL for Web Services"
date: 2015-04-19T21:40:00Z
lastmod: 2015-05-17T20:33:20Z
url: "/2015/04/ssl-for-web-services.html"
tags: ["d365bc", "exchange", "security", "simple dev", "talks"]
author: "Andy Wingate"
---
TLS protection should be a standard security policy these days. It's common place for servers hosting web pages and web services.<br />
<br />
Certificates are inexpensive and relatively simple to setup and use. The basic outline is that you generate a private key on your server, pass this to the CA. They will use this to generate the Certificate and public key. They send you back the certificate and publish the public key on their servers. The certificate, private key and the CA's authority chain certificates are installed on your server and bound/configures to be utilised within the the webservice in question.<br />
<br />
A 3rd party browser pointed to your https URL will request the certificate, which it uses to lookup the host servers details with the CA and obtain the public key. The public key is then used by the browser to lock the session key that it generates. Only the specific private key can unlock and obtain the session key that was locked by the related public key. Which is what the host server does and then both machines have identical keys to use for all further communication in that session.<br />
<br />
Here are the main elements and terms you may come across when setting up SSL protection using a Certificate Authority (CA)<br />
<br />
Machines:<br />
<br />
<ol>
<li>Host Server - where your web page or servces are being run.&nbsp;</li>
<li>Browsing Server - the party that wishes to communicate with your server in a secure way.</li>
<li>Certificate Authority - the party the enables the secure communications by issuing certificates and publishing public keys.</li>
</ol>
<br />
Information/Documents<br />
<br />
<ol>
<li>Certificate Request - The private key generated on the host server</li>
<li>Common Name (CN) - the URL used to access the host server with HTTPS protocol,&nbsp;</li>
<li>Subject Alternative Name - one or more other URLs used to access the host server with HTTPS protocol.&nbsp;</li>
</ol>
<br />
To generate the private key various methods are described <a href="https://support.godaddy.com/help/article/5343/generating-a-certificate-signing-request?countrysite=uk" target="_blank">here</a> you can also use the MMC with a certificate snap-in to do the job.<br />
<br />
Here is the MMC method<br />
<ol>
<li>Open MMC and add the Certificate (Local Computer) snap in
</li>
<li>Ctrl + M | Choose 'Certificates' | Add | OK
</li>
<li>Pick 'Computer Account' | Local Computer | OK
</li>
<li>Expand out Certificates and right click | All tasks | Advanced Operations | Create Custom Request 
</li>
<li>Certificate Enrolment - Proceed without enrolment policy | Next
</li>
<li>Custom Request - Template | Choose '(No Template) Legacy Key | Uncheck 'Suppress default extensions' |PKCS #10 | Next
</li>
<li>Expand down 'Details' on the Custom Request line | Click 'Properties' to open the dialogue with 4 tabs
</li>
<li>General Tab - Fill in what you like
</li>
<li>Subject Tab - Fill in 'Common Name' with your sub-domain and any other fields your CA may require
</li>
<li>Extensions Tab | Key Usage - Digital signature | Extended Key Usage - 'Server Auth.' &amp; 'Client Auth.' 
</li>
<li>Private key Tab | Cryptographic Service Provider - 'MS RSA SChannel Crypto. Provider' | Key Options - 'Key Size: 2048' and Check 'Make private key exportable' | Key Type - 'Exchange' 
</li>
<li>Click OK | Save the key somewhere and send to your CA when requesting a new Certificate or Re-keying an existing one.</li>
</ol>
The file you created can be referred to as a Certificate request and contains your Private Key as well as the other details you completed. The contents is a hash function that starts with:<br />
<br />
<pre>-----BEGIN NEW CERTIFICATE REQUEST-----</pre>
<br />
You can check the validity using openssl or via a&nbsp;<a href="https://www.sslshopper.com/csr-decoder.html" target="_blank">web service</a>&nbsp;if it's just a test.<br />
<br />
<pre>openssl req -in mycsr.csr -noout -text</pre>
<br />
My experience of CA's is limited to <a href="https://www.starfieldtech.com/" target="_blank">www.starfieldtech.com</a>&nbsp;but I think they offer a great service and very good value certificates, they are the R and D arm of internet giant GoDaddy. The simple SSL certificate from Starfield, which is all you would need for a single web service, costs just over £6 per annum.<br />
<br />
As for the range of different SSL certificate types, this all comes down to how many domains you wish to protect with a single certificate and also a marketing/consumer/cosmetic issue specific for Web Pages such as having a 'green bar' with your company name in the URL bar e.g. <a href="https://www.paypal.com/" target="_blank">https://www.paypal.com</a>. These more expensive certificates require much more rigorous validation by the CA so take longer to issue (10 days+), the simple 'vanilla' SSL takes minutes only. <br />
<br />
In the example of Starfield you purchase your SSL certificate then submit the CSR, starfield do what vaidaton they need to. For example in the case of wingateUK.com after submitting my CSR they looked up my contact details for the domain on WhoIs and emailed me. I clicked a link and that was it - approved.<br />
<br />
To install the certificate may depend on how you requested it; as I requested mine via MMC I installed from there also.<br />
<ol>
<li>Expand out the Certificates (Local Computer) \ Personal \ Certificates &amp; Right click 'Certificates'</li>
<li>All Tasks \ Import</li>
<li>Choose the file and run through the wizard</li>
</ol>
<div>
My particular web services application (MS Dynamics NAV) had me assigning the relevant port using a tool that came with it and also referenced the Certificates thumbprint that you can find by double clicking on the certificate file and looking in the details tab. Other application may vary!<br />
<br />
One final note on SSL web services, the free to use <a href="https://code.google.com/p/webservicestudio2/" target="_blank">WebServiceStudio</a>&nbsp;v2&nbsp;does not appear to work over HTTPS, but <a href="http://sourceforge.net/projects/soapui/" target="_blank">SoapUI</a> does and it's also opensource, which is always nice.</div>

