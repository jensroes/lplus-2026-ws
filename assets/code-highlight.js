(function () {
  function nextText(node) {
    var current = node.nextSibling;

    while (current) {
      var text = current.textContent || "";
      if (text.trim().length > 0) {
        return text.trim();
      }
      current = current.nextSibling;
    }

    return "";
  }

  function markRFunctions() {
    var tokens = document.querySelectorAll(
      "pre.prettyprint:not(.lang-r-output) span.pln, pre.sourceCode span, pre code span"
    );

    tokens.forEach(function (token) {
      var text = token.textContent || "";
      var name = text.trim();

      if (/^[A-Za-z.][A-Za-z0-9._]*$/.test(name) && nextText(token).charAt(0) === "(") {
        token.classList.add("r-function-call");
      }
    });
  }

  function isOutputBlock(pre) {
    if (pre.classList.contains("r-output") || pre.classList.contains("lang-r-output")) {
      return true;
    }

    if (pre.classList.contains("prettyprint") || pre.querySelector("code")) {
      return false;
    }

    var text = pre.textContent || "";
    return text.indexOf("# A tibble:") !== -1 || text.indexOf("<NA>") !== -1;
  }

  function escapeHtml(text) {
    return text
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;");
  }

  function formatOutputLine(line) {
    var html = escapeHtml(line)
      .replace(/&lt;NA&gt;|<NA>/g, '<span class="r-missing-value">NA</span>')
      .replace(/&lt;[A-Za-z0-9_?!]+&gt;/g, '<span class="r-variable-type">$&</span>')
      .replace(/(^|[^A-Za-z0-9_.])-\d+(?:\.\d+)?/g, function (match, prefix) {
        return prefix + '<span class="r-negative-number">' + match.slice(prefix.length) + '</span>';
      });

    if (/^#/.test(line)) {
      return '<span class="r-output-meta">' + html + '</span>';
    }

    return html;
  }

  function formatConsoleOutput() {
    var blocks = document.querySelectorAll("pre");

    blocks.forEach(function (pre) {
      if (!isOutputBlock(pre) || pre.dataset.consoleOutputFormatted === "true") {
        return;
      }

      pre.innerHTML = (pre.textContent || "")
        .split("\n")
        .map(formatOutputLine)
        .join("\n");
      pre.dataset.consoleOutputFormatted = "true";
    });
  }

  document.addEventListener("DOMContentLoaded", function () {
    formatConsoleOutput();
    markRFunctions();
    window.setTimeout(formatConsoleOutput, 250);
    window.setTimeout(markRFunctions, 250);
  });
}());
