---
layout: default
---

{% for post in site.posts %}
{{ post.content }}
<a href="{{ site.baseurl }}{{ post.url }}">{{ post.date | date: "%B %d, %Y" }}</a><hr />
{% endfor %}
