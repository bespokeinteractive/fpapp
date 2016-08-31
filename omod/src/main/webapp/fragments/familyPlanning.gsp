<div>
    Previously Administered Methods:
    <% if (administeredMethods) { %>
    <ul>
    <% administeredMethods.each { %>
        <li>${it.method} (${it.comment})</li>
    <% } %>
    </ul>
    <% }
       else { %>
        None
    <% } %>
</div>
<p>
    <label for="374AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">FP Method</label>
    <input type="text" class="fp-method">
    <input type="hidden" name="concept.374AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="fp-method-value" id="374AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
</p>
<p>
    <label>Type (if applicable)</label>
    <label for="insertion"><input id="insertion" type="radio" name="concept.be53c0fd-e7c4-40d1-9933-175484b6ac09" value="66a52b2a-9323-4d39-a3e2-be9906f2d9cf" >Insertion</label>
    <label for="removal"><input id="removal" type="radio" name="concept.be53c0fd-e7c4-40d1-9933-175484b6ac09" value="3069f0b8-0f0a-4f0f-bcc5-dd6812fceca8" >Removal</label>
</p>
<p>
    <label for="quantity-given">Quantity Issued</label>
    <input type="text" name="concept.074c20bc-e18d-42f7-b501-a0bb549394c6" id="quantity-given">
</p>
<p>
    ${ui.includeFragment("uicommons", "field/datetimepicker", [id: 'fp-date', label: 'Date Given', formFieldName: 'obsDatetime', useTime: false, defaultToday: true, endToday: true])}
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
