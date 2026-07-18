---
title: "Dynamics 365 Business Central and Large Data Sets"
date: 2023-10-22T11:07:00Z
lastmod: 2024-03-16T10:22:21Z
url: "/2023/10/dynamics-365-business-central-and-large.html"
tags: ["c#", "d365bc", "data", ".net"]
hero: "https://blogger.googleusercontent.com/img/a/AVvXsEigvUd-3NFGus4s6QflLG3VRqJr7BELTr2GyD9bkrUsNrGa7r8HZ9ffcgqqzqbn6quo1bJGMT8SsVzBFheL0i6b6iNEN7fqUf4ZPZuOyd8CqYnXkRd3252oSqOKUO0skZkiEYFdvLN6LtKQm13AM34PVfegLI4RAqsDo1_2oNcIpzxnsvoQSnZd"
author: "Andy Wingate"
---
<h1>How Big is Big? The Challenge of Handling Over 5 Million Records</h1><div><br />When it comes to data migration, especially for large datasets, how big is too big? What if you're dealing with over 5 million records? This post explores the challenges and possible solutions for this predicament.</div>
  
  <h2>Data Migration: Excel vs RapidStart</h2>

  <p>Configuration Packages accept two types of files for data migration:</p>

  <ol>
    <li><strong>Excel</strong>: Created by exporting a template. It has a maximum row limitation of 1,048,576.</li>
    <li><strong>RapidStart</strong>: Also created by exporting a package, but appears to be a type of archive file.</li>
  </ol>

  <p>So, if we need to import or export more than approximately 1 million records, what do we do?</p>

  <h2>The RapidStart Solution</h2>
  
  <p>After some investigation, it turns out that RapidStart files are essentially gzipped XML files. This opens up the possibility of using these files as an alternative to Excel.</p>

  <h2>Learning LINQ to XML</h2>
  
  <p>To explore this further, I dabbled in LINQ to create XML files from CSV. I followed the tutorials on Microsoft Learn, specifically "<a href="https://learn.microsoft.com/en-us/dotnet/csharp/tutorials/working-with-linq">Working with LINQ - C#</a>" and "<a href="https://learn.microsoft.com/en-us/dotnet/standard/linq/linq-xml-overview">Overview - LINQ to XML - .NET</a>".</p>
  
  <p>With some help from ChatGPT for coding, I developed two programs:</p>

  <ol>
    <li>The first program converts a CSV lists of Fixed Assets records into a RapidStart package.</li>
    <li>The second program exports all table data from any RapidStart package into a series of CSV files.</li>
  </ol>

  <p>Both programs' source code can be found on GitHub:</p>

  <ul>
    <li><a href="https://github.com/andywingate/Create-RapidStart">Create-RapidStart</a></li><li><a href="https://github.com/andywingate/Plunder-RapidStart">Plunder-RapidStart</a></li>
  </ul>

  <h2>A Guide for .NET C# Beginners</h2>
  
  <p>If you're new to .NET C# (as I am), here's a very basic guide on how you can compile and use the source code:</p>

  <ol>
    <li>Install <a href="https://dotnet.microsoft.com/download">.NET</a> and <a href="https://code.visualstudio.com/">Visual Studio Code</a>.</li>
    <li>Add the <a href="https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell">PowerShell extension</a> for VS Code.</li>
    <li>Open the terminal in VS Code, create a folder, navigate into the folder, and set up a sample project:</li></ol><pre><code>PS &gt; md Hello-World  
PS &gt; cd .\Hello-World\  
PS &gt; dotnet new console  
PS &gt; code .<br /></code></pre>

  <p>The last command will open VS Code to that project, you can then run the sample app:</p><pre><code>PS &gt; dotnet run
  </code></pre>

  <p></p><table align="center" cellpadding="0" cellspacing="0" class="tr-caption-container" style="margin-left: auto; margin-right: auto;"><tbody><tr><td style="text-align: center;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEjQgzYBJMrq1Sdqt3ftUhQ93Vnq0TqEPdAk9HcLMnRxTsH6GXqMHZ3k2BbNDzw2UEm1UImhLIiJPhLWKH8LRdPsk39gUW4Q1DGqRiY92y_H3t_Lto7pNVp6f1C2d8psnfV2udJjFX48WfOIX-aHEJ_gYO6Ypq2I9UlsaFi6Orw9l1seJ5yAGttL" style="margin-left: auto; margin-right: auto;"><img alt="" data-original-height="578" data-original-width="1024" height="181" src="https://blogger.googleusercontent.com/img/a/AVvXsEjQgzYBJMrq1Sdqt3ftUhQ93Vnq0TqEPdAk9HcLMnRxTsH6GXqMHZ3k2BbNDzw2UEm1UImhLIiJPhLWKH8LRdPsk39gUW4Q1DGqRiY92y_H3t_Lto7pNVp6f1C2d8psnfV2udJjFX48WfOIX-aHEJ_gYO6Ypq2I9UlsaFi6Orw9l1seJ5yAGttL" width="320" /></a></td></tr><tr><td class="tr-caption" style="text-align: center;">Running the sample c# app from the PS terminal in VS Code</td></tr></tbody></table><p>To use the experimental apps I created simply replace the <code>Program.cs</code> source code with the code from GitHub, save the file, and run it again.</p>

  <h2>Performance Metrics: Fixed Asset Processing Times</h2>

  <p>Next, let's talk about the performance metrics. I conducted tests using 5k and 25k samples to calculate depreciation and journal posting times:</p>

  <ul>
    <li>For the 5k sample, the total processing time was 390 seconds, giving a per-record time of 78 ms.</li>
    <li>For the 25k sample, the total processing time was 1897 seconds, with a per-record time of 75.9 ms.</li>
  </ul><div><table align="center" cellpadding="0" cellspacing="0" class="tr-caption-container" style="margin-left: auto; margin-right: auto;"><tbody><tr><td style="text-align: center;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEiD_sVLJZ9CV4grB7RbdIu_DWjVVOAqOPBWHUj43Fhk5vebSynqP6FkrzA_SpEZEFE275SYw9dxc8yXO78_py-So3iLh0HUav6twMK2JMQtilQhWhhNlpqPf2FQBeAuoaN3WaAtedxpTnZnoSoUAUWxRVKzmwxzDBFM6bKNT5ouXFvBjbe6Q26K" style="margin-left: auto; margin-right: auto;"><img alt="" data-original-height="407" data-original-width="641" height="203" src="https://blogger.googleusercontent.com/img/a/AVvXsEiD_sVLJZ9CV4grB7RbdIu_DWjVVOAqOPBWHUj43Fhk5vebSynqP6FkrzA_SpEZEFE275SYw9dxc8yXO78_py-So3iLh0HUav6twMK2JMQtilQhWhhNlpqPf2FQBeAuoaN3WaAtedxpTnZnoSoUAUWxRVKzmwxzDBFM6bKNT5ouXFvBjbe6Q26K" width="320" /></a></td></tr><tr><td class="tr-caption" style="text-align: center;">Extrapolated Depreciation time in hrs for large list of Fixed Assets</td></tr></tbody></table><br /></div>

  <h2>Future Considerations</h2>

  <p>The journal posting time could potentially be reduced by not having a balancing line for each asset but using one balancing line for the entire batch. This optimization is something to explore in the future.</p>

  <h2>What's Next?</h2>

  <p>In the future, I'll be looking into using the Job Queue to manage these long-running tasks more efficiently.</p>
