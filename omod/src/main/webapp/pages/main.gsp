<%
    ui.decorateWith("appui", "standardEmrPage", [title: "Family Planning"])
    ui.includeJavascript("uicommons", "handlebars/handlebars.min.js", Integer.MAX_VALUE - 1)
    ui.includeJavascript("uicommons", "navigator/validators.js", Integer.MAX_VALUE - 19)
    ui.includeJavascript("uicommons", "navigator/navigator.js", Integer.MAX_VALUE - 20)
    ui.includeJavascript("uicommons", "navigator/navigatorHandlers.js", Integer.MAX_VALUE - 21)
    ui.includeJavascript("uicommons", "navigator/navigatorModels.js", Integer.MAX_VALUE - 21)
    ui.includeJavascript("uicommons", "navigator/navigatorTemplates.js", Integer.MAX_VALUE - 21)
    ui.includeJavascript("uicommons", "navigator/exitHandlers.js", Integer.MAX_VALUE - 22)
    ui.includeJavascript("billingui", "moment.js")
    ui.includeJavascript("mchapp", "object-to-query-string.js")
    ui.includeJavascript("mchapp", "drugOrder.js")
    ui.includeJavascript("mchapp", "includes-polyfill.js")
    ui.includeCss("registration", "onepcssgrid.css")
%>

<script>
    jq(function() {
        jq(".fp-tabs").tabs();
        NavigatorController = new KeyboardController(jq('#familyPlanningForm'));
    });
</script>

<style>
.toast-item {
    background-color: #222;
}

.name {
    color: #f26522;
}

#breadcrumbs a, #breadcrumbs a:link, #breadcrumbs a:visited {
    text-decoration: none;
}

.new-patient-header .demographics .gender-age {
    font-size: 14px;
    margin-left: -55px;
    margin-top: 12px;
}

.new-patient-header .demographics .gender-age span {
    border-bottom: 1px none #ddd;
}

.new-patient-header .identifiers {
    margin-top: 5px;
}

.tag {
    padding: 2px 10px;
}

.tad {
    background: #666 none repeat scroll 0 0;
    border-radius: 1px;
    color: white;
    display: inline;
    font-size: 0.8em;
    padding: 2px 10px;
}

.status-container {
    padding: 5px 10px 5px 5px;
}

.catg {
    color: #363463;
    margin: 35px 10px 0 0;
}

.print-only {
    display: none;
}

.button-group {
    display: inline-block;
    position: relative;
    vertical-align: middle;
}

.button-group > .button:first-child:not(:last-child):not(.dropdown-toggle) {
    border-bottom-right-radius: 0;
    border-top-right-radius: 0;
}

.button-group > .button:first-child {
    margin-left: 0;
}

.button-group > .button:hover, .button-group > .button:focus, .button-group > .button:active, .button-group > .button.active {
    z-index: 2;
}

.button-group > .button {
    border-radius: 5px;
    float: left;
    position: relative;
}

.button.active, button.active, input.active[type="submit"], input.active[type="button"], input.active[type="submit"], a.button.active {
    background: #d8d8d8 none repeat scroll 0 0;
    border-color: #d0d0d0;
}

.button-group > .button:not(:first-child):not(:last-child) {
    border-radius: 0;
}

.button-group > .button {
    border-radius: 5px;
    float: left;
    position: relative;
}

.button-group > .button:last-child:not(:first-child) {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
}

.button-group .button + .button, .button-group .button + .button-group, .button-group .button-group + .button, .button-group .button-group + .button-group {
    margin-left: -1px;
}

ul.left-menu {
    border-style: solid;
}

.col15 {
    display: inline-block;
    float: left;
    max-width: 22%;
    min-width: 22%;
}

.col16 {
    display: inline-block;
    float: left;
    width: 730px;
}

#date-enrolled label {
    display: none;
}

.add-on {
    color: #f26522;
}

.append-to-value {
    color: #999;
    float: right;
    left: auto;
    margin-left: -200px;
    margin-top: 13px;
    padding-right: 55px;
    position: relative;
}

.menu-title span {
    display: inline-block;
    width: 65px;
}

span a:hover {
    text-decoration: none;
}

form label,
.form label {
    display: inline-block;
    padding-left: 10px;
    width: 140px;
}triageDetails
form input,
form textarea,
.form input,
.form textarea {
    display: inline-block;
    min-width: 1%!important;
}
form select,
form ul.select,
.form select,
.form ul.select {
    display: inline-block;
    min-width: 3%;
}
form input:focus, form select:focus, form textarea:focus, form ul.select:focus, .form input:focus, .form select:focus, .form textarea:focus, .form ul.select:focus {
    outline: 2px none #007fff;
    box-shadow: 0 0 1px 0 #ccc !important;
}
form input[type="checkbox"], .form input[type="checkbox"] {
    margin-top: 4px;
    cursor: pointer;triageDetails
}
#modal-overlay {
    background: #000 none repeat scroll 0 0;
    opacity: 0.4 !important;
}

