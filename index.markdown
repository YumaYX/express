---
layout: default
---

{% for post in site.posts %}
{{ post.content }}

<small>{{ post.date | date: "%B %d, %Y" }}</small>

<hr />
{% endfor %}
