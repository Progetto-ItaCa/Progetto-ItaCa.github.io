---
title: ItaCa Folk Ensemble
---

The "folk ensemble" project happily ended. For more information on what it has been, see [here](ensemble.html).

It is now time to introduce

# ItaCa Mentors

<img src="/assets/images/telemachus-up.jpg" style="width: 100%;" />


When Odysseus left for the Trojan War, he placed Mentor in charge of the education of his son Telemachus, and of Odysseus' palace.

This page contains a list of mentors and topics in category theory and nearby areas; each of them is willing to be contacted by young or less young students, to receive pointers to the literature, reading advices, and more in general whatever support Telemachus might need, studying the topics mentioned.

<ul class="mentor-list">
{%- for m in site.data.mentors | sort: "surname" %}
  <li>
    <strong>{{ m.name }} {{ m.surname }}</strong> 
      {%- if m.webpage %} <a href="{{ m.webpage }}">🌐</a> {%- endif %}
    <a href="mailto:{{ m.email }}">{{ m.email }}</a>
    <br>
    {{ m.topics }}
  </li>
{%- endfor %}
</ul>

<hr>

<img src="/assets/images/telemachus-down.jpg" style="width: 100%;" />

<p style="text-align:right; font-size:small;">
<em>— The Sorrow of Telemachus</em>, <br>
Angelica Kauffman (1783)
</p>