---
layout: default 
---

{%- assign slides_url = '/assets/slides/' -%} 

<h1> {{ page.title }} </h1> 

<p> ItaCa Fest is an online webinar aimed to gather the community of ItaCa.</p> 

<p> The seminar will be live on <a href="https://zoom.us" target="_blank">Zoom</a> at
<a href="{{ page.zoom  | escape_url }}">this link</a>. The timezone is: GMT+1.
</p> 

<p> Here the list of seminars 
  <ul>
  {%- for day in site.data[page.id] %}
    <li> <a href="#{{ day.id }}"> {{ day.date }} </a> </li> 
  {% endfor -%}
  </ul>
</p>

<br> 

{% for day in site.data[page.id] %} 

<br> 

<div id="{{ day.id }}"></div> 
<h2> {{ day.date }} </h2> 

<a name="fest4"></a>
<center>
<table>
  <thead>
    <tr>
      <th>Time</th>
      <th>Speaker</th>
      <th>Affiliation</th>
      <th>Talk</th>
      <th>Material</th>
    </tr>
  </thead>
  <tbody>
{% for slot in day.slots %}
  {% if slot.talk %} 
    <tr style="background-color:#fbe49d	">
      <td>{{ slot.time }}</td>
      <td>
        {%- if slot.talk.speaker.home -%} <a href="{{ slot.talk.speaker.home | escape_url }}" target="_blank"> {%- endif -%}
          <strong> {{ slot.talk.speaker.name }} </strong>
        {%- if slot.talk.speaker.hom -%} </a> {%- endif -%}
      </td>
      <td> {{ slot.talk.speaker.affiliation }} </td>
      <td> <a href="#{{ slot.talk.id }}"> <b>{{ slot.talk.title }} </b> </a> </td>
      <td>
        {%- if slot.talk.slides -%} <a href="{{ slot.talk.slides | prepend: slides_url | relative_url  }}">▤</a> {%- endif -%} 
        {%- if slot.talk.youtube -%} <a href="{{ slot.talk.youtube | escape_url }}" target="_blank">▶</a> {%- endif -%} 
      </td>
    </tr>
  {% else %} 
    <tr>
      <td>{{ slot.time }}</td>
      <td colspan="4">{{ slot.msg }}</td>
    </tr>
  {% endif %}
{% endfor %} 
  </tbody>
</table>
</center>

{% for slot in day.slots %} 
  {% if slot.talk %} 
<div id="{{ slot.talk.id }}"></div>
<h3> {{ slot.talk.speaker.fullname }} </h3> 
<h4> {{ slot.talk.title }} </h4> 

<p> {{ slot.talk.abstract | newline_to_br }} </p> 
{% endif %} 

{% endfor %} 

{% endfor %} 



