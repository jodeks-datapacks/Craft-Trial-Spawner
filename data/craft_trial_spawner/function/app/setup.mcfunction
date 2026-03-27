scoreboard objectives add jodek.config dummy
execute unless score &craft_trial_spawner_load_message jodek.config = &craft_trial_spawner_load_message jodek.config run scoreboard players set &craft_trial_spawner_load_message jodek.config 1
execute unless score &craft_trial_spawner_advancements jodek.config = &craft_trial_spawner_advancements jodek.config run scoreboard players set &craft_trial_spawner_advancements jodek.config 1

scoreboard objectives add craft_trial_spawner.image dummy

function craft_trial_spawner:config/image