use <attack_primary.scad>;
use <attack_secondary.scad>;

module attack() {
    attack_primary();
    attack_secondary();
}

attack();