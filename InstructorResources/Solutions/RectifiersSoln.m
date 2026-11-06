%[text] %[text:anchor:T_F8C38FD0] # Rectifiers
%[text] [⇦ Return to the main menu](file:../../MainMenu.m)
%[text] %[text:anchor:M_1763F6B4] Power electronics play a major role in everyday life, such as converting the electricity between a power source and its load. Rectifiers are a type of power electronic that convert alternating current (AC) to direct current (DC). This conversion process is known as rectification. Without rectification, you could damage the device you are trying to charge/use or the device may not charge at all. Let's take a smartphone charger for example. The power coming from the plug in the wall is AC, and the charger is a rectifier that converts that AC to DC in order to charge a smartphone safely. If there were no rectifier in this setup, the phone would receive direct AC power and not charge. This is because the battery would charge during the positive cycle of the AC signal and then discharge on the negative cycle. Concepts like this can also be applied to the effective and safe charging of electric vehicles. In this script, we will explore the theory and applications of rectifiers in power electronics.
%[text]{"align":"center"}  
%[text]{"align":"center"} 
%[text]{"align":"center"} ![Smartphone connected to a charging cable, illustrating a standard conversion of AC wall power to DC to charge a battery.](text:image:9bdb)
%[text] 
%[text:tableOfContents]{"heading":"Table of Contents"} %[text:anchor:M_597CA885]
%[text] %[text:anchor:H_51183E7B] **Before you get started:**
%[text] %[text:anchor:H_BF646A47] This live script is intended to be used with the code hidden. On the **View** tab of the MATLAB Toolstrip, in the **View** section, select **Hide Code**.  Alternately, select **Hide Code** using the icon ![Hide Code icon.](text:image:8a8c) at the top right of the Live Editor pane.
%[text] ![](text:image:585d) Although the code is hidden, some interactivity requires familiarity with MATLAB. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2-hour online tutorial that teaches the essentials of MATLAB.
%[text] %[text:anchor:H_8F8A032D] ![Warning icon.](text:image:0313)   For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections and will generate errors if they run out of order.
%[text] 
%[text] %[text:anchor:H_7318CFF8] ## Types of rectifiers
%[text] %[text:anchor:M_9B36D5F4] The majority of the everyday portable devices we use operate on DC power. Because of this, we need to use rectifiers in places like our households so that we can convert the AC power coming out of the wall to something more useful for our personal devices. There are two main classifications of rectifiers: uncontrolled and controlled[ \[1\]](internal:M_0ADF869F). Both of these types of rectifiers are described in the Rectifier Classification table below:
%[text] 
%[text:table]{"columnWidths":[179,-1,366,-1,-1],"ignoreHeader":true}
%[text] | <p align="center">**Rectifier Classification**</p> | <p align="center">**Description**</p> | <p align="center">**How It Works**</p> | <p align="center">**Equipment**</p> | <p align="center">**Examples**</p> |
%[text] | --- | --- | --- | --- | --- |
%[text] | <p align="center">Uncontrolled Rectifier</p> | <p align="center">Does not allow for control of the output voltage/current</p> | <p align="center">Unidirectional current is passively regulated by [diodes](internal:M_22706366) to convert the AC to DC</p> | <p align="center">Diodes</p> | <p align="center">Laptop/Smartphone Chargers</p> |
%[text] | <p align="center">Controlled Rectifier</p> | <p align="center">Allows for variation or control of the output voltage/current</p> | <p align="center">Bidirectional current is regulated by [thyristors](internal:M_B8E29DAF) via a gated signal to convert the AC to DC</p> | <p align="center">Thyristors</p> | <p align="center">Motor Controllers/EV Battery Charger</p> |
%[text:table]
%[text] 
%[text] A further breakdown of these types of rectifiers are half-wave and full-wave rectifiers. Both uncontrolled and controlled rectifiers can have both half-wave and full-wave types as needed for the particular application. The Rectifier Type table provides a visualization for the different types. We will cover them in more detail in a later section. 
%[text] ![](text:image:4684) **Try**. Use the drop down menu below to view the different types of rectifiers.
switchRectifier("No Selection"); %[control:dropdown:012e]{"position":[17,31]}
%%
%[text] ![](text:image:6488) **Exercise 1.** Which of the following choices are considered to be real applications of rectifiers? Please select all that apply and click the **Submit Answers** button below.  
exerciseSol1(...
    A = true, ... %[control:checkbox:0472]{"position":[9,13]}
    B = false, ... %[control:checkbox:550b]{"position":[9,14]}
    C = true, ... %[control:checkbox:089f]{"position":[9,13]}
    D = true); %[control:checkbox:7a55]{"position":[9,13]}
%[text] 
  %[control:button:6368]{"position":[1,2]}
%%
%[text] %[text:anchor:H_856FAA7E] ### Half-wave rectifier 
%[text] Half-wave rectifiers are generally used in low-power applications because their voltage output is not uniform by design. A half-wave means that half of the AC power is lost before being converted. Another way to look at this is this type of rectifier only converts the positive cycle of the AC signal into a DC signal. 
%[text] ![](text:image:5d46) **Demonstration**. Let's simulate a simple half-wave rectifier to visualize the behavior of the circuit.
% View half-wave signal
hwFlag = true; %[control:checkbox:2d42]{"position":[10,14]}

% Run the Simscape model for the half-wave rectifier and store data from
% simulation
if hwFlag
    HWRectData = sim("Models/HalfWaveRectifier.slx","StopTime","0.1"); %#ok<UNRCH>

    % Plot half-wave rectifier output voltage signal
    t1 = HWRectData.ScopeData1(:,1);
    v1 = HWRectData.ScopeData1(:,2);
    t2 = HWRectData.ScopeData(:,1);
    v2 = HWRectData.ScopeData(:,2);
    plot(t1,v1,':',t2,v2,'-','LineWidth',2);
    xlabel('Time (sec)'); ylabel('DC Voltage (V)');
    title('Half-Wave Rectifier Output Voltage');
    legend("Original Signal","Rectified Signal");
end
%%
%[text] ![](text:image:3d61) **Try**. Explore an <u>**uncontrolled half-wave rectifier**</u> in Simscape that created the half-wave signal. Notice that the half-wave rectifier only has one diode in its circuit. This is because only half of the cycle (positive) is converted. You can simulate the model using the run icon ![Simulink Run icon.](text:image:3826).
  %[control:button:7798]{"position":[1,2]}

% Open Simscape model for the half-wave rectifier 
open_system("Models/HalfWaveRectifier.slx")
%%
%[text] %[text:anchor:H_2D249281] ### Full-wave rectifier
%[text] A full-wave rectifier converts both the positive and negative cycles of the AC signal into a DC voltage signal, utilizing all of the available power being provided. The two common types of full-wave rectifiers are the center-tapped and bridge rectifiers. The difference between the two is the center-tapped rectifier requires a transformer and the bridge rectifier has twice as many diodes as the center-tapped rectifier. Bridge rectifiers are more commonly used because they are lightweight, have good efficiency in power conversion, and the cost of diodes is low. We won't be covering center-tapped rectifiers in this module, but you can interact with a model that simulates one: [Open Center-Tapped Rectifier Model](file:../../Models/FullWaveRectifierCT.slx). 
%[text] ![](text:image:4c3b) **Demonstration**. Let's simulate a simple full-wave rectifier to visualize the behavior of the circuit.
% View full-wave signal
fwFlag = true; %[control:checkbox:65da]{"position":[10,14]}

% Run the Simscape model for the full-wave rectifier and store data from
% simulation
if fwFlag
    FWRectData = sim("Models/FullWaveBridgeRectifier.slx","StopTime","0.1"); %#ok<UNRCH>

    % Plot half-wave rectifier output voltage signal
    t3 = FWRectData.ScopeData1(:,1);
    v3 = FWRectData.ScopeData1(:,2);
    t4 = FWRectData.ScopeData(:,1);
    v4 = FWRectData.ScopeData(:,2);
    plot(t3,v3,':',t4,v4,'-','LineWidth',2);
    xlabel('Time (sec)'); ylabel('DC Voltage (V)');
    title('Full-Wave Bridge Rectifier Output Voltage');
    legend("Original Signal","Rectified Signal");
end
%%
%[text] ![](text:image:4101) **Try**. Explore an <u>**uncontrolled full-wave bridge rectifier**</u> in Simscape that created the full-wave signal. Notice that the full-wave bridge rectifier has four diodes in its circuit. This is to create a "bridge" that allows two diodes to conduct current during the positive cycle and the other two to conduct current during the negative cycle, converting the full power of the AC to DC.
  %[control:button:5fa3]{"position":[1,2]}

