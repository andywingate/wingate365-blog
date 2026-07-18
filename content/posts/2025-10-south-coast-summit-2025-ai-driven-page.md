---
title: "South Coast Summit 2025 - AI-Driven Page Scripting: Practical Use Cases for Dynamics 365"
date: 2025-10-18T21:12:00Z
lastmod: 2025-10-18T22:29:14Z
url: "/2025/10/south-coast-summit-2025-ai-driven-page.html"
tags: ["talks", "AI", "vibe coding"]
hero: "https://blogger.googleusercontent.com/img/a/AVvXsEidE3UBJFVGDBlaERpyLggItYtIcHu6FqS_d-U9G625JliHyUPeD_mlBN16LZ90H1W-hdyhCuzoB33E3w-9nDXO84GPfRh6IOolLx4nEoBirjky7oKKSmfgCOQFqba9kTUeiJHtcFSCHoJnvgKGo1isaupEp2ofbDVxwGbI9oGs3w-RAT8FeIV0=w640-h320"
author: "Andy Wingate"
---
<p></p><br />At South Coast Summit 2025, <a href="https://www.linkedin.com/in/josemiguelazevedo/" target="_blank">José Miguel Azevedo</a> and I had the opportunity to share something we've been working on since our last <a href="https://blog.wingate365.com/2025/08/dynamicsminds-2025-portoroz-slovenia.html" target="_blank">Page Scripting talk at Dynamics Minds</a>. Using AI to transform how we work with page scripting in Dynamics 365 ERP.<p></p>
<h3 style="text-align: left;">The Core Idea</h3>
<p>Page scripting and task recording have been around for a while in Business Central and Finance &amp; Operations respectively. They're powerful tools for capturing business processes, automating testing, and documenting workflows. But creating and maintaining these scripts? That's always been the tedious part or cost prohibitive part if you really wanted to scale the volume of test scripts.&nbsp;</p>
<h3 style="text-align: left;">The AI adoption approach - Stand, Walk, Run, Fly&nbsp;</h3><div style="text-align: left;">We structured our presentation around our recommended approach to AI adoption for any given task. This approach doesn't guarantee that AI will be a great fit for a given task - but it does help you explore the tools and give you the best opportunity to discover where and how AI tooling can be applied.&nbsp;&nbsp;</div>
<h3>Stand Phase: Getting the Foundation Right</h3>
<p>The first step is all about creating a solid baseline. In page scripting this was around the creatin of a base script for our testing process "happy path". We used the example of creating and posting a purchase order. The output file for a BC page script is a YAML file.&nbsp;</p>
<p>With this clean baseline script, next we applied the AI asking it to analyse the structure, understand the pattern, and document what the script does step-by-step. This gives the AI context for everything that follows.&nbsp;</p>
<h3>Walk Phase: Building the Prompt System</h3>
<p>This is where things get interesting. Moving to VS Code with GitHub Copilot Pro, gave us access to multiple models and the ability to work with various files simultaneously.</p>
<p>The setup includes:</p>
<ul>
<li>Main prompt instructions that teach the AI how to work with your scripting format</li>
<li>Business process definitions</li>
<li>Variable lists for all the parameters&nbsp;</li>
<li>Source control in GitHub to tracking changes</li>
</ul>
<p>The benefit of working in VS Code rather than just a web interface? You can easily view a local folder structure for multiple levels of instructions and AI guidelines, we can use Model Context Protocol (MCP) servers to connect to Azure DevOps / Jira, if we needed to track tests against project work items or test cases.&nbsp;</p>
<h3>Run Phase: Create multiple Variants</h3>
<p>Once your AI understands your base scripts, you can start generating variants at scale. Want to test the same process across twenty different items? Different vendors? Edge cases with specific field combinations?</p>
<p>This is where the magic happens. Instead of manually creating script after script, you define your variants in structured files and let the AI generate the complete test suite. We demonstrated creating batch scripts for multiple items, validating them, and running them in the background.</p><p>By validating each step the AI was able to create its own detailed prompt instructions.&nbsp;</p><h3 style="text-align: left;">Fly Phase: High-Volume Generation with PowerShell</h3><p class="whitespace-normal break-words">AI tools are excellent at understanding patterns and generating structured content, but they're not optimised for very high-volume data operations. When you need to create hundreds or thousands of test script variants, asking the AI to directly generate each one becomes inefficient.</p><p class="whitespace-normal break-words">The solution? Get the AI to write a PowerShell or Python script that does the heavy lifting.</p><p class="whitespace-normal break-words">Instead of asking the AI to create 500 page scripts directly, we asked it to generate a PS script that could:</p><ul class="[&amp;:not(:last-child)_ul]:pb-1 [&amp;:not(:last-child)_ol]:pb-1 list-disc space-y-2.5 pl-7">
<li class="whitespace-normal break-words">Read our variant parameters from structured files</li>
<li class="whitespace-normal break-words">Apply the transformation logic to our base script template</li>
<li class="whitespace-normal break-words">Output the complete set of page scripts in seconds</li>
</ul><p class="whitespace-normal break-words">This approach plays to each tool's strengths: AI excels at understanding the pattern and writing the generation logic, while PowerShell handles the high-volume execution efficiently. The result is the ability to scale from dozens to thousands of test variants without hitting token limits or waiting for the AI to process each one individually.</p><p>
</p><p class="whitespace-normal break-words">It's a perfect example of using AI not to do all the work, but to automate the automation itself.</p>
<h3 style="text-align: left;">Real-World Gotchas</h3>
<p>Because this is a practical session, we made sure to cover the things that will trip you up:</p>
<ul>
<li><strong>MFA and test accounts</strong>: If you're using SaaS environments, your test-runner account needs MFA disabled or you'll have a bad time</li>
<li><strong>User context matters</strong>: Make sure your user's default company is set correctly before batch runs</li>
<li><strong>Permissions can be sneaky</strong>: Test your base script with the actual test-runner account - things like "show more" actions can break scripts if permissions aren't quite right</li>
<li><strong>BC performance tip</strong>: Consider running tests against a local Docker container. It's significantly faster than hitting cloud environments repeatedly</li>
<li><strong>AI security for work data</strong>: If you're working with sensitive data, use Azure OpenAI models deployed in your own tenant. You can connect VS Code to these and maintain data governance</li>
</ul>
<h3 style="text-align: left;">The Bigger Picture</h3>
<p>What we demonstrated with page scripting is really a blueprint for using AI with any structured output format. The approach - understanding the schema, creating clean examples, building comprehensive prompts, and then scaling to variants - applies far beyond just test automation.</p>
<p>José and I approached this from slightly different angles (BC vs F&amp;O), but the general approach work the same for both systems which gave us confidence that the fundamental approach we used for prompt engineering for structured outputs in this case is likely transferable.</p>
<h3 style="text-align: left;">What's Next?</h3>
<p>If you're thinking about applying this approach in your own work, start small. Pick one repetitive process you need to script, create one really good baseline, and experiment with getting AI to create a single variant. Once that works, you'll quickly see where the time savings compound.</p>
<p>For those who attended South Coast Summit, thanks for the great questions and discussion. For everyone else, the techniques we demonstrated are available to try right now - you just need a BC or F&amp;O environment, access to an AI tool (ChatGPT, Claude, or GitHub Copilot), and a willingness to experiment.</p>
<p>The AI won't replace understanding your business processes or knowing how to create good tests. But it absolutely can multiply your ability to execute once you know what needs to be done.</p><h3>Who was at the session?</h3><div>The in the room survey results</div><div><br /></div><div><div class="separator" style="clear: both; text-align: center;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEgI0oyqBk7PHqTwTgZg2NEkBZgMmIA2M8lXDJZjPhkvD72f_n4KkdHhs3IsUPvn6kIrB19su2zbdv0bWQaQfmGBRisJYr79TX16waCChEuU4uwRvxxlYLi3CFBQDgHkl74ZUksu3VGYGasDI4pFJoTORRpF3mwB88ACNLATJ18pJJhsKp3jnX_z" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="635" data-original-width="1221" height="208" src="https://blogger.googleusercontent.com/img/a/AVvXsEgI0oyqBk7PHqTwTgZg2NEkBZgMmIA2M8lXDJZjPhkvD72f_n4KkdHhs3IsUPvn6kIrB19su2zbdv0bWQaQfmGBRisJYr79TX16waCChEuU4uwRvxxlYLi3CFBQDgHkl74ZUksu3VGYGasDI4pFJoTORRpF3mwB88ACNLATJ18pJJhsKp3jnX_z=w400-h208" width="400" /></a></div><br /><div class="separator" style="clear: both; text-align: center;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEg03puEqmYRUAQVYLnXT1DIdtjnHshE0KKF_ZeRtpZ8xH4s2Yxkgs11qqNAfr9yUKUtkmG-WqurtXqe_inODKjklT7M-Mr5hkhVkUAicCZswFov6BaVMnXD5gaMA9bRwiqbPXySti_HEZfgeNYfjtuhQ8bfsth7CYnHeHGoNwA7JauCkBcHdVad" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="690" data-original-width="1289" height="214" src="https://blogger.googleusercontent.com/img/a/AVvXsEg03puEqmYRUAQVYLnXT1DIdtjnHshE0KKF_ZeRtpZ8xH4s2Yxkgs11qqNAfr9yUKUtkmG-WqurtXqe_inODKjklT7M-Mr5hkhVkUAicCZswFov6BaVMnXD5gaMA9bRwiqbPXySti_HEZfgeNYfjtuhQ8bfsth7CYnHeHGoNwA7JauCkBcHdVad=w400-h214" width="400" /></a></div><br /><div class="separator" style="clear: both; text-align: center;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEh7DevzsSLq741BXYVfL-qMmlZX7sfNvOq07DlCNB77uoThAl0AzMp6Mg1XFHh9Ug8O31cjVU7M-6yawKZULY_baqMzTXC-XIWfUCtQW2Clo5B_IWRxzjLzUQZskv0fssSp7YaHyCRKli_1wzRii_0pZQ_x1nZ3P4KOMtpNEEmEwiaHW_cyvuZ9" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="652" data-original-width="1248" height="209" src="https://blogger.googleusercontent.com/img/a/AVvXsEh7DevzsSLq741BXYVfL-qMmlZX7sfNvOq07DlCNB77uoThAl0AzMp6Mg1XFHh9Ug8O31cjVU7M-6yawKZULY_baqMzTXC-XIWfUCtQW2Clo5B_IWRxzjLzUQZskv0fssSp7YaHyCRKli_1wzRii_0pZQ_x1nZ3P4KOMtpNEEmEwiaHW_cyvuZ9=w400-h209" width="400" /></a></div></div><h3>Links</h3><div>You can grab a copy of these presentations&nbsp;<a href="https://1drv.ms/f/c/73ecbf3d4743e7c6/EkHIu3GRf_xAlKlFSLhFs2EB1nDUJ1jOhxiejc73UgDKCg?e=qyNU4k">here</a>.</div><div>All the prompt files and script examples are <a href="https://github.com/andywingate/D365BC-vibe-page-scripting" target="_blank">here</a><h3 style="text-align: left;">What do you think?</h3>
<p>Connect or follow me on LinkedIn to get all my updates&nbsp;<a href="https://www.linkedin.com/in/andywingate/" target="_blank">Andrew Wingate | LinkedIn</a></p>
<style>
    .libutton {
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 7px;
      text-align: center;
      outline: none;
      text-decoration: none !important;
      color: #ffffff !important;
      width: 200px;
      height: 32px;
      border-radius: 16px;
      background-color: #0A66C2;
      font-family: "SF Pro Text", Helvetica, sans-serif;
    }
  </style>
  <a class="libutton" href="https://www.linkedin.com/posts/andywingate_dynamicsminds-dynamicsminds2025-msdyn365bc-activity-7367982336585412608-jqPX?utm_source=share&amp;utm_medium=member_desktop&amp;rcm=ACoAAABqx-kBfdOkbVhGP3GNH_AVkAWCujaJWG8" target="_blank">Click to Follow</a></div>
