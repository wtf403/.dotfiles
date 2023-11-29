space_info=$(yabai -m query --spaces --space)
first_window=$(echo "$space_info" | jq -r '.["first-window"]')
windows=$(echo "$space_info" | jq -r '.windows' | tr ' ' '\n')
read -ra window_array <<< "$(echo "$windows" | tr -d '[],')"
echo $window_array


index=0
next_window=""

echo "${window_array[@]}"
for window in "${window_array[@]}"; do
  index=$(($index+1))
  echo "$window =? $first_window"
  if [[ "$window" == "$first_window" ]]; then
    next_window=${windows[$index]}
    break
  fi
done

echo $next_window

yabai -m window --focus $next_window
