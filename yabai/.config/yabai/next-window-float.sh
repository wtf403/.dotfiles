# Get current first window
first_window=$(yabai -m query --spaces --space | jq -r '.["first-window"]')

# Get array of all windows  
windows=$(yabai -m query --spaces --space | jq -r '.windows')
window_array=($(echo $windows | tr ',' '\n' | tr -d ']['))

# Find index of current first window
index=0
for window in "${window_array[@]}"; do
    if [[ "$window" == "$first_window" ]]; then
        break
    fi
    index=$((index+1))
done

# Get next window index, wrap around to 0 if at end
echo "$index $first_window"
echo ${window_array[@]}
next_index=$(( (index + ${#window_array[@]} - 1) % ${#window_array[@]} ))
next_window=${window_array[$next_index]}
echo $next_window

# Focus next window 
yabai -m window --focus $next_window
