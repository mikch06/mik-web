--- 
title: Homepage - Startseite
date: 2024-10-30T21:45:42+01:00
---
Home

Search
<link href="pagefind/pagefind-ui.css" rel="stylesheet">
<script src="pagefind/pagefind-ui.js"></script>
<div id="search"></div>
<script>
    window.addEventListener('DOMContentLoaded', (event) => {
        new PagefindUI({ element: "#search", showSubResults: true });
    });
</script>