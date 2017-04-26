{%- set version = salt['pillar.get']('sift_version', 'dev') -%}

include:
  - ..packages.python-software-properties

{%- if version == "stable" %}
sift-dev:
  pkgrepo.absent:
    - ppa: sift/dev
{%- else %}
sift-stable:
  pkgrepo.absent:
    - ppa: sift/stable
{%- endif %}

sift:
  pkgrepo.managed:
    - ppa: sift/{{ version }}
    - refresh_db: true
    - require:
      - pkg: python-software-properties
