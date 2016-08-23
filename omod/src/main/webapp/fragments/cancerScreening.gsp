<fieldset>
    <legend>Cervical Screening</legend>
    <label  class="label title-label" style="width: auto;">Cervical Screening Information<span class="important"></span></label>

    <field>
        <input type="hidden" id="cervical-info-set" class=""/>
        <span id="cervical-info-lbl" class="field-error" style="display: none"></span>
    </field>
    <div class="onerow floating-controls misc-info">
        <div class="col4" style="width: 42%; margin: 0 1% 0 0;">
            <div class="testbox">
                <div>Screening Method:</div>
                <label>
                    <input id="screening-method-via" type="radio"  name="concept.50c026c3-f2bc-44b9-a9dd-e972ffcbb774" value="556f371e-d980-4adb-adfc-93dc31973b98" data-value="VIA">
                    V.I.A
                </label><br/>

                <label>
                    <input id="screening-method-pap" type="radio" name="concept.50c026c3-f2bc-44b9-a9dd-e972ffcbb774" value="fc60e89d-68c8-4844-bd5a-efb43b203c18" data-value="PAP">
                    P.A.P
                </label><br/>

            </div>

        </div>

        <div class="col4 last" style="width: 49%;">
            <div class="testbox">
                <div>Screening Results:</div>
                <label>
                    <input id="screening-positive" type="radio" data-value="Positive" name="concept.1406dbf3-05da-4264-9659-fb688cea5809" value="7480ebef-125b-4e0d-a8e5-256224ee31a0" data-value="Positive">
                    Positive
                </label><br/>

                <label>
                    <input id="screening-negative" type="radio" data-value="Negative" name="concept.1406dbf3-05da-4264-9659-fb688cea5809" value="aca8224b-2f4b-46cb-b75d-9e532745d61f" data-value="Negative">
                    Negative
                </label><br/>
            </div>

        </div>
    </div>

</fieldset>

