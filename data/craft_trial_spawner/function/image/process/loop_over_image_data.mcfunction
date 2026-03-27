# Copy current pixel
data modify storage craft_trial_spawner:image data.current.pixel_color set \
  from storage craft_trial_spawner:image data.current.image_data[0]
data modify storage craft_trial_spawner:image data.current.description_text set \
  from storage craft_trial_spawner:image data.current.description[0]

scoreboard players add $index.image_data craft_trial_spawner.image 1

# Calculate column
scoreboard players operation $index.column craft_trial_spawner.image = $index.image_data craft_trial_spawner.image
scoreboard players operation $index.column craft_trial_spawner.image %= $width craft_trial_spawner.image

# Calculate row
scoreboard players operation $index.row craft_trial_spawner.image = $index.image_data craft_trial_spawner.image
scoreboard players operation $index.row craft_trial_spawner.image /= $width craft_trial_spawner.image

# Append start spacing
execute if score $index.column craft_trial_spawner.image matches 1 run \
  function craft_trial_spawner:image/process/append/blank

# Append colored pixel
execute unless data storage craft_trial_spawner:image data.current{pixel_color: ''} run \
  function craft_trial_spawner:image/process/append/pixel
# Append background pixel
execute if data storage craft_trial_spawner:image data.current{pixel_color: ''} run \
  function craft_trial_spawner:image/process/append/background

# Append description
execute if score $index.column craft_trial_spawner.image matches 0 run \
    function craft_trial_spawner:image/process/image_end/description

# Remove first element from the image_data array
data remove storage craft_trial_spawner:image data.current.image_data[0]
# Loop over rows
execute if score $index.row craft_trial_spawner.image < $height craft_trial_spawner.image run \
  function craft_trial_spawner:image/process/loop_over_image_data
 