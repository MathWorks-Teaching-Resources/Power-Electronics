%  Post-run script for InvertersSoln.m
% ---- Post-run commands -----

% Follow the manual solar simulation step and validate the graded result.
if ~exist('ME','var')
    in = Simulink.SimulationInput("SolarPowerInverterModel");
    in = in.setBlockParameter(Simulink.ID.getFullName( ...
        "SolarPowerInverterModel:277"),"Value","0.75");
    out = sim(in);
    testCase.verifyEmpty(out.SimulationMetadata.ExecutionInfo.WarningDiagnostics);
    panelMeasurements = out.PVData.signals.values;
    settled = out.PVData.time > 1.8;
    settledVoltage = mean(panelMeasurements(settled,1));
    settledPower = mean(panelMeasurements(settled,3));
    panelCurves = load('solarPanel1LUT.mat','vVec','powerMat');
    availablePower = max(panelCurves.powerMat(:,6));
    testCase.verifyTrue(solarVoltageFeedback(settledVoltage), ...
        "The settled panel voltage must be accepted by the lesson.");
    testCase.verifyGreaterThan(settledPower,0.98*availablePower, ...
        "MPPT must extract at least 98% of the reference maximum power.");
    testCase.verifyEqual(panelMeasurements(:,3), ...
        panelMeasurements(:,1).*panelMeasurements(:,2), ...
        "Logged panel power must equal simultaneous panel voltage times current.", ...
        'AbsTol',1e-8);
    testCase.verifyTrue(solarPowerFeedback( ...
        interp1(panelCurves.vVec,panelCurves.powerMat(:,6),25)));
end

% <matlab:ShareFeedback Share your feedback>

