<style>
	.fp-triage-form input {
		display: inline-block;
		min-width: 1%!important;
		width: 69%;
		background-color: #FFF;
		border: 1px solid #DDD;
	}
	.simple-form-ui section, .simple-form-ui #confirmation, .simple-form-ui form section, .simple-form-ui form #confirmation {
		background: #fff none repeat scroll 0 0;
	}	
	.dashboard .info-section {
		margin: -10px 5px 5px;
		width: 100%;
	}
	.dashboard .info-header h3 {
		color: #f26522;
	}
	.triage-details input{
		width: 77%;
	}
	.triage-details .append-to-value {
		padding-right: 25px;
	}
</style>
<script>
    jq(function(){
        jq("#fpTriageFormSubmitButton").on("click", function(){
            jq("#fp-triage-form").submit();
        })
    });
</script>
<div>

    <div style="min-width: 78%" class="col16 dashboard">
        <div class="info-section">
			<div class="info-header">
				<i class="icon-vitals"></i>
				<h3>TRIAGE DETAILS</h3>
			</div>

			<div class="info-body triage-details">
				<input type="hidden" name="patientId" value="${patient.id}" >
				<input type="hidden" name="queueId" value="${queueId}" >
				<field>
					<label for="concept.5089AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Weight</label>
					<input type="text" id="triageWeight" name="concept.5089AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range"/>
					<span class="append-to-value">Kgs</span>
					<span id="12482" class="field-error" style="display: none"></span>
				</field>
				
				<field>
					<label for="concept.5090AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Height</label>
					<input type="text" id="triageHeight" name="concept.5090AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range"/>
					<span class="append-to-value">Mtrs</span>
					<span id="12483" class="field-error" style="display: none"></span>
				</field>
				
				<field>
					<label for="concept.dece7c79-d59d-41ed-a5b7-9bfbe7a3bc2f">Respiratory Rate</label>
					<input type="text" id="triageBpm" name="concept.dece7c79-d59d-41ed-a5b7-9bfbe7a3bc2f" class="number numeric-range"/>
					<span class="append-to-value">Bpm</span>
					<span id="12486" class="field-error" style="display: none"></span>
				</field>
				
				<field>
					<label for="systolic">Blood Pressure</label>
					<input type="text" id="triageSystolic" name="concept.6aa7eab2-138a-4041-a87f-00d9421492bc" class="number numeric-range" />
					<span class="append-to-value">Systolic</span>
					<span id="12485" class="field-error" style="display: none"></span>
				</field>

				<field>
					<label for="diastolic"></label>
					<input type="text" id="triageDiastolic" name="concept.5086AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" />
					<span class="append-to-value">Diastolic</span>
					<span id="12484" class="field-error" style="display: none"></span>
				</field>
				
				<br/><br/>
			</div>
          
        </div>
    </div>
</div>

<div class="container">
    <br style="clear: both">
</div>





