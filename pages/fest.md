---
layout: default
---

# ItaCa Fest 

ItaCa Fest is a series of online seminars aimed to gather the community of ItaCa. 

{%- assign fests = site.fests | sort: 'title' | reverse %} 

{%- for f in fests %}
* [{{ f.title }}]({{ f.url }}) 
{%- endfor %}

