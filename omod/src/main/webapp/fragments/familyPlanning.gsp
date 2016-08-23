<p>
    <label for="374AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">FP Method</label>
    <input type="text" class="fp-method">
    <input type="hidden" name="concept.374AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="fp-method-value" id="374AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
</p>
<p>
    <label for="quantity-given">Quantity</label>
    <input type="text" name="" id="quantity-given">
</p>
<p>
    ${ui.includeFragment("uicommons", "field/datetimepicker", [id: 'fp-date', label: 'Date Given', formFieldName: 'obsDatetime', useTime: false, defaultToday: true])}
</p>
<p>
    <label>Comment</label>
    <textarea name="comment.374AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" rows="4" cols="50"></textarea>
</p>
<script>
    jq(function(){
        var fpMethods = [];
        <% fpMethods.each { %>
        fpMethods.push(${it.toJson()});
        <% } %>
        jq(".fp-method").autocomplete({
            minLength: 2,
            focus: function( event, ui ) {
                jq( ".fp-method" ).val( ui.item.label );
                return false;
            },
            source: fpMethods,
            select: function(event, ui){
                event.preventDefault();
                jq(".fp-method-value").val(ui.item.id);
                jq("#quantity-given").attr("name", "concept." + ui.item.id);
            }
        }).autocomplete("instance")._renderItem = function( ul, item ) {
            return ( "<li>" )
                .append( "<div>" + item.label + "</div>" )
                .appendTo( ul );
        };
    });
</script>
