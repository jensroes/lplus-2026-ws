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
      "pre.prettyprint span.pln, pre.sourceCode span, pre code span"
    );

    tokens.forEach(function (token) {
      var text = token.textContent || "";
      var name = text.trim();

      if (/^[A-Za-z.][A-Za-z0-9._]*$/.test(name) && nextText(token).charAt(0) === "(") {
        token.classList.add("r-function-call");
      }
    });
  }

  document.addEventListener("DOMContentLoaded", function () {
    markRFunctions();
    window.setTimeout(markRFunctions, 250);
  });
}());
