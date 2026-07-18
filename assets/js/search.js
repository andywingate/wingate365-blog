/* Lightweight client-side search over the Hugo-generated /index.json.
   No external dependencies. */
(function () {
  var input = document.getElementById('search-input');
  var results = document.getElementById('search-results');
  if (!input || !results) return;

  var data = null;
  var loading = null;
  var active = -1;

  function load() {
    if (data) return Promise.resolve(data);
    if (loading) return loading;
    loading = fetch(input.dataset.index)
      .then(function (r) { return r.json(); })
      .then(function (d) { data = d; return d; })
      .catch(function () { data = []; return data; });
    return loading;
  }

  function escapeHtml(s) {
    return String(s).replace(/[&<>"]/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c];
    });
  }

  function search(query, limit) {
    var terms = query.toLowerCase().split(/\s+/).filter(Boolean);
    if (!terms.length) return [];
    var scored = [];
    for (var i = 0; i < data.length; i++) {
      var p = data[i];
      var title = (p.title || '').toLowerCase();
      var tags = (p.tags || []).join(' ').toLowerCase();
      var body = (p.summary || '') + ' ' + (p.content || '');
      body = body.toLowerCase();
      var score = 0;
      var matchedAll = true;
      for (var t = 0; t < terms.length; t++) {
        var term = terms[t];
        if (title.indexOf(term) !== -1) score += 5;
        else if (tags.indexOf(term) !== -1) score += 3;
        else if (body.indexOf(term) !== -1) score += 1;
        else { matchedAll = false; break; }
      }
      if (matchedAll) scored.push({ p: p, score: score });
    }
    scored.sort(function (a, b) { return b.score - a.score; });
    return scored.slice(0, limit || 8).map(function (x) { return x.p; });
  }

  function render(list, query) {
    active = -1;
    if (!query) {
      results.innerHTML = '';
      results.hidden = true;
      input.setAttribute('aria-expanded', 'false');
      return;
    }
    if (!list.length) {
      results.innerHTML = '<div class="search-empty">No results for &ldquo;' + escapeHtml(query) + '&rdquo;</div>';
    } else {
      results.innerHTML = list.map(function (p) {
        var meta = escapeHtml(p.date || '');
        if (p.tags && p.tags.length) meta += ' · ' + escapeHtml(p.tags.slice(0, 3).join(', '));
        return '<a class="search-result" role="option" href="' + escapeHtml(p.url) + '">' +
          '<span class="search-result-title">' + escapeHtml(p.title) + '</span>' +
          '<span class="search-result-meta">' + meta + '</span></a>';
      }).join('');
    }
    results.hidden = false;
    input.setAttribute('aria-expanded', 'true');
  }

  var debounce;
  function onInput() {
    var query = input.value.trim();
    clearTimeout(debounce);
    if (!query) { render([], ''); return; }
    debounce = setTimeout(function () {
      load().then(function () { render(search(query), query); });
    }, 100);
  }

  function items() {
    return Array.prototype.slice.call(results.querySelectorAll('.search-result'));
  }

  function setActive(next) {
    var list = items();
    if (!list.length) return;
    if (active >= 0 && list[active]) list[active].classList.remove('is-active');
    active = (next + list.length) % list.length;
    list[active].classList.add('is-active');
    list[active].scrollIntoView({ block: 'nearest' });
  }

  input.addEventListener('input', onInput);
  input.addEventListener('focus', load);

  input.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') {
      input.value = '';
      render([], '');
      input.blur();
    } else if (e.key === 'ArrowDown') {
      e.preventDefault();
      setActive(active + 1);
    } else if (e.key === 'ArrowUp') {
      e.preventDefault();
      setActive(active - 1);
    } else if (e.key === 'Enter') {
      var list = items();
      if (active >= 0 && list[active]) {
        e.preventDefault();
        window.location.href = list[active].getAttribute('href');
      } else {
        var q = input.value.trim();
        if (q) {
          e.preventDefault();
          var base = input.dataset.index.replace(/index\.json.*$/, '');
          window.location.href = base + 'search/?q=' + encodeURIComponent(q);
        }
      }
    }
  });

  document.addEventListener('click', function (e) {
    if (!e.target.closest('.search')) {
      results.hidden = true;
      input.setAttribute('aria-expanded', 'false');
    }
  });

  // Keyboard shortcut: "/" focuses search
  document.addEventListener('keydown', function (e) {
    if (e.key === '/' && document.activeElement !== input &&
        !/^(INPUT|TEXTAREA|SELECT)$/.test(document.activeElement.tagName)) {
      e.preventDefault();
      input.focus();
    }
  });

  // Full search results page (/search/?q=...): reuse the post-card style with heroes.
  var pageEl = document.getElementById('search-page-results');
  if (pageEl) {
    var titleEl = document.getElementById('search-page-title');
    var countEl = document.getElementById('search-page-count');
    var pageBase = pageEl.dataset.base || input.dataset.index.replace(/index\.json.*$/, '');
    var pageQuery = (new URLSearchParams(location.search).get('q') || '').trim();
    input.value = pageQuery;

    var tagSlug = function (t) {
      return String(t).toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
    };

    var card = function (p) {
      var tags = '';
      if (p.tags && p.tags.length) {
        tags = '<ul class="post-card-tags">' + p.tags.slice(0, 4).map(function (t) {
          return '<li><a class="tag-pill sm" href="' + pageBase + 'tags/' + tagSlug(t) + '/">' + escapeHtml(t) + '</a></li>';
        }).join('') + '</ul>';
      }
      var meta = p.date ? '<div class="post-card-meta"><time>' + escapeHtml(p.date) + '</time></div>' : '';
      var summary = p.summary ? '<p class="post-card-summary">' + escapeHtml(String(p.summary).slice(0, 180)) + '</p>' : '';
      return '<article class="post-card has-thumb">' +
        '<a class="post-card-thumb" href="' + escapeHtml(p.url) + '" aria-hidden="true" tabindex="-1">' + (p.thumb || '') + '</a>' +
        '<div class="post-card-body">' + meta +
        '<h3 class="post-card-title"><a href="' + escapeHtml(p.url) + '">' + escapeHtml(p.title) + '</a></h3>' +
        summary + tags + '</div></article>';
    };

    var renderPage = function () {
      if (!pageQuery) {
        if (titleEl) titleEl.textContent = 'Search';
        if (countEl) countEl.textContent = 'Type a query in the search box above.';
        pageEl.innerHTML = '';
        return;
      }
      if (titleEl) titleEl.textContent = 'Search: ' + pageQuery;
      var list = search(pageQuery, 50);
      if (countEl) countEl.textContent = list.length + ' result' + (list.length === 1 ? '' : 's') + ' for \u201C' + pageQuery + '\u201D.';
      pageEl.innerHTML = list.length
        ? list.map(card).join('')
        : '<p class="muted">No results for \u201C' + escapeHtml(pageQuery) + '\u201D.</p>';
    };

    load().then(renderPage);
  }
})();