% Open Simscape model for the full-wave rectifier 
open_system("Models/FullWaveBridgeRectifier.slx")          
%[text] ![](text:image:24c5) **Reflect.** Observe the diodes within the previous models had a forward voltage and resistance that were both non-zero values. An ideal diode is defined by having both of these parameters set to zero. Therefore, the diodes within the models are characterized as real.
%%
%[text] %[text:anchor:H_2E1C9A9F] ### Uncontrolled vs. Controlled rectifiers
%[text] %[text:anchor:M_A77DF51F] The goal of rectification is to convert from AC power to DC power. We have explored uncontrolled rectifiers for low-power applications like cell phone or laptop batteries. What if we wanted to manage the voltage and current going towards a particular load? This is where a controlled rectifier would come into play. Some examples of where a controlled rectifier would be useful are in high-power applications such as locomotives, electric cars, and airplanes. You will observe that the controlled rectifier circuit is structured similarly to the uncontrolled rectifier circuit. The primary difference is that controlled rectifiers will have a thyristor in place of a diode for converting the AC power to DC power. Thyristors are more reliable than regular diodes because they can control the flow of current, withstand high power and temperature, and have a much faster response time to changes in voltage. By adjusting the [firing angle](internal:M_BEAFD53A) in the thyristors, the voltage and current can be managed to the specifications that need to be met for the system [\[2\]](internal:M_A15E5D10). 
%[text] 
%[text] %[text:anchor:H_276A888C] ### Simulating rectification in a smartphone battery
%[text] In this next example, we will explore a **controlled full-wave bridge rectifier** with a typical smartphone battery as the application. Imagine you own a smartphone and you are charging it using a standard outlet in your home. Using a controlled rectifier, we want to manage the input to the battery at 5VDC. The firing angle for the thyristors has been automatically set in the following model for your convenience.
%[text] 
%[text] ![](text:image:3add) **Exercise 2.** Launch the model using the button below. In the open model, you will see a few [subsystems](https://www.mathworks.com/help/simulink/subsystems.html) containing various components. Which subsystem contains the rectifier? Please select an option from the drop-down menu and click the **Submit Answers** button below. 
  %[control:button:9864]{"position":[1,2]}

% Open Simscape model for the smartphone battery rectifier
open_system("Models/SmartphoneBatteryRectifierModel.slx")
%%
exerciseSol2("Smartphone Charger") %[control:dropdown:524e]{"position":[14,34]}
  %[control:button:598e]{"position":[1,2]}
%%
%[text] ![](text:image:8c2c) **Exercise 3.** Begin by simulating the open model. Using the [scope](https://www.mathworks.com/help/simulink/slref/scope.html) block labeled as "Results", what is the total power (in Watts) that is being consumed in the charging of the smartphone battery?
  %[control:button:3902]{"position":[1,2]}

% Simulate Simscape model for the smartphone battery rectifier
set_param('SmartphoneBatteryRectifierModel',"StopTime","0.1");
sim("Models/SmartphoneBatteryRectifierModel.slx","StopTime","0.1");
disp("The total simulation time elapsed for exercise 3 is 0.1 seconds.")
%[text] ![](text:image:91a1) **Note.** Recall that power is calculated by the following equation: $P = V \* I${"altText":"P = V times I"}, where V is the voltage and I is the current. 
%%
%[text] Analyze the first two plots labeled as "Current" and "Voltage" in the scope. Use the zoom Y tool ![Zoom Y icon](text:image:3f30) in the scope toolstrip to <u>**estimate**</u> the peak values for voltage and current. If the plot is not scaled upon opening the scope, use the Scale X and Y Axes Limits tool ![Scale Axes icon](text:image:7ab8).
power = 326; %[control:editfield:4ac4]{"position":[9,12]}
exerciseSol3(power);
%%
%[text] ![](text:image:6fe3) **Exercise 4.** Simulate the open model again. Using the scope block labeled "Results", determine the amount of time (in hours) that it will take to fully charge (100%) the smartphone battery from its current state of charge, 25%.
  %[control:button:5cb0]{"position":[1,2]}

% Simulate Simscape model for the smartphone battery rectifier
set_param('SmartphoneBatteryRectifierModel',"StopTime","10");
sim("Models/SmartphoneBatteryRectifierModel.slx","StopTime","10");
disp("The total simulation time elapsed for exercise 4 is 10 seconds.")
%[text] ![](text:image:0351) **Note.** Analyze the third plot labeled as "Charge" in the scope. This details the percent of charge in the battery as it increases over time. The simulation ran for 10 seconds going from 25% to ~25.429% charge. You can use this data to extrapolate to 100% charge. This can be achieved by finding the slope of the Charge % straight line. Recall the slope formula as: $slope = m = \\frac{(y\_2 - y\_1)}{(x\_2 - x\_1)}${"altText":"slope = m = (y\_2 - y\_1) \/ (x\_2 - x\_1)"} and the slope-intercept form as: $y = mx+ b${"altText":"y = m times x + b"}, where b = 25. b is set to 25 because it is the first point to intercept the y-axis (25%) on the Charge % plot.
%%
%[text] Open the scope block. Use the Scale X and Y Axes Limits tool ![Scale Axes icon](text:image:57e7) in the toolstrip to make the charge signal easier to see. Select the cursor measurements tool ![Cursor Measurements icon](text:image:5e6c) to find the values for your slope calculation. Before finding the values, make sure to select "Charge %" in the "Trace Selection" drop-down menu. Under "Cursor Measurements", set the time values to 1 and 10 in the edit fields, respectively. Use the zoom Y ![Zoom Y icon](text:image:6d90) tool to <u>**estimate**</u> the Charge % slope. <u>**Do not round your final answer.**</u>
%[text] Once you have a value for the slope (**units in %/seconds**), use the slider below to calculate your slope-intercept form (*where you want y to be as close to 100% as possible*) with x as the value on the slider (**in seconds**).
slope = 0.0429; % Charge/time (sec) %[control:editfield:6a49]{"position":[9,15]}
exerciseSol4(slope);
%%
t =1750; % Seconds %[control:slider:8bd2]{"position":[4,8]}
b = 25;
charge = (slope*t) + b;
disp(['The Smartphone battery will be ' num2str(round(charge,2)) '% charged in ' num2str(round(t/3600,2)) ' hours.'])
time = 0.49; %[control:editfield:9aa5]{"position":[8,12]}
exerciseSol5(time);
%%
%[text] ![](text:image:3e86) **Note.** Open the scope and look at the "Cursor Measurements" section for the Charge %. You may notice that there is a value in that window expressed as $\\Delta Y/\\Delta T${"altText":"change in Y \/ change in T"}. Compare the slope that you calculated to the value in the scope. How close were you to the exact value? 
%[text] ![](text:image:3dfa) **Note.** The scope block is used to display specific parameters chosen by the user. What if you want to view <u>**all**</u> of the parameters across blocks in a model? The Simulink Data Inspector ![Open Simulation Data Inspector icon.](text:image:1d51) tool allows you to view all of your parameters in one place. Once a simulation is run, a `simlog` variable will appear in the workspace. Click the data inspector icon and select the import data button ![Import Data icon](text:image:5276). Select the import button, and you will be able to view all the signals and parameters in the model.
%[text] ![](text:image:296a) **Reflect.** How good is the extrapolation that was performed? Was the charge fast or slow? What feature of the rectifier could you change that would improve the charging performance and, thus, the extrapolation?
%%
%[text] %[text:anchor:H_5DF4D7CD] ## Next Steps
%[text] This script covered the fundamentals of rectifiers in power electronics, specifically uncontrolled and controlled rectifiers. In later sections of this power electronics module, we will explore other related topics on inverters and converters.
%%
%[text] %[text:anchor:H_D2FA2F0E] ## Glossary
%[text] %[text:anchor:M_22706366] Diode -  A semiconductor device that behaves like a one-way valve, allowing current to only flow in one direction. [(↑ Return to Text)](internal:M_9B36D5F4)
%[text] %[text:anchor:M_B8E29DAF] Thyristor - A four-layered semiconductor device in which the flow of current between two electrodes is controlled by an input signal at a third electrode. These are more commonly known as a Silicon Controlled Rectifier (SCR) or Metal-Oxide-Semiconductor Field-Effect Transistor (MOSFET). [(↑ Return to Text)](internal:M_9B36D5F4)
%[text] %[text:anchor:M_BEAFD53A] Firing Angle - The angle in the AC cycle at which the thyristor starts conducting. Ex. If the firing angle is 45 degrees, then the thyristor will begin conducting when the phase angle is 45 degrees, until the cycle completes. It will then repeat as the AC cycle continues. [(↑ Return to Text)](internal:M_A77DF51F)
%%
%[text] %[text:anchor:H_E72546F9] ## Further Exploration
%[text] - [Power Electronics Simulation in MATLAB](https://www.mathworks.com/discovery/power-electronics-simulation.html)
%[text] - [Power Electronics Simulation Onramp](https://matlabacademy.mathworks.com/details/power-electronics-simulation-onramp/powerelectronics)
%[text] - [MathWorks: Introduction to Diode Rectifiers](https://www.mathworks.com/videos/what-is-3-phase-power-part-5-introduction-to-diode-rectifiers-1655099875869.html)
%[text] - [MathWorks Example: Uncontrolled Full-Wave Bridge Rectifier](https://www.mathworks.com/help/simscape/ug/full-wave-bridge-rectifier.html)
%[text] - [Power Electronics with Speedgoat for RCP & HIL](https://www.speedgoat.com/solutions/industries/power-electronics?utm_term=power%20electronics%20matlab&utm_source=google&utm_medium=cpc&device=c&utm_campaign=10278398312&utm_adgroup=135515401899&utm_content=591792460255&gad_source=1&gclid=EAIaIQobChMIy5nB66CEhAMVXl9HAR2KgQSMEAAYASAAEgK42_D_BwE) \
%%
%[text] %[text:anchor:H_2B834829] ## References
%[text] %[text:anchor:M_0ADF869F] \[1\] Electrical Technology (n.d.). *Types of Rectifiers*. Www.Electricaltechnology.org. Retrieved January 29, 2024, from [https://www.electricaltechnology.org/2019/01/what-is-rectifier-types-of-rectifiers-their-operation.html](https://www.electricaltechnology.org/2019/01/what-is-rectifier-types-of-rectifiers-their-operation.html) [(↑ Return to Text)](internal:M_9B36D5F4)
%[text] %[text:anchor:M_A15E5D10] \[2\] Monolithic Power Systems (n.d.). *Controlled Rectifiers*. Www.Monolithicpower.com. Retrieved January 29, 2024, from [https://www.monolithicpower.com/en/power-electronics/ac-dc-converters/controlled-rectifiers](https://www.monolithicpower.com/en/power-electronics/ac-dc-converters/controlled-rectifiers) [(↑ Return to Text)](internal:M_A77DF51F)
%%
%[text] [⇦ Return to the main menu](file:../../MainMenu.m)
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] %[text:anchor:H_30677844] ## Local Helper Functions
%[text] If you want to see the details of the code, select the **View** tab and switch to **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:25c3) at the top right of the Live Editor pane.
function switchRectifier(opt)
arguments
    opt (1,1) string {mustBeMember(opt,["No Selection" "Half-Wave Rectifier" "Full-Wave Center-Tapped Rectifier" "Full-Wave Bridge Rectifier"])}
end

if opt == "No Selection"
else
    if opt == "Half-Wave Rectifier"
        rect = imread("Images/HWRectifier.png");
        imshow(rect,Interpolation="bilinear");
    elseif opt == "Full-Wave Center-Tapped Rectifier"
        rect = imread("Images/FWCenterTap.png");
        imshow(rect,Interpolation="bilinear");
    elseif opt == "Full-Wave Bridge Rectifier"
        rect = imread("Images/FWBridge.png");
        imshow(rect,Interpolation="bilinear");
    end
end
end

function exerciseSol1(opts)
    % Provides solution for Exercise 1
    arguments
        opts.A (1,1) logical
        opts.B (1,1) logical
        opts.C (1,1) logical
        opts.D (1,1) logical
    end

    if ~any([opts.A opts.B opts.C opts.D])
        disp("Please select all that apply!")
    elseif [opts.A opts.C opts.D] & ~opts.B %#ok<AND2,BDSCA>
        disp("Correct! These are all examples of rectifiers.")
    elseif [opts.A opts.C] & ~[opts.B opts.D] | [opts.A opts.D] & ~[opts.B opts.C] | [opts.C opts.D] & ~[opts.A opts.B] %#ok<AND2,OR2,BDSCA>
        warning("Incorrect. You have not selected all applications of rectifiers.")
    elseif opts.A
        warning("Part of an automobiles' charging system is alternator which produces AC current. The battery in the car is DC. Rectification takes place between the alternator that charges and the battery that stores. However, this is not the only example of a rectifier.")
    elseif opts.B
        warning("Solar panel systems turn solar power into DC power. And an inverter is used to go from DC to AC. There is not a rectifier in the conversion process.")
    elseif opts.C
        warning("Smartphone and laptop chargers are very common examples of components that must perform rectification. However, this is not the only example of a rectifier.")
    elseif opts.D
        warning("Flat screen TVs take in AC power from the wall. The internal components run on DC power and therefore must have rectfication performed internally. However, this is not the only example of a rectifier.")
    end
end

function exerciseSol2(subs)
    % Provides solution for Exercise 2
    arguments
        subs (1,1) string {mustBeMember(subs,["No Selection" "Wall Outlet AC Power" "Smartphone Charger" "Smartphone" "Results"])} = "No Selection"
    end

    switch (subs)
        case "No Selection"
            disp("Please select one of the options in the drop down menu.")
        case "Wall Outlet AC Power"
            warning("This is a subsystem that contains the AC Power coming from the wall outlet. This what would be considered the source in the system, which is upstream of the rectifier.")
        case "Smartphone Charger"
            disp("Correct! The Smartphone Charger, will contain your transformer to step down the voltage and the rectifier that converts the AC power to DC power.")
        case "Smartphone"
            warning("This is a subsystem that contains the Smartphone battery. This is what would be considered the load in the system, which is downstream of the rectifier.")
        case "Results"
            warning("This is NOT a subsystem block. This is a scope block which allows you to visualize the data in your simulation.")
    end
end

function exerciseSol3(power)
    % Provides solution for Exercise 3
    arguments
        power (1,1) double
    end

    errMargin = 1; % Watts
    if power >= (326 - errMargin) && power <= (326 + errMargin)
        disp("Correct! You have properly calculated the total power consumed.")
    elseif power == 0
        disp("Please enter your answer.")
    else
        warning("Your answer has exceeded the tolerance of the possible solutions. Please measure the peaks of the signals and try again.")
    end
end

function exerciseSol4(slope)
    % Provides solution for Exercise 4 pt 1
    arguments
        slope (1,1) double
    end

    slopeMargin = 0.0002; % Change in Charge/Change in Time
    if slope >= (0.0427 - slopeMargin) && slope <= (0.0433 + slopeMargin)
        disp("Correct! You have properly calculated the slope of the Charge % line.")
    elseif slope == 0
        disp("Please enter your answer.")
    else
        warning("Your answer has exceeded the tolerance of the possible solutions. Please measure the slope of the signal again.")
    end
end

function exerciseSol5(time)
    % Provides solution for Exercise 4 pt 2
    arguments
        time  (1,1) double
    end

    timeMargin = 0.2; % Seconds
    if time >= (0.47 - timeMargin) && time <= (0.47 + timeMargin)
        disp("Correct! You have properly determined the time it will take to charge the Smartphone battery to 100%.")
    elseif time == 0
        disp("Please enter your answer.")
    else
        warning("Your answer has exceeded the tolerance of the possible solutions. Please check the slider to verify that the battery is charged to 100%.")
    end
end

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode","rightPanelPercent":40}
%---
%[text:image:9bdb]
%   data: {"align":"baseline","height":379,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAbsAAAIdCAIAAAArpkQnAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAU80lEQVR4nO3dUWxd9X3A8eNgh0CcxMghgSVqQkuhKQgEncgmjW1Cy6qKMWnlodK6B142dUJKpUpdX7o+ManqQx8iRapWqetL+1Ze2ghNUVt1q9aGraVUpClpoWQkK6R4OImNQ+LgPVzmmNixf7733PP\/\/8\/5fJ6wSa7\/ds793t\/\/nOt7RxYWFqqAWz72mcgfo7PefObLqZcAQzeyejGFkj6oJ2113WJqJQPSTdpnw4qflUsG5yiifa6dMR3l1MukSZu8Z8aUS2rnoKJNrhbTkc2QOLRojZXPY0K9RJN2eLeYDmiANZkxaYhHZVpgQ+VQBogxY9Icj82UTjEBojZ42AcIMmMCRCkmQJRi0ihngSjaaOoFNGpy25bUS1jB5fn587NzqVcBrK0rxdy6+aY\/vO+u0dEbUi9kZXNvX\/qv4y\/pJmSuE7vysdEbcs5lVVU33bjx9+\/5QOpVAGvoRDG3br4551z23HTjxjxPGgCLOlFMgFooJkCUYgJEKSZAVCeK+dbbb6deQsj52bdSLwFYTSeKOXfx0vMnT6VexRqeP3nq8vyV1KsAVtOVZ7Cffn1q7uKlyYnx1AtZ2auvT81dvJR6FcAaulLMqqqmzl2YOnch9SqAgnViVw5QC8UEiFJMgCjFBIhSTIAoxQSIUkyAKMUEiFJMgCjFBIhSTIAoxQSIUkyAKMUEiFJMgCjFBIhSTIAoxQSIUkyAqBXe5+exhx+4\/daJ5pdC+\/zz099PvQSo00rF\/OMHHvzQ3sZXQgspJi1jVw4QpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRigkQpZgAUYoJEKWYAFGKCRClmABRo6kX0IRjZ6dPz148M3sx9ULWtu+W8d2bN+2bGE+9EGAFbS7m6dmLh1545eiZqQuX51OvZX12bd70+N6dT9y9e+tYm\/+BoDit3ZUfeuGVP\/3Osadfeb24XFZVdWb24qHjp\/7k28eOnnkj9VqAq9pZzH849stDx0+lXsWgLlye\/\/sfHv\/Wb15LvRDgXS3c9D313K+ffuX15Z9\/6NaJ5hezLhcuz5+Ynrnmk5979sWqqh6\/47YUKwLeo23FPHZ2+usnzyz9zEO3Tnz63j37d+Sey0Xf+s1rh46fWnqd6qnnXjqwe7tzmpBc23blTz330tIPD96z55uP3F9QLquqevyO27790Y98fO\/Oxc9cuDz\/1E9\/nXBJQE+rinliembprvbje3cevHdvuuX0b+vY6OcfvHPpc4yOnplKuB6gp1XFPHr6PVeWP\/\/gnalWMritY6Off+ADix9euDx\/7Ox0wvUAVcuK+eOz5xb\/+892FX\/ib\/+OiV2bNy1+qJiQXKuKudSHJzanXkINdt28ae0\/BDSltcUEqJ1iAkQpJkCUYgJEKSZAlGICRCkmQJRiAkQpJkCUYgJEKSZAlGICRCkmQJRiAkQpJkCUYgJEKSZAlGICRCkmQJRiAkQpJtBpI4ePxP+wYgIdNXL4SC+X8WiW\/Y7eAH1Y11y5lBkT6JYVcxlsqBkTKMCKRVt48tHBb2RdFBPI1+qN6\/3fSDcjrRw5fGTNm1JMIEfxeXD1bg4+Vy7lPCaQnT4yN8jZyZ7IrGrGBDIyyEi4dFtdeyt7FBPIQl3b5\/XezrouHykmkF6SXK73UnulmEBa9V6ZCeqjlT2KCaSRpJXVALmsFBNoXomt7FFMoFFlbcOvoZhAQ4puZY9iAkNX7jb8GooJDFGqVg6J35IEhiV5LmtfgBkTqF\/yVg6JGROo0+JbQWRi8MUs\/Y7MmEA9sgplLZZ\/R2ZMoAY557K\/14675m\/1PjRjAgPJuZWLIq+vvvgnV\/m\/ign0qYhWrsuab5JhVw70o7hcrlnDyHdkxgTWp7hWrm5d345iAlGlt\/Kas5l9vFq7YgJrK72Vy\/X3au2KCayhTbkc8F2AXPkBVtOmXK7X8ickmTGB6+psLq\/35E3FBFbWzVyu\/kR3u3JgBXK5IjMmQPTV2hUT6LR1vbOFXTlwre5sydf7RkCKCXTXeh8bFBMgSjEBohQT6LR1bcwVEyBKMQGiFBO41nqfc9MdigkQpZjACoyZK1JMgCjFBFbWkTHT75UDDIViAtfV+jHTK3EADItiAqtp8ZjZx7emmMAaWhnN\/r4pxQQ6p+\/HAMUE1taaMXPhyUcH+V68zw\/QCbVE34wJhBQ9Zta1eDMm0Gb1ht6MCUSVNWYOeMpyRWZMIKSgt+QdXtkVE1hDQa2shjwIKyawmoJy2cBJg04U88T0zHf+++zv5i6lXsgabr1p41+8b8e+ifHUC4Gq0sqVtLyY5y\/Pf+K7P3v5\/FtXFhZSryXkq7989e5t49945P6tYy3\/pyFna7Zy4clH8+lpk9ejWn6t\/BPf\/dmvzs2Wksuqqt5ZqE5Mz\/ztv72QeiF01+opXLwAncN182FcDV9dmweZE9MzL59\/K\/Uq+vHc1PkT0zO25zRszVY2tpI1pVpMm4t59PQbBU2XS72zsHD09BuKSWMi2\/AVP9n83jxtuNtcTCDCaBmnmNBdg7eysTEzeSt7FBM6qpTRMp+VVIoJ3bRKLtdbqOGNmVm1sqflzy4CrjFy+EiNuRzkbzV\/m4MzY0KH1N7KYchnJcuZMaErhprLWjLX\/DPS18uMCe3XzGg5yAnNzEO5yIwJLZf\/TjyTZUSYMaHNGs5l7zbjk2ZBrexRTGit65Vr2J2KbM+La2VPm4u5ZWPB313RiycHqXK5\/KssXUmhoVzU5rvlgV3bv\/izlwt9MY4Du7anXgIFS5vLHL7okLT5ys\/uzZv+au\/ODSMjqReyPhtGqifu2rV786bUC6FUWeWyZdo8Y1ZV9cWH7p7cNPa1F0+PbdhwQ\/bpvLKwMP\/OwsF793xq3\/tSr4VSyeVQtbyYVVV99r73f\/a+9x87O516ISH7d0ykXgIFWzGXWlmjNu\/KS3Rieib1EiiVXDag\/TPmsbPTn\/rh8YtXrlx+p4BLQDeMjLx\/681fffhe5zFZF7lsRstnzBPTM5\/8\/vMXLs8Xkcuqqq4sLPzq3OyfP\/Of5y\/Pp14LxZDLxrS8mJ\/+jxOpl9CPS1feOfTCK6lXQRnkskktL+bLF4p8L8mqqr73P\/+begkUQC4b1vJilqvQJ97TJLlsnmJCkeQyCcWE8shlKooJEKWYUBgDZkKKCSWRy7QUE4ohl8kpJhRMLhummFCGvt+mkRopJhTAfjwTiglFksskFBNyt3zAlMtUWlvM3qul3X7zjakX0qcPbduceglkwenLrLSqmLs3X+3jsbPnqqr6woN3FvfOaFVVbdyw4R8fvPP85flnf3f1zTZ2eY1hqqoyYCbVqmIufZOcE9Mzx85OH9i1\/QsP3jm2YaSUbt4wMrJlbPRbBx7YvXnT1188vfR\/eQugDjJg5qZV71pxYPf2zz374uKHn\/rh8R88tv9v7vy9v9yz49jZ6RNvFvAWOvt3TPTKeGJ65tDxU4uf3zcx7n0sqAyYqbWqmFvHRp+4a9fXT57pfXjh8vxj\/\/qTLz109\/4dEwd2bT+wa3va5cX9y8nTh144tfQzT9y1K9ViSMUFnwy1qphVVR28d+\/RM1NnZi\/2Pjwze\/GT33\/+oVsnDuye\/PDEeNq1RRw7O330zNQ17yj50K0Tj99xW6olAYvaVsytY6Nf+aN7\/vp7z19Y8s5iz\/5ueukllLLsmxj\/ysP3pF4FTTNg5qlVV3569k2Mf\/OR+7eMteHBYN\/E+DceuX9rK74XaIEWFrOqqn0T4z94bP\/H9+5MvZD+bRkbPXjPnm9\/9CNy2UEGzGy19t64dWz0S\/s\/dPDevU\/\/5rUfnz13YnrmQgnvAL5r86Z9E+P7d2x7\/I7btBJy0\/L75O7Nmw7eu\/dg6mXAIAyY+WjnrhzK5VnrOVNMgCjFhIy45pM5xQSIUkzIlwEzN4oJEKWYkAtXyfOnmJApW\/IMKSZAlGJCFmzJi6CYAFGKCTlyEjNPigkQpZgAUYoJEKWYkJ4L5aVQTMiOyz7ZUkyAKMUEiFJMgCjFBIhSTIAoxQSIUkyAKMUEiFJMgCjFBIhSTIAoxQSIUkyAKMUEiFJMgCjFhOx4geFsKSak5yWES6GYAFGKCRClmABRigk5cvEnT4oJWXDxpwiKCRClmABRigmZciozQ4oJuXAqM3+KCRClmJAvG\/PcKCZkxMY8c4oJEKWYkDUb86yMLv\/U3\/3T15pfB9Cz8OSjKpktMybkTkDzoZgAUYoJ2XHFPFuKCQWwMc+EYgJEKSbkyMY8T4oJZbAxz8EKz8dkbPSGrZtvHvx2zs++dXn+yuC3Qzd5YmaGFPM9Jrdt+eCe2ye3jdd1g1PnZn7x0qvnZ+fqukG6bOTwEbv1tOzKr9q9c\/IP7vtgjbmsqmpy2\/jDD+7bvXOyxtsEUlHMd902OXH\/XXuGdOP337XntsmJId04LbZ8orRPT0sx3zW8XPZ8+AO7h3r7QAMUs6qq6rbJidHRG4b6JW66cePkti1D\/RK0khOXWVHMqqqqreM3NfBVJifqPENKZ9mYJ6SYAFGKCblz\/ScfigkQpZhQANd\/MqGYUCQb8yQUEyBKMaEMNuY5UEwolY158xQTimHMTE4xoWDGzIYpJkCUYkJJbMzTUkwom415kxQTIEoxm+Nd0qiFjXlCillVVfXaG9NNfJWpJr4KHWRj3hjFrKqqOj87N3VuZqhfYurczNzFS0P9EsCwKea7fvHSq\/ND2zXPz195\/uQrQ7rxsrz5zJdTL6ENbMxTUcx3nZ+d+9HPT869Xf8YOPf2pR\/9\/KQBE1pAMa86Pzv37z898YuXT0+dmxl83px7+9LUuZnnT5763rMvnJ+dq2WFcD1OZTZjZGFh4ZaPfSb1MugKu\/IaXVNJW\/UGmDEBohST5hgwKd2GynEMreBUZgPMmDTEA3PtnLhs3rvFdDQDrMmMSRM8JNMOV4vpmGZIHFqNcSpz2N4zYzqyqZ2DijYZWVhYWP5Zz2mnFnLZAM9jb9Loip9985kvi2bPla1b5u75YH9\/d+Pp32589bf1rqcUWkkrrVzM6v+PeN1cGBudn7ylv7872skXxNRKWuy6xexZPPo7m87Lt9\/a\/9\/duX3TyZdrXEy2VJKOWKOYizp7lxjk4uOVbVua+bkN9fGss\/\/0sFy0mORM1Fg0cviIiz\/D4xnsUDZ9bJJiAkQpJkCUYgJEKSZAlGICRCkmQJRiAkQpJkCUYgJEKSZAlGICRCkmQJRiAkQpJkCUYgJEKSZAlGICRCkmQJRiAkQpJkCUYgJEKSZAlGICRCkmlG3k8JHUS+gQxYRWWXjy0dRLaDPFBIhSTIAoxQSIUkyAKMUEiFJMKJinFjVMMaE9PLVo2EZTLyB31zsEV3xsd7xCu5kxAaIUs0\/GSZJzErN5igkQpZjQEvY9DVDMOtklQbspJhTJw3MSigkQpZj9c9qIfDgam6GYAFGKWTNnl2iAwywVxYTi2ZI3RjEBohQTCmNLnpBiDsRuiOQchE1SzPoZAaCtFBNK4vE4LcWEgtmSN0wxoRgGzOQUc1Ae5KE7FBNK5dG6eYo5FHZP1M5BlQPFhCIZMJNQTCiAATMTilkDj\/bQEYoJuVs+YHqQTkUxh8U2CtpHMSFrBsysKCZAlGLWw8M+w2DAzI1iAkQp5hC5+MMgDJgZUkyAKMWsjcd\/amTAzJNiAkQpJmTHgJktxQSIUszhcrmc9TJg5kwx6+TIZkAeYjOnmJA1D8NZUUzIhQEzf4oJ+TJg5kYxa7b8EDc4EOGCTxEUE9LzsFoKxYQcGTDzpJiQmP14QRSzfg534uzHy6KYkBePuDlTzCaYI1iR\/XhxFBPS8DhaIsUcCpMCq1sxlw6b\/CkmZEEui6CYDbEFY5GDoVyKCY2yHy+aYg6L+wDLyWXpFBMaIpctoJjNcfYKSqeY0AQDZjso5hC5P9Ajl62hmDBcctkmitkopzK7Ri5bRjFhWDxAto9iDpdpgms4JIqmmDAU9uOtpJhNs1PrArlsK8UcOveTrpHLFlNMqJNctptiQm3ksvUUMwGnMltJLrtAMZvgbtN6ctkRigmDksvuUMw0bMxbQy47RTGhf3LZNYrZEPei9pHLDlJM6IdcdpNiJuNUZqFGDh+Ry85SzOa4R7XA9R7n\/ON2hGJClFyimCnZmBdELqkUEyLkkh7FbJQ7WInkkkWKmZiNec6ud1m8ksuuUkxY2SoPZnLZWYrZNHe2IqwyWvoX7DLFTM\/GPCt24qxCMeEqO3FWp5gJuO\/lSS5Z02jqBVBVVTVy+Ij7ZEJaSZAZk66TS+IUMw13xUzIJetiV54LG\/OGaSV9MGPSRXJJf0YWFhZSr6G7lt9v3V2HbfVnv\/r5szq7crpCKxmcXXlK7qWNkUtqYcbMi+s\/tdNKamTGTMw9dnhW+Q3xHj981ksxs+OFOWqxZivlkj7YlefI3nwQ5kqGx4yZnvtwXWzDGTbPx8yF52YOYs1TGX6Y1MKunLJpJU0yY2bEmLkukUtkfoDUy4yZNZeAVqSVpGLGzMuKLXDn7wk+78qPi+FRzOyI5nJaSSYUM0ei2RN\/Mn8Hfzgk4TxmMTp1TlMryZMZM1PdfMtsoSRzipmv7rxO+Lp+lb5l3ztlUcystft3\/tb7miOlf7+0gGIWoGXDplBSLsUsQ+nDZh8vYZf\/N0UHKWYxivtFl75f6DOr7wKWUszCZP5c7kFeDlkoyZ9ilierK8uDv2K8UFIQxSxVw3veet9LQyUplGIWr6D3BRJKSqeYLZFtN1WSNlHMtkmeTomkxRSzzZqpp0TSHYrZLQM2VBzpuP8Dx9AtGI\/5h5cAAAAASUVORK5CYII=","width":310}
%---
%[text:image:8a8c]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAiCAYAAACnSgJKAAAA4WlDQ1BzUkdCAAAYlWNgYDzNAARMDgwMuXklRUHuTgoRkVEKDEggMbm4gAE3YGRg+HYNRDIwXNYNLGHlx6MWG+AsAloIpD8AsUg6mM3IAmInQdgSIHZ5SUEJkK0DYicXFIHYQBcz8BSFBDkD2T5AtkI6EjsJiZ2SWpwMZOcA2fEIv+XPZ2Cw+MLAwDwRIZY0jYFhezsDg8QdhJjKQgYG\/lYGhm2XEWKf\/cH+ZRQ7VJJaUQIS8dN3ZChILEoESzODAjQtjYHh03IGBt5IBgbhCwwMXNEQd4ABazEwoEkMJ0IAAHLYNoSjH0ezAAAACXBIWXMAABYlAAAWJQFJUiTwAAAAQHpUWHRTbmlwTWV0YWRhdGEAAAiZq1ZKzsksCMjPzCspVrKKrlaqULIy0FGqBJK1OmCesSE2rrEplG8A48bWAgBimhV0SF35\/QAAAypJREFUWIXt189Lo0ccx\/H3zDyPiYnmN2LNRtK0MdBDS5tVhEARke0l+A\/0fyj0WPqnlPbopeBNWLyIHlzpoZaCkFrBQlpNF2uoMT+e5Hlmeiha3JhsYkI97H5uzzDzvJgZ5suMqNfrhkeKfCz40XHr1QatNVprjBnvbgghkFIi5X\/zvYO3Wi1KpRKHh4fUarWxwlNTU6RSKfL5PNFotBsvl8vs7u6STqfJZDJjwwE8z6NUKgGwtrbWjddqNZRSFAoFksnkWPFWq0W9Xufy8vK2rWvPjTEopVBK0a7X+euXElprAHyhELF3M0jbHhpXSgHQbDZ74zfRnQ7lF\/v8+O03eJ0OCEEwkWD5iy9J5HIIOfpB6YkLpZj98CM+\/err2zZpWUTm57tg13XxPO\/22+fzjYhLSXBmhuDMTN8fuK7L0dERJycnaK1RSrG6ukokEnk4DtBut6lUKrRarZ59HMfh4OCA09NTEokE5+fnJBIJZmdnUUoRi8UIh8PD4cYYKpUKW1tbXF1d9cS11lxcXJDNZllZWWFjY4OdnR38fj+2bZPP51leXh4eN8YQCARoNBp98ZuqdVMVLcvCsixs22ZychKlFK7rDo5LKZmbm6NYLNJut3vijuOwt7dHtVqlXC7jui7r6+skk0mklIRCISzLGg4HsG2beDzerwtaaxYXF9nc3GR7e5tcLkcmkyEWi\/Ud91p8kEgpyWazFItFjo+PKRQKt7V7JNwz8GfN5eyqe8m6+kbe48nTDGfa5uwPBwBbCZ6ELeIBNRze8Qx7vzX4\/ucaL+ter259IwQ8ez\/I5x+H7oV649rw05lDpQGffZB4EH78sskPvzd5lg3yTmAI3Jh\/Zx+ckMxHByuXr+ay7nLxdwNX338xeXPvcG\/xt\/j\/mr7lVQrQhp7n9HXRxiCEQIghcUsK0lGb5782+O5F5UF4o+3xdM5H2K8APQSuBIupSQxw1eoeOEh8luCTpJ94QNF2OoPjSkA6YpMKW4zybFNSIAdZ9omJCTqdDqVSievr6zuPulHjOA7VapVQKHQ\/nkwmWVhYYH9\/\/87dbBwxxjA9Pc3S0tJt2z95qS0VQ3PF+AAAAABJRU5ErkJggg==","width":24}
%---
%[text:image:585d]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:0313]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:4684]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:dropdown:012e]
%   data: {"defaultValue":"\"No Selection\"","itemLabels":["No Selection","Half-Wave Rectifier","Full-Wave Center-Tapped Rectifier","Full-Wave Bridge Rectifier"],"items":["\"No Selection\"","\"Half-Wave Rectifier\"","\"Full-Wave Center-Tapped Rectifier\"","\"Full-Wave Bridge Rectifier\""],"label":"Make a selection","run":"Section"}
%---
%[text:image:6488]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:checkbox:0472]
%   data: {"defaultValue":false,"label":"A     Automobile Charging System","run":"Nothing"}
%---
%[control:checkbox:550b]
%   data: {"defaultValue":false,"label":"B     Solar Panel System","run":"Nothing"}
%---
%[control:checkbox:089f]
%   data: {"defaultValue":false,"label":"C     iPhone\/Android Wall Charger","run":"Nothing"}
%---
%[control:checkbox:7a55]
%   data: {"defaultValue":false,"label":"D     Flat Screen Television","run":"Nothing"}
%---
%[control:button:6368]
%   data: {"label":"Submit Answers","run":"Section"}
%---
%[text:image:5d46]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABMCAYAAADkzAD+AAABzklEQVR42u3cXXGEMBSG4ZWAhJWABCQgAQcgAQkrIRIqAQlIiAQcUDJDO91OKFBCOCe8F9\/1Js8y+TkJPMZxfJD4AQF44AnwwBPggSfAA0+AB\/4tdV1nU4pEk4uEdw2bMkwZE46RCN8njv6VXBr8eJMUkuGLlCZL4IEHHnjggQceeOCBBx74UI16Tml+1zT2FJWA31+JfK1srzv3xwAfFn1rUWzQ\/vRLgu92FpYcfgb8sUZUZ9aygT+n7p4Bf03dvQD+fw0oDsK3wAN\/q6GmBP6ayfUJfPzlZMdyMv5Tr3r3KgneFcbsDviKkkHYes3HCrhNoUQstSzsru61nqpkpR2cgxDggY8OPy8jj15MtfOwlAG\/7YdN4IufVtPy8hJ4z8QZKj3wf6\/Xz7zy3ADv\/8HmZPgO+LjDzFtHFCRJeN4IAR544M\/uCC8YAw888MADDzzwwIuFn2voKX9Rw0iFv8OGpgEe+G943xjdK\/1C0muhL5nIyXXhyp2qtzMW+tBLPbtd+2xVqwQ91\/bg+I7xft4SGJTAG23HhVteLMgVwFttR4Vbzg\/NPAFLjrrhccsTpC2lZviSXepFtZp5om0VpbpVkYwADzwBHngCvIh8Ag3lAhMN2JymAAAAAElFTkSuQmCC","width":30}
%---
%[control:checkbox:2d42]
%   data: {"defaultValue":false,"label":"View a Half-Wave Signal","run":"Section"}
%---
%[text:image:3d61]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:3826]
%   data: {"align":"baseline","height":25,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAZCAYAAAAmNZ4aAAAA4WlDQ1BzUkdCAAAYlWNgYDzNAARMDgwMuXklRUHuTgoRkVEKDEggMbm4gAE3YGRg+HYNRDIwXNYNLGHlx6MWG+AsAloIpD8AsUg6mM3IAmInQdgSIHZ5SUEJkK0DYicXFIHYQBcz8BSFBDkD2T5AtkI6EjsJiZ2SWpwMZOcA2fEIv+XPZ2Cw+MLAwDwRIZY0jYFhezsDg8QdhJjKQgYG\/lYGhm2XEWKf\/cH+ZRQ7VJJaUQIS8dN3ZChILEoESzODAjQtjYHh03IGBt5IBgbhCwwMXNEQd4ABazEwoEkMJ0IAAHLYNoSjH0ezAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAPnpUWHRTbmlwTWV0YWRhdGEAAAiZq1ZKzsksCMjPzCspVrKKrlaqULIy0FGqBJK1OmCeMVaukSmUD+fG1gIAYj4VcK1SiSYAAAP+SURBVEiJxZZtTFtVHMZ\/LeWt7YCWAe1gYVjBFhguMHUuUyaSZUOTCcNgssSE6ZdFA3FBTTQuy3xJNMvMEs0+TZMlflhG5ic3YhDDMhVUyFaHdCAIrh2lhbZAW+jbuX4RTLktdMbok5zcm3Oec37nufeef64iEAhI\/A9SpWqcWbjLwO+9TM2P4Q3Ox43p1PnsyK9gT1kjxtztKa2n2CyxNzjHleHP8S3PU28+hKmwkmJdaZzH4Z1mwvUr\/bZr5GXn01Lbjk699Z+DRxzDdA99RtOuVurNTQgpTFSsEJPCcb40RQYqZRZKRQb9tqtcvdlNa90xqopr7x982zHE5R8v0HnoFEadgWDERVRa2TCFSpGFOr2QGa+Tc9dO8fyjL1FdXJc62ON3c7bnHU48c5r8XC3+iB0hiQ2hq1IqlGjTS5hf8HP2q5OcOPguem1BauBPvv6AWtMeHjfX4Q2NpQRcL11mBT\/YhhieGODVA2\/JN7i+w+6ZZm7Jxf6qBtzLtwjHluLacw0dDA4My\/rXN\/fyLfZXNTC35MLumd488cX+8zxgLMds0hCMumQTnq7uAmBfw05ef78N7ZaspKnVqkJsEwEmZ8Z5sf74xolt9hFKi4z4QpOEY35ZUyqVKBQKbvT9wtED73H54jcJfeGYH19oktIiIzb7iGxTsgLi8jnZkhPFH1hKnEKtRgiBEBKRsODCx70MXr9D+2tPsKNCfna35kRx+ZwbgwMrfjJVarwrY4RjicEajRYhBJIk\/XUVTI56ePvlL2lur6HxSDlqTfqa37syRiwmPxGyxLGYwB9xEBb+pGBJEmupV+8lSUKTUYAqO0RYhNb8\/ohjc7AmS8tSYJHF8B8JoQBarQYh\/k4rhER5pZFjnQdJy3XiXRmP84djS8SiKSTWawu4514kX5+RNPFqwswsFc++sJude3U4g98RCQRl\/nlPOGEBkYHNJVVM2X9Gk5OWFCxJgsq6YhpbLPiEjXGfNaEXYMoexFyye3Nw0yOHOflFH6ZyjcwcDSkoNOpoaLag3rbIuL+XmBRJCgWwWhc5ffTw5uAyg4lSvQWrdZoKizZ+UAlHOh5mauEnHB73hkCAsVE\/pXoLZQaTbCxhrZ71Oun89DiPPZVNrj5dNikVLXgiDH67zLlXzlOkM8jGZZULoEhnoKO5i74eF7OuEMsRcV9t1hWir8dFR3NXQmjSxKv6\/vYNzlz6iBKLglKz\/J0n0rQtgH1UoqvtDfZW70vq2\/TXx+lxcubSh9yZsbK9QkNeQTqavPjHH\/BF8Lkj3B0L8JCxhq62NzHoEydNGbyqiXu\/ceV6N9aJmzg98bXXoDdQY9pFy5OtmLY9mMpyqYP\/bSX8uP4L\/QlHdCw5EkO+mgAAAABJRU5ErkJggg==","width":30}
%---
%[control:button:7798]
%   data: {"label":"Launch Half-Wave Model","run":"Section"}
%---
%[text:image:4c3b]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABMCAYAAADkzAD+AAABzklEQVR42u3cXXGEMBSG4ZWAhJWABCQgAQcgAQkrIRIqAQlIiAQcUDJDO91OKFBCOCe8F9\/1Js8y+TkJPMZxfJD4AQF44AnwwBPggSfAA0+AB\/4tdV1nU4pEk4uEdw2bMkwZE46RCN8njv6VXBr8eJMUkuGLlCZL4IEHHnjggQceeOCBBx74UI16Tml+1zT2FJWA31+JfK1srzv3xwAfFn1rUWzQ\/vRLgu92FpYcfgb8sUZUZ9aygT+n7p4Bf03dvQD+fw0oDsK3wAN\/q6GmBP6ayfUJfPzlZMdyMv5Tr3r3KgneFcbsDviKkkHYes3HCrhNoUQstSzsru61nqpkpR2cgxDggY8OPy8jj15MtfOwlAG\/7YdN4IufVtPy8hJ4z8QZKj3wf6\/Xz7zy3ADv\/8HmZPgO+LjDzFtHFCRJeN4IAR544M\/uCC8YAw888MADDzzwwIuFn2voKX9Rw0iFv8OGpgEe+G943xjdK\/1C0muhL5nIyXXhyp2qtzMW+tBLPbtd+2xVqwQ91\/bg+I7xft4SGJTAG23HhVteLMgVwFttR4Vbzg\/NPAFLjrrhccsTpC2lZviSXepFtZp5om0VpbpVkYwADzwBHngCvIh8Ag3lAhMN2JymAAAAAElFTkSuQmCC","width":30}
%---
%[control:checkbox:65da]
%   data: {"defaultValue":false,"label":"View a Full-Wave Signal","run":"Section"}
%---
%[text:image:4101]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:button:5fa3]
%   data: {"label":"Launch Full-Wave Bridge Rectifier Model","run":"Section"}
%---
%[text:image:24c5]
%   data: {"align":"bottom","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:3add]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:9864]
%   data: {"label":"Launch Smartphone Battery Rectifier Model","run":"Section"}
%---
%[control:dropdown:524e]
%   data: {"defaultValue":"\"No Selection\"","itemLabels":["No Selection","Wall Outlet AC Power","Smartphone Charger","Smartphone","Results"],"items":["\"No Selection\"","\"Wall Outlet AC Power\"","\"Smartphone Charger\"","\"Smartphone\"","\"Results\""],"label":"Selected Model Subsystem: ","run":"Nothing"}
%---
%[control:button:598e]
%   data: {"label":"Submit Answers","run":"Section"}
%---
%[text:image:8c2c]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:3902]
%   data: {"label":"Simulate Smartphone Battery Rectifier Model","run":"Section"}
%---
%[text:image:91a1]
%   data: {"align":"bottom","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:3f30]
%   data: {"align":"baseline","height":22,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAWCAYAAAChWZ5EAAABaElEQVR4AWP48OHD\/4HEDANpOcjuwe0ABgaG\/+iY2iFGVAg0NDTQLJ0QdAByCFDb90SngY7OroEJgZOnTv+fO3\/R\/1lz5v+fPmP2\/4OHjlDdITij4PCRo0CL5\/1\/8vTp\/z9\/\/\/6\/e\/\/B\/+7e\/v\/bd+ykqiNwOqC9s\/v\/w0eP\/n\/9\/vP\/\/Rdv\/99++vr\/0TMX\/hcWldDHARVVNf\/\/\/vv3\/9HL9\/+vPXzx\/\/WHL\/8fvHz3Pyk5hSQHVFZW\/tfT04NjEB85MeMMgcysnP\/Xrl\/\/f\/85xPd\/\/v77v+vgsf\/BISEoBiAbhoudnJwMdgCIRleD0wGLFy\/5n5iY9P\/gsZP\/rz96+X\/7vkP\/AwID\/3t6eoIxukGE+JmZmRiWg\/TgdABIcubMmf+dnZ3\/29vb\/7e1tf0\/ceJEsCHkOgKbI\/E6AKYhPz8fw\/XUcgRBBwyKknDA6gJk38PYsGihFk0wCqhlES5zRh0w4CEAAHsTCnDdTPOOAAAAAElFTkSuQmCC","width":32}
%---
%[text:image:7ab8]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAYCAYAAAAVibZIAAACGUlEQVR4AeWUW2saURSF8598EvH2YsULCCKKCCKIvyNNn1Ry8UV\/RymlNJS8mFByo5TWy4yXF7U0ZURJG8RGXZ114AyTeIY+JH3qwIYzZ\/b+Zu+15szOfD7Hc8fOcwPJ+7fQUqkEp8jlcmA4Pee+fWKr02KxCNWlaRr8fr+ITqeD1WqF3\/f3WC6XWCwW+HV3B9YqoYVCYYspgS6XCwzCW63WA+Dt7U+wVgnN5\/Nb0Fgshkwmg2q1ikqlItbRaNTqkMCZaQxrlVBqZr82mw0mk4lIbjQaqJsxnU4xHA7FyBJoGFOhtxKazWYFk+Oxm8FggPV6LTQksF6vWx2ORiNwCl3X8f3mB1irhKbTadAI6saRDcNQmiI6nM3A\/EAgIMBcK6Ecn0AaQv1kd3aXCeQ+5WAOcwlmrSOUCRIqdZSfjdSQMhBcLpf\/Dk0kEmIUguU4j4E0hRpSGjl+t9sFa5WdxuNxoSHFpwnj8dhyuVar4fDwSADHk2\/o9\/vCzHa7jc9fvoK1Sigdf3xSdL2HkQkncP\/gAJp5f3F5hd5giHZXE8DL60\/iBUpoOBzeOimRSASpVAp7e6+wu\/sSyWQSL8w8O7B59hGsVUJDoZD1HUpTzs8v4PP5hCE00Ov14t37Y6tDAo8\/nIC1SmgwGLQ05NGTpjSbpwLmBHz95i1Yq4R6PB44hdvtBsPpOfeVUPvmU9fW\/\/SpIHv9fw79A6Uzm87PE2EqAAAAAElFTkSuQmCC","width":21}
%---
%[control:editfield:4ac4]
%   data: {"defaultValue":"0","label":"Enter Power Consumed (Watts):","run":"Section","valueType":"MATLAB code"}
%---
%[text:image:6fe3]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:button:5cb0]
%   data: {"label":"Simulate Smartphone Battery Rectifier Model","run":"Section"}
%---
%[text:image:0351]
%   data: {"align":"bottom","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:57e7]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAYCAYAAAAVibZIAAACGUlEQVR4AeWUW2saURSF8598EvH2YsULCCKKCCKIvyNNn1Ry8UV\/RymlNJS8mFByo5TWy4yXF7U0ZURJG8RGXZ114AyTeIY+JH3qwIYzZ\/b+Zu+15szOfD7Hc8fOcwPJ+7fQUqkEp8jlcmA4Pee+fWKr02KxCNWlaRr8fr+ITqeD1WqF3\/f3WC6XWCwW+HV3B9YqoYVCYYspgS6XCwzCW63WA+Dt7U+wVgnN5\/Nb0Fgshkwmg2q1ikqlItbRaNTqkMCZaQxrlVBqZr82mw0mk4lIbjQaqJsxnU4xHA7FyBJoGFOhtxKazWYFk+Oxm8FggPV6LTQksF6vWx2ORiNwCl3X8f3mB1irhKbTadAI6saRDcNQmiI6nM3A\/EAgIMBcK6Ecn0AaQv1kd3aXCeQ+5WAOcwlmrSOUCRIqdZSfjdSQMhBcLpf\/Dk0kEmIUguU4j4E0hRpSGjl+t9sFa5WdxuNxoSHFpwnj8dhyuVar4fDwSADHk2\/o9\/vCzHa7jc9fvoK1Sigdf3xSdL2HkQkncP\/gAJp5f3F5hd5giHZXE8DL60\/iBUpoOBzeOimRSASpVAp7e6+wu\/sSyWQSL8w8O7B59hGsVUJDoZD1HUpTzs8v4PP5hCE00Ov14t37Y6tDAo8\/nIC1SmgwGLQ05NGTpjSbpwLmBHz95i1Yq4R6PB44hdvtBsPpOfeVUPvmU9fW\/\/SpIHv9fw79A6Uzm87PE2EqAAAAAElFTkSuQmCC","width":21}
%---
%[text:image:5e6c]
%   data: {"align":"baseline","height":19,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAATCAYAAAB\/TkaLAAAB10lEQVR4AbXUT0sCURQF8D6WnyQkBBcuXAguXBhYLqwMBEOICCKIKIg2ES0Ka6JSLKOMbNJGHc3+oFYbRxFEUE\/dVyOO3dxIwsN5g+fHcXh3xjRNA61QKDTS0h36HtM3wWAQwz7dbhedTgftdhsmkwmtVgvNZhONRgOU1R0DGggE\/jQHwcxHQ8AE1ut1UJZF\/X4\/i3JgulLD5eO7gKvVKijLoj6f7xf6F3hReMd+6hUbVwUBU5ZFvV6vAeXA1FfDWP5NQOuXBQRPFMyEU2LPoh6Pp4dy4H25hqj6hj35BWvxvIB0cHJqmm\/qdrsFyoMaznIV7CZfsHqRR+D4Ab6fhrlCEZRlm7pcLnCgXNZwmq1g5\/YZK+fq9zPsA1VVBWVZ1Ol0Gs4hHZu7kobjTFlAyzEV85KxIYGKooCyLOpwOHoHWwclpYztmycsRXNsQwJlWQZlWdRut4sggcmvhuGHErYSRSxGspg7Shueod6QwEQiAcqyqM1mE6NHI3iQLmHzuojQWXZoQwLj8Tgoy6JWq7U3ywQvnGYwezi8IYGRSASUZVGLxSJeDjTLNHoE9x+bwb+sg5IkgbIsajabMbgIHp+w\/Lo\/+Dvas2j\/zVGve+\/TUaH+\/L+gn8xINi6FlQWTAAAAAElFTkSuQmCC","width":21}
%---
%[text:image:6d90]
%   data: {"align":"baseline","height":22,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAAWCAYAAAAinad\/AAAA4WlDQ1BzUkdCAAAYlWNgYDzNAARMDgwMuXklRUHuTgoRkVEKDEggMbm4gAE3YGRg+HYNRDIwXNYNLGHlx6MWG+AsAloIpD8AsUg6mM3IAmInQdgSIHZ5SUEJkK0DYicXFIHYQBcz8BSFBDkD2T5AtkI6EjsJiZ2SWpwMZOcA2fEIv+XPZ2Cw+MLAwDwRIZY0jYFhezsDg8QdhJjKQgYG\/lYGhm2XEWKf\/cH+ZRQ7VJJaUQIS8dN3ZChILEoESzODAjQtjYHh03IGBt5IBgbhCwwMXNEQd4ABazEwoEkMJ0IAAHLYNoSjH0ezAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAQHpUWHRTbmlwTWV0YWRhdGEAAAiZq1ZKzsksCMjPzCspVrKKrlaqULIy0FGqBJK1OmCeoSU2rpERlG8A48bWAgBjyhV4WF7BTgAAAUtJREFUOI3llE1LAlEUhh\/LghqCjBZC1j53UYuSPggiqfX8BH+FK1dSumnVL3AlYntdBdayWmg6EUS6jGAmOBPRzK2VYuTMlEib3tXl3Hse3nsO54RE5IMRaWxUIICw36Wmad9iIuL53teZiCAiZDKZ3tlPoaCa9bsLggXWTEQ4Os4FggKd1Ru31BtNXNfFdRzi8WXWVlc8YZ4NuLq+odkyODxIEo1GeWx3KJfPsG1he2tzYI7nN2sXlyT394jMzdN5MlGTGomdXSqVqqczT5hlWcRiMZ5fbF7f3pnVplhYXMKyzCFgpolhGLhKMREeJzIzzV2rNRwssbFOPpen\/XCP4yqq5zVOT\/LYIui6PjDHt5uFQoFisYjjOCil0HWdVCrVg5VKpZ\/Dukqn02Sz2S+xQcC\/n4DubAbJ19lvt4bvCvqJm36NdDn+E9gnJ4qo4TRl\/sQAAAAASUVORK5CYII=","width":19}
%---
%[control:editfield:6a49]
%   data: {"defaultValue":"0","label":"Enter Slope Value:","run":"Section","valueType":"MATLAB code"}
%---
%[control:slider:8bd2]
%   data: {"defaultValue":0,"label":"Find Time to Charge (sec):","max":2000,"min":0,"run":"Section","runOn":"ValueChanging","step":10}
%---
%[control:editfield:9aa5]
%   data: {"defaultValue":"0","label":"Enter Time to Charge (hrs):","run":"Section","valueType":"MATLAB code"}
%---
%[text:image:3e86]
%   data: {"align":"bottom","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:3dfa]
%   data: {"align":"bottom","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:1d51]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAaCAYAAACgoey0AAAA4WlDQ1BzUkdCAAAYlWNgYDzNAARMDgwMuXklRUHuTgoRkVEKDEggMbm4gAE3YGRg+HYNRDIwXNYNLGHlx6MWG+AsAloIpD8AsUg6mM3IAmInQdgSIHZ5SUEJkK0DYicXFIHYQBcz8BSFBDkD2T5AtkI6EjsJiZ2SWpwMZOcA2fEIv+XPZ2Cw+MLAwDwRIZY0jYFhezsDg8QdhJjKQgYG\/lYGhm2XEWKf\/cH+ZRQ7VJJaUQIS8dN3ZChILEoESzODAjQtjYHh03IGBt5IBgbhCwwMXNEQd4ABazEwoEkMJ0IAAHLYNoSjH0ezAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAPnpUWHRTbmlwTWV0YWRhdGEAAAiZq1ZKzsksCMjPzCspVrKKrlaqULIy0FGqBJK1OmCeMVaukRmUD+fG1gIAYlUVchP3+s8AAAOUSURBVEiJ3ZZ\/aFVlGMc\/d\/fe7o\/dbbbNGl2XbFqZsy5JyCLWaKwZCYtcipCwyH5IdC+r\/KONZi4t0K0mTP8KHdNAA60QhNCEKIK5YNR23VY0M+a8g+WUs3ncPXvf9\/aH3rPdnXPdhbSgFw7vOc95z\/N5nu\/znPccRyKRSPAfDNd8w85dO+8IqPn95luDhRC07Gj5xyAhhHm0trVa7mfZPXC7h51PC1jeAbCdT4vUUshbOtENyTfRcQZjUwAsLfDx1IMF3Huhj+snv0SOjeII5OB+8mmc1etQStn6tEot02f8x7jO1kN9fN0bI7jIQ3CRh97oCD+\/9gq\/v\/UGky4\/gS1hnKE1XG7fzV+RV1GTmq1Pa8bSPuOpacG7R89RlOehbVMZ\/rucAAwfbEI5dXbXfsxEdiF7lqykNPQ47pp1jGzdwvRHHyJdnoUzlkKi9fRYFn5y6jxaXLBn40oTOrJ\/HxPRIe5v38\/ehmcI+Fy83tXHYEwjK5BDfuMHXP7u+0ylllwdGEqxnYtN0dkzyptVJQS8N0QS2iTnDx6icHM9nmCQgNfFvs2P4PO52NTZT\/TSJO5ly\/CufQ5ho6JtV491n02xNX01QOi+bNavLjJtsdPfoqsExfX1pi3X66KrfhV3+7LYeOAXLl6ZJn\/DBtuutoKlZPjMKQxNA6D7t3F6+y\/SWFOaqkJXJ\/k1Vbhyc2bVEoKA28EXL6+i1Jug4fN+PKUltn1jK7XIyyba1QnA9sM9lC\/NpXx5obkm2tXJ6FCUskg4NWilUEqR53ez64WHGL00QduJX22ltu3qR8MRujv2cvRKPhdGFGda68z744MD\/NjRzmPhCIHgEtNuGAYOQCmFEILlRX62r1\/B25+dpcqVSY2lZOyBSgb8JWQfaWHbahfFiwNMaxo\/dHzKgefXUlxdzZpwQwp07pzMvLJsMbWhe2yldsz\/LL5YV8dP2hOUh4p5qWCYwWOHmb5Z76KHy6iMvMOK6mfTQuOGYTaTYRhc1a6zo\/k9jh0\/voDUSvLn6W3mdW1jkyVamN34589zoQB+rxOpMqixkMoWlA6YrOlc2NxZSmnr0wJWUqLSwGdkalYLBSGlREqJyrSr7Tb1ud\/U5PlMmgBMqLoBtWsuCzhuxBFCoJR91ulqm\/zbSAYvlUTd3KPjRnxhsH5NN2uUDpouS5gtQxI6I2bQr+kZgHWdiooKW\/DtHJb3+N8alp3rfw\/+G4X\/H+xPZB+mAAAAAElFTkSuQmCC","width":30}
%---
%[text:image:5276]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAArCAYAAAAQVipNAAAA4WlDQ1BzUkdCAAAYlWNgYDzNAARMDgwMuXklRUHuTgoRkVEKDEggMbm4gAE3YGRg+HYNRDIwXNYNLGHlx6MWG+AsAloIpD8AsUg6mM3IAmInQdgSIHZ5SUEJkK0DYicXFIHYQBcz8BSFBDkD2T5AtkI6EjsJiZ2SWpwMZOcA2fEIv+XPZ2Cw+MLAwDwRIZY0jYFhezsDg8QdhJjKQgYG\/lYGhm2XEWKf\/cH+ZRQ7VJJaUQIS8dN3ZChILEoESzODAjQtjYHh03IGBt5IBgbhCwwMXNEQd4ABazEwoEkMJ0IAAHLYNoSjH0ezAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAQHpUWHRTbmlwTWV0YWRhdGEAAAiZq1ZKzsksCMjPzCspVrKKrlaqULIy0FGqBJK1OmCesRk2rokxlG8A48bWAgBj1BV8LVd9TAAAAW9JREFUWIXtl82RgzAMRr9k6EA1uIZQAzXQDCVQA9RADbgG04KOnHcPLAw\/wZLj3YSd8bsxg\/GzZCP5No7jFy7E\/dMCe5KQRBKSSEISWcxg5xyYeXnO8\/yzQn3fw1r7q0KXS1kSkkhCEklIIglJJCEJtVDTNOi6LujjTdPAORc0RlVc67qGcw5EBAAoisL7PjOjbVs45zAMA8qyhDFGJSRGaL1KZoa11huptcz6ed2m+BAjVBQFiGiRmKU0MjNlWS7RlbhpLorPIjNPsF65MWYjQ0RB6VILnUn5eEUGCDhlRITH4yFu6BiZICGtVIwM8JMyZt7kXtMbd113SJ9WxjdfBky3h7Ztl49qhOYozVJEhKqqxHEADnvRGLMckqhbxyxlrVXLSEQJAZOUZqNr+b\/F9V1cTujpHgptM0LxtSQZgE3hY+Y\/F9qznv8OTP+BV\/+ssexP6FJcQ4tnLGdl6FDttY1UrMwZ6vbjXVzu2H8DP4PJ4\/Q5NDgAAAAASUVORK5CYII=","width":22}
%---
%[text:image:296a]
%   data: {"align":"bottom","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:25c3]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
