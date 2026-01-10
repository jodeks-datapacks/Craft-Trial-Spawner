# Append blank
function crafttrialspawner:image/process/append/blank

data modify storage crafttrialspawner:image tellraw append \
  from storage crafttrialspawner:image current.description_text

# Append blank
function crafttrialspawner:image/process/append/blank

# Append line_break
execute unless score $index.image_data crafttrialspawner.image = $length crafttrialspawner.image \
  run function crafttrialspawner:image/process/append/line_break

# Remove first element from the description
data remove storage crafttrialspawner:image current.description[0]
 