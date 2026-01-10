#> crafttrialspawner:image/process/generate
#
# This function generates the image data.

data modify storage crafttrialspawner:image current.image_data set from storage crafttrialspawner:image image_data
data modify storage crafttrialspawner:image current.description set from storage crafttrialspawner:image description
data modify storage crafttrialspawner:image current.pixel_character set from storage crafttrialspawner:image pixel_character.pixel

# Reset index score
scoreboard players set $index.image_data crafttrialspawner.image 0
# Set width
execute store result score $width crafttrialspawner.image run data get storage crafttrialspawner:image width
# Set height
execute store result score $height crafttrialspawner.image run data get storage crafttrialspawner:image height
# Set length
scoreboard players operation $length crafttrialspawner.image = $width crafttrialspawner.image
scoreboard players operation $length crafttrialspawner.image *= $height crafttrialspawner.image
# Clear remaining entries in tellraw
data remove storage crafttrialspawner:image tellraw

# Add spacing on top
function crafttrialspawner:image/process/append/line_break
# Loop over image data
function crafttrialspawner:image/process/loop_over_image_data
# Add spacing on bottom
function crafttrialspawner:image/process/append/line_break