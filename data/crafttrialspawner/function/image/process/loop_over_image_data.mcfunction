# Copy current pixel
data modify storage crafttrialspawner:image current.pixel_color set \
  from storage crafttrialspawner:image current.image_data[0]
data modify storage crafttrialspawner:image current.description_text set \
  from storage crafttrialspawner:image current.description[0]

scoreboard players add $index.image_data crafttrialspawner.image 1

# Calculate column
scoreboard players operation $index.column crafttrialspawner.image = $index.image_data crafttrialspawner.image
scoreboard players operation $index.column crafttrialspawner.image %= $width crafttrialspawner.image

# Calculate row
scoreboard players operation $index.row crafttrialspawner.image = $index.image_data crafttrialspawner.image
scoreboard players operation $index.row crafttrialspawner.image /= $width crafttrialspawner.image

# Append start spacing
execute if score $index.column crafttrialspawner.image matches 1 run \
  function crafttrialspawner:image/process/append/blank

# Append colored pixel
execute unless data storage crafttrialspawner:image current{pixel_color: ''} run \
  function crafttrialspawner:image/process/append/pixel
# Append background pixel
execute if data storage crafttrialspawner:image current{pixel_color: ''} run \
  function crafttrialspawner:image/process/append/background

# Append description
execute if score $index.column crafttrialspawner.image matches 0 run \
    function crafttrialspawner:image/process/image_end/description

# Remove first element from the image_data array
data remove storage crafttrialspawner:image current.image_data[0]
# Loop over rows
execute if score $index.row crafttrialspawner.image < $height crafttrialspawner.image run \
  function crafttrialspawner:image/process/loop_over_image_data
 