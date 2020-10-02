Other markdown syntax files have a ton of features, but they are also
slow, and still get things wrong depending on the variant you're using.

<!-- For example, consider the following nested enumerated list: -->

<!-- ``` markdown -->
<!-- 1.  Item 1 -->
<!--     1.  Sub-item 1 -->

<!--     2.  Sub-item 2 -->

<!--         New paragraph -->

<!-- 2.  Item 2 -->
<!-- ``` -->

<!-- In pretty much every other syntax file I've tried, `New paragraph` is -->
<!-- mis-categorized as a code block. -->

This plugin limits the scope of markdown syntax significantly, choosing
not to highlight things like tables, unmarked code blocks, underlined
headers, etc. that are more expensive to highlight, and that I either
don't use all that frequently or don't really need syntax highlighting
for.
