# Append blank
function craft_trial_spawner:image/process/append/blank

data modify storage craft_trial_spawner:image data.tellraw append \
  from storage craft_trial_spawner:image data.current.description_text

# Append blank
function craft_trial_spawner:image/process/append/blank

# Append line_break
execute unless score $index.image_data craft_trial_spawner.image = $length craft_trial_spawner.image \
  run function craft_trial_spawner:image/process/append/line_break

# Remove first element from the description
data remove storage craft_trial_spawner:image data.current.description[0]
 