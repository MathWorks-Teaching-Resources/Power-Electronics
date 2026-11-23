%  Post-run script for Rectifiers.m
% ---- Post-run commands -----

% Check the actual Exercise 3 measurement against the learner's checker.
if ~exist('ME','var')
    chargingCurrent = rectifierData.ScopeData1{1}.Values;
    chargingVoltage = rectifierData.ScopeData1{2}.Values;
    testCase.assertEqual(chargingCurrent.Time,chargingVoltage.Time);
    peakChargingPower = max(chargingCurrent.Data.*chargingVoltage.Data);
    testCase.verifyTrue(rectifierPowerFeedback(peakChargingPower), ...
        "The measured peak charging power must be accepted by the lesson.");
end

% <matlab:ShareFeedback Share your feedback>

