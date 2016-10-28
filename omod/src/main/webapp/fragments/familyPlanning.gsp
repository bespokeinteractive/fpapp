<script>
	jq(function(){
		var fpMethods = [];
		<% fpMethods.each { %>
			fpMethods.push(${it.toJson()});
		<% } %>

		jq(".fp-method").autocomplete({
			minLength: 2,
			focus: function(event, ui ) {
				jq( ".fp-method" ).val( ui.item.label );
				return false;
			},
			source: fpMethods,
			select: function(event, ui){
				event.preventDefault();
				jq(".fp-method-value").val(ui.item.id);
				jq("#quantity-given").attr("name", "concept." + ui.item.id);
				
				if (ui.item.type == 4){
					jq('#insertion').attr('disabled', false);
					jq('#removal').attr('disabled', false);
					
					jq('#removal').parent().removeClass('greyOut');					
					jq('#insertion').parent().removeClass('greyOut');
					
					jq('#quantity-given').attr('disabled', false);
					jq('#quantity-given').removeClass('greyOut');
					jq('#quantity-given').val('1');
				}
				else{
					jq('#insertion').attr('disabled', true);
					jq('#removal').attr('disabled', true);
					
					jq('#insertion').parent().addClass('greyOut');
					jq('#removal').parent().addClass('greyOut');
					
					jq('#removal').attr('checked', false);
					jq('#insertion').attr('checked', false);
					
					if (ui.item.type >= 5){
						jq('#quantity-given').attr('disabled', true);
						jq('#quantity-given').addClass('greyOut');
						jq('#quantity-given').val('N/A');
					} else{
						jq('#quantity-given').attr('disabled', false);
						jq('#quantity-given').removeClass('greyOut');
						jq('#quantity-given').val('');
					}
				}
				
				jq('.fp-administration input').change();				
			}
		});
		
		jq('#other-method').change(function(){
			var methodType = jq('#other-method :selected').data('type');
			if (methodType == 0 || methodType == 6){
				jq('#other-method-quantity').attr('disabled', true);
				jq('#other-method-quantity').addClass('greyOut');
				jq('#other-method-quantity').val('N/A');
			}
			else {
				jq('#other-method-quantity').attr('disabled', false);
				jq('#other-method-quantity').removeClass('greyOut');
				jq('#other-method-quantity').val('');
			}
		}).change();
		
		jq('.fp-administration input').change(function(){
			var anyFilled = false;
			
			jq('.fp-administration input').each(function(index, element){
				if (element.value !== ''){
					anyFilled = true;
				}
			});
			
			if (anyFilled == true){
				jq('#fp-administration-set').val('SET');
			} else{
				jq('#fp-administration-set').val('');
			}
		});
		
		
		jq('#return-date-display').attr('name', 'ac5c88af-3104-4ca2-b1f7-2073b1364065');
	});
</script>

<style>
	.simple-form-ui section{
		background: #fff none repeat scroll 0 0;
	}	
	.dashboard .info-header h3 {
		color: #f26522;
	}
	.greyOut{
		color: #aaa!important;
	}
</style>


<div style="min-width: 78%" class="col16 dashboard">
	<div class="info-section" style="margin:0 5px 5px">
		<div class="info-header">
			<i class="icon-th-list"></i>
			<h3>FAMILY PLANNING ADMINISTRATION</h3>
		</div>
	</div>
</div>

<div class="fp-administration">
	<div>
		<label for="374AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">FP Method</label>
		<input type="text" class="fp-method">
		<input type="hidden" name="concept.374AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="fp-method-value" id="374AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
	</div>
	
	<field style="display: none;">
		<input id="fp-administration-set" type="hidden" />
	</field>
	
	<div class="ft-type">
		<label>FP Type</label>
		<label style="padding-left: 0px; margin-top: 0px; cursor: pointer;">
			<input id="insertion" data-value="Insertion" type="radio" name="concept.be53c0fd-e7c4-40d1-9933-175484b6ac09" value="66a52b2a-9323-4d39-a3e2-be9906f2d9cf" style="margin: 4px 5px 0 0" />
			Insertion
		</label><br/>
		
		<label></label>
		<label style="padding-left: 0px; margin-top: 0px; cursor: pointer;">
			<input id="removal" data-value="Removal" type="radio" name="concept.be53c0fd-e7c4-40d1-9933-175484b6ac09" value="3069f0b8-0f0a-4f0f-bcc5-dd6812fceca8" style="margin: 4px 5px 0 0" />
			Removal
		</label><br/>
		
		<label></label>
		<label style="padding-left: 0px; margin-top: 0px; cursor: pointer;">
			<input id="followup" data-value="Follow-up" type="radio" name="concept.be53c0fd-e7c4-40d1-9933-175484b6ac09" value="159489AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" style="margin: 4px 5px 0 0" />
			Follow-up
		</label>
	</div>
	
	<div>
		<label for="quantity-given">Quantity Issued</label>
		<input type="text" name="concept.074c20bc-e18d-42f7-b501-a0bb549394c6" id="quantity-given">
	</div>
	
	<div style="margin-top: 30px; border-top: 2px solid #ddd;">
		<label for="other-method">Other Method</label>
		<select id="other-method" name="concept.1767f404-6098-4e40-9ffc-6f8d9f3eec70">
			<option value="" data-type="0">SELECT OPTION</option>
			<% secondaryMethods.each { %>
				<option value="${it.concept.uuid}" data-type="${it.type.id}">${it.concept.name.toString().toUpperCase()}</option>				
			<% } %>			
		</select>	
	</div>
	
	<div>
		<label for="other-method-quantity">Quantity</label>
		<input type="text" name="concept.bcc9d139-45dc-4285-b926-ae10d4b221bd" id="other-method-quantity">
	</div>
	
	<div style="margin-top: 30px; border-top: 2px solid #ddd;">
		${ui.includeFragment("uicommons", "field/datetimepicker", [id: 'fp-date', label: 'Date Given', formFieldName: 'obsDatetime', useTime: false, defaultToday: true, endToday: true])}
	</div>
	
	<div>
		${ui.includeFragment("uicommons", "field/datetimepicker", [id: 'return-date', label: 'Return Date', formFieldName: 'concept.ac5c88af-3104-4ca2-b1f7-2073b1364065', useTime: false, defaultToday: true, startDate: new Date()])}
	</div>
	
	<div>
		<label>Comment</label>
		<textarea name="comment.374AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" rows="4" cols="50"></textarea>
	</div>
</div>

