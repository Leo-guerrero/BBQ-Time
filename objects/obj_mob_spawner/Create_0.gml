// --- simple spawn controller (edge spawns) ---
max_enemies        = 20;    // concurrent cap
spawn_interval_sec = 0.6;   // seconds between spawns
t_accum            = 0;     // timer accumulator (in seconds)

// Safety: avoid popping on top of the BBQ or player (optional but recommended)
min_spawn_dist_bbq    = 260;
min_spawn_dist_player = 220;

// Enemy type(s)
enemy_types   = [ obj_enemy ];  // add more types if you have them
enemy_weights = [ 100 ];              // weights must match types (e.g., [70,25,5])

// Layer to spawn on
spawn_layer = "Instances";

// Helper: weighted pick (kept simple and local)
function pick_enemy_type(_types, _weights) {
    var total = 0;
    for (var i = 0; i < array_length(_weights); i++) total += _weights[i];
    var r = irandom_range(1, total);
    var run = 0;
    for (var j = 0; j < array_length(_types); j++) {
        run += _weights[j];
        if (r <= run) return _types[j];
    }
    return _types[0];
}
