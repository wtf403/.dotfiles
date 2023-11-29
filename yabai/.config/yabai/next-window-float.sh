first_window=$(yabai -m query --spaces --space | jq '.["first-window"]')
windows=$(yabai -m query --spaces --space | jq -r '.windows'  | tr ' ' '\n')
windows=$(echo "$windows" | tr -d '][')
window_array=(${windows//,/})

echo "${window_array[@]}"

index=0
next_window=""

for window in "${window_array[@]}"; do
  index=$(($index+1))
  if [[ "$window" == "$first_window" ]]; then
    echo "$window ?? $first_window"
    next_window=${window_array[$index]}
    break
  fi
done

echo $next_window

yabai -m window --focus $next_window

