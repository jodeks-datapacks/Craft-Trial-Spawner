#> craft_trial_spawner:image/process/generate
#
# This function generates the image data.

data modify storage craft_trial_spawner:image data.current.image_data set from storage craft_trial_spawner:image data.image_data
data modify storage craft_trial_spawner:image data.current.description set from storage craft_trial_spawner:image data.description
data modify storage craft_trial_spawner:image data.current.pixel_character set from storage craft_trial_spawner:image data.pixel_character.pixel

# Reset index score
scoreboard players set $index.image_data craft_trial_spawner.image 0
# Set width
execute store result score $width craft_trial_spawner.image run data get storage craft_trial_spawner:image data.width
# Set height
execute store result score $height craft_trial_spawner.image run data get storage craft_trial_spawner:image data.height
# Set length
scoreboard players operation $length craft_trial_spawner.image = $width craft_trial_spawner.image
scoreboard players operation $length craft_trial_spawner.image *= $height craft_trial_spawner.image
# Clear remaining entries in tellraw
data remove storage craft_trial_spawner:image data.tellraw

# Add spacing on top
function craft_trial_spawner:image/process/append/line_break
# Loop over image data
function craft_trial_spawner:image/process/loop_over_image_data
# Add spacing on bottom
function craft_trial_spawner:image/process/append/line_break