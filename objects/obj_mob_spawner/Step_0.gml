//show_debug_message("Mobs: " + string(instance_number(Enemy)));

// Time accumulation (delta_time is in microseconds)
t_accum += delta_time / 1000000 * global.DilationFactor;

// Only try to spawn if under cap and the timer elapsed
if (instance_number(obj_enemy) < max_enemies && t_accum >= spawn_interval_sec) {

    // reset timer first (prevents spiraling if we exit early)
    t_accum = 0;

    // Try a few times to find a fair spawn point
    var tries = 6;
    var sx = 0, sy = 0;
    var ok = false;

    repeat (tries) {
        // Pick a random edge (0=top, 1=right, 2=bottom, 3=left)
        var side = irandom(3);
        var m = 16; // small margin from room edge

        if (side == 0) { sx = irandom(room_width);  sy = m; }
        if (side == 1) { sx = room_width - m;       sy = irandom(room_height); }
        if (side == 2) { sx = irandom(room_width);  sy = room_height - m; }
        if (side == 3) { sx = m;                    sy = irandom(room_height); }

        // Fairness checks (optional but nice)
        ok = true;

        // keep away from BBQ (if it exists)
        if (instance_exists(obj_bbq)) {
            var bbq = instance_find(obj_bbq, 0);
            if (point_distance(sx, sy, bbq.x, bbq.y) < min_spawn_dist_bbq) ok = false;
        }

        // keep away from player (if you have a player object)
        if (ok && instance_exists(obj_player)) {
            var pl = instance_find(obj_player, 0);
            if (point_distance(sx, sy, pl.x, pl.y) < min_spawn_dist_player) ok = false;
        }

        if (ok) break;
    }

    if (ok) {
        // Pick enemy type (weighted)
        var etype = pick_enemy_type(enemy_types, enemy_weights);

        // Spawn
        var e = instance_create_layer(sx, sy, spawn_layer, etype);

        // (Optional) give target references right away
        if (instance_exists(obj_bbq)) e.target = instance_find(obj_bbq, 0);
    }
}
