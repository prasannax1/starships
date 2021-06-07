use <attack-primary.scad>;
use <attack-secondary.scad>;

module attack() {
    attack_primary();
    attack_secondary();
}

attack();