.simple-form-ui section fieldset select:focus, .simple-form-ui section fieldset input:focus, .simple-form-ui section #confirmationQuestion select:focus, .simple-form-ui section #confirmationQuestion input:focus, .simple-form-ui #confirmation fieldset select:focus, .simple-form-ui #confirmation fieldset input:focus, .simple-form-ui #confirmation #confirmationQuestion select:focus, .simple-form-ui #confirmation #confirmationQuestion input:focus, .simple-form-ui form section fieldset select:focus, .simple-form-ui form section fieldset input:focus, .simple-form-ui form section #confirmationQuestion select:focus, .simple-form-ui form section #confirmationQuestion input:focus, .simple-form-ui form #confirmation fieldset select:focus, .simple-form-ui form #confirmation fieldset input:focus, .simple-form-ui form #confirmation #confirmationQuestion select:focus, .simple-form-ui form #confirmation #confirmationQuestion input:focus{
    outline: 1px none #f00
}
.floating-controls{
    margin-top: 5px;
    padding: 0 !important;
}
.floating-controls input{
    cursor: pointer;
    float: none!important;
}triageDetails
.floating-controls label{
    cursor: pointer;
}
.floating-controls span{
    color: #f26522;
}
.floating-controls textarea{
    resize: none;
}
.onerow {
    clear: both;
    padding: 0 10px;
}
.testbox {
    background-color: rgba(0, 0, 0, 0.01);
    border: 1px solid rgba(51, 51, 51, 0.1);
    min-height: 130px;
    margin: 0 0 15px 5px;
    width: 100%;
}
.testbox div {
    background: #5b57a6 none repeat scroll 0 0;
    border-bottom: 1px solid rgba(51, 51, 51, 0.1);
    color: #fff;
    margin: -1px;
    padding: 2px 15px;
}
.append-to-value {
    color: #999;
    float: right;
    left: auto;
    margin-left: -200px;
    margin-top: 13px;
    padding-right: 55px;
    position: relative;
}

</style>


<div class="clear"></div>

<div>
    <div class="example">
        <ul id="breadcrumbs">
            <li>
                <a href="${ui.pageLink('referenceapplication', 'home')}">
                    <i class="icon-home small"></i></a>
            </li>

            <li>
                <i class="icon-chevron-right link"></i>
                <a href="${ui.pageLink('patientqueueapp', 'mchClinicQueue')}">Family Planning</a>
            </li>

            <li>
                <i class="icon-chevron-right link"></i>
                FP Services
            </li>
        </ul>
    </div>
</div>

<div class="patient-header new-patient-header">
    <div class="demographics">
        <h1 class="name">
            <span id="surname">${patient.familyName},<em>surname</em></span>
            <span id="othname">${patient.givenName} ${patient.middleName ? patient.middleName : ''} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>other names</em>
            </span>

            <span class="gender-age">
                <span>
                    ${gender}
                </span>
                <span id="agename"></span>
            </span>
        </h1>
triageDetails
        <br/>

        <div id="stacont" class="status-container">
            <span class="status active"></span>
            Visit Status
        </div>

        <div class="tag">Outpatient</div>

        <div class="tad" id="lstdate">Last Visit: ${ui.formatDatePretty(previousVisit)}</div>
    </div>

    <div class="identifiers">
        <em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Patient ID</em>
        <span>${patient.getPatientIdentifier()}</span>
        <br>

        <div class="catg">
            <i class="icon-tags small" style="font-size: 16px"></i><small>Category:</small> ${patientCategory}
        </div>
    </div>
</div>

<div class="fp-tabs" style="margin-top:5px!important;">
    <ul>
        <li id="ts"><a href="#triage-summary">Triage Summary</a></li>
        <li id="ti"><a href="#triage-info">Triage</a></li>
        <li id="cn"><a href="#fp-services">FP Services</a></li>

    </ul>
    <div id="triage-summary">
        ${ui.includeFragment("fpapp","triageSummary")}
    </div>

    <div id="triage-info">
        ${ui.includeFragment("fpapp","triageDetails")}
    </div>

    <div id="fp-services">

        <form method="post" id="familyPlanningForm" class="simple-form-ui">
            <input type="hidden" value="${patient.id}" name="patientId" >
            <input type="hidden" value="${queueId}" name="queueId" >
            <section style="width:60%">
                <span class="title">FP Services</span>
                <fieldset class="no-confirmation">
                    <legend>Counselling</legend>
                    ${ui.includeFragment("fpapp","counselling")}
                </fieldset>
                <fieldset class="no-confirmation">
                    <legend>Cervical Screening</legend>
                    ${ui.includeFragment("fpapp","cancerScreening")}
                </fieldset>
                <fieldset class="no-confirmation">
                    <legend>FP Administration</legend>
                    ${ui.includeFragment("fpapp", "familyPlanning")}
                </fieldset>
            </section>
            <div id="confirmation">
                <span id="confirmation_label" class="title">Confirmation</span>
                <div class="before-dataCanvas"></div>
                <div id="dataCanvas"></div>
                <div class="after-data-canvas"></div>
                <div id="confirmationQuestion">
                    <p style="display: inline">
                        <input id="submit" type="submit" class="submitButton confirm right" value="Submit" />
                    </p>
                    <p style="display: inline">
                        <input id="cancelSubmission" class="cancel" type="button" value="Cancel" />
                    </p>
                </div>
            </div>
        </form>

    </div>

</div>
