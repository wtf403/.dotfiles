set deviceName to "AirPods" -- Replace with the name of your AirPods

-- Check if Bluetooth is enabled
tell application "System Events"
    set bluetoothEnabled to the value of the checkbox "Bluetooth" of the window "Bluetooth" of application process "System Preferences"
end tell

if bluetoothEnabled then
    -- Enable Bluetooth if not already enabled
    tell application "System Preferences"
        reveal anchor "Bluetooth" of pane id "com.apple.preferences.Bluetooth"
        activate
    end tell
    tell application "System Events"
        tell process "System Preferences"
            tell window "Bluetooth"
                click checkbox "Bluetooth"
            end tell
        end tell
    end tell
    delay 2 -- Wait for Bluetooth to enable
end if

-- Check for AirPods RSSI
set RSSIvalue to missing value
tell application "System Events"
    set bluetoothDevices to the properties of every device of application process "bluetoothaudiod"
    repeat with aDevice in bluetoothDevices
        if name of aDevice contains deviceName then
            set RSSIvalue to RSSI of aDevice
            exit repeat
        end if
    end repeat
end tell

if RSSIvalue is missing value then
    display dialog "AirPods not found." buttons {"OK"} default button "OK" with icon 2
else
    display dialog "AirPods RSSI: " & RSSIvalue buttons {"OK"} default button "OK" with icon 1
end if

