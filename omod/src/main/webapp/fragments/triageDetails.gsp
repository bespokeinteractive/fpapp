<style>
.fp-triage-form input {
    display: inline-block;
    min-width: 1%!important;
    width: 69%;
    background-color: #FFF;
    border: 1px solid #DDD;
}
</style>
<script>
    jq(function(){
        jq("#fpTriageFormSubmitButton").on("click", function(){

        })
    });
</script>
<div>
    <div style="padding-top: 15px;" class="col15 clear">
        <ul id="left-menu" class="left-menu">
            <li class="menu-item selected" visitid="54">
                <span class="menu-date">
                    <i class="icon-time"></i>
                    <span id="vistdate">23 May 2016<br> &nbsp; &nbsp; (Active since 04:10 PM)</span>
                </span>

                <div class="patient-profile">

                </div>
                <span class="arrow-border"></span>
                <span class="arrow"></span>
            </li>

            <li style="height: 30px;" class="menu-item" visitid="53">
            </li>
        </ul>
    </div>

    <div style="min-width: 78%" class="col16 dashboard">
        <div class="info-section">
            <form id="fp-triage-form" class="fp-triage-form">
                <input type="hidden" value="" id="editStatus" name="isEdit"/>
                <div class="profile-editor"></div>

                <div class="info-header">
                    <i class="icon-diagnosis"></i>
                    <h3>TRIAGE DETAILS</h3>
                </div>

                <div class="info-body">
                    <input type="hidden" name="patientId" value="${patientId}" >
                    <input type="hidden" name="queueId" value="${queueId}" >
                    <div>
                        <label for="concept.5089AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Weight</label>
                        <input type="text" id="concept.5089AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" name="concept.5089AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range"/>
                        <span class="append-to-value">Kgs</span>
                        <span id="12482" class="field-error" style="display: none"></span>
                    </div>
                    <div>
                        <label for="concept.5090AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Height</label>
                        <input type="text" id="concept.5090AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" name="concept.5090AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range"/>
                        <span class="append-to-value">Mtrs</span>
                        <span id="12483" class="field-error" style="display: none"></span>
                    </div>
                    <div>
                        <label for="concept.respiratoryRateConcept">Respiratory Rate</label>
                        <input type="text" id="concept.respiratoryRateConcept" name="concept.respiratoryRateConcept" class="number numeric-range"/>
                        <span class="append-to-value">Bpm</span>
                        <span id="12486" class="field-error" style="display: none"></span>
                    </div>
                    <div>
                        <label for="systolic">Blood Pressure</label>
                        <input type="text" id="systolic" name="concept.6aa7eab2-138a-4041-a87f-00d9421492bc" class="number numeric-range" />
                        <span class="append-to-value">Systolic</span>
                        <span id="12485" class="field-error" style="display: none"></span>
                    </div>

                    <div>
                        <label for="diastolic"></label>
                        <input type="text" id="diastolic" name="concept.5086AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" />
                        <span class="append-to-value">Diastolic</span>
                        <span id="12484" class="field-error" style="display: none"></span>
                    </div>


                </div>
            </form>

            <div>
                <span class="button submit confirm right" id="fpTriageFormSubmitButton" style="margin-top: 10px; margin-right: 50px;">
                    <i class="icon-save"></i>
                    Save
                </span>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <br style="clear: both">
</div>